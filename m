Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C11164B7AA
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236013AbiLMOqF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbiLMOqA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:46:00 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124052663
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 06:45:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id x28so5264297lfn.6
        for <linux-i2c@vger.kernel.org>; Tue, 13 Dec 2022 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joYJhs/UbTShGdQmdLhc0caoTEY+w1Kc0FjlXwjWOPU=;
        b=x6gpIpZxwxG/0ptyx0p+fIT5P+6dLADGso7O1iYGmCguLkfRWwufCnCWtK0BbMeGVl
         v7e9rIvqu0TNP7BwiDbz5DOFmheMEeW4jmaPHxqVnUedHVaDuza1clY02MpUqtMdtExN
         b5CFiXhzE1BfRuAitlluGjHLmb/hmQpFbw8uDLchXSN+U35TbiXsv1QAUNHh0h/Muc3Q
         BSMXFBNrbkC1w9lQDvbzj69iMrj9B4UhKtLNxq3MkazTY2z2wAatnhLONVBf2S4KEBzK
         pqgZz/VCyqNpLh98WVTyiOOahE1lNHtZmTPrWjMxz7npUH8kr97pOvbDSNRiYk66SdTF
         GCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joYJhs/UbTShGdQmdLhc0caoTEY+w1Kc0FjlXwjWOPU=;
        b=HXcY5735kMSDOWaVyEb/KMbgtoQevqFM8OIdAot4AAGepWh6DdeOr8azb8VmsUR2wT
         m2SNMyQoHXLoEQIUrkTiKmL9qMjQ+5fTo0e1FrFJB8UH1lW/0ANC59YxufGaE71R1ry/
         pgdgYuPIPy9MZQiv8RE1jg/PfpewL72orFRsQGPUd0l1FANBhYr3w0+xyPUdX1I8A6iP
         /pRYS6AJS9aJd9M/PdPd7lQLYLh6Q/1Nx4nYL9BXYkp4f5Q12bv5v+ai02v+a77aPhBo
         X5tDmozQCeifUEp46DMsQD9DHzSbUJEvS2EBIJfLLeAFTJxw1Hu+q9Ciu+vIfZ15ibay
         t0DA==
X-Gm-Message-State: ANoB5pme7mKCBgzHev6JY5amCvo1x2Dyj6o7vRYKAHrxTMl0aNzsjEDQ
        j2xODfNTo3uGZeZ2WW8+6eq6lA==
X-Google-Smtp-Source: AA0mqf66w3KkeJLHCLO28iVX2sXxRjfxJj2Q88CGskvHkkHXsn92K/IfXLgEKG5fR8bl3q9XaB+8xw==
X-Received: by 2002:a05:6512:a91:b0:4b6:f3b3:fe14 with SMTP id m17-20020a0565120a9100b004b6f3b3fe14mr1626053lfu.1.1670942757443;
        Tue, 13 Dec 2022 06:45:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651205c600b004b575d239besm388015lfo.237.2022.12.13.06.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 06:45:57 -0800 (PST)
Message-ID: <e9c96757-ff86-2e66-6ad6-4537d7a09001@linaro.org>
Date:   Tue, 13 Dec 2022 15:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] dt-bindings: i2c: Convert Synquacer I2C to DT schema
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209171658.3352119-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221209171658.3352119-1-robh@kernel.org>
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

On 09/12/2022 18:16, Rob Herring wrote:
> Convert the Socionext Synquacer I2C binding to DT schema format.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/i2c/i2c-synquacer.txt | 29 ----------
>  .../bindings/i2c/socionext,synquacer-i2c.yaml | 58 +++++++++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

