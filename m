Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5D5D5106FD
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Apr 2022 20:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351728AbiDZSeV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Apr 2022 14:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351716AbiDZSeT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Apr 2022 14:34:19 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CF071D0D2
        for <linux-i2c@vger.kernel.org>; Tue, 26 Apr 2022 11:31:10 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id d6so18327586ede.8
        for <linux-i2c@vger.kernel.org>; Tue, 26 Apr 2022 11:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VKC8XPJlcNCFiabfzRUjbIvQEbTuiGQyD4TWftjpgaw=;
        b=y8uP8WQR9Xwv9xFK5OwMM9teFu+FnFeOtAK3RIRMXP1D8Aw/JiRwOADDKNekuTPYe2
         O53g+xstGFxFXFkTDYTyGWkVZrVELo127DTIdnYe23jcto4FjuVqzndBA4PxhNPTw5as
         4Qe+kVcmKLogXzieBj3+y4pdFR8wI4PYbr1UJQkDugRVKIDbQkU7ErJfhqIhggEQl8/x
         Ugvu4qVgOV8zQYt+1vfQRUyrlAeBqFmssAiu1sQZT5/Bey6h+5FrqTkiJPRRToYELdhg
         Mb2svLJLnIVWEyJgF5TLB2bqL8xia6yYIs1/QpFFeCyj5+ZOZkDNRD+Khgo5bkWUhtTy
         nz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VKC8XPJlcNCFiabfzRUjbIvQEbTuiGQyD4TWftjpgaw=;
        b=ZCXT4hWrWCaF0KZ3Kvp7AlMnLNf4/9NnNN6PWrFlSyLVus2hwRFojvkc8dMh8FPNWx
         wZKFTMcpWuS9DiKB+DRr8a9L56EHmBvktqaWW5DTd5rLKBNwwdLNvJZlcO3kNbOF3ZlV
         kOYFoOf6u2QbG0rQd/wRgD9BegQTIT8XY31c44EohchLwBrStgDq+ssMpW3miAVb9O95
         n3snI/xrXHl91ajTeFtNolbFC6mxF53OQ5kNJZ9WU6crcC2i5eBbkJTiQheTeKIJtyCw
         EH0y2nIS8Je2l5U+zmqcyiNuF8lbp9XnbcWu37kBPDTUZDKEWcyL/grdc3vuPbkVrABM
         4G5A==
X-Gm-Message-State: AOAM5302HDy2Bhj2K92P37a9u4em2/xO67ZgwRcpN39++D3IjDQvEnWa
        QaCBzb65cs7BsrQbCQLqw+bIUg==
X-Google-Smtp-Source: ABdhPJy8+F7Ugdd/PM47ZCM/rjQIjw1uj6RBLZ2FyOnjUrLtOLWSbh8KM966aI5K5T24fm7Jnd29mw==
X-Received: by 2002:a50:bae7:0:b0:425:c0fa:e0a7 with SMTP id x94-20020a50bae7000000b00425c0fae0a7mr23869480ede.104.1650997868901;
        Tue, 26 Apr 2022 11:31:08 -0700 (PDT)
Received: from [192.168.0.252] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e17-20020a170906505100b006f3beab8af8sm391941ejk.204.2022.04.26.11.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 11:31:08 -0700 (PDT)
Message-ID: <ec5a09fd-2308-b149-e5d5-12866cd9297b@linaro.org>
Date:   Tue, 26 Apr 2022 20:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] dt-bindings: eeprom/at24: Add samsung,s524ad0xd1
 compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220426175938.2262966-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426175938.2262966-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 26/04/2022 19:59, Rob Herring wrote:
> The samsung,s524ad0xd1 compatible is in use, but not documented. According
> to arch/arm/mach-s3c/mach-smdk6410.c, the samsung,s524ad0xd1 is compatible
> with the 24c128. As the schema requires a fallback compatible to the
> corresponding Atmel compatible, 'atmel,24c128' is added as a fallback.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Fix the example in samsung,s3c2410-i2c.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

There is still a DTS to fix. I assume you leave it for volunteers, so
I'll send a patch for it.


Best regards,
Krzysztof
