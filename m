Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0580078A6FF
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Aug 2023 10:04:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjH1IER (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Aug 2023 04:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjH1ID6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Aug 2023 04:03:58 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68AE5114;
        Mon, 28 Aug 2023 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1693209835; x=1724745835;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=W6UvRcQNcknRhKMqAymfgYVMc/oAF9o4ms5wsMxD9pw=;
  b=vogpT6sSKhUWe95dTItTx7+scjwl9ttkhf4gBCS79D2WpzqEYXL2xXIa
   /Jw2FSZPerU9f88SfqoI8UtzNSI/XLxlUj8gtEwR3TuaU/DfO7i6LxFII
   upeQNpUANmDkWthzQVN9rCQ3ql1QxqwEh4FAl6eOJDDYbIK/aV8SPPEBH
   F0lTn0+atp+pF8VRPvQMsisEVfK8DldeB7/OAmWfrfZhIjrEn9uWSabL+
   CsCeTaZmZ0lJz0sVtEb4E946GambkbbSwRUUpbV543o3Q7xOsczv6ZvKP
   2OJU93Zdmvfct6eE991DT5AcH8UQEnj0sVNFqxl0gVPGyAMfKOOi1kUd/
   g==;
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1641246"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Aug 2023 01:03:53 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 28 Aug 2023 01:03:24 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 28 Aug 2023 01:03:23 -0700
Message-ID: <5c680292-bcfe-881a-1c23-299c05b377ee@microchip.com>
Date:   Mon, 28 Aug 2023 10:03:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH RESEND] i2c: at91: Use dev_err_probe() instead of
 dev_err()
Content-Language: en-US, fr-FR
To:     Yann Sionneau <yann@sionneau.net>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>
CC:     <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20230825143234.38336-1-yann@sionneau.net>
From:   Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20230825143234.38336-1-yann@sionneau.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/08/2023 at 16:32, Yann Sionneau wrote:
> Change
> if (IS_ERR(x)) { dev_err(...); return PTR_ERR(x); }
> into
> return dev_err_probe()
> 
> Also, return the correct error instead of hardcoding -ENODEV
> This change has also the advantage of handling the -EPROBE_DEFER situation.

Is it found using a tool like Coccinelle or you just ran into it and 
figured out it could be good to change?

Regards,
   Nicolas

> Signed-off-by: Yann Sionneau <yann@sionneau.net>
> ---
>   drivers/i2c/busses/i2c-at91-core.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index 05ad3bc3578a..b7bc17b0e5f0 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -227,10 +227,9 @@ static int at91_twi_probe(struct platform_device *pdev)
>          platform_set_drvdata(pdev, dev);
> 
>          dev->clk = devm_clk_get(dev->dev, NULL);
> -       if (IS_ERR(dev->clk)) {
> -               dev_err(dev->dev, "no clock defined\n");
> -               return -ENODEV;
> -       }
> +       if (IS_ERR(dev->clk))
> +               return dev_err_probe(dev->dev, PTR_ERR(dev->clk), "no clock defined\n");
> +
>          clk_prepare_enable(dev->clk);
> 
>          snprintf(dev->adapter.name, sizeof(dev->adapter.name), "AT91");
> --
> 2.34.1
> 

