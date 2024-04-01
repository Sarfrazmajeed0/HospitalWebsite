<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="DirectorMessage.aspx.cs" Inherits="HospitalWebsite.Admin.DirectorMessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script defer >
         //function editFeature(id) {

             

         //    var featureData = fetchFeatureData(id);

         //    // Update the modal fields with existing data
         //    document.getElementById('post_title').value = featureData.title;
         //}

        

         //function fetchFeatureData(id) {
         //    // Replace this with your actual logic to fetch existing data based on ID
         //    // For demonstration, return a sample object
         //    return {
         //        title: id,
         //        // Add other properties as needed
         //    };
         //}



     
             function previewImage(event) {
                var input = event.target;
                var imagePreview = document.getElementById('imagePreview');
             // Ensure that the input contains files and the browser supports FileReader
               if (input.files && input.files[0]) {
               var reader = new FileReader();
               reader.onload = function (e) {
              // Set the source of the image to the data URL
              imagePreview.src = e.target.result;
           
            };

             // Read the image file as a data URL
             reader.readAsDataURL(input.files[0]);
        }
    }

         
         function editButton() {

                 document.getElementById('<%= DirectorName.ClientID %>').disabled = false;
                 document.getElementById('<%= DirectorMessageTextarea.ClientID %>').disabled = false;
                 document.getElementById('<%= DirectorImage.ClientID %>').disabled = false;
                 
                 document.getElementById('<%= editButton.ClientID %>').style.display = 'none';
                 document.getElementById('<%= updateButton.ClientID %>').style.display = 'block';
                 document.getElementById('<%= DirectorImage.ClientID %>').style.display = 'block';
                 document.getElementById('DirectorImageConatiner').style.display = 'block';
                 

                 return false;
             }
         

         function updateButton() {

             document.getElementById('<%= DirectorName.ClientID %>').disabled = true;
             document.getElementById('<%= DirectorMessageTextarea.ClientID %>').disabled = true;
             document.getElementById('<%= DirectorImage.ClientID %>').disabled = true;
        
             document.getElementById('<%= editButton.ClientID %>').style.display = 'block';
             document.getElementById('<%= updateButton.ClientID %>').style.display = 'none';
             document.getElementById('DirectorImageConatiner').style.display = 'none';
             return false;
         }

     </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div id="BreadcrumbPlaceholder" runat="server"></div>
            <!-- Card with header and footer -->
 <div class="card col-lg-8">
            <div class="card-header"><span class="add-dept-header-text fw-bold fs-5" style="color: #012970;">Director Message</span></div>
            <div class="card-body py-0">

                <form>
                  <div class="form-group mb-3" id="feature-image">
                    <div class="row justify-content-center align-items-center mt-3">
                        <div class="col-12 col-sm-12 col-lg-12 text-center">
                            <img id="imagePreview" src="assets/img/profile-img.jpg" alt="Image Preview" width="100" height="100" style="border-radius: 50%; object-fit: cover;">
                        </div>
                    </div>
                  </div>



                    <div class="form-group mt-3 mb-3">
                        <div class="row">
                            <label for="directorname" runat="server" class="col-sm-12 col-lg-3 col-form-label"><b>Name</b></label>
                            <div class="col-sm-12 col-lg-9" >
                                <input type="text" runat="server" placeholder="Title" class="form-control"   id="DirectorName" name="Director_Name" disabled  >
                            </div>
                        </div>
                    </div>

                    <div class="form-group mb-3">
        <div class="row">
            <label for="directormessage" runat="server" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Message</b></label>
            <div class="col-12 col-sm-12 col-lg-9">
                <Textarea type="text" runat="server" placeholder="Description" rows="5" class="form-control"  id="DirectorMessageTextarea" name="DirectorMessage" disabled ></Textarea>
            </div>
        </div>
    </div>

                      <div class="form-group mb-3" id="DirectorImageConatiner" style="display:none;">
                        <div class="row">
                            <label for="directorimage" runat="server" class="col-12 col-sm-12 col-lg-3 col-form-label"><b>Choose Image</b></label>
                            <div class="col-12 col-sm-12 col-lg-9">
                                <input type="file" runat="server" class="form-control" id="DirectorImage" name="post_images" accept="image/*"   onchange="previewImage(event)" disabled>
                            </div>
                        </div>
                    </div>





            </div>
     </form>
            <div class="card-footer">
                <asp:Button type="button" runat="server" class="btn btn-primary btn-small float-end" Width="120" id="editButton" OnClientClick="return editButton()" Text="Edit" />

                <%--<asp:Button type="button" runat="server"  class="btn btn-primary btn-small float-end" Width="120" id="editButton"  OnClientClick="editButton_Click"  Text="Edit"/>--%>
                
                 <asp:Button type="button" runat="server" class="btn btn-success btn-small  float-end" Width="120" id="updateButton" style="display:none;" OnClientClick="return updateButton()" Text="Update"/>
              

            </div>

</div><!-- End Card with header and footer -->

 

   

    
</asp:Content>

