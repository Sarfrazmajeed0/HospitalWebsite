<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="HospitalWebsite.Admin.Gallery" %>
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
                 var modal = document.getElementById('verticalycentered');
                 var modalInstance = new bootstrap.Modal(modal);
                 modalInstance.show();
                 
             }
             else {
                
                 document.getElementById('updateButton').style.display = 'none';
                 document.getElementById('saveButton').style.display = 'block';
                 resetModel();
               
             }
             
           
            
         }

         function resetModel() {
             const imageContainer = document.getElementById('feature-images');
             imageContainer.innerHTML = ''; // Clear previous images
             document.getElementById('imageInput').value = '';
             document.getElementById('selectInput').selectedIndex = 0;
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
    
 <style>
    .position-relative {
        position: relative;
    }
    .image-container {
        position: relative;
        display: inline-block; /* Ensures that the close button stays on the same line */
        margin-right: 20px; /* Add margin between images */
        margin-bottom: 20px; /* Adjust as needed */
    }
    .close-btn {
  
    position: absolute;
    color: white;
    top: 0;
    right: 0;
    background-color: orangered; /* Adjust as needed */
    border: none;
    cursor: pointer;
    font-weight: bold;
    font-size:18px;
    border-top-right-radius: 4px;
   
}

</style>

 <script>
       function previewImages(event) {
           const imageContainer = document.getElementById('feature-images');
           imageContainer.innerHTML = ''; // Clear previous images

           const files = event.target.files;
           for (let i = 0; i < files.length; i++) {
               const file = files[i];

               const reader = new FileReader();
               reader.onload = function (e) {
                   const imageUrl = e.target.result;

                   // Create image element
                   const imgElement = document.createElement('img');
                   imgElement.src = imageUrl;
                   imgElement.alt = 'Image';
                   imgElement.width = 165;
                   imgElement.height = 200;
                   imgElement.classList.add('img-fluid', 'rounded-2');

                   // Create close button
                   const closeButton = document.createElement('button');
                   closeButton.type = 'button';
                   closeButton.classList.add('close-btn', 'fs-6');
                   closeButton.innerHTML = '&times;';
                   closeButton.onclick = function () {
                       // Handle close button click
                       imgElement.parentNode.remove(); // Remove the entire container div
                   };

                   // Create container div
                   const imageContainerDiv = document.createElement('div');
                   imageContainerDiv.classList.add('image-container');
                   imageContainerDiv.appendChild(imgElement);
                   imageContainerDiv.appendChild(closeButton);

                   // Append to the main container
                   imageContainer.appendChild(imageContainerDiv);
               };

               reader.readAsDataURL(file);
           }
       }
   </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card">
            <div class="card-header"><span class="add-dept-header-text fw-bold fs-5" style="color: #012970;">Gallery</span><span class="d-flex float-end"><button type="button" class="add-dept-btn btn btn-primary rounded-pill" data-bs-toggle="modal" data-bs-target="#verticalycentered" onclick="editFeature(null)">Add Gallery</button></span></div>
            <div class="card-body py-0">
                <div class="table-responsive overflow-auto">
            <table class="table table-bordered mt-3">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Caption</th>
                    <th scope="col">Department</th>
                    <th scope="col">Image</th>
                    <th scope="col">Edit</th>
                    <th scope="col">Delete</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="departments-table">
                    <th scope="row">1</th>
                    <td><p>Caption</p></td>
                    <td ><p> Department Name </p></td>
                      <td class="text-center"> <img src="assets/img/slides-1.jpg" width="100" height="60" class="img-fluid"/> </td>
                  
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
                <h4 class="modal-title mx-auto fw-bold" style="width: 50%; color: #012970;">Gallery</h4>
            </div>

            <div class="modal-body" style="max-height: 600px; overflow-y: auto;">
                <form>
                    <div class="form-group mb-3">
                        <div class="row">
                            <label for="post_title" class="col-sm-12 col-lg-3 col-form-label"><b>Caption</b></label>
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
                        <label for="imageInput" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Choose Images</b></label>
                        <div class="col-12 col-sm-12 col-lg-9">
                            <input type="file" class="form-control" id="imageInput" name="post_images" accept="image/*" multiple required autofocus onchange="previewImages(event)">
                        </div>
                    </div>
                </div>

                <div class="form-group mb-3" >
                    <div class="row">
                      <label for="imageInput" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Images</b></label>
                     <div class="col-12 col-sm-12 col-lg-9" id="feature-images">
         
                     </div>
                    </div>
                    <!-- Images will be dynamically added here -->
                </div>



                 

                </form>
            </div>
            <div class="modal-footer mb-0">
                <button type="button" class="btn btn-danger btn-small" data-bs-dismiss="modal" >Close</button>          
                <button type="button" class="btn btn-success btn-small " width="100px" id="saveButton" onclick="saveFeature()">Save</button>
                <button type="button" class="btn btn-success btn-small" id="updateButton" style="display:none;" onclick="updateFeature()">Update</button>
            </div>
        </div>
    </div>
</div>

   
   
    
</asp:Content>
