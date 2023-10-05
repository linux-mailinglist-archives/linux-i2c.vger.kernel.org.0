Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC6B7BAF14
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Oct 2023 01:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjJEXIN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 5 Oct 2023 19:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJEXFv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 5 Oct 2023 19:05:51 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E302FD41;
        Thu,  5 Oct 2023 16:00:14 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71905C433CB;
        Thu,  5 Oct 2023 23:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696546814;
        bh=z8SBsSMi2KrKif8ZB0siIYo9TONoKiFZO7As5Wbrins=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tPT5j8H51+zkqqaKNtgexqQjXunmNEejDNzNXGpgOC2BYI7TK3yYsvisl0H65F2ou
         hYN4lzaFlLy8qBPAz2gV+0SJV9aVQMbKNNCenmTNotanGG/5mGQCtFPvyviytPOpcE
         gEnuMSL6QFIBzxoCLpgcbqz8QAUVay8gliDC6WcKlOZMiSvK1XOUYw8iS7hrp5w5Ay
         8UppHEVxuyLRDBTZHqZcJ/jISXS6NUk5vpD/OBiZGhotdiqJua+AxlsZuhl6Wis008
         1Y/FdIT70dtNKokQdH6wbhwclXFx96Wc6YL5BTxbzBxdDXXQNAsdyY0Uo4C1/DKuHj
         S7SazjYfnja+A==
Date:   Fri, 6 Oct 2023 01:00:08 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Naresh Solanki <naresh.solanki@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Message-ID: <20231005230008.kw3u76gmudpia4cq@zenone.zhora.eu>
References: <20231005134541.947727-1-naresh.solanki@9elements.com>
 <20231005134541.947727-2-naresh.solanki@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231005134541.947727-2-naresh.solanki@9elements.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Thu, Oct 05, 2023 at 03:45:40PM +0200, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Enable additional features based on DT settings and unconditionally
> release the shared interrupt pin after 1.6 seconds and allow to use
> it as reset.
> 
> These features aren't enabled by default & its up to board designer

/&/and/
/its/it's/

> to enable the same as it may have unexpected side effects.

which side effects?

> These should be validated for proper functioning & detection of devices

/&/and/

it ain't WhatsApp :-)

> in secondary bus as sometimes it can cause secondary bus being disabled.

Is this latest sentence a related to this patch or is it a free
information?

> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

[...]

>  	else
>  		data->last_chan = 0; /* Disconnect multiplexer */
>  
> -	ret = i2c_smbus_write_byte(client, data->last_chan);
> +	if (device_is_compatible(&client->dev, "maxim,max7357")) {
> +		if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
> +			u8 conf = MAX7357_POR_DEFAULT_CONF;
> +			/*
> +			 * The interrupt signal is shared with the reset pin. Release the
> +			 * interrupt after 1.6 seconds to allow using the pin as reset.
> +			 * The interrupt isn't serviced yet.
> +			 */
> +			conf |= MAX7357_CONF_RELEASE_INT;

This setting comes as default, what about the dedicated reset
gpio pin? How is the driver going to understand whether from the
irq pin is coming a reset or an interrupt?

> +			if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
> +				conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
> +			if (device_property_read_bool(&client->dev,
> +						      "maxim,send-flush-out-sequence"))
> +				conf |= MAX7357_CONF_FLUSH_OUT;
> +			if (device_property_read_bool(&client->dev,
> +						      "maxim,preconnection-wiggle-test-enable"))
> +				conf |= MAX7357_CONF_PRECONNECT_TEST;

How are these properties affecting the economy of the driver? Can
we have a brief description?

Andi
