Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDA9766DABA
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 11:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236570AbjAQKQc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 05:16:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236576AbjAQKQX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 05:16:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3217D1D915;
        Tue, 17 Jan 2023 02:16:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E148AB8128A;
        Tue, 17 Jan 2023 10:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD7BC433D2;
        Tue, 17 Jan 2023 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1673950572;
        bh=4nUdh6r/RqhO+UCX8sxbmzKcUCZTpAL3SHTGFRsjOAo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=okniVIeCYcNaUbY9G8aa0Ck3ZkEhskzGWbLXzgXVHpa0t3i9xX/YIggZj816jOff+
         gDbKi/NTT1k31NZHQV9C2JZQfvUMaGKh/bkTthkJSOZ+eO2gAoFqNfLzEnR7cb7Ov3
         ry/Qt3GpNJ7ZNB+RV2X3dkuazdbRx0saUJ1e9OLg=
Date:   Tue, 17 Jan 2023 11:15:03 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc:     patrick@stwcx.xyz, Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>, garnermic@fb.com,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] misc: Add meta cld driver
Message-ID: <Y8Z1JxsLA6UKi805@kroah.com>
References: <20230117094425.19004-1-Delphine_CC_Chiu@Wiwynn.com>
 <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117094425.19004-4-Delphine_CC_Chiu@Wiwynn.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jan 17, 2023 at 05:44:22PM +0800, Delphine CC Chiu wrote:
> Add support for meta control-logic-device driver. The CLD manages the
> server system power squence and other state such as host-power-state,
> uart-selection and presense-slots. The baseboard management controller
> (BMC) can access the CLD through I2C.
> 
> The version 1 of CLD driver is supported. The registers number, name
> and mode of CLD can be defined in dts file for version 1. The driver
> exports the filesystem following the dts setting.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> Tested-by: Bonnie Lo <Bonnie_Lo@Wiwynn.com>
> ---
>  MAINTAINERS                         |   6 +
>  drivers/misc/Kconfig                |   9 +
>  drivers/misc/Makefile               |   1 +
>  drivers/misc/control-logic-device.c | 443 ++++++++++++++++++++++++++++

That is a very generic name for a very specific driver.  Please make it
more hardware-specific.

Also, you add a bunch of undocumented sysfs files here, which require a
Documentation/ABI/ entries so that we can review the code to verify it
does what you all think it does.

And finally, why is this needed to be a kernel driver at all?  Why can't
you control this all through the userspace i2c api?

One review comment:

> +static int cld_remove(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct cld_client *cld = dev_get_drvdata(dev);
> +
> +	if (cld->task) {
> +		kthread_stop(cld->task);
> +		cld->task = NULL;
> +	}
> +
> +	devm_kfree(dev, cld);

Whenever you see this line in code, it's almost always a huge red flag
that someone is not using the devm_* api properly.  I think that is most
certainly the case here.

thanks,

greg k-h
