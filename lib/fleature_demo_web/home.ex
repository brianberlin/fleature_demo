defmodule FleatureDemoWeb.HomeLive do
  use Phoenix.LiveView

  def mount(_arg1, _session, socket) do
    Fleature.subscribe("live_view_feature_flag")

    {:ok, assign(socket, :live_view_feature_flag, Fleature.enabled?("live_view_feature_flag"))}
  end

  def render(assigns) do
    ~H"""
    <div id="live_view">
      <%= if @live_view_feature_flag do %>
        <p>Live View Feature Enabled</p>
      <% else %>
        <p>Live View Feature Disabled</p>
      <% end %>
    </div>

    <div id="javascript" phx-update="ignore"></div>
    """
  end

  def handle_info({:feature_flag, "live_view_feature_flag", status}, socket) do
    {:noreply, assign(socket, :live_view_feature_flag, status)}
  end
end
