FROM ubuntu:17.10

ENV	VULKAN_VERSION="1.0.61.1"

RUN apt-get update && \
	apt-get install -y cmake git gcc g++ wget xorg-dev libglu1-mesa-dev xz-utils --fix-missing && \
    wget -O VulkanSDK.run https://vulkan.lunarg.com/sdk/download/${VULKAN_VERSION}/linux/vulkansdk-linux-x86_64-${VULKAN_VERSION}.run && \
	chmod ugo+x VulkanSDK.run && \
    ./VulkanSDK.run --noprogress && \
    apt-get remove -y wget xz-utils && \
    apt-get autoremove -y

ENV	VULKAN_SDK="/VulkanSDK/${VULKAN_VERSION}/x86_64:${VULKAN_SDK}"
ENV	PATH="${VULKAN_SDK}/bin:${PATH}"
ENV	LD_LIBRARY_PATH="${VULKAN_SDK}/lib:${LD_LIBRARY_PATH}"
ENV	VK_LAYER_PATH="${VULKAN_SDK}/etc/explicit_layer.d:${VK_LAYER_PATH}"
