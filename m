Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1DBF695CCD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Feb 2023 09:22:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjBNIWI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Feb 2023 03:22:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjBNIWH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Feb 2023 03:22:07 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1689A20D1A
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 00:22:06 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso13064200wms.5
        for <linux-i2c@vger.kernel.org>; Tue, 14 Feb 2023 00:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zSMRtKLXg3ZdMa2S1Nyuy48lVNBmym6/uNjNme3x3vU=;
        b=cvC0d3Wzfl/m8ZNCju4O8AOg8/aaWwlGB+Ii05laxRBb1N2pXoIYODtbeD4dCVhwFI
         BXLCWYeVR+RSETvuwHyRBV5K1MtKqpRSf2VIJNHu42KetC+wCMFI1/s5cM5Gqv16Suol
         dNmm+IJEnnz9gmZRAnbrrAfG5k2b+doeM3PPMMGRdxkKxwDHjx+ZNZApv7IW/CKfByvS
         0uRnpyJ2d+6Pwxqb7jrrRJdbWFo7umWjlBkg2b8ua+xyamIc8F4DrQr4yx3VPVv1evTn
         cbBgFfFL0LmmmWLoqTUg/sLhRiVpdwC9jMAMw8dj0HDEeKnjwvH1wfD4MlTjNejYR+dl
         +Olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zSMRtKLXg3ZdMa2S1Nyuy48lVNBmym6/uNjNme3x3vU=;
        b=QBttuVA5Aymx8CdCCU23l9WRVEs7ikbm1Lfw2wwGhi1lvhffON2YYLc+eQCL5eDgKA
         mYFjXzkUWAJWfnsGAfkdCfBlXiAaLR2cBVWSyKE6QQcF38hUQSsb1wLeQ0rrOF43N93Z
         3d+6LaRINM54Xfu1+/+ID5aAD9A+Zs5Ytd9x13uqu1VKyGA3/hUawZ0DE0YxGo6rgE6m
         QE3YwoUN5l/3l9y8sNLMOTkRV9DDkkSpHU3cUqHjFNy93+4eeWPrLxjkRFDyWXDtAroX
         P25DuQtlabIv0wye+K5p0lWwfvSvGf3uJlPLCiD7kSZM1qWE7gNXlD6h5zqAAf2CX5M+
         0Dng==
X-Gm-Message-State: AO0yUKUr02SbHBqzk/KVyIQSsRrQw0wafjqM7L/S2uYrI5N3u4aK+1GH
        6Ltv7FHNrXM281/w0RN6AU+4yY7NcodNMb+M
X-Google-Smtp-Source: AK7set+ETfJcExOmEk6Cz1+al2ANXe0Uqq1jtmt78KD1iPvv7qAtQgSqrB+VO+Z/++3vAMuM1UNkoA==
X-Received: by 2002:a05:600c:44c8:b0:3df:30c9:4865 with SMTP id f8-20020a05600c44c800b003df30c94865mr1374945wmo.26.1676362924697;
        Tue, 14 Feb 2023 00:22:04 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600c364600b003df7b40f99fsm18708753wmq.11.2023.02.14.00.22.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:22:03 -0800 (PST)
Message-ID: <d2e20336-b4b1-0eb7-5667-ef98420a3629@linaro.org>
Date:   Tue, 14 Feb 2023 09:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] dt-bindings: i2c: i2c-st: convert to DT schema
Content-Language: en-US
To:     Alain Volmat <avolmat@me.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230213191608.16503-1-avolmat@me.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230213191608.16503-1-avolmat@me.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/02/2023 20:16, Alain Volmat wrote:
> Convert i2c-st.txt into st,sti-i2c.yaml for the i2c-st driver.
> 
> Signed-off-by: Alain Volmat <avolmat@me.com>
> ---
> v2: correct subject / commit log
>     add default clock-frequency
>     remove maxItems for st,i2c-min-scl-pulse-width-us &
>                         st,i2c-min-sda-pulse-width-us
>     remove extra spaces within example
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

