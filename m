Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6233D75DB8C
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 11:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229662AbjGVJuf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 05:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjGVJue (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 05:50:34 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6C3E47
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:50:32 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-992ace062f3so440159966b.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690019431; x=1690624231;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QHChrvcrfV2WQvVPoJEtqpBZGX5CfodsGG+RU8wjVAk=;
        b=od224R7yLScZt8LAcSuEkqYWplUlL5o78yraqQhijgYmSQoi5EAEdOw1eYkojA8M+d
         foAetwKGbDAJzY34F+K4tLNU/u522gFFDfJa0DPtxJgZAjORyWlrYRiSQJ4d9SOM/+J5
         Wzqe3w1eql52S1Xxv4l7QHXNoU3y+wEsdgnlAMUIQRHJ1VKO3wMXVUSRx44gloEx4oAd
         8Yn5m8xFnyfN+o0T7FBjfzAfodQenvqywmyfVV6Tu6RF588pD0IkxuAN7E4RynaP7Yxn
         Z5HFqcmJNgaQ3ZzXt41I4Unj4oIBPHrrtAOYwkl6eT6ssyUdk123iqvkeY+B/xM+456X
         6p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690019431; x=1690624231;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHChrvcrfV2WQvVPoJEtqpBZGX5CfodsGG+RU8wjVAk=;
        b=fzaKk79bprjGyrgzydkfNBBAwCOTI9usYK3Pepshb8kfBU9YruxPx9O82BQapffPF0
         4SSl7rUWHnqO+jyguteQqG4Xt2KgaHFzukZfcaIlbylHiVVeZ2YZ3PVk/c4Nj3XFmpy9
         xqipNFiCZv3NGXpwWAecT3PAahJkdtW+j/o1lws399niDtTqUniF0VMIYfjqsphQYQpo
         tAfmMDEv/RA+XCDwNIWY5r+sMN9TuS4vqI65SSYL6WnlhhdxqAIQGl1WSaX8Mi5Lyk6J
         ofjdsSjPUqqivnZozVah7Zmb05NFyG4Skg4+p43fcDGyWspfj8jQk2rQKuc1zZzLA5Hd
         CejA==
X-Gm-Message-State: ABy/qLah7J2V7SLQs9lvlitQpiN0dNG68mZ0eVX2B4mS4khm177n8dFV
        cALUuUMY1DXCrU+ad2TCsNRQ0k+qwk6YoZbKn3o=
X-Google-Smtp-Source: APBJJlHHWqO2jIpdyCPwF4jeGM6+9IDrbw2KNSmcL6143jkTHMtdpeYcUCmeDsEQzWiv0YsQVmTxPw==
X-Received: by 2002:a17:906:53cd:b0:997:8a65:1cf8 with SMTP id p13-20020a17090653cd00b009978a651cf8mr4509218ejo.8.1690019431171;
        Sat, 22 Jul 2023 02:50:31 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id p18-20020a1709060dd200b00992afee724bsm3331173eji.76.2023.07.22.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:50:30 -0700 (PDT)
Message-ID: <28283cbe-f106-16f2-47b0-0d7ace71cbac@linaro.org>
Date:   Sat, 22 Jul 2023 11:50:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: i2c: arb-gpio-challange: convert to DT
 schema
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230721133035.15222-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721133035.15222-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21/07/2023 15:30, Krzysztof Kozlowski wrote:
> Convert the bindings for GPIO-based I2C Arbitration Using a Challenge &
> Response Mechanism to DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


...

> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +

This is wrong, I will remove it.

Best regards,
Krzysztof

