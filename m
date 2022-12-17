Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C51364F8CF
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Dec 2022 11:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230274AbiLQK7O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Dec 2022 05:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiLQK7N (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 17 Dec 2022 05:59:13 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C52A5647E
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:59:12 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id b9so4614508ljr.5
        for <linux-i2c@vger.kernel.org>; Sat, 17 Dec 2022 02:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bWBK8NjdOSu2oHxSgXnlLAV0JJ7om2AhC9msq+gIQIM=;
        b=Dlhh+IGTjTctruJwrIaH6drA+PFg6ZZJ92h9c61MVbbPSXUenClCC+DRso8ySoGoQC
         t+b+YXGI2GdDC6+JOPNlFH+BW1RaIHoCsofdfmwKUP4cnbm491J+8FBCl0+1eYQWcMRB
         SybJThQORk17Dey8dWxK577KDG/qgxIGd6uYidPmv+5mPe0wGPlsZcXX7TdKQBgHatFd
         E85WHFb5Tdvf2UrDHlaV3moTNZ6ahNNSUgFLTYlfKEAFNlFYao/oFKBoUqn3KlTdyLsL
         172qDrWM1GMPhHJUgcMxWw/RM4yoIXgSK0N6Kc0vaCRQxXJ8FZ8ZafNTtLm+JiqRj0Ga
         5E2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWBK8NjdOSu2oHxSgXnlLAV0JJ7om2AhC9msq+gIQIM=;
        b=RVYujdonzPjjnpH1nW9rg6L8AhiEAgbQt9cxxGCW6IQKC5QPaFFszbWAiZlK+60hF8
         Vci4JHGkyhiAKyLGKwBPGvjl023hGgd9dBOpeTsgE+gPpoo2y303C6p9d3JkiK6olzFW
         SUYinHTi6X4x29zLvFu+F6tcVdwcTMb3RKg+7zrAEM+iQbTEsDPJRzkigvnrvridaXBG
         euOwyxT+flqLXSKKK/af1odJij7zSu2aCDSq6Kg+/uFbVovYUNIuV4UgnUb0KXi4NWxA
         8xEi/hYmCoOwkRNMdfMJm5j5pZ2KcOGi5gWyJ1DOiquixOyHauTIKipBG7tA4eOy9zBM
         nbCg==
X-Gm-Message-State: ANoB5pmH11JdhIlvpjHXPgZ9qt6o01rQ0WKH3Zz0ek6pdt2gz0WdLxj+
        8rkLA82SDTAt3gBOOUBRoX0kTQ==
X-Google-Smtp-Source: AA0mqf7Y4mEt/k9+m5ipOow6pNb/D27j4c2KqpRcfhLmsqUub5zJB/St9dC7Jsmzft03u3M2Kyvr+Q==
X-Received: by 2002:a05:651c:b0a:b0:26f:db35:6059 with SMTP id b10-20020a05651c0b0a00b0026fdb356059mr11629668ljr.36.1671274751143;
        Sat, 17 Dec 2022 02:59:11 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i25-20020a2ea379000000b0026e0434eb1esm302535ljn.67.2022.12.17.02.59.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 02:59:10 -0800 (PST)
Message-ID: <ff8cd48a-c353-3663-4370-f86637e092b2@linaro.org>
Date:   Sat, 17 Dec 2022 11:59:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1 3/6] dt-bindings: mfd: syscon: Document GXP register
 compatible
Content-Language: en-US
To:     nick.hawkins@hpe.com, verdun@hpe.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        linux@armlinux.org.uk, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20221216183532.78933-1-nick.hawkins@hpe.com>
 <20221216183532.78933-4-nick.hawkins@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216183532.78933-4-nick.hawkins@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/12/2022 19:35, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Document hpe,gxp-sysreg compatible for GXP registers.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

