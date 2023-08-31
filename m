Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E794E78ECB4
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Aug 2023 14:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbjHaMDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 31 Aug 2023 08:03:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbjHaMDb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 31 Aug 2023 08:03:31 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF75CFC
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 05:03:27 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-522bd411679so929882a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 31 Aug 2023 05:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693483406; x=1694088206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Qid7Zt4Nm7h17lK01I8jj5e2dg/MWibaTYtU5DvKk8=;
        b=WEcSjFymwdzKSUSEA54RpKH/2Z7qoZDNRSeWWv24DZefzZaGlcMS3eEphgc/EuB5Mn
         IpQqYDO2yi7DpL6sTIdqKc7QlGAu+Ph+zao5rhm2JB6itKlDN4Iyvzm3CitGpuOhSrpM
         juKZsN1Hcw0vyVNokxNnp7gVJ7FwopoJcBf/TB6+tA1oXivfo3+t+lfryHZtQ6UTH36I
         t57ATg63MNvgXaaPiRSJc1o90mrPb9W2XtKsGYR9RZUTYb4+kSKCqhL0ueYpxtQ+Qf1r
         fSXMH6SR4CmajD5XsNl5QTXT+aRSjTYM+Jfsjgnhn3MkI5lI9qT3vW1iEKLpIOhU3ahP
         EEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693483406; x=1694088206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Qid7Zt4Nm7h17lK01I8jj5e2dg/MWibaTYtU5DvKk8=;
        b=irMDRRFOxR5E7woYJ0EF4dGrXiszLfVmka7Ux3CDmPJNkQEEpJBIAP8iVSr8j1/j1v
         1WxbekBMZv+cj7ztCQCnXkXDektAK//N2b+WcG3kQAxoRQPAdDjjJuRxJFD2k/ybzIr3
         gxD0LpZdaXR/NmZrYxLM+Sy2qAtPaBbRTKiFvQjjQYD3KpofkRtgayi6+qlP/LjGgi2c
         6sO1GtCZ8M3IaEeYRclsEmgNIbrpg5CAYrUSDdQKNXpLhz36hOxJ7dllwQZwR/sQgbfL
         4N9fBIhvNXF7Yw61c03jZP/w5EKW0/Wc6xhJCEQbQ2L/5sxrhN9wtOwptMN6TeECH/+S
         qMrw==
X-Gm-Message-State: AOJu0YyN6e0i54aJPV5E3DnTPc38QPt+j/YdIdRs7O7doHb6s/mO+vun
        m1ayTiAOwd6PXE66i8zVlir83Q==
X-Google-Smtp-Source: AGHT+IEs6VS8bjSZseegVzeqGN/rt4+LKFjlVeCkSmCCxHrzS8MHmJ5CQGLBGIJXqB2bCztP2HFybw==
X-Received: by 2002:aa7:c545:0:b0:523:3f1e:68c4 with SMTP id s5-20020aa7c545000000b005233f1e68c4mr4455616edr.34.1693483405972;
        Thu, 31 Aug 2023 05:03:25 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id d19-20020a05640208d300b00523b1335618sm693235edz.97.2023.08.31.05.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 05:03:23 -0700 (PDT)
Message-ID: <0b7cb454-4c31-569c-7609-7931e6fb798a@linaro.org>
Date:   Thu, 31 Aug 2023 14:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: Add custom properties for
 MAX7357/MAX7358
Content-Language: en-US
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230831101513.2042773-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 31/08/2023 12:15, Naresh Solanki wrote:
> From: Patrick Rudolph <patrick.rudolph@9elements.com>
> 
> Both chips have a configuration register to enable additional
> features. These features aren't enabled by default & its up to
> board designer to enable the same.
> 
> Add booleans for:
>  - maxim,isolate-stuck-channel
>  - maxim,send-flush-out-sequence
>  - maxim,preconnection-wiggle-test-enable
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>

Subject: still did not improve. You waited exactly 30 minutes for my
feedback after sending your response.



> ---
> Changes in V2:
> - Update properties.
> ---
>  .../bindings/i2c/i2c-mux-pca954x.yaml         | 31 +++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> index 2d7bb998b0e9..fa73eadfdf7b 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
> @@ -71,6 +71,23 @@ properties:
>      description: A voltage regulator supplying power to the chip. On PCA9846
>        the regulator supplies power to VDD2 (core logic) and optionally to VDD1.
>  
> +  maxim,isolate-stuck-channel:
> +    type: boolean
> +    description: Allows to use non faulty channels while a stuck channel is
> +      isolated from the upstream bus. If not set all channels are isolated from
> +      the upstream bus until the fault is cleared.

Nothing improved here. As I said, please provide arguments or drop this
property.

> +
> +  maxim,send-flush-out-sequence:
> +    type: boolean
> +    description: Send a flush-out sequence to stuck auxiliary buses
> +      automatically after a stuck channel is being detected.

Ditto

> +
> +  maxim,preconnection-wiggle-test-enable:
> +    type: boolean
> +    description: Send a STOP condition to the auxiliary buses when the switch
> +      register activates a channel to detect a stuck high fault. On fault the
> +      channel is isolated from the upstream bus.

Ditto


Best regards,
Krzysztof

