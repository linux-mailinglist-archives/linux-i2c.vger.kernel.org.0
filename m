Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058776FECE7
	for <lists+linux-i2c@lfdr.de>; Thu, 11 May 2023 09:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbjEKHde (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 May 2023 03:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbjEKHdI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 May 2023 03:33:08 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6B2421A
        for <linux-i2c@vger.kernel.org>; Thu, 11 May 2023 00:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1683790361; x=1715326361;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=umE62j3C43M51JL5CsP4pGKSRkWAZ5+mQ783j+j1teg=;
  b=dF4ruBzaYY4VfOtdvsDZQ2SktJhhVjUDnLgCOS1NB3r58Nk3WkdIx96X
   i1gWopY5vderq/S8lGmzVnSfy18MOzSCACIGEVsCGm8+2MUuU1TQwwaLd
   WydOTrXwBnaa1rurPVAZ9K/anN2NQhlVpuLLLq5/bHLzSJfob31ShKsP6
   kXuXGEh2vmLVluU6Cp3akB4oBZYiXGyH6hbKqqiLbgDHoT/8RH/KSiutG
   f5yrH3yKnWAUNj9XcdfZzRaj57vN8u7XYwtYDq2Xpn4Ab8tViL90oU2Qh
   CRpTXxuL706nGJcJ6Ie4R2dydVwf4xD0krI7rAP1OC8vDqVoZK30Ca0g9
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,266,1677567600"; 
   d="scan'208";a="214820066"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 May 2023 00:32:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 11 May 2023 00:32:32 -0700
Received: from localhost (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 11 May 2023 00:32:32 -0700
Date:   Thu, 11 May 2023 09:32:31 +0200
From:   Horatiu Vultur <horatiu.vultur@microchip.com>
To:     Simon Horman <horms@kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Nick Desaulniers" <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, <linux-i2c@vger.kernel.org>,
        <llvm@lists.linux.dev>
Subject: Re: [PATCH] i2c: mchp-pci1xxxx: Avoid cast to incompatible function
 type
Message-ID: <20230511073231.of2uriz4chdmfemq@soft-dev3-1>
References: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20230510-i2c-mchp-pci1xxxx-function-cast-v1-1-3ba4459114c4@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The 05/10/2023 14:32, Simon Horman wrote:
> 
> Rather than casting pci1xxxx_i2c_shutdown to an incompatible function type,
> update the type to match that expected by __devm_add_action.
> 
> Reported by clang-16 with W-1:
> 
>  .../i2c-mchp-pci1xxxx.c:1159:29: error: cast from 'void (*)(struct pci1xxxx_i2c *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>          ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
>                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  ./include/linux/device.h:251:29: note: expanded from macro 'devm_add_action'
>          __devm_add_action(release, action, data, #action)
>                                    ^~~~~~
> 
> No functional change intended.
> Compile tested only.

Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>

> 
> Signed-off-by: Simon Horman <horms@kernel.org>
> ---
>  drivers/i2c/busses/i2c-mchp-pci1xxxx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> index b21ffd6df927..5ef136c3ecb1 100644
> --- a/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> +++ b/drivers/i2c/busses/i2c-mchp-pci1xxxx.c
> @@ -1118,8 +1118,10 @@ static int pci1xxxx_i2c_resume(struct device *dev)
>  static DEFINE_SIMPLE_DEV_PM_OPS(pci1xxxx_i2c_pm_ops, pci1xxxx_i2c_suspend,
>                          pci1xxxx_i2c_resume);
> 
> -static void pci1xxxx_i2c_shutdown(struct pci1xxxx_i2c *i2c)
> +static void pci1xxxx_i2c_shutdown(void *data)
>  {
> +       struct pci1xxxx_i2c *i2c = data;
> +
>         pci1xxxx_i2c_config_padctrl(i2c, false);
>         pci1xxxx_i2c_configure_core_reg(i2c, false);
>  }
> @@ -1156,7 +1158,7 @@ static int pci1xxxx_i2c_probe_pci(struct pci_dev *pdev,
>         init_completion(&i2c->i2c_xfer_done);
>         pci1xxxx_i2c_init(i2c);
> 
> -       ret = devm_add_action(dev, (void (*)(void *))pci1xxxx_i2c_shutdown, i2c);
> +       ret = devm_add_action(dev, pci1xxxx_i2c_shutdown, i2c);
>         if (ret)
>                 return ret;
> 
> 

-- 
/Horatiu
