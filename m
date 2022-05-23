Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C395A530CA1
	for <lists+linux-i2c@lfdr.de>; Mon, 23 May 2022 12:40:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbiEWKHk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 23 May 2022 06:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233914AbiEWKHi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 23 May 2022 06:07:38 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E23947AD0
        for <linux-i2c@vger.kernel.org>; Mon, 23 May 2022 03:07:35 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id l13so18016499lfp.11
        for <linux-i2c@vger.kernel.org>; Mon, 23 May 2022 03:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2thMnipGQrwbIYaTpOIQFKO3y25BWCRS7OoW10wpgPY=;
        b=gOYwbOEE0W/hGPnlp8cI+mSGkdABURnhZLtBSkEr/fnoUYgGhm5LtYOd5ZDT/33etE
         d8Ibx95fMhsrpIdwMmHd94qinfWKsSNicrn+OoihHpl/J43cbm4m2UuQTg1tCvowHqEA
         3/7FFW5aJ/6Tl6ObLR1eXSiYoV/D0FBdrzUdEDZQvus3LdE6v3phScBjxPJfww5hPkG1
         a7KfbZdNVdEwgi3c2dnGPnMN3EBy6wIosOP4NrpkK++x/yuwD43DiGu3+XVHdbLAFKnz
         n6Gws1leh/w6RS1FJKYec3eJmH34zhLc9v6I7ROxp/iBRQ/ZCRw8KR0gCQAqNYBC7tuW
         MoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2thMnipGQrwbIYaTpOIQFKO3y25BWCRS7OoW10wpgPY=;
        b=JsYkpF6GaDoaJTySH1wVQynXBTVtPm2zOXnfD4BgzIDeayihTDELSQs703QywfzY/t
         uWIgTZ7ilG/gn99fuwPIC8z/GAW/rIvkBhhZAGde6HBwm42iA3n1TEEabm6dW1W6m3vP
         DQ+LY+H0uyohgJ536fsmFaQxtgHr75SNecOl2P2M3VKd+/PiezW6qAYFPVgSgPnulBZy
         XRJH3Lum4YVlMkdTYm+clTsK80opsfaZkHUOOxbsp9t74XlFrzLHRzYnLs/trAW39eQA
         MC4JqE6fnsXV6f0jC3GnBiAzx2NU+JKA4Skw3C0eYtFcmDBZqOjK1ldEknRz8NeTp/YO
         WNVQ==
X-Gm-Message-State: AOAM532jwAJlo78+cwdzw+dnGzFrtjUC7ABmXkybNHtnudYS/+TvseXn
        ldQOJRO2NVXPjb/LIPdX7+IOqg==
X-Google-Smtp-Source: ABdhPJxs8EtqrTUt1LqsTXVl5KTJ4MPW7EjahL3tb7tKaF5mJmTmcP25Vknm6BhNib3K941QpLUjEA==
X-Received: by 2002:a05:6512:32c1:b0:478:710f:d375 with SMTP id f1-20020a05651232c100b00478710fd375mr2677764lfg.147.1653300453721;
        Mon, 23 May 2022 03:07:33 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h26-20020a19701a000000b0047255d210fesm1894356lfc.45.2022.05.23.03.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 03:07:33 -0700 (PDT)
Message-ID: <36e378f1-9628-b22a-b3bf-2d5ae9e2da33@linaro.org>
Date:   Mon, 23 May 2022 12:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 09/14] dt-bindings: i2c: qcom-cci: add QCOM MSM8974
 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        matti.lehtimaki@gmail.com
References: <20220522162802.208275-1-luca@z3ntu.xyz>
 <20220522162802.208275-10-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220522162802.208275-10-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/05/2022 18:27, Luca Weiss wrote:
> Add the compatible for the CCI found in MSM8974 which supports two I2C
> masters.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-qcom-cci.txt | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
