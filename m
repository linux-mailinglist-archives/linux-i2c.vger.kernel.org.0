Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4661443E5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 19:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgAUSCh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 13:02:37 -0500
Received: from mx2.suse.de ([195.135.220.15]:38472 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729273AbgAUSCh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 13:02:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 184BAAEC1;
        Tue, 21 Jan 2020 18:02:34 +0000 (UTC)
Date:   Tue, 21 Jan 2020 19:02:31 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 21/26] docs: i2c: instantiating-devices: rearrange
 static instatiation
Message-ID: <20200121190231.6e88bbdc@endymion>
In-Reply-To: <20200105225012.11701-21-luca@lucaceresoli.net>
References: <20200105224006.10321-1-luca@lucaceresoli.net>
        <20200105225012.11701-1-luca@lucaceresoli.net>
        <20200105225012.11701-21-luca@lucaceresoli.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun,  5 Jan 2020 23:50:07 +0100, Luca Ceresoli wrote:
> Among the "static" instantiation methods the "board file" method is
> described first. Move it as last, since it is being replaced by the other
> methods.
> 
> Also fix subsubsection heading syntax and remove the "Method 1[abc]"
> prefix as the subsubsection structure clarifies the logical hierarchy.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/i2c/instantiating-devices.rst | 98 ++++++++++++---------
>  1 file changed, 54 insertions(+), 44 deletions(-)
> 
> diff --git a/Documentation/i2c/instantiating-devices.rst b/Documentation/i2c/instantiating-devices.rst
> index 5debaafef64d..cbcafb36b417 100644
> --- a/Documentation/i2c/instantiating-devices.rst
> +++ b/Documentation/i2c/instantiating-devices.rst
> @@ -9,54 +9,27 @@ reason, the kernel code must instantiate I2C devices explicitly. There are
>  several ways to achieve this, depending on the context and requirements.
>  
>  
> -Method 1a: Declare the I2C devices by bus number
> -------------------------------------------------
> +Method 1: Declare the I2C devices statically
> +--------------------------------------------
>  
>  This method is appropriate when the I2C bus is a system bus as is the case
> -for many embedded systems. On such systems, each I2C bus has a number
> -which is known in advance. It is thus possible to pre-declare the I2C
> -devices which live on this bus. This is done with an array of struct
> -i2c_board_info which is registered by calling i2c_register_board_info().
> +for many embedded systems. On such systems, each I2C bus has a number which
> +is known in advance. It is thus possible to pre-declare the I2C devices
> +which live on this bus.
>  
> -Example (from omap2 h4)::
> +This information is provided to the kernel in a different way on different
> +architectures: device tree, ACPI or board files.
>  
> -  static struct i2c_board_info h4_i2c_board_info[] __initdata = {
> -	{
> -		I2C_BOARD_INFO("isp1301_omap", 0x2d),
> -		.irq		= OMAP_GPIO_IRQ(125),
> -	},
> -	{	/* EEPROM on mainboard */
> -		I2C_BOARD_INFO("24c01", 0x52),
> -		.platform_data	= &m24c01,
> -	},
> -	{	/* EEPROM on cpu card */
> -		I2C_BOARD_INFO("24c01", 0x57),
> -		.platform_data	= &m24c01,
> -	},
> -  };
> -
> -  static void __init omap_h4_init(void)
> -  {
> -	(...)
> -	i2c_register_board_info(1, h4_i2c_board_info,
> -			ARRAY_SIZE(h4_i2c_board_info));
> -	(...)
> -  }
> -
> -The above code declares 3 devices on I2C bus 1, including their respective
> -addresses and custom data needed by their drivers. When the I2C bus in
> -question is registered, the I2C devices will be instantiated automatically
> -by i2c-core.
> +When the I2C bus in question is registered, the I2C devices will be
> +instantiated automatically by i2c-core. The devices will be automatically
> +unbound and destroyed when the I2C bus they sit on goes away (if ever).
>  
> -The devices will be automatically unbound and destroyed when the I2C bus
> -they sit on goes away (if ever.)
>  
> +Declare the I2C devices via devicetree
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
> -Method 1b: Declare the I2C devices via devicetree
> --------------------------------------------------
> -
> -This method has the same implications as method 1a. The declaration of I2C
> -devices is here done via devicetree as subnodes of the master controller.
> +On platforms using devicetree the declaration of I2C devices is done in

I suggest adding a comma between "devicetree" and "the" to make the
sentence easier to read.

> +subnodes of the master controller.
>  
>  Example::
>  
> @@ -81,14 +54,51 @@ Here, two devices are attached to the bus using a speed of 100kHz. For
>  additional properties which might be needed to set up the device, please refer
>  to its devicetree documentation in Documentation/devicetree/bindings/.
>  
> -
> -Method 1c: Declare the I2C devices via ACPI
> --------------------------------------------
> +Declare the I2C devices via ACPI
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>  
>  ACPI can also describe I2C devices. There is special documentation for this
>  which is currently located at :doc:`../firmware-guide/acpi/enumeration` .
>  
>  
> +Declare the I2C devices in board files
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +In many embedded architectures devicetree has replaced the old hardware

Same here between "architectures" and "devicetree".

> +description based on board files, but the latter are still used in old
> +code. Instantiating I2C devices via board files is done with an array of
> +struct i2c_board_info which is registered by calling
> +i2c_register_board_info().
> +
> +Example (from omap2 h4)::
> +
> +  static struct i2c_board_info h4_i2c_board_info[] __initdata = {
> +	{
> +		I2C_BOARD_INFO("isp1301_omap", 0x2d),
> +		.irq		= OMAP_GPIO_IRQ(125),
> +	},
> +	{	/* EEPROM on mainboard */
> +		I2C_BOARD_INFO("24c01", 0x52),
> +		.platform_data	= &m24c01,
> +	},
> +	{	/* EEPROM on cpu card */
> +		I2C_BOARD_INFO("24c01", 0x57),
> +		.platform_data	= &m24c01,
> +	},
> +  };
> +
> +  static void __init omap_h4_init(void)
> +  {
> +	(...)
> +	i2c_register_board_info(1, h4_i2c_board_info,
> +			ARRAY_SIZE(h4_i2c_board_info));
> +	(...)
> +  }
> +
> +The above code declares 3 devices on I2C bus 1, including their respective
> +addresses and custom data needed by their drivers.
> +
> +
>  Method 2: Instantiate the devices explicitly
>  --------------------------------------------
>  


You have some inconsistency in your spacing between subsections, some
have 1 blank line before while some have 2. I think 1 is enough. At any
rate it should be consistent.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
