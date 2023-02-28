class LeasesController < ApplicationController
    def create
        lease = Lease.create!(:id, :rent, :apartment_id, :tenant_id)
        if lease.valid?
        render json: leases
        else
            render json: {error: lease.errors.full_messages}, status: 422
        end
    end

    def destroy
        lease = Lease.find(params[:id])
        if lease
            lease.destroy
            render head :no_content
        else
            render json: {error: 'Lease not found'}, status: 422
        end
end
