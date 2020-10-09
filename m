Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA3FB289C3C
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Oct 2020 01:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgJIXus (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Oct 2020 19:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727481AbgJIXk7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Oct 2020 19:40:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D18C0613D5;
        Fri,  9 Oct 2020 16:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=c16hDea0Ubs5mAeuNDwrNNrLUpa7/zEsF/YXj/C0m1o=; b=C2S1Ayo8BnoSBhREoBkfbtTMGH
        XB0qFPNUm1VjvcsRjyBC3fCuv7Yc1PVME5ercXezFEBkaeLCg7ubWRP3tPFZDWPFikSTzSF2FbOXp
        gi1fDqg+ZVGvO3KQO/Ek5gnsUL5QPnYoR0uAEp39ZT5MLcpgn3pUA8WqZDZUzEt4xseng5o9zqCc3
        cVYqJkoLa/N8uTuCgUs//eh6thTYLnmQ+2qwaIjmwH1BxWwMt/ZQ2S14HUpGCZMJxTly2Iih1swxg
        22KnpAbgVOVQOTIsBB7CwowpZJfYSgBSps2/yRGdfxhThqU4pSTslKf3g4GBuckjYVMh3yNUpkEiV
        R0xXdRsg==;
Received: from [2601:1c0:6280:3f0::507c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kR202-0001hb-TK; Fri, 09 Oct 2020 23:40:35 +0000
Subject: Re: [PATCH] i2c: i2c-mux-gpio: Enable this driver in ACPI land
To:     Evan Green <evgreen@chromium.org>, Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5aaa5dca-9f71-1b25-d02c-2a6be44fdae0@infradead.org>
Date:   Fri, 9 Oct 2020 16:40:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009154235.1.Idef164c23d326f5e5edecfc5d3eb2a68fcf18be1@changeid>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/9/20 3:43 PM, Evan Green wrote:
> Enable i2c-mux-gpio devices to be defined via ACPI. The idle-state
> property translates directly to a fwnode_property_*() call. The child
> reg property translates naturally into _ADR in ACPI.
> 
> The i2c-parent is a little trickier, since of's phandle definition
> suggests the i2c mux could live in a completely different part of
> the tree than its upstream i2c controller. For now in ACPI,
> just assume that the i2c-mux-gpio device will always be a direct
> child of the i2c controller. If the additional flexibility of
> defining muxes in wildly different locations from their parent
> controllers is required, it can be added later.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
>  drivers/i2c/muxes/i2c-mux-gpio.c | 77 +++++++++++++++++++++-----------
>  1 file changed, 50 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
> index 4effe563e9e8d..f195e95e8a037 100644
> --- a/drivers/i2c/muxes/i2c-mux-gpio.c
> +++ b/drivers/i2c/muxes/i2c-mux-gpio.c
> @@ -49,34 +49,46 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_OF
> -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> -					struct platform_device *pdev)
> +static int i2c_mux_gpio_probe_fw(struct gpiomux *mux,
> +				 struct platform_device *pdev)
>  {
> -	struct device_node *np = pdev->dev.of_node;
> -	struct device_node *adapter_np, *child;
> -	struct i2c_adapter *adapter;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	acpi_handle dev_handle;
> +	struct device_node *adapter_np;
> +	struct i2c_adapter *adapter = NULL;
> +	struct fwnode_handle *child = NULL;
>  	unsigned *values;
>  	int i = 0;
>  
> -	if (!np)
> -		return -ENODEV;
> +	if (is_of_node(dev->fwnode)) {
> +		if (!np)
> +			return -ENODEV;
>  
> -	adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> -	if (!adapter_np) {
> -		dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> -		return -ENODEV;
> +		adapter_np = of_parse_phandle(np, "i2c-parent", 0);
> +		if (!adapter_np) {
> +			dev_err(&pdev->dev, "Cannot parse i2c-parent\n");
> +			return -ENODEV;
> +		}
> +		adapter = of_find_i2c_adapter_by_node(adapter_np);
> +		of_node_put(adapter_np);
> +
> +	} else if (is_acpi_node(dev->fwnode)) {
> +		/*
> +		 * In ACPI land the mux should be a direct child of the i2c
> +		 * bus it muxes.
> +		 */
> +		dev_handle = ACPI_HANDLE(dev->parent);
> +		adapter = i2c_acpi_find_adapter_by_handle(dev_handle);
>  	}
> -	adapter = of_find_i2c_adapter_by_node(adapter_np);
> -	of_node_put(adapter_np);
> +
>  	if (!adapter)
>  		return -EPROBE_DEFER;
>  
>  	mux->data.parent = i2c_adapter_id(adapter);
>  	put_device(&adapter->dev);
>  
> -	mux->data.n_values = of_get_child_count(np);
> -
> +	mux->data.n_values = device_get_child_node_count(dev);
>  	values = devm_kcalloc(&pdev->dev,
>  			      mux->data.n_values, sizeof(*mux->data.values),
>  			      GFP_KERNEL);
> @@ -85,24 +97,35 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
>  		return -ENOMEM;
>  	}
>  
> -	for_each_child_of_node(np, child) {
> -		of_property_read_u32(child, "reg", values + i);
> +	device_for_each_child_node(dev, child) {
> +		if (is_of_node(child)) {
> +			fwnode_property_read_u32(child, "reg", values + i);
> +
> +		} else if (is_acpi_node(child)) {
> +			unsigned long long adr;
> +			acpi_status status;
> +
> +			status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(child),
> +						       METHOD_NAME__ADR,
> +						       NULL, &adr);
> +			if (ACPI_SUCCESS(status)) {
> +				*(values + i) = adr;
> +
> +			} else {
> +				dev_err(dev, "Cannot get address");
> +				return -EINVAL;
> +			}
> +		}
> +
>  		i++;
>  	}
>  	mux->data.values = values;
>  
> -	if (of_property_read_u32(np, "idle-state", &mux->data.idle))
> +	if (fwnode_property_read_u32(dev->fwnode, "idle-state", &mux->data.idle))
>  		mux->data.idle = I2C_MUX_GPIO_NO_IDLE;
>  
>  	return 0;
>  }
> -#else
> -static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
> -					struct platform_device *pdev)
> -{
> -	return 0;
> -}
> -#endif
>  
>  static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  {
> @@ -118,7 +141,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	if (!dev_get_platdata(&pdev->dev)) {
> -		ret = i2c_mux_gpio_probe_dt(mux, pdev);
> +		ret = i2c_mux_gpio_probe_fw(mux, pdev);
>  		if (ret < 0)
>  			return ret;
>  	} else {
> 

Hi,


When CONFIG_ACPI is not enabled:

../drivers/i2c/muxes/i2c-mux-gpio.c: In function ‘i2c_mux_gpio_probe_fw’:
../drivers/i2c/muxes/i2c-mux-gpio.c:108:13: error: implicit declaration of function ‘acpi_evaluate_integer’; did you mean ‘acpi_evaluate_object’? [-Werror=implicit-function-declaration]
    status = acpi_evaluate_integer(ACPI_HANDLE_FWNODE(child),


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
