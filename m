Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07E4A10CD65
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Nov 2019 18:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfK1RCR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Nov 2019 12:02:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44782 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726510AbfK1RCR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Nov 2019 12:02:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id A3509292528
Subject: Re: [PATCH v2 2/2] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert
 i2c tunnel to MFD Cell
To:     Raul E Rangel <rrangel@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Akshu.Agrawal@amd.com, Guenter Roeck <groeck@chromium.org>,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-i2c@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>
References: <20191125204730.187000-1-rrangel@chromium.org>
 <20191125134551.v2.2.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <870329a6-1254-9411-f80d-26c9c2823e37@collabora.com>
Date:   Thu, 28 Nov 2019 18:02:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191125134551.v2.2.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Raul,

On 25/11/19 21:47, Raul E Rangel wrote:
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
> Changes in v2:
> - Moved i2c tunnel into cros_ec_platform_cells
> - Requires https://lkml.org/lkml/2019/11/21/208 to correctly enumerate.
> 
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
>  drivers/mfd/cros_ec_dev.c               |  9 +++++++
>  2 files changed, 22 insertions(+), 23 deletions(-)
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

I still think that the tables should be in the i2c-cros-ec-tunnel.

>  	},
>  };
>  
> diff --git a/drivers/mfd/cros_ec_dev.c b/drivers/mfd/cros_ec_dev.c
> index 1efdba18f20b..04f8fc5772f0 100644
> --- a/drivers/mfd/cros_ec_dev.c
> +++ b/drivers/mfd/cros_ec_dev.c
> @@ -101,12 +101,21 @@ static const struct cros_feature_to_cells cros_subdevices[] = {
>  	},
>  };
>  
> +static const struct mfd_cell_acpi_match cros_ec_i2c_tunnel_acpi_match = {
> +	.pnpid = "GOOG0012"
> +};
> +
>  static const struct mfd_cell cros_ec_platform_cells[] = {
>  	{ .name = "cros-ec-chardev", },
>  	{ .name = "cros-ec-debugfs", },
>  	{ .name = "cros-ec-lightbar", },
>  	{ .name = "cros-ec-pd-sysfs" },
>  	{ .name = "cros-ec-sysfs", },
> +	{
> +		.name = "cros-ec-i2c-tunnel",
> +		.acpi_match = &cros_ec_i2c_tunnel_acpi_match,
> +		.of_compatible = "google,cros-ec-i2c-tunnel"
> +	},

We can't do this. With this change, on OF-based systems, the cros-ec-i2c-tunnel
will be instantiated twice. Once because of the mfd_add_device call for the
above cells and another one because of the call of of_platform_populate.

I think I understand what you are trying to solve, but not convinced about the
solution. I think that I can't test for cros-ec-i2c-tunnel case because are no
devices out, but should be similar for cros-ec-keyb driver. Let me check if I
have an ACPI based device supporting this (Samus is an option, I guess)

Thanks,
 Enric

>  };
>  
>  static const struct mfd_cell cros_ec_vbc_cells[] = {
> 
