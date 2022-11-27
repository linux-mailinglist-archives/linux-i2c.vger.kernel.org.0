Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3BA6639CF4
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Nov 2022 21:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbiK0UtJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 15:49:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiK0UtH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 15:49:07 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5683BDEFC
        for <linux-i2c@vger.kernel.org>; Sun, 27 Nov 2022 12:49:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id u27so3549893lfc.9
        for <linux-i2c@vger.kernel.org>; Sun, 27 Nov 2022 12:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vR4hvjFZqcJcK9D7nIBiS7pXR2h8XNS5XvEnHFUhGDE=;
        b=mLpVT2EoF2YuKbsQrmK0Up8tniXVmqelZ/a04ghqJhHsC1N4FbhcF6+uNOzeiYLud+
         NJk6n15Ea8qZ4y8VR+iQmweBVzanYTs2Ha4mkSOhwlFf3K9ZuUIxdw3mLW8G0Gt0BZ45
         Sjo0Mrv8dSAjRgpMBriUULmX7mlwkm1b60LvQ+I8lElxEa6EX/u1RaIdMaHq4nBBXkNj
         ww2YHxcuIUncjEtylGaqEi37xBi7ZCYa5E6bCwkLMvAJixQkgrkc+Lhn69+aWzPLNy6d
         iJAiwGjYhmY6hvLyGNd7CEb1xHbi44nU+l2sZvUp86muQr+hebJJQiVoryXU4IIxB614
         ejGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vR4hvjFZqcJcK9D7nIBiS7pXR2h8XNS5XvEnHFUhGDE=;
        b=hQdK4bqn01Qtl+ewPm0PPLhXtcFZN0OT0THTjPA49zouydBb5UIXG8Z/jN1/gNrIgh
         /Wt7uwoDJNnQoC1ePXEds9trWUlk7s21AD/hA+L1ANG1XQmolmyFqSG9iR4m/oo+Tr+p
         QO7ZYEazc4StJnmgVxZjCYHhsbgKs2/kf4TF1cvMCuuoZqwmCrM1nyKXNjlFcZF3/38N
         wWxEA/iLe2qcgIdkW9UL7/syo7cz6n337K4Ggvw/oGGHjmK+Fd0MQg1HUHWP11a2rAhn
         H5vn1UCvJ+/ANHOb1ngqMcxC7tIQ215ZO7LuF13tbzHS27qHDbAEMGWsCg9RiQuM5/DN
         Q99g==
X-Gm-Message-State: ANoB5pmiT9aV+VIRFqlgs9pgIcK287IPM/MpEm8VCEy+L7it2Wwc/L6f
        Y2bW3mp0q37TjBX68PSXwYz48+cd2xvcqAJ7
X-Google-Smtp-Source: AA0mqf47uMAlT8JMFOyJOqlqu4YKZATtET8jVj4qm5LqbktsNhciwtvw8kt3U1yFZtbUdXSXBVmREQ==
X-Received: by 2002:a05:6512:6d:b0:4a8:ebec:7143 with SMTP id i13-20020a056512006d00b004a8ebec7143mr16016485lfo.493.1669582142700;
        Sun, 27 Nov 2022 12:49:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id n11-20020a05651203eb00b00497aa190523sm1421668lfq.248.2022.11.27.12.49.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Nov 2022 12:49:02 -0800 (PST)
Message-ID: <61541d15-fbfd-3f99-fc05-663ebf4a2b54@linaro.org>
Date:   Sun, 27 Nov 2022 21:49:01 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57339e73b6c0bfe446e19a7f55a48b7ca640b9ec.1669359515.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 25/11/2022 09:54, Binbin Zhou wrote:
> Add device tree bindings for the i2c controller on the Loongson-2K Soc
> or Loongosn LS7A bridge.

It's a v3 which is for the first time sent to DT maintainers...

Subject: drop second, redundant "bindings for".

> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../bindings/i2c/loongson,ls2x-i2c.yaml       | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> new file mode 100644
> index 000000000000..8c785f329d2f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/loongson,ls2x-i2c.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/i2c/loongson,ls2x-i2c.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes form both.

> +
> +title: Loongson LS2X I2C Controller
> +
> +maintainers:
> +  - Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +allOf:
> +  - $ref: /schemas/i2c/i2c-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - loongson,ls2k-i2c # Loongson-2K SoCs
> +      - loongson,ls7a-i2c # Loongson LS7A Bridge

Isn't your comment exactly the same as compatible? Where is the
difference? I propose to drop the comment entirely, unless it explains
something.

> +
> +  reg:
> +    maxItems: 1
> +

No clocks? I2C controller without clocks? Are you sure the binding is
complete?

> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +

Best regards,
Krzysztof

