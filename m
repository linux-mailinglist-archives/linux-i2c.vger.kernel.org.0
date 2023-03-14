Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2036B97C1
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 15:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCNOVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 10:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbjCNOVn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 10:21:43 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BC5A7AAA
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:21:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j11so62727319edq.4
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678803666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VuZS7RbY6ZldH2ilAQjBRJiWJizf7XEL9oNzVJSsgE=;
        b=Iacc1DOdC2EC4ZW5rKyNuUfgecaivc6IvkKFqWfUJBGO0s+2jkLRe+e0+lvWvOvW/y
         +CJic7Qsg+b37dk/K9Comk8N/poHt82EbFmNtUSXP6B0Xd7wypmUZ3NdURoK06IDZT69
         uNRJnSmLvePtnnt1RXKJMcanfYZ+dWEP4qG7tscjAGiAxLuMQctxR+Wd112cSQcOIgJr
         ZhtZVMufWKFIn+Y/UZeT5zU7qv/WbJItFGkohS6coXd5xmkDVz372rfpWTqKTSOJqaQv
         ti/pOTm12cSLeknzk+87Ev5L03vSuSfd9DfXSFQ9sJ9oYBBqKoFtD1E6vYeFKDiNrzsX
         71SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678803666;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VuZS7RbY6ZldH2ilAQjBRJiWJizf7XEL9oNzVJSsgE=;
        b=eSkpc4uuQO8gc1Kz0snCgsp4KGQz8kZ0oQ+S3igIgD4xjlmPNsbBXGpNye+U0dClsp
         LQWSYFn62p+YpDPWiZBXqZBzvxTGST55+7cZ8lGXalCfyRJjBu/wUoDg6v+cLQYMqzIn
         4oM0ojOwn1MrRNBFc8LtxAZJm9hu4PfnO6McjdRd+ltEQ3PNL9PSerjMiHpabJYF2VnZ
         yRr6BZHeDC6RKqTjYirvAiw/htRY8RyMl+GNF0Fjsgd4sf6JDDU57kSCLZ2FMqmmBvYq
         4o8XejtMK3VtTzr2IIOBYX5OzjJMXt/s/OdB/eBiMxm9+40o/9geHll/ZqBeQkS1c3/L
         LQHA==
X-Gm-Message-State: AO0yUKXsFQcWzVoOsbqob/IbKnZpRQnn+ckanvZ9oaho4HccBWn+QGUm
        rB2TfiS30XVPAXMWmQDaaXaNJw==
X-Google-Smtp-Source: AK7set/CqBlzUTje/yhpDFgTQi5VBjU6f292LHsX+VzhELe1yngizcfuBFkh2YlmDd7UvmwOPAQEKQ==
X-Received: by 2002:a17:906:e0d2:b0:92b:f3c3:7c5f with SMTP id gl18-20020a170906e0d200b0092bf3c37c5fmr2608711ejb.53.1678803666478;
        Tue, 14 Mar 2023 07:21:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:59be:4b3f:994b:e78c? ([2a02:810d:15c0:828:59be:4b3f:994b:e78c])
        by smtp.gmail.com with ESMTPSA id oy17-20020a170907105100b008e385438c76sm1220838ejb.55.2023.03.14.07.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 07:21:06 -0700 (PDT)
Message-ID: <49f0b7d9-475d-898d-29d2-7e7cdf07cb0b@linaro.org>
Date:   Tue, 14 Mar 2023 15:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: mpc: Mark "fsl,timeout" as
 deprecated
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-2-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312233613.303408-2-andi.shyti@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 13/03/2023 00:36, Andi Shyti wrote:
> Now we have the i2c-scl-clk-low-timeout-ms property defined in
> the i2c schema.
> 
> Mark "fsl,timeout" as deprecated and update the example.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mpc.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

