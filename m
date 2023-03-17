Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67CF96BE583
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Mar 2023 10:25:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbjCQJZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Mar 2023 05:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbjCQJZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Mar 2023 05:25:47 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0CE5CC30
        for <linux-i2c@vger.kernel.org>; Fri, 17 Mar 2023 02:25:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id r11so17879589edd.5
        for <linux-i2c@vger.kernel.org>; Fri, 17 Mar 2023 02:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679045143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Pw6XAMpgTlR8PaT1jKw0afe8tRaddYEQnP2dI3tIIo=;
        b=L1UL7kGV+3R1BsSnk91xcwAYB2stBBoXWpACPaXTUapAEwuMtsZYvWVMk7NxXfrSyS
         fgnQtDvC2QP8RBGmZN6WAfIQ9rP0Zwypu3m8/TETtgVr+IMG4jnoxXA9C0IK+Znx59Ha
         4hKSepl8gAhxe5IieMX69gaZ3N377cqOTgZWedmIBnFho/vrm2o7Byq16Tb0HURKavcQ
         6+5+zTfu5OGlyEEkVAvnBqy8gyVUX31+nNv6X+XBY5y5fwU2pUx/mmH0OlO0rT1wN2Hs
         BzYeH6LkaK2WhfKuAqJokNoBXOWggFP1w2ZgrzNsbgopFR2SouFbuW31Nc23X51Lqd+H
         sGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045143;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pw6XAMpgTlR8PaT1jKw0afe8tRaddYEQnP2dI3tIIo=;
        b=Q5xkch2KksdocoOc4xyZJgrwlxjSxMEl3qEuLLtWhIl9MN4VBl1mDzTfXTumIPuzq7
         t03lu5F7yJfJnIgz0d65Ff2SgXzPclJZhnDDjwKOC6pw5rE8p5gPjK0P1ezaaN3zyAKv
         E3wuv5K0N/HsxStlHlUg6SMN1UfXRYTJ5AFPsC94PriqiqgBVY9K+dM0J0Gai+Bbb4PN
         ODgb3vXMCm4YYWFPYiBrOuGmWAc5oEMxcES3h8NusskqcIS0YtvM+ZSvVNvfzhE/bOno
         a2ysj0cQLczZj1nUe5eCc3Ey4PdZVKFG/O5DZqpO0DCQvrIQVDd+i8vphajpF5ZYX9MB
         EwSA==
X-Gm-Message-State: AO0yUKX0bgkdAsKgGANt7ROcyW/EAQ99ZPuedca9BSCsqs43/BHklRsR
        j0M9E4MucQuqXyvO1sT4W4hrgw==
X-Google-Smtp-Source: AK7set+9NT+jmXGWxhJ+ya2LlxnSMGWlNIyWsPK814Qlf5sfchSP8o1GMGE3L61aFkWfgx8c+bCrtw==
X-Received: by 2002:a17:906:e206:b0:8b1:bab0:aa3d with SMTP id gf6-20020a170906e20600b008b1bab0aa3dmr13148850ejb.8.1679045143401;
        Fri, 17 Mar 2023 02:25:43 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:848a:1971:93e0:b465? ([2a02:810d:15c0:828:848a:1971:93e0:b465])
        by smtp.gmail.com with ESMTPSA id v14-20020a50d58e000000b004fd29e87535sm805150edi.14.2023.03.17.02.25.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:25:43 -0700 (PDT)
Message-ID: <a0f93645-b147-d567-3a5e-c82afe42b0f7@linaro.org>
Date:   Fri, 17 Mar 2023 10:25:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Content-Language: en-US
To:     Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
 <20230314215612.23741-4-andi.shyti@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314215612.23741-4-andi.shyti@kernel.org>
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

On 14/03/2023 22:56, Andi Shyti wrote:
> "fsl,timeout" is marked as deprecated and replaced by the
> "i2c-scl-clk-low-timeout-us" i2c property.
> 
> Use this latter and, in case it is missing, for back
> compatibility, check whether we still have "fsl,timeout" defined.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

