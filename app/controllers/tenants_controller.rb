class TenantsController < ApplicationController
    def index
        tenants = Tenant.all
        render json: tenants
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end
end
