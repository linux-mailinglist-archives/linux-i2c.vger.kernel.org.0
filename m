Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DA475DB98
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jul 2023 11:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjGVJ6h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Jul 2023 05:58:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbjGVJ6h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Jul 2023 05:58:37 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C99E71
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:58:35 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e57870becso3460555a12.2
        for <linux-i2c@vger.kernel.org>; Sat, 22 Jul 2023 02:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690019914; x=1690624714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kgd70worU63TfKs2VrNmjloL/wFwE+PVlPgyw18hVks=;
        b=PNs9wGAp2yX+uuYqH1WzlmRqomf5eY81PJGhplmKgbSLRwb/7BlMaEEf4KiiYYfO06
         5/YwWtDhZN7kQw8OkNx1qI+AqaLI2ou1eN/AGE0R/nN5fpuGdEtoFTXtzRjD75B+W9KZ
         oJhqP/+wU6eJim9ZGFtDCIjeqTtdbdxGtQLohfB7VkPZ2rLQmD42AjmF4Qq2p7zsIz5X
         DyCbF/lp3D001BHA86WdOf+8K55vmX2/OK+U5RFJtegXlY96OOMUr0Zg19t20uPqIVyQ
         lviWbYjwAyp4SiLC7KvY7P1dkAVLakN8+6vZH+Iagt/oLaGiLojnHoe7uT7H2xP3tlyi
         1OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690019914; x=1690624714;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kgd70worU63TfKs2VrNmjloL/wFwE+PVlPgyw18hVks=;
        b=fr4U6HJiYVv8oY3BMjjw0xqL8nFZlNkDDkqkcEH87Poeey+RLmNtqGMQx5qeD268gJ
         KOkO/qpb5PwyQAeA4sRwp5cUT+vHYmMPP4oWHsPYmCigFwj8syemvHfe4KXrx3Ak0g2r
         wL3o3E2sHjnoe3wxFlOrUNQoGv5iR8hNVwjFZ/O+nJTajZ5M1ot8/4178xQ2akefBFlI
         hL753gvybRtkgcfQ14v/Byd3eVc+1UTvbgKzwcNzXds5K4zbh2NZGhZdw5r2msCVq6xN
         k9HD5bbkeIaVmEhJwv6BeWbZ9cMYPJWH53TNmjga49FdSdmm+rC4wKODNNFj6vPJKp/U
         p0Pg==
X-Gm-Message-State: ABy/qLZetGi6xUexspfSoVBS3gQTsghGaO7XVcHAl7PHNsZbRRI3tinX
        HLhIgT4tgcLSQtS8FvSiUwo+yA==
X-Google-Smtp-Source: APBJJlHnRcooSCaR6o8olZ5cjZYsWJ/3J4/iVUI/FcwltwFpm2etAg1ZcgW8v6fEHaKRh0t7V5NvAQ==
X-Received: by 2002:a50:ed92:0:b0:51e:2a17:3573 with SMTP id h18-20020a50ed92000000b0051e2a173573mr3408113edr.32.1690019914207;
        Sat, 22 Jul 2023 02:58:34 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id f13-20020a05640214cd00b0051df1797222sm3164808edx.11.2023.07.22.02.58.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jul 2023 02:58:33 -0700 (PDT)
Message-ID: <20685a78-0d9b-072b-d313-5314f9b31ec2@linaro.org>
Date:   Sat, 22 Jul 2023 11:58:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: i2c: nxp,pca9541: convert to DT schema
Content-Language: en-US
To:     Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230722095710.17496-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 22/07/2023 11:57, Krzysztof Kozlowski wrote:
> Convert the bindings for NXP PCA9541 I2C bus master selector to DT
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. New patch (Doug)

The subject should be "PATCH v2" obviously :)

Best regards,
Krzysztof

