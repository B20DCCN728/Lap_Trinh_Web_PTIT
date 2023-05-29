// Lấy tất cả các menu cha
var dropdowns = document.getElementsByClassName("sub-menu");
		
// Lặp qua các menu cha và thêm sự kiện click
for (var i = 0; i < dropdowns.length; i++) {
    dropdowns[i].addEventListener("click", function() {
        // Lấy tất cả các menu cha khác và ẩn các menu con của chúng
        var otherDropdowns = document.getElementsByClassName("sub-menu");
        for (var j = 0; j < otherDropdowns.length; j++) {
            if (otherDropdowns[j] != this) {
                otherDropdowns[j].classList.remove("active");
                otherDropdowns[j].querySelector("ul").style.display = "none";
            }
        }
        // Toggle lớp CSS "active" để hiển thị hoặc ẩn các menu con của menu cha đang được nhấp vào
        this.classList.toggle("active");
        var dropdownContent = this.querySelector("ul");
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}

function makeSortable() {
    const table = document.querySelector('#tbl-content');
    const headers = table.querySelectorAll('.table-header');

    headers.forEach((header, index) => {
        header.addEventListener('click', () => {
          // Xác định thứ tự sắp xếp và cột được chọn
            const isAscending = header.classList.contains('asc');
            const columnIndex = index;

            // Sắp xếp bảng
            sortTableByColumn(table, columnIndex, isAscending);

            // Đổi thứ tự sắp xếp và cập nhật lớp CSS trên tiêu đề cột
            headers.forEach((h) => {
                h.classList.remove('asc', 'desc');
            });
            header.classList.toggle(isAscending ? 'desc' : 'asc');
        });
    });
}

function sortTableByColumn(table, column, asc = true) {
    const dirModifier = asc ? 1 : -1;
    const tBody = table.tBodies[0];
    const rows = Array.from(tBody.querySelectorAll("tr"));

    // Sắp xếp các hàng theo giá trị của cột được chỉ định
    const sortedRows = rows.sort((a, b) => {
        const aVal = a.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
        const bVal = b.querySelector(`td:nth-child(${column + 1})`).textContent.trim();
        return aVal.localeCompare(bVal, undefined, {numeric: true}) * dirModifier;
    });

    // Xóa các hàng hiện tại khỏi bảng
    while (tBody.firstChild) {
        tBody.removeChild(tBody.firstChild);
    }

    // Thêm các hàng đã sắp xếp trở lại vào bảng
    tBody.append(...sortedRows);
}
makeSortable();

