Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15787F799F
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 18:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfKKRSV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 12:18:21 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:37948 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbfKKRSV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 Nov 2019 12:18:21 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id E7CE328FCBA
Subject: Re: [PATCH] i2c: i2c-cros-ec-tunnel: Make the device acpi compatible
To:     Akshu Agrawal <akshu.agrawal@amd.com>
Cc:     cychiang@chromium.org, rrangel@chromium.org,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mark Brown <broonie@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20191111161431.26293-1-akshu.agrawal@amd.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <a5f6a3a9-8eb7-58fd-a624-718374c2437f@collabora.com>
Date:   Mon, 11 Nov 2019 18:18:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111161431.26293-1-akshu.agrawal@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Akshu,

Thanks for sending this upstream and improve CrOS EC

On 11/11/19 17:14, Akshu Agrawal wrote:
> Add ACPI entry and use device_property_read to get fw value
> which is common to both dtsi and acpi.
> 
> Signed-off-by: Akshu Agrawal <akshu.agrawal@amd.com>
> ---
>  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cros-ec-tunnel.c b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> index c551aa96a2e3..958161c71985 100644
> --- a/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> +++ b/drivers/i2c/busses/i2c-cros-ec-tunnel.c
> @@ -3,6 +3,7 @@
>  //
>  // Copyright (C) 2013 Google, Inc.
>  
> +#include <linux/acpi.h>
>  #include <linux/module.h>
>  #include <linux/i2c.h>
>  #include <linux/platform_data/cros_ec_commands.h>
> @@ -240,7 +241,6 @@ static const struct i2c_algorithm ec_i2c_algorithm = {
>  
>  static int ec_i2c_probe(struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
>  	struct cros_ec_device *ec = dev_get_drvdata(pdev->dev.parent);
>  	struct device *dev = &pdev->dev;
>  	struct ec_i2c_device *bus = NULL;
> @@ -256,7 +256,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>  	if (bus == NULL)
>  		return -ENOMEM;
>  
> -	err = of_property_read_u32(np, "google,remote-bus", &remote_bus);
> +	err = device_property_read_u32(dev, "google,remote-bus", &remote_bus);
>  	if (err) {
>  		dev_err(dev, "Couldn't read remote-bus property\n");
>  		return err;
> @@ -271,7 +271,7 @@ static int ec_i2c_probe(struct platform_device *pdev)
>  	bus->adap.algo = &ec_i2c_algorithm;
>  	bus->adap.algo_data = bus;
>  	bus->adap.dev.parent = &pdev->dev;
> -	bus->adap.dev.of_node = np;
> +	bus->adap.dev.of_node = pdev->dev.of_node;

That change is not really needed/(related) but as np was only used here I'm fine
with it.

>  	bus->adap.retries = I2C_MAX_RETRIES;
>  
>  	err = i2c_add_adapter(&bus->adap);
> @@ -291,19 +291,24 @@ static int ec_i2c_remove(struct platform_device *dev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_OF
>  static const struct of_device_id cros_ec_i2c_of_match[] = {
>  	{ .compatible = "google,cros-ec-i2c-tunnel" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, cros_ec_i2c_of_match);
> -#endif
> +
> +static const struct acpi_device_id cros_ec_i2c_tunnel_acpi_id[] = {
> +	{ "GOOG001A", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, cros_ec_i2c_tunnel_acpi_id);
>  
>  static struct platform_driver ec_i2c_tunnel_driver = {
>  	.probe = ec_i2c_probe,
>  	.remove = ec_i2c_remove,
>  	.driver = {
>  		.name = "cros-ec-i2c-tunnel",
> +		.acpi_match_table = ACPI_PTR(cros_ec_i2c_tunnel_acpi_id),
>  		.of_match_table = of_match_ptr(cros_ec_i2c_of_match),
>  	},
>  };
> 

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Question: Is this supported on older firmwares or is only expected to work on
newer ACPI-based devices?

Thanks,
 Enric
