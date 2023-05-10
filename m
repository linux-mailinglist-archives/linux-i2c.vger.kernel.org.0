Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E3C6FE2CC
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 18:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjEJQzx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 12:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjEJQzx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 12:55:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E95F113
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 09:55:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f315735514so254831945e9.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 09:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683737750; x=1686329750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9y7cGD3DdhxiTnvOkhxIVt549Y/e7kFTE/+uk3TXWg=;
        b=ldXAkfpTo6z8AMiwx38DDlh15ZKGU4BpuVeFTScNNtgMhWVBikjfiQ9n1LZOup0LuO
         3Oop3vDms+w/1o5p6d+s1ifEQo/OMIkmPPYe40yOY3oaxAh4HBxw5avcF2q9QfvXr0zS
         hH/Q/VbxN9finYJmHwuJLGwIoEFF1Tk2TojfdiZuWX3r3nXiAf8hNw6dGoYun6qHqJwu
         TXkdG4c+QMfzHLIXlhuJDrrbZwSRBh49ye5cICAfbwGmecDnoy6gReyu249FaO4vfaAa
         Tx7FWWRVTiWqtEyG1dlnMUYZfzG3JeXxjiQbP0qLIm5ZMsYinSjv5+q0PWXM8+UPx63e
         ca2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737750; x=1686329750;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9y7cGD3DdhxiTnvOkhxIVt549Y/e7kFTE/+uk3TXWg=;
        b=NHuFZtVF6HTPLSNrpwuasAn++qs5x7pGAQQF4qqezy15ROjUs9aDvBZKlgGghFmWZv
         k8ye3u8OW34xysnW41yBlE/E9z7DSVo3+OaKdRlPlGcq15EX8uHD290V7EyCsVWjivCF
         vNDccAnTaZAlQM7eEpgWGZY1aXWbIhNMdGOXYMPwEkDsS4psAAhlUdieLz0VRtUChtCv
         m6zY/wF5NJHbQZR7UOuDJH5JTt+LUluAOb/b3VZgE6IPtlkWqxrk1WVPsC6kvVCujyyf
         vpwgPISxFTiQ2HJ+1yGf5b/WMUUgV+yYFgOyl05J0VjT4UTMyt3sG+FzYwERl2JDQTxT
         HoiA==
X-Gm-Message-State: AC+VfDwTNGosWOKYh6MesaI4xMyttQCzi6huwr7ySEOFZVPI7mEx3RJe
        0tMGfwgXjr9QTRXVXv53jec=
X-Google-Smtp-Source: ACHHUZ4JOPmHj45Ix++KLw55iJfyL9l77zzzY6bH3JYTV32D7R7TFxqwc7S4vI3oaBhXTU4NXdKB/Q==
X-Received: by 2002:a05:600c:5129:b0:3f1:7371:86bb with SMTP id o41-20020a05600c512900b003f1737186bbmr11018982wms.20.1683737749992;
        Wed, 10 May 2023 09:55:49 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c024a00b003f423dfc686sm10585430wmj.45.2023.05.10.09.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:55:48 -0700 (PDT)
Message-ID: <a477f921-909e-ae83-f8af-0d794f8859fb@gmail.com>
Date:   Wed, 10 May 2023 18:55:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 41/89] i2c: mt65xx: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Qii Wang <qii.wang@mediatek.com>, Wolfram Sang <wsa@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-42-u.kleine-koenig@pengutronix.de>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230508205306.1474415-42-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 08/05/2023 22:52, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index a43c4d77739a..7ca3f2221ba6 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1505,15 +1505,13 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_i2c_remove(struct platform_device *pdev)
> +static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
>   	i2c_del_adapter(&i2c->adap);
>   
>   	clk_bulk_unprepare(I2C_MT65XX_CLK_MAX, i2c->clocks);
> -
> -	return 0;
>   }
>   
>   #ifdef CONFIG_PM_SLEEP
> @@ -1555,7 +1553,7 @@ static const struct dev_pm_ops mtk_i2c_pm = {
>   
>   static struct platform_driver mtk_i2c_driver = {
>   	.probe = mtk_i2c_probe,
> -	.remove = mtk_i2c_remove,
> +	.remove_new = mtk_i2c_remove,
>   	.driver = {
>   		.name = I2C_DRV_NAME,
>   		.pm = &mtk_i2c_pm,
