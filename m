Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 468A773BA57
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jun 2023 16:39:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbjFWOjE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jun 2023 10:39:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbjFWOjD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jun 2023 10:39:03 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE47A1
        for <linux-i2c@vger.kernel.org>; Fri, 23 Jun 2023 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687531141; x=1719067141;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7dFtHmAI0ilGhYuq26XkL5GH9TosFOESpg2wiQ1WmYA=;
  b=CPpQR78z0XnzqooHeI5JbhPyybahyr9OyMFNb+635BiuClnojksWYcm7
   BoXM1FzuyRFXU24rnssyFa766QRwUZiNEQTqi4BtpheBYMaYDtSMC3e31
   l26hmmVejpV/r83NAGU2p1sLbqeczfHvK5dDu8/VwcPTuKmIi62q+oW58
   eUzCXzToonQwan4UTUwbI/GWNkdVyXUSBsqZiaEv7zyOV0toLnI2s8nJx
   msuYxrGY96dZpkhglsEwnYI+lVd8KZDvaCT8AJKir9DDmTqXW7CDEv8xs
   bWBv7b4t9vem3vEgHVoaJh5sqVi/HVP3CU3e+MrE24/w4He7PRYFkoOkw
   A==;
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="219500558"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Jun 2023 07:39:01 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 23 Jun 2023 07:39:01 -0700
Received: from [10.159.245.112] (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 23 Jun 2023 07:39:00 -0700
Message-ID: <b7616125-0467-451c-90aa-0b863012f7a9@microchip.com>
Date:   Fri, 23 Jun 2023 16:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/15] i2c: busses: at91-core: Use devm_clk_get_enabled()
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>
CC:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Durai Manickam <Durai.ManickamKR@microchip.com>
References: <20230611225702.891856-1-andi.shyti@kernel.org>
 <20230611225702.891856-4-andi.shyti@kernel.org>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230611225702.891856-4-andi.shyti@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/06/2023 at 00:56, Andi Shyti wrote:
> Replace the pair of functions, devm_clk_get() and
> clk_prepare_enable(), with a single function
> devm_clk_get_enabled().
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>

Looks good to me:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Best regards,
   Nicolas

> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>   drivers/i2c/busses/i2c-at91-core.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 05ad3bc3578ac..2251e0deed29c 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -226,12 +226,11 @@ static int at91_twi_probe(struct platform_device *pdev)
> 
>          platform_set_drvdata(pdev, dev);
> 
> -       dev->clk = devm_clk_get(dev->dev, NULL);
> +       dev->clk = devm_clk_get_enabled(dev->dev, NULL);
>          if (IS_ERR(dev->clk)) {
> -               dev_err(dev->dev, "no clock defined\n");
> +               dev_err(dev->dev, "failed to enable clock\n");
>                  return -ENODEV;
>          }
> -       clk_prepare_enable(dev->clk);
> 
>          snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
>          i2c_set_adapdata(&dev->adapter, dev);
> @@ -260,8 +259,6 @@ static int at91_twi_probe(struct platform_device *pdev)
> 
>          rc = i2c_add_numbered_adapter(&dev->adapter);
>          if (rc) {
> -               clk_disable_unprepare(dev->clk);
> -
>                  pm_runtime_disable(dev->dev);
>                  pm_runtime_set_suspended(dev->dev);
> 
> @@ -278,7 +275,6 @@ static void at91_twi_remove(struct platform_device *pdev)
>          struct at91_twi_dev *dev = platform_get_drvdata(pdev);
> 
>          i2c_del_adapter(&dev->adapter);
> -       clk_disable_unprepare(dev->clk);
> 
>          pm_runtime_disable(dev->dev);
>          pm_runtime_set_suspended(dev->dev);
> --
> 2.40.1
> 

-- 
Nicolas Ferre

