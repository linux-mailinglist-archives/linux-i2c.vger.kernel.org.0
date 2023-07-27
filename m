Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D2F7659C0
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 19:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232812AbjG0RO3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Jul 2023 13:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232815AbjG0RN7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Jul 2023 13:13:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7261C35A9;
        Thu, 27 Jul 2023 10:13:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 080BC61EF1;
        Thu, 27 Jul 2023 17:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DBBC433C7;
        Thu, 27 Jul 2023 17:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690478028;
        bh=AFPKBytJ6Pj64+Tjq6KtRqZyi5jRmPsAML5BH0f/lII=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CZwiNM9dKZA3hV5kE0A/+mLhS9s1dTmgY4pM88f8JbXYBSSZzkDMTrPWKA8bJUYzS
         6ENBJubS2033390jm83LqHwH2ew/uHOFfenb2MOkG7HClcsuSPWsrXnAuSpyeZ9IeO
         QYvmTh9z/l7o8+arR2tU3hkubhQ28lCz9yQcSVQly0qKLTpLsokZztnFNJb+rPWHKf
         ExsCURADVuOc25aflFVBBn0myLiK8dxnqqbPE4bBKCik59i0soamjKUITp9Ek9Ptid
         CKCjy0XhRfKo32LaSmJv8coN+0Dk21AJ37wpEvtjed2we3HAn+ZE/CPTl2ejR11WJq
         v+qnm/MY3SeAw==
Date:   Thu, 27 Jul 2023 19:13:45 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Harry Geyer <harry.geyer@devtank.co.uk>
Cc:     Till Harbaum <till@harbaum.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: tiny-usb: check usb base class before assuming the
 interface on device is for this driver
Message-ID: <20230727171345.7u53kcfeadubvvlq@intel.intel>
References: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162255.21551-1-harry.geyer@devtank.co.uk>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Harry,

On Thu, Jul 27, 2023 at 05:22:55PM +0100, Harry Geyer wrote:
> Patch allows usb devices with multiple interfaces to use this driver without
> this driver assuming all interfaces are i2c-tiny-usb.
> 
> Signed-off-by: Harry Geyer <harry.geyer@devtank.co.uk>
> ---
>  drivers/i2c/busses/i2c-tiny-usb.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tiny-usb.c b/drivers/i2c/busses/i2c-tiny-usb.c
> index d1fa9ff5aeab..1bffe36c40ad 100644
> --- a/drivers/i2c/busses/i2c-tiny-usb.c
> +++ b/drivers/i2c/busses/i2c-tiny-usb.c
> @@ -222,6 +222,10 @@ static int i2c_tiny_usb_probe(struct usb_interface *interface,
>  	int retval = -ENOMEM;
>  	u16 version;
>  
> +	if (interface->intf_assoc &&
> +	    interface->intf_assoc->bFunctionClass != USB_CLASS_VENDOR_SPEC)
> +		return -ENODEV;
> +

Thanks for resending it!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi
