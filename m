Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9E42C8A88
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 18:12:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbgK3RMH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 12:12:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60468 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgK3RMH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 12:12:07 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2E21BB26;
        Mon, 30 Nov 2020 18:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1606756284;
        bh=LxH+ORnXBU/B0vWsyN4AKPo4BJ7XbxrZEvCR3dgTzOc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qXTGbSKCi/w5Hym0xjyDGKjUTA5xkDly9OQilhN2ryt82q0EBZP6ptrdeNScpbjER
         wbyHk5JcUqRODiZMd4OhV5zdtwr62wP6enssHAkDyX5ux15LmWI/sPFyeB8UsArqsW
         GnqJd+fBvGHOzmo9dyahKpPHKVUqk0ttmJsP3UJM=
Date:   Mon, 30 Nov 2020 19:11:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
Subject: Re: [PATCH 15/18] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20201130171116.GO14465@pendragon.ideasonboard.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-16-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201130133129.1024662-16-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Nov 30, 2020 at 01:31:26PM +0000, Daniel Scally wrote:
> Some places in the kernel allow users to map resources to a device
> using device name (for example, gpiod_lookup_table). Currently
> this involves waiting for the i2c_client to have been registered so we
> can use dev_name(&client->dev). Adding this function means that we can
> achieve the same thing without having to wait to the i2c device.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since RFC v3:
> 
> 	- Patch introduced
> 
>  drivers/i2c/i2c-core-acpi.c | 14 ++++++++++++++
>  include/linux/i2c.h         |  5 +++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 37c510d9347a..d3a653eac79e 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -497,6 +497,20 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>  }
>  EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
>  
> +/**
> + * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
> + * @adev:     ACPI device to construct the name for
> + *
> + * Prefixes "i2c-" to the ACPI device name, for use in i2c_dev_set_name() and
> + * also anywhere else in the kernel that needs to refer to an i2c device by
> + * name but before they have been instantiated.

The documentation should state that the caller must free the return
value.

> + */
> +char *i2c_acpi_dev_name(struct acpi_device *adev)
> +{
> +	return kasprintf(GFP_KERNEL, "i2c-%s", acpi_dev_name(adev));
> +}
> +EXPORT_SYMBOL_GPL(i2c_acpi_dev_name);
> +
>  #ifdef CONFIG_ACPI_I2C_OPREGION
>  static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
>  		u8 cmd, u8 *data, u8 data_len)
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 56622658b215..ab0e505b2ca6 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -995,6 +995,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>  u32 i2c_acpi_find_bus_speed(struct device *dev);
>  struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>  				       struct i2c_board_info *info);
> +char *i2c_acpi_dev_name(struct acpi_device *adev);
>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>  #else
>  static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
> @@ -1011,6 +1012,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +static inline char *i2c_acpi_dev_name(struct acpi_device *adev)
> +{
> +	return NULL;
> +}
>  static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>  {
>  	return NULL;

-- 
Regards,

Laurent Pinchart
