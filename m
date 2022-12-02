Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 637C16402C1
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 09:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiLBI7o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 2 Dec 2022 03:59:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232768AbiLBI7Y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 2 Dec 2022 03:59:24 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889CEC056E
        for <linux-i2c@vger.kernel.org>; Fri,  2 Dec 2022 00:57:21 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bp15so6382671lfb.13
        for <linux-i2c@vger.kernel.org>; Fri, 02 Dec 2022 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1Y1b1DxJndmlcP2TtAAGXqukfYf06t/03mEiH61oCo=;
        b=ZJJnSTiMuqYLv0z5n8maXBJ3U2fjsGdj0JtL5Qj2map3+OFZaZSeKWo2JF3js2KiNL
         MVU6yaCCjWlXUQjy5VPmGswXwat1uph/scGRIeS6Ly3DuIAGIrMa1522lR+YeJ8c/RP3
         TZM7peM5ECZmldAuntzGDsyJ6bL/JNdk8iNv27w7boZ9RF67Fy+cqqRB7AsvZgzBZC7r
         0CyTmwkaqOzvsiv57dENaBCSe6Eak3Ylt4sChS8VkjKzVp/977MnU1JAQ9UsOMDIj6Ed
         rCtj8JZgNXBTigrttSRWFWnL4qj1j2WyE+k4+JBGgIPFsyiln6+TOQw/dNClNP6X8DPg
         vuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D1Y1b1DxJndmlcP2TtAAGXqukfYf06t/03mEiH61oCo=;
        b=s+0+RjX9UI2cUXDqAmcDSlkfF4+FPyyWq/UpqdyWg1jrZwRdjsCJRxA8sZ2+DJ6Gbe
         yJ6D5rE+Monjz/cAkC6kNgfR86VMyHafMhYjj8TdCCtMduUEWqolxzrt8gV7/YcKwnmL
         d5SFJg0kbNjqs0+vhAxXBEBcZbAu0/Dqv42bJF2XHK+qc1kzJsLgsrCOGQRkshNaocb1
         SxJK7w3yUx8h7oGjObsRPSGrFm90l2ye5fxqLEcMXUkZ+OIujRo5chJgWqDOVp0VmYS5
         qpx/eZdzdbWTMqDg9eoKKO3JQIpLythdbUx99GSMNx7zVPRB0aKsZYtX/JNnzcpoaL+O
         awZg==
X-Gm-Message-State: ANoB5pk0nElOt88HMPSm8Yje7R3OOHv6dhQeuM4uiob7FdNmfJalTS/7
        W+WBcGySjvfGnr2kYytrfhx7qA==
X-Google-Smtp-Source: AA0mqf6HWQeioeGsGimOHKenGW2HpUjso7U03/yTVxlUQtgq5k5p+CBmmrs1EKEBfs+L5AeIMGzJkw==
X-Received: by 2002:ac2:4f05:0:b0:497:aa48:8fe7 with SMTP id k5-20020ac24f05000000b00497aa488fe7mr26482008lfr.612.1669971439873;
        Fri, 02 Dec 2022 00:57:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id t9-20020a19dc09000000b004b4b5bd8d02sm945276lfg.78.2022.12.02.00.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:57:18 -0800 (PST)
Message-ID: <a8f14b30-dd4f-b5be-ba1b-a8e19f045206@linaro.org>
Date:   Fri, 2 Dec 2022 09:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V4 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
 I2C
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     loongarch@lists.linux.dev, devicetree@vger.kernel.org,
        Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <8503ed054d5b4984b5d6e18891767cace2d36a31.1669777792.git.zhoubinbin@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8503ed054d5b4984b5d6e18891767cace2d36a31.1669777792.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 30/11/2022 06:55, Binbin Zhou wrote:
> Add Loongson LS2X I2C controller binding with DT schema format using
> json-schema.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

With above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

