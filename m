Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C7005E8E55
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 18:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbiIXQFm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 12:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiIXQFl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 12:05:41 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CA963BC6B;
        Sat, 24 Sep 2022 09:05:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0CD70B80782;
        Sat, 24 Sep 2022 16:05:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FAAC433C1;
        Sat, 24 Sep 2022 16:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664035537;
        bh=Bs9NJ0R82GcaSwooJvmvxGQW/0RDf+v/EwvcXxNfKNc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QogBWn5ugx2RTc98GivhcN1QwRXyxRERBR+g75Sg9EjAXXyAc6G1iE5V44EvSPwsQ
         tep/1pXpEZOFCFJSXJkaAsOZWApML8c94Cjz7QG2WT1EwCUD/TXnbkJc0N2J0U2Ox9
         wMocwvDfdLPAn/PjbWexAcAf7Honc8peodN3RBExn1jfMeqmBGPDS979+IUkDb6ROF
         kJ++9Xaa7ubHj3VOjiVn2XcAVu6rzosPyh8eCGs++y8MBBcdgHqwRXx9cHMTInPIKm
         kwCahkte4rAEb1idQ42ealkn0Hgavxcc2MbRb2O6+a/3FjgNFJBWdaLaSPhyWhnEuL
         vO2+nAmZgN2Yw==
Date:   Sat, 24 Sep 2022 17:05:45 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 2/5] iio: addac: stx104: fix future recursive
 dependencies
Message-ID: <20220924170545.0b581e6d@jic23-huawei>
In-Reply-To: <20220921063026.89619-3-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
        <20220921063026.89619-3-matt.ranostay@konsulko.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 20 Sep 2022 23:30:23 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> When using 'imply IIO' for other configurations which have 'select GPIOLIB'
> the following recursive dependency is detected for STX1040
> 
> Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
> recommendation in kconfig-language.rst
> 
> drivers/gpio/Kconfig:14:error: recursive dependency detected!
> drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by STX104
> drivers/iio/addac/Kconfig:20:   symbol STX104 depends on IIO
> drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
> drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Given this wants to go in with the patch that causes the problem (and definitely
not after it!)- I'll assume this will go via the HID tree.


Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/addac/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/addac/Kconfig b/drivers/iio/addac/Kconfig
> index fcf6d2269bfc..494790816ac7 100644
> --- a/drivers/iio/addac/Kconfig
> +++ b/drivers/iio/addac/Kconfig
> @@ -19,9 +19,8 @@ config AD74413R
>  
>  config STX104
>  	tristate "Apex Embedded Systems STX104 driver"
> -	depends on PC104 && X86
> +	depends on PC104 && X86 && GPIOLIB
>  	select ISA_BUS_API
> -	select GPIOLIB
>  	help
>  	  Say yes here to build support for the Apex Embedded Systems STX104
>  	  integrated analog PC/104 card.

