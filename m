Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BCC263A887
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 13:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbiK1Mha (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 07:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbiK1Mh2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 07:37:28 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED221A079
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 04:37:27 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g7so17117549lfv.5
        for <linux-i2c@vger.kernel.org>; Mon, 28 Nov 2022 04:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3zsuy+0KAbon34PjD50ab0w1ynNsD0k56NpcI5wUZZY=;
        b=nNowC5tN1eKFJBmunGJikmsjqeJ/RZ8kp06qtd4uCbDB1SPM2VZThIjAMQRzCJ48Zc
         XruHi5Q8q1FrwX0F2jQdhznu3cP6nBBS8CN8/lZr8MWZTa0vyGhF6CCqLPXfaT8BDSnw
         GLnP+NkrbqP+K8Lf4l3ht12LlKKWaxugQUq1otVv2Z+kEtP7RGcJz6ApOz0yXHeYIwSc
         KvFtaXxN23QskFC5ezXWO3F/pFocLY5cTITZShvYs03ygkmkg14n+jtBlC92pTu0xzU2
         ZCMjSRNF5GyZKdcSMk/TdLO62Apm7f+xSABKXB3hp1Xe6RXazm3Pm7QHTwMBDoH+SkT2
         v50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zsuy+0KAbon34PjD50ab0w1ynNsD0k56NpcI5wUZZY=;
        b=gvUdI0SRtIoOCHDmSc1Rkmq4GmB4Vgvd7zL/aojhShogvF6MLBcOcrZOuKButg4GXX
         2QDwh7E2NartZg9poi31xqou+uMyIgVrVg/8t3w0HumT6mjEkk0eU7TNISJjGIcsw4SI
         XLhllAH56E9eueKLJ7RZtjdxRhpsGgZ8zzz7a7gm332PeAGYRf94Xxipq1q70r3Q3uue
         I8cI6FhXu6crzDUcnSH2po/L3st5JUxrCLegaLMdKI9rGKj4tULO6I24x2jiexnvCs/A
         g7fP024g97YsCCglc9UdGSVzJP08QpFdC30dQlpaa2Da5QLNbd2UCHYa8olOWN1qsjD2
         iKsQ==
X-Gm-Message-State: ANoB5plCksqgCQXY7TdVAleAloGKhKPyustk3YQlhtSCgT89dLbzqRfh
        18X8xnVXqmfGrX8zvbUuQbPgmQ==
X-Google-Smtp-Source: AA0mqf4wQN/ZHP/4bc7HcoQXJzIU87tAaHbkDsXSPAwaz8rWU+HBFFrbh++nFRy+SN9XCqBEi3d0Hg==
X-Received: by 2002:ac2:41c6:0:b0:4b0:4b08:6873 with SMTP id d6-20020ac241c6000000b004b04b086873mr18360398lfi.329.1669639045898;
        Mon, 28 Nov 2022 04:37:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x21-20020a056512047500b00492ca820e15sm1673362lfd.270.2022.11.28.04.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 04:37:25 -0800 (PST)
Message-ID: <58febf4d-05c8-e06e-04c1-6f10322e29c8@linaro.org>
Date:   Mon, 28 Nov 2022 13:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V3 3/5] dt-bindings: i2c: add bindings for Loongson LS2X
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
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
 <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
 <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <654be437-f4f0-4c98-b124-ac2d8f78fdbe@loongson.cn>
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

On 28/11/2022 13:24, Binbin Zhou wrote:

> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>> No clocks? I2C controller without clocks? Are you sure the binding is
>> complete?
> 
> We previously set the default CLOCK in the driver. Of course, we also 
> provide the path to read the clock-frequency field for redo. In any 
> case, I will add the clock-frequency field to the V4 patchset.

I am not thinking here about the driver. What your bindings said, is
that device does not have any clocks and I have doubts about it...

I also do not say anything about clock-frequency because it is already
there via i2c-controller.yaml.

Best regards,
Krzysztof

