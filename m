Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BAF46410E9
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 23:52:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiLBWwr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 17:52:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiLBWwp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 17:52:45 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2D710B4E;
        Fri,  2 Dec 2022 14:52:43 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 3-20020a17090a098300b00219041dcbe9so6381753pjo.3;
        Fri, 02 Dec 2022 14:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gEE4JrsehGhRKU15NnOEpAKRAPcQRZ9RQqzVHv3f2PY=;
        b=hPOcgrQM+Fjo2OJqHC0LTYfpU7qdD31QzFNdI+22DO7/Tqm4VlG9Nznma6t9TmEgp7
         8/E8ezsdpdIYrjW701L0Qkoe3+LSSb8fVBh7Prk14ziM5vYsW2iqhDkBv/7sJySBTotV
         xhe9+V+Ljoro+f0Eo05onbutf0MqlO+MVaCSVe1bpW6Jxm8ER2Yteo8rcxL09HcZ/w80
         z21VPODnqsGaXtIorcB1ttbzMtAb+JEZlexDGSw54p0rjA91TNbAzgXf3Op9G1Hg/QqT
         jHTt5gcsKhREa+s+02VN/ikQh4VgsZYA7PobD7mpOvxAnuib6QYOmeZHAKXowCVbC0XG
         fX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gEE4JrsehGhRKU15NnOEpAKRAPcQRZ9RQqzVHv3f2PY=;
        b=hc9zR+QyaUGceHjkLJLvZaAXBj+z3NKdyAIRPcFmDdOayS4gRBqMKvAGNRSghA3E5F
         mDzt/LUGUnYjz3GTMejxHVoPFp/GaeXNOl0VX/UXzouusWOiNF170dhIi0gI6IZx0/45
         r1K6oaV89YJ5Zx4CYS+nGD6y90CSvkwYz7OyFjkuxu9C8X6avRgFcM6PCL0wM1i7lhf5
         uPvbwVyQTm78BCta8Ypk1dYUs2TPtr6VxmgHXkJHkEvELvykBhpQKH/24JB9bOLs5soy
         rdzVDeR79676zRl8e0qMtoxy49NUj396ElzIqHoEwYc8tNd5ZSoxxmJpJT3h8BNsS3bS
         7+Xg==
X-Gm-Message-State: ANoB5pn8+4lSovLaTQtYc/KleihJ3WCeZez8Ut/VbXMHue3fjrMvWefL
        iYM7xcQYNAB6TZ0hWeTPESE=
X-Google-Smtp-Source: AA0mqf41AAhFrCFB933koqspmtegZ2jCQQRfxD/xpydn7B4XmNFS1Z35I2hk/1jFJ6q2uostYf7ZEw==
X-Received: by 2002:a17:903:491:b0:17f:73d6:4375 with SMTP id jj17-20020a170903049100b0017f73d64375mr54940047plb.24.1670021563006;
        Fri, 02 Dec 2022 14:52:43 -0800 (PST)
Received: from [172.30.1.1] ([14.32.163.5])
        by smtp.gmail.com with ESMTPSA id f18-20020a17090aa79200b0021864cf062dsm5275728pjq.21.2022.12.02.14.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 14:52:42 -0800 (PST)
Message-ID: <d8944efc-57df-98ec-a6ec-678db9c6ffa8@gmail.com>
Date:   Sat, 3 Dec 2022 07:52:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/3] extcon: intel-cht-wc: Add support for Lenovo Yoga Tab
 3 Pro YT3-X90F
To:     Hans de Goede <hdegoede@redhat.com>, Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221127182257.104410-1-hdegoede@redhat.com>
 <20221127182257.104410-4-hdegoede@redhat.com>
From:   Chanwoo Choi <cwchoi00@gmail.com>
Content-Language: en-US
In-Reply-To: <20221127182257.104410-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22. 11. 28. 03:22, Hans de Goede wrote:
> The Lenovo Yoga Tab 3 Pro YT3-X90F needs the same handling as
> the Lenovo Yogabook models. That is it needs the extcon code to:
> 
> 1. Control the Vbus regulator and USB-role-switch for the micro-USB
>    port's host/device mode switching.
> 2. Register a power_supply device so that the charger-chip driver can
>    see what sort of charger (SDP/CDP/DCP) is connected.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/extcon/extcon-intel-cht-wc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/extcon/extcon-intel-cht-wc.c b/drivers/extcon/extcon-intel-cht-wc.c
> index c45d7ff6cc61..323ab8731284 100644
> --- a/drivers/extcon/extcon-intel-cht-wc.c
> +++ b/drivers/extcon/extcon-intel-cht-wc.c
> @@ -539,6 +539,7 @@ static int cht_wc_extcon_probe(struct platform_device *pdev)
>  		cht_wc_extcon_set_gpio(ext, CHT_WC_VBUS_GPIO_CTLO, false);
>  		break;
>  	case INTEL_CHT_WC_LENOVO_YOGABOOK1:
> +	case INTEL_CHT_WC_LENOVO_YT3_X90:
>  		/* Do this first, as it may very well return -EPROBE_DEFER. */
>  		ret = cht_wc_extcon_get_role_sw_and_regulator(ext);
>  		if (ret)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Thanks.

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

