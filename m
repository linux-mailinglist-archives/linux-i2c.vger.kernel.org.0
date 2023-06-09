Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 068007295A1
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jun 2023 11:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241718AbjFIJlC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Jun 2023 05:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242006AbjFIJkQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Jun 2023 05:40:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932AB46B1
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 02:35:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE8D5655FF
        for <linux-i2c@vger.kernel.org>; Fri,  9 Jun 2023 09:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583B8C433EF;
        Fri,  9 Jun 2023 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686303241;
        bh=iH3dyjRyQIQgYXi71MyFp6V3lIQkmbSod+R6mloCwFU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ptQMo9HMgetrMGopklRx7jzRDZ17DJqBvF3mFEQqKKsSJK6QOqj8B2ht1J853kazT
         1TGLcOJgJ7OZXDoEk2uDU3k9OmCv327fWA8ruaBKBjvtfj2Zkf3NlSHQ+1SxdaBdwh
         vItfQ8g8NyBG08j9K6rWrh+hQzDNjQGykdv1fD5lnRU1M4DCPaGV+iORND1BHTOkzC
         fEqLbtOBt98zVGE5IhsS0o2bTLNhw3WEfZOOxld6pyu45J2y9fdc+BthzYPEhKqaXL
         JJlGxYORBhRIeKJg0dv0dAYHqerWCzo3hJdCusH9ftNVJVAJUIgukeHmSqbZs9orBc
         pRgz1zwoVBVvg==
Message-ID: <a6c22dd5-262c-4829-1eda-601cff697553@kernel.org>
Date:   Fri, 9 Jun 2023 11:33:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v4] i2c: add support for Zhaoxin I2C controller
To:     Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     cobechen@zhaoxin.com, TonyWWang@zhaoxin.com
References: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230609031625.6928-1-hanshu-oc@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/06/2023 05:16, Hans Hu wrote:
> Add Zhaoxin I2C controller driver. It provides the access to the i2c
> busses, which connects to the touchpad, eeprom, etc.
> 
> Zhaoxin I2C controller has two separate busses, so may accommodate up
> to two I2C adapters. Those adapters are listed in the ACPI namespace
> with the "IIC1D17" HID, and probed by a platform driver.
> 
> The driver works with IRQ mode, and supports basic I2C features. Flags
> I2C_AQ_NO_ZERO_LEN and I2C_AQ_COMB_WRITE_THEN_READ are used to limit
> the unsupported access.
> 


> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb932c6f8959..bb61e19eef72 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9761,6 +9761,13 @@ L:	linux-i2c@vger.kernel.org
>  F:	Documentation/i2c/busses/i2c-ismt.rst
>  F:	drivers/i2c/busses/i2c-ismt.c
>  
> +ZHAOXIN I2C CONTROLLER DRIVER
> +M:	Hans Hu <hanshu@zhaoxin.com>
> +L:	linux-i2c@vger.kernel.org
> +S:	Maintained
> +W:	https://www.zhaoxin.com
> +F:	drivers/i2c/busses/i2c-zhaoxin.c
> +
>  I2C/SMBUS STUB DRIVER
>  M:	Jean Delvare <jdelvare@suse.com>
>  L:	linux-i2c@vger.kernel.org
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 87600b4aacb3..1f181757ce2a 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -333,6 +333,16 @@ config I2C_VIAPRO
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-viapro.
>  
> +config I2C_ZHAOXIN
> +	tristate "ZHAOXIN I2C Interface"
> +	depends on (PCI && ACPI) || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  ZHAOXIN I2C interface
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called i2c-zhaoxin.
> +
>  if ACPI
>  
>  comment "ACPI drivers"

Shouldn't you driver be in ACPI drivers?

...

> +
> +static int zxi2c_probe(struct platform_device *pdev)
> +{
> +	int err = 0;
> +	struct zxi2c *i2c;
> +	struct pci_dev *pci;
> +	struct device *dev;
> +
> +	/* make sure this is zhaoxin platform */

Why? You didn't provid explanation last time for this.

> +	dev = pdev->dev.parent;
> +	if (dev && dev_is_pci(dev)) {
> +		pci = to_pci_dev(dev);
> +		if (pci->vendor != PCI_VENDOR_ID_ZHAOXIN ||
> +		    pci->device != ZXI2C_PARENT_PCI_DID)
> +			return -ENODEV;
> +	} else {
> +		return -ENODEV;
> +	}

Drop it.

> +


Best regards,
Krzysztof

