Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04BBD4F48F3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Apr 2022 02:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354484AbiDEV4Q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Apr 2022 17:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443621AbiDEPkA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Apr 2022 11:40:00 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E3EE17DC86
        for <linux-i2c@vger.kernel.org>; Tue,  5 Apr 2022 06:57:19 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bg10so26934320ejb.4
        for <linux-i2c@vger.kernel.org>; Tue, 05 Apr 2022 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IVfxiW6zKe0dHxT2NnEjml4pjCNh93EsN7m5exyESZw=;
        b=UXRyAeEeXf2x76rRsTVT85Yu3qMDdIO8T76/plyF2HR/xrK6SSH+NaRviJpVZh7Qwg
         sDlhRAI83MwCI3gbOLnBxOCANE1IcKQwEfrAwCIyDHAAtFq710fD+ZRlVWZv/xEqZlP2
         2xaaXUL1FQTdhZiuvu+h3FVmKJ21wi4tSIvUxoAwP1nhl6vffFEzbfhRI4nAsZi2EVnd
         pMeyjuSEWFMQCRF/nJ7z/vfgUOwNgvH2iTxe8G1ZXH7d9W9pBEqLvYhucm/tg3XSPyUf
         uvwFMkqw+KsPAZDRjdA3KHBjqlNYwp3fE3vsEHxRyU2l/m40UVa6h2Ljee9euWBm9D1t
         GkIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IVfxiW6zKe0dHxT2NnEjml4pjCNh93EsN7m5exyESZw=;
        b=cqzR2XKWutOgSZlqIS6h/pUklEVIGBTmchJl2tLUZ6SjC1fZezTl+X1xFdduq/p3Ue
         kl/FnJMeBTfHcc1BDpEhHRiljoGppqP6zhpyX0qomolYG12DFU0ijfSZN7olKUAuzfnQ
         l7hsAweMC5IuneR9LtQ0GZ2wqgroebOWwOPXfLZf9ZOjY3Lvmk6TNkhsEx4WgDdPp1E2
         iI63m+4eax0gnN/E0epYclXZ7T6zIsVXDlMKuX/53KGRm35sCp5igj54IJsTO1yGJWoL
         WWa0ruNj4aXEiNx1xr5N8n08XpxFdnieVlkGsR1PuwFNtv0C+qyEpGgySmjiZgvFG5Ct
         pwtg==
X-Gm-Message-State: AOAM530tHIfQg2Sjcs6uWS5Ir7TCSlvU9WlvnHiGGwydXhOCsL4iSSh2
        ZzCmYgTJPk3zUbH3/q/D0l6Vrw==
X-Google-Smtp-Source: ABdhPJzrbED2j3hKopCA4gDE01wRh9WEQTM3OOohAmICtp6UQWRL7za5ii7DlT49Qvcs5o0Kwd6rww==
X-Received: by 2002:a17:906:3ad3:b0:6cd:382b:86e5 with SMTP id z19-20020a1709063ad300b006cd382b86e5mr3579318ejd.145.1649167038173;
        Tue, 05 Apr 2022 06:57:18 -0700 (PDT)
Received: from [192.168.0.182] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id v20-20020a056402349400b00419651e513asm6776474edc.45.2022.04.05.06.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 06:57:17 -0700 (PDT)
Message-ID: <e3247f0f-5d3d-d981-699e-7dcedb30f881@linaro.org>
Date:   Tue, 5 Apr 2022 15:57:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] i2c: add binding to prevent device detection
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>, wsa@kernel.org
Cc:     kernel@axis.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, krzk+dt@kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20220405121627.1560949-1-vincent.whitchurch@axis.com>
 <20220405121627.1560949-2-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220405121627.1560949-2-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 05/04/2022 14:16, Vincent Whitchurch wrote:
> When drivers with ->detect callbacks are loaded, the I2C core does a
> bunch of transactions to try to probe for these devices, regardless of
> whether they are specified in the devicetree or not.  (This only happens
> on I2C controllers whose drivers enable the I2C_CLASS* flags, but this
> is the case for generic drivers like i2c-gpio.)
> 

Thank you for your patch. There is something to discuss/improve.

> These kinds of transactions are unnecessary on systems where the
> devicetree specifies all the devices on the I2C bus, so add a property
> to allow them to be disabled.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c.txt | 4 ++++

Use the subject matching the subsystem (git log --oneline -- .......).

>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
> index fc3dd7ec0445..5f7bdf4851e8 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
> @@ -72,6 +72,10 @@ wants to support one of the below features, it should adapt these bindings.
>  	this information to adapt power management to keep the arbitration awake
>  	all the time, for example. Can not be combined with 'single-master'.
>  
> +- no-detect
> +	states that the system should not attempt to automatically detect
> +	devices which are not explicitly specified as child nodes.

Focus on the hardware, not on system and behavior. The hardware property
is that bus is completely described in Devicetree or detection does not
work correctly. I guess the property name could stay like this, but the
description could be rephrased.

Best regards,
Krzysztof
