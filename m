Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56D3C6DF831
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Apr 2023 16:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjDLOSS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Apr 2023 10:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbjDLOSR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Apr 2023 10:18:17 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 833B644B9
        for <linux-i2c@vger.kernel.org>; Wed, 12 Apr 2023 07:18:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id xi5so29259282ejb.13
        for <linux-i2c@vger.kernel.org>; Wed, 12 Apr 2023 07:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681309095;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E8NWS2eelnyQFGBZDCPZ75VP8HbH55/0xHGNByiFEd0=;
        b=BIVb69/bW8OF8X+48XLU+AqyKSWVuga3OpfarkvheGyyNL8fzaJAAWf80o0gb+KmqJ
         9EJES3UdW5EJSN7G1DYeJSd+WMfG3DAm9cRlXWs4+JustZunvmSWI5leHYTnydFjZI0a
         o2iz7VHzrN8OZw/bStB3NceoQuc2hUS/CYmJwEYt1AcngYuymtJbdBNalwY4k4jjPPXI
         o52Fzvk7HrgBHfvFprqWlaLdjB3jrUl7/Xl7Ko/jHtxuwir6Pw1Jq7JhJ1knw+bwwa2o
         LYnj6NR8UuMY9f1ktMBsrMmx1Hur24Ypb8i5gZGbOxzqeToL7LZK0JeVrdAzMhAHaVMM
         tDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681309095;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E8NWS2eelnyQFGBZDCPZ75VP8HbH55/0xHGNByiFEd0=;
        b=vqQR5zNdxkgUSSxiWC6eggZxTxq2cUIiSSFzCDtjgK4yLH6d2Vj+oBhlch5YOWX6X1
         7Uta3Iyvnt5Yp8jUoyss57Io2xpFAohZWfbfyijLSiozIW/gjjZi3mBieRExYATLJYs9
         /TDGqACiVQZSiKF+NwZis0W/nb/IIST87xZ8gADuOpq9p1S9fq2gvq5xHOylxBfW/thl
         YZrlMqPawPc/L2QIrQYoRPVQP/fHq9RDk1d9FfdQ1zuPyjy+OcmLxe3s0XBGMYFbk0ke
         TqPH6zHYq6MQwwh7n7j1n7VqV8KIuaeyQiLV/my5lcxP0SPKJGEztzPvXqIphQPMj8s/
         lK5w==
X-Gm-Message-State: AAQBX9dcYdYviv7mS72DN3R5kQEnu7bhSck9zigZSbwSmDpnqWHeCrBF
        ustiwE/sTyfOZp06gKYT5S4g8w==
X-Google-Smtp-Source: AKy350an9q10HxsKC2ERoCMc194DK+2dDRSAYWMKvPPJMJnrXj+0fVHJo+jEScP03ZhibXW94IC3kA==
X-Received: by 2002:a17:906:560e:b0:94d:fd61:e90b with SMTP id f14-20020a170906560e00b0094dfd61e90bmr7327963ejq.65.1681309094957;
        Wed, 12 Apr 2023 07:18:14 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8fa0:9989:3f72:b14f? ([2a02:810d:15c0:828:8fa0:9989:3f72:b14f])
        by smtp.gmail.com with ESMTPSA id wz10-20020a170906fe4a00b0094a6e7075eesm3733929ejb.41.2023.04.12.07.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 07:18:14 -0700 (PDT)
Message-ID: <3ee27d89-5a13-cf5f-c7d3-aa2740a790f3@linaro.org>
Date:   Wed, 12 Apr 2023 16:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v9 1/2] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ryan Chen <ryan_chen@aspeedtech.com>, jk@codeconstruct.com.au,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-aspeed@lists.ozlabs.org
References: <20230405022825.333246-1-ryan_chen@aspeedtech.com>
 <20230405022825.333246-2-ryan_chen@aspeedtech.com>
 <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
In-Reply-To: <40f1ca77-7f7a-dc51-1137-45664a6ef2a1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 06/04/2023 09:36, Krzysztof Kozlowski wrote:
> On 05/04/2023 04:28, Ryan Chen wrote:
>> Add ast2600-i2cv2 compatible and aspeed,global-regs, aspeed,enable-dma
>> and description for ast2600-i2cv2.
>>
>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
>> ---
>>  .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 52 +++++++++++++++++--
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>

Unreviewed. I don't understand this. It's v9 and still wrong address people.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

