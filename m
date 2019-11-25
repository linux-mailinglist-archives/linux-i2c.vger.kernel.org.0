Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A28F10922A
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 17:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728902AbfKYQvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 11:51:24 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60890 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728683AbfKYQvY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 25 Nov 2019 11:51:24 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id AEA5A28FCBE
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert i2c
 tunnel to MFD Cell
To:     Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Benson Leung <bleung@chromium.org>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <f8645254-ce59-3d3e-0f82-975f9e283a9c@collabora.com>
Date:   Mon, 25 Nov 2019 17:51:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Raul,

On 21/11/19 22:10, Raul E Rangel wrote:
> If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
> possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
> has finished initializing and setting the drvdata. This would cause a
> NULL pointer panic.
> 
> Converting this driver over to an MFD solves the problem and aligns with
> where the cros_ec is going.
> 
> Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> ---
> You can now see the device node lives under the mfd device.
> 
> $ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00
> 
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
>  drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++
>  2 files changed, 32 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index 5d91e33eb600..2e3217678fa3 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -6,6 +6,7 @@
>  #include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
> +#include <linux/mfd/cros_ec.h>
>  #include <linux/platform_data/cros_ec_commands.h>
>  #include <linux/platform_data/cros_ec_proto.h>
>  #include <linux/platform_device.h>
> @@ -27,7 +28,6 @@
>  struct ec_i2c_device {
>  	struct device *dev;
>  	struct i2c_adapter adap;
> -	struct cros_ec_device *ec;
>  
>  	u16 remote_bus;
>  
> @@ -176,6 +176,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>  {
>  	struct ec_i2c_device *bus = adap->algo_data;
>  	struct device *dev = bus->dev;
> +	struct cros_ec_dev *ec = dev_get_drvdata(dev->parent);
>  	const u16 bus_num = bus->remote_bus;
>  	int request_len;
>  	int response_len;
> @@ -183,6 +184,16 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>  	int result;
>  	struct cros_ec_command *msg;
>  
> +	if (!ec) {
> +		dev_err(dev, "%s: ec is missing!\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	if (!ec->ec_dev) {
> +		dev_err(dev, "%s: ec->ec_dev is missing!\n", __func__);
> +		return -EINVAL;
> +	}
> +

Are those checks needed? Is that possible?

>  	request_len = ec_i2c_count_message(i2c_msgs, num);
>  	if (request_len < 0) {
>  		dev_warn(dev, "Error constructing message %d\n", request_len);
> @@ -212,7 +223,7 @@ static int ec_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg i2c_msgs[],
>  	msg->outsize = request_len;
>  	msg->insize = response_len;
>  
> -	result = cros_ec_cmd_xfer_status(bus->ec, msg);
> +	result = cros_ec_cmd_xfer_status(ec->ec_dev, msg);
>  	if (result < 0) {
>  		dev_err(dev, "Error transferring EC i2c message %d\n", result);
>  		goto exit;
> @@ -241,17 +252,11 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
>  
>  static int ec_i2c_probe(struct platform_device *pdev)
>  {
> -	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>  	struct device *dev = &pdev->dev;
>  	struct ec_i2c_device *bus = NULL;
>  	u32 remote_bus;
>  	int err;
>  
> -	if (!ec->cmd_xfer) {
> -		dev_err(dev, "Missing sendrecv\n");
> -		return -EINVAL;
> -	}
> -
>  	bus = devm_kzalloc(dev, sizeof(*bus), GFP_KERNEL);
>  	if (bus == NULL)
>  		return -ENOMEM;
> @@ -263,7 +268,6 @@ static int ec_i2c_probe(struct platform_device *pdev)
>  	}
>  	bus->remote_bus = remote_bus;
>  
> -	bus->ec = ec;
>  	bus->dev = dev;
>  
>  	bus->adap.owner = THIS_MODULE;
> @@ -292,25 +296,11 @@ static int ec_i2c_remove(struct platform_device *dev)
>  	return 0;
>  }
>  
> -static const struct of_device_id cros_ec_i2c_of_match[] = {
> -	{ .compatible = "google,cros-ec-i2c-tunnel" },
> -	{},
> -};
> -MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
> -
> -static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
> -	{ "GOOG0012", 0 },

So, you're removing something that you just added in a previous patch. So is
really the change in the previous patch needed?


> -	{ }
> -};
> -MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
> -
>  static struct platform_driver ec_i2c_tunnel_driver = {
>  	.probe = ec_i2c_probe,
>  	.remove = ec_i2c_remove,
>  	.driver = {
>  		.name = "cros-ec-i2c-tunnel",
> -		.acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
> -		.of_match_table = of_match_ptr(cros_ec_i2c_of_match),

I don't understand this change, why? The id should be in the driver to match.

>  	},
>  };
>  
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 1efdba18f20b..61b20e061f75 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -113,6 +113,18 @@ static const struct mfd_cell cros_ec_vbc_cells[] = {
>  	{ .name = "cros-ec-vbc", }
>  };
>  
> +static struct mfd_cell_acpi_match cros_ec_i2c_tunnel_acpi_match = {
> +	.pnpid = "GOOG0012"
> +};
> +
> +static struct mfd_cell cros_ec_fw_cells[] = {
> +	{
> +		.name = "cros-ec-i2c-tunnel",
> +		.acpi_match = &cros_ec_i2c_tunnel_acpi_match,
> +		.of_compatible = "google,cros-ec-i2c-tunnel"

Ah, I see. The acpi_match and the of_compatible should be in the
i2c-cros-ec-tunnel driver not here. Why you changed? Didn't work?

> +	},
> +};
> +
>  int cros_ec_check_features(struct cros_ec_dev *ec, int feature)
>  {
>  	struct cros_ec_command *msg;
> @@ -485,6 +497,13 @@ static int ec_device_probe(struct platform_device *pdev)
>  			 "failed to add cros-ec platform devices: %d\n",
>  			 retval);
>  
> +	retval = mfd_add_hotplug_devices(ec->dev, cros_ec_fw_cells,
> +					 ARRAY_SIZE(cros_ec_fw_cells));
> +	if (retval)
> +		dev_warn(ec->dev,
> +			 "failed to add cros-ec fw platform devices: %d\n",
> +			 retval);
> +

I think this should go inside the cros_ec_platform_cells, so drop this and
add the "cros-ec-i2c-tunnel" in the cros_ec_platform_cells[] table is enough.

Thanks,
 Enric


>  	/* Check whether this EC instance has a VBC NVRAM */
>  	node = ec->ec_dev->dev->of_node;
>  	if (of_property_read_bool(node, "google,has-vbc-nvram")) {
> 
