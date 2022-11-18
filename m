Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA196302D2
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 00:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiKRXST (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Nov 2022 18:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbiKRXRy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Nov 2022 18:17:54 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE22378B27
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:01:12 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id g10so5799966plo.11
        for <linux-i2c@vger.kernel.org>; Fri, 18 Nov 2022 15:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flatmax-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jeg5OPbcU8Um2n3zzZ8ZeF9Qwca653OFnBoiSDNreoU=;
        b=jCNJD4bxBXoCXfG8DydsvITI5IlXvVpTpnrkGNFZawmCwvS2ZrwWB4Wf6zb+WDzMeX
         xcvnxHhjYt/XM0EvmLuFLhsQ4wJCuEQwA3QkYC4uCLRBWz6Yn0VakY0fSUUEu42Roovz
         FztGlZfDJjISJmGtoaknWeACdznB9bKZeNbo3W0+7eQmxPmSQszj+p9rVR1uuqamXj7x
         L2I6/5A8WKwo4LXOFXskapC6KygVCKGe7jLeANfnLKlTksH6JCmkuan0R3MHH9bJfTUE
         MHwl0hXqnvg0MetsN2GRsff/sQBkup8vsN3dGmx6oszthoWzPqi59uf6vvp1nvb5Rhw1
         tgPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jeg5OPbcU8Um2n3zzZ8ZeF9Qwca653OFnBoiSDNreoU=;
        b=2jlenI3q9iMguCVRVkRWVUfupLyINjbPkESUc7EMuib1S44J9gUw76UR5OwYI9xVYN
         8T52YrvT1CL1pQrELhHBAGBbcxyWPGBzPxe0EWCKIUdAHuqA2u00OH0GfKc1E5f7PuU2
         WbF8GboA7bcKU9kf/FcraGvkkZ76nQLEpvCwTvPjq+IJbMpfxudRdi7+gPIb6u34KbbG
         h/WkbdrY+5TsnmHm2ySIO/53TJYFTHXQdEBRk86PIkCq/shdI3D3TIyYrsoHQdk+FK/l
         C/Pf6olnLekI8dSKCDSa7W+J4rWMasTf+6GkxlnraTgYAuyYNTGPeQcBNdMxxRpAKlCx
         tnaw==
X-Gm-Message-State: ANoB5plb5i3jyjwZzKejbSgGFUFWa4k7Aw03d7TXFohTKBUKOtfjPzcL
        an0ddwZW1df/BNZ+bBoma+yN026FY1wDKw==
X-Google-Smtp-Source: AA0mqf7ynBarcnD4LPeA+XPoRO3UNn4nstk3Sm2a7p0+99ICAzmWZ1OZ9laAvn2SyrvJ4EOFWN101g==
X-Received: by 2002:a17:90b:4d0b:b0:214:1329:dec7 with SMTP id mw11-20020a17090b4d0b00b002141329dec7mr15978573pjb.91.1668812472181;
        Fri, 18 Nov 2022 15:01:12 -0800 (PST)
Received: from ?IPV6:2406:3400:213:70c0:9df6:7e57:88ce:1bea? ([2406:3400:213:70c0:9df6:7e57:88ce:1bea])
        by smtp.gmail.com with ESMTPSA id u71-20020a62794a000000b00562019b961asm3696850pfc.188.2022.11.18.15.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 15:01:11 -0800 (PST)
Message-ID: <6f431abb-356c-b057-2784-6b5f165a2a2d@flatmax.com>
Date:   Sat, 19 Nov 2022 10:01:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 603/606] ASoC: codecs: src4xxx-i2c: Convert to i2c's
 .probe_new()
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-604-uwe@kleine-koenig.org>
Content-Language: en-AU
From:   Matt Flax <flatmax@flatmax.com>
In-Reply-To: <20221118224540.619276-604-uwe@kleine-koenig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Reviewed-by: Matt Flax <flatmax@flatmax.com>

On 19/11/22 09:45, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   sound/soc/codecs/src4xxx-i2c.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
> index 43daa9dc8ab5..27026030704a 100644
> --- a/sound/soc/codecs/src4xxx-i2c.c
> +++ b/sound/soc/codecs/src4xxx-i2c.c
> @@ -12,8 +12,7 @@
>   
>   #include "src4xxx.h"
>   
> -static int src4xxx_i2c_probe(struct i2c_client *i2c,
> -			const struct i2c_device_id *id)
> +static int src4xxx_i2c_probe(struct i2c_client *i2c)
>   {
>   	return src4xxx_probe(&i2c->dev,
>   		devm_regmap_init_i2c(i2c, &src4xxx_regmap_config), NULL);
> @@ -37,7 +36,7 @@ static struct i2c_driver src4xxx_i2c_driver = {
>   		.name = "src4xxx",
>   		.of_match_table = of_match_ptr(src4xxx_of_match),
>   	},
> -	.probe = src4xxx_i2c_probe,
> +	.probe_new = src4xxx_i2c_probe,
>   	.id_table = src4xxx_i2c_ids,
>   };
>   module_i2c_driver(src4xxx_i2c_driver);
