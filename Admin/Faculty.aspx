<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="HospitalWebsite.Admin.Faculty" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script defer>
         function editFeature(id) {

             resetModel();

             var featureData = fetchFeatureData(id);
             
             // Update the modal fields with existing data
             document.getElementById('post_title').value = featureData.title;

             // Toggle visibility of buttons based on whether ID exists
             if (id) {
                 document.getElementById('saveButton').style.display = 'none';
                 document.getElementById('updateButton').style.display = 'block';
                 //document.getElementById('feature-image').className = 'form-group mb-3';

                 var modal = document.getElementById('verticalycentered');
                 var modalInstance = new bootstrap.Modal(modal);
                 modalInstance.show();
                 
             }
             else {
                 document.getElementById('saveButton').style.display = 'block';
                 document.getElementById('updateButton').style.display = 'none';
                 resetModel();
                 //document.getElementById('feature-image').className = 'form-group mb-3';
                
             }
             
           
            
         }

         function resetModel() {
             document.getElementById('imageInput').value = '';
             const imagePreview = document.getElementById('imagePreview');
             imagePreview.src = '#';
             imagePreview.style.display = 'none';
         }
         
         function fetchFeatureData(id) {
             // Replace this with your actual logic to fetch existing data based on ID
             // For demonstration, return a sample object
             return {
                 title: id,
                 // Add other properties as needed
             };
         }

        

         
         

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card">
            <div class="card-header"><span class="add-dept-header-text fw-bold fs-5" style="color: #012970;">Faculty</span><span class="d-flex float-end"><button type="button" class="add-dept-btn btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#verticalycentered" onclick="editFeature(null)">Add Faculty</button></span></div>
            <div class="card-body py-0">
                <div class="table-responsive overflow-auto">
            <table class="table table-bordered mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Qualification</th>
                    <th scope="col">Department</th>
                    <th scope="col">Designation</th>
                    <th scope="col">Mobile No.</th>
                    <th scope="col">Emial</th>                 
                    <th scope="col">Image</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="departments-table">
                    <th scope="row">1</th>
                    <td><p>Name</p></td>
                    <td ><p> Qalification </p></td>
                      <td ><p> Department </p></td>
                      <td ><p> Designation </p></td>
                      <td ><p> Mobile number </p></td>
                      <td ><p> email </p></td>
                       <td class="text-center"> <img src="assets/img/slides-1.jpg" width="100" height="60" class="img-fluid"/> </td>
                    <%--<td><a  href="?all-departments"><i class="bi bi-pencil-square text-success"></i> </a></td>--%>
                      <td> <button type="button" class="btn btn-link" onclick="editFeature(1);">
        <i class="bi bi-pencil-square text-success"></i>
    </button></td>
                    <td ><a  href="?all-departments" ><p><i class="bi bi-trash text-danger"></i></p> </a></td>
                  </tr>
                 
                </tbody>
              </table>
              <!-- End Bordered Table -->
            </div>
            </div>
            <div class="card-footer">
              <!-- Pagination with icons -->
              <nav aria-label="Page navigation example">
                <ul class="pagination  justify-content-center">
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </ul>
              </nav><!-- End Pagination with icons -->

            </div>
</div><!-- End Card with header and footer -->

 <!-- Vertically centered Modal -->
 
       <div class="modal fade" id="verticalycentered" tabindex="-1">
    <%--<div class="modal-dialog modal-dialog-centered modal-lg">--%>
        <div class="modal-dialog  modal-lg">
        <div class="modal-content">
           <div class="modal-header text-center">
                <h4 class="modal-title mx-auto fw-bold" style="width: 50%; color: #012970;">Faculty</h4>
            </div>

            <div class="modal-body">
                <form>
                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Name</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <input type="text" placeholder="Title" class="form-control" id="post_title" name="post_title" required autofocus>
                            </div>
                        </div>
                    </div>

                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Qualification</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <input type="text" placeholder="Title" class="form-control" id="post_title" name="post_title" required autofocus>
                            </div>
                        </div>
                    </div>
                                        <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Designation</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <input type="text" placeholder="Title" class="form-control" id="post_title" name="post_title" required autofocus>
                            </div>
                        </div>
                    </div>
                                        <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Mobile Number</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <input type="text" placeholder="Title" class="form-control" id="post_title" name="post_title" required autofocus>
                            </div>
                        </div>
                    </div>
                                        <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Email</b></label>
                            <div class="col-sm-12 col-lg-9">
                                <input type="text" placeholder="Title" class="form-control" id="post_title" name="post_title" required autofocus>
                            </div>
                        </div>
                    </div>
                    <div class="form-group mb-3">
                        <div class="row">
                        <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Department</b></label>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <select class="form-control form-select" id="selectInput" name="post_title" required autofocus>
                                <option value="option1">Option 1</option>
                                <option value="option2">Option 2</option>
                                <option value="option3">Option 3</option>
                                <!-- Add more options as needed -->
                            </select>
                             </div>
                         </div>
                    </div>
                  <div class="form-group mb-3">
                    <div class="row">
                        <label for="post_title" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Choose Image</b></label>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <input type="file" class="form-control" id="imageInput" name="post_images" accept="image/*" required autofocus onchange="previewImage(event)">
                        </div>
                    </div>
                </div>

                <div class="form-group mb-3" id="feature-image">
                    <div class="row">
                        <div class="col-12 col-sm-12 col-lg-3 col-form-label"></div>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <img id="imagePreview" src="#" alt="Image Preview" width="200" height="100" style="display: none;">
                        </div>
                    </div>
                </div>

                <script>
                    function previewImage(event) {
                        var input = event.target;
                        var imagePreview = document.getElementById('imagePreview');

                        // Ensure that the input contains files and the browser supports FileReader
                        if (input.files && input.files[0]) {
                            var reader = new FileReader();

                            reader.onload = function (e) {
                                // Set the source of the image to the data URL
                                imagePreview.src = e.target.result;
                                // Display the image preview
                                imagePreview.style.display = 'block';
                            };

                            // Read the image file as a data URL
                            reader.readAsDataURL(input.files[0]);
                        }
                    }
                </script>

                </form>
            </div>
            <div class="modal-footer mb-0">
                <button type="button" class="btn btn-danger btn-small" data-bs-dismiss="modal">Close</button>          
                <button type="button" class="btn btn-primary btn-small" id="saveButton" onclick="saveFeature()">Save</button>
                <button type="button" class="btn btn-success btn-small" id="updateButton" style="display:none;" onclick="updateFeature()">Update</button>
            </div>
        </div>
    </div>
</div>

   

    
</asp:Content>
