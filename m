Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6536FE2CE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 May 2023 18:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbjEJQ4P (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 May 2023 12:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjEJQ4O (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 May 2023 12:56:14 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C2910CE
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 09:56:09 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3062b101ae1so4871866f8f.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 May 2023 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683737768; x=1686329768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=76FXAH8QjI+FOKBGsSy8WrQUk/FqdfktfF/bZ9G6p1o=;
        b=gNKuLRopV1WQ4kTxS/5wQ4m7hl4+BBPI5aKmYXMfQzCkG/dQTYM6HjsPXyuP9p8gC7
         DYoA6qAoWh6KkfZn5ttIKFY0ArHdhQ9C5jYWkQAVD1p5tYLPQ0619I0wlXfMh0NMLH7R
         cmVUVONh/MADkTDLSeKaa2PSwNA6CZlB+7L+Sos2GSwWyi8Xl3bj23T3XSF6GEw+RrcZ
         JKKiDf1B2Xgk6JHIRfcPUy2yOim6DRFEF1qG3FMof9GLw7utN4ueUescSZGpAd6gmVrD
         oFoKFWR5bCPsbfITWgjNhsB9FKmJ1nS70yD1AFocheVXy9bUxHBe0ZM+Zojj4yyP0cYo
         27KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683737768; x=1686329768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=76FXAH8QjI+FOKBGsSy8WrQUk/FqdfktfF/bZ9G6p1o=;
        b=RotO/prMkqjGnARNFsj1o+9c6n9CA6Ui7rkC7VOiP0Fv85tHDXF4cSFR1GL8qKQL+I
         A/oRwdinlzjslZVJxH7dqWePhQbRAK442PkAEvaCECvhWQCvjZ9oQDYgFEqJ5lI1++eT
         odm2TvVmv+MBrsld8STnDBr1eoL58UCZNftHT48v/DzcwG1Tj3Je0BU7iufL8/6b1gm4
         HZ4u8TQMkUX/SYVoQAJPjbcUradgJVRp/SdqKkOycgsUx+TY/JxsC5YFwlCniac2BSGl
         AWklRKWCqriQQsWXGvKVURmAMU8zwTyXVlyLMkDoVe6VM97s875OgAaq3Evv42V9g5R0
         GKBw==
X-Gm-Message-State: AC+VfDzelLFN1qdXW/7A+UKHdgUtTK8b5enfbStXu1zhl3XVAEZ0bvYL
        e4lj44ZYWyMCAd7TCL5f6oc=
X-Google-Smtp-Source: ACHHUZ62RGTf3iIJSn5ZpPrGv/U9gxaQ0dWwbzOVZAIuYaRat6he6PFt5S7VdYEzDyP1bpENowcR9g==
X-Received: by 2002:adf:de8d:0:b0:2f5:3fa1:6226 with SMTP id w13-20020adfde8d000000b002f53fa16226mr13285768wrl.14.1683737767570;
        Wed, 10 May 2023 09:56:07 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b002fe13ec49fasm17764802wrn.98.2023.05.10.09.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 09:56:05 -0700 (PDT)
Message-ID: <450c7dae-9935-1189-4853-001f5f1d1be6@gmail.com>
Date:   Wed, 10 May 2023 18:56:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 42/89] i2c: mt7621: Convert to platform remove callback
 returning void
Content-Language: en-US, ca-ES, es-ES
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Stefan Roese <sr@denx.de>, Wolfram Sang <wsa@kernel.org>
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-43-u.kleine-koenig@pengutronix.de>
From:   Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230508205306.1474415-43-u.kleine-koenig@pengutronix.de>
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
>   drivers/i2c/busses/i2c-mt7621.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
> index 20eda5738ac4..f9c294e2bd3c 100644
> --- a/drivers/i2c/busses/i2c-mt7621.c
> +++ b/drivers/i2c/busses/i2c-mt7621.c
> @@ -332,19 +332,17 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int mtk_i2c_remove(struct platform_device *pdev)
> +static void mtk_i2c_remove(struct platform_device *pdev)
>   {
>   	struct mtk_i2c *i2c = platform_get_drvdata(pdev);
>   
>   	clk_disable_unprepare(i2c->clk);
>   	i2c_del_adapter(&i2c->adap);
> -
> -	return 0;
>   }
>   
>   static struct platform_driver mtk_i2c_driver = {
>   	.probe		= mtk_i2c_probe,
> -	.remove		= mtk_i2c_remove,
> +	.remove_new	= mtk_i2c_remove,
>   	.driver		= {
>   		.name	= "i2c-mt7621",
>   		.of_match_table = i2c_mtk_dt_ids,
