Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2BA76E8106
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Apr 2023 20:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233625AbjDSSN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Apr 2023 14:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjDSSNX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Apr 2023 14:13:23 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 166AB7AA0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Apr 2023 11:13:22 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504fce3d7fbso160763a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 19 Apr 2023 11:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681928000; x=1684520000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rE6/qx7CvlPWxm3WAA8STmrK00/5TaEUc8FrjlCK5Gw=;
        b=UMQTOuY8fYpH74N3z0PciOZRGA8e7QfKPrJrhWY8lU37dYwFFViKIcj/3gRe8tunNY
         60QxGsIfRsIyNL7drZoxKX8I60ktSdPMJI7wTWEv7t4JbYcOjzMerBJBWYtPdbagtCjG
         21zhH+g2Gb08GJISV65Ev5avU81+DfUFZyJBJnITFq8vSvrxtiMyc9Mkh/wNGbyaH0aD
         yioK2U4X2H2YPjfxVTxK9oMJhvSQ7b0xBT2YOSTmmLrJcssiZQeckqf84Q6T7+Xuf92S
         06gwMSG8J3KVC5SROg73D52EZWQF4w1ciXsK90r3vQGtSEyQZJc14siQ7vlb9TT70Z31
         VSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681928000; x=1684520000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rE6/qx7CvlPWxm3WAA8STmrK00/5TaEUc8FrjlCK5Gw=;
        b=kmTkuIcp7Pd/CRbyT3u3Nk/wbXJhgzw2Ml38BfYK3QfDdBSB4Dsfvz/oyKrJ4YS1mJ
         X5YHVo83V5nAsQmE4DEMDQWvNoaNfMC4q5XL+JETRHwrGZJZ6hUQmmTNt5+iReWjoxGM
         xZ8YbD4gbYrZxG/iOlOolmNeCxSixd4qzQMG2fQNG7iADtTX3bPzHGsmQbI3CDnldmvU
         5nSIqJQoKH+1Pt64Tzq+D7gQNVs5npRL6drKVEnzhx+clcQq+S+sfTdXZu55SL4yOSss
         Dr+s4aJnW/l3aeU8bL8vrkoqIuxiQqpt0X9GjGWOyMa9o1M+uE+1hjZHSku7rjBe1QBo
         eDWQ==
X-Gm-Message-State: AAQBX9dl2fJhhonvfvOp/HBA7nSHMzyS7xDeGoISWAOCIce3pjeVTe/1
        nQKxnRVCpoIISQWcYXIfzvB6Ig==
X-Google-Smtp-Source: AKy350Yh3kVFzvB+Rb4D6qnkoCW5liXK5d8vO2KzvC76eHuvw0U4VneErqKYBsVxGpj7Y+FuvEXvRA==
X-Received: by 2002:a50:ed18:0:b0:504:8905:5218 with SMTP id j24-20020a50ed18000000b0050489055218mr6853084eds.1.1681928000490;
        Wed, 19 Apr 2023 11:13:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:b7d8:d88b:1fac:c802? ([2a02:810d:15c0:828:b7d8:d88b:1fac:c802])
        by smtp.gmail.com with ESMTPSA id t18-20020aa7d4d2000000b005083db60635sm641202edr.34.2023.04.19.11.13.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 11:13:20 -0700 (PDT)
Message-ID: <1b569c7c-3ee5-54e8-c158-f7900eaa246a@linaro.org>
Date:   Wed, 19 Apr 2023 20:13:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v13 1/4] dt-bindings: i2c: pca954x: Correct interrupt
 support
Content-Language: en-US
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230418103430.966278-1-patrick.rudolph@9elements.com>
 <20230418103430.966278-2-patrick.rudolph@9elements.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418103430.966278-2-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/04/2023 12:34, Patrick Rudolph wrote:
> Only some of the PCA954x compatible ICs have interrupt
> capability, but the binding advertises it on all ICs.
> 
> Sync the dt-binding with the driver and only advertise it on:
>  - nxp,pca9542
>  - nxp,pca9543
>  - nxp,pca9544
>  - nxp,pca9545
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I really hope this was tested this time.

Best regards,
Krzysztof

