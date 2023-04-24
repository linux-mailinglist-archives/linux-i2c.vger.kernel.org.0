Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 510676ECFAC
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 15:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231640AbjDXNxV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 09:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbjDXNxS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 09:53:18 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25AC47EF1
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 06:53:10 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94f6c285d92so812684566b.3
        for <linux-i2c@vger.kernel.org>; Mon, 24 Apr 2023 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682344388; x=1684936388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DN3EpammMYUgcbelODq7KNgKSIPG334o3tiz3xO6ATo=;
        b=MsFzFJkpnMYogA8m4Wn9r0eZ+8tKrb+2QAsSKfavg5MMLlO+xGl1RWs4hr38gWqGOT
         4pmRXBJ7cZuRL9SHPF7474U+Cgv31SoJBFibFAT4dtrIWx0/IHz0qKL9gCJ5OQ4L5mcv
         DFwLHFt/YAJXWwY87LYw5U5unQSbn+32mZx6/Q0mpfPD0jtuln6jf5Q7kIw5PHRIGceY
         luafYqQlYdD5p9KrAuMx/PwgVhl5l6AFeEwxyb5fAzd7rLt1Ep3uke6AziNAyWex+S/h
         U065u56pk20R/I5ZuqpXHqP54cLCtv5+08LbQELPl5ovKNCAKYCctZ++eVC/7q9pckfA
         eh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682344388; x=1684936388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DN3EpammMYUgcbelODq7KNgKSIPG334o3tiz3xO6ATo=;
        b=AgjqDhjWRCAR/LJ7+A88wxnbZ+NEsGAkp9nW6NuJAi9hEN49P9kz3S2hmJlEvakBVa
         JUTlq03/TN6gqwd1t08+t08T2j3HlfmqwNUGbkXZhwlgwjotiyGj/k8iIRaYCV6qBeR8
         hcMP+MVPHt8hSmyU4IPz9P7IfJnsYYSjBypUc9EZtxPfoC1sO2g3MR65b+8bzZbPqNS7
         6ddhPlqCPhvUbtqQJDHTuMy1ZS+Dbi2j0cAIocDt3gmQiDzVbkxVrjagvDht3hDlihBg
         fI6ukDz0S0K3aiofUClV05YZA5pnix4mNZ5w5oT+LhZ8qnKOK6AgOGUUvS7sxz9YXZif
         +SKw==
X-Gm-Message-State: AAQBX9cD67J6iYdSaeWhyv7AKMTiN78GOzOxZCOLig9Jbv1hKzmZoTz6
        sB2mTfi9nL7opeC71OevOn/F+A==
X-Google-Smtp-Source: AKy350bi+dAkY6mAXDgZXRRrK0/OKW8THr+CbNCxHtGcHURjl7j4bNeSKer4d8QNG4Ow9cToOg02Zw==
X-Received: by 2002:a17:906:b354:b0:953:3e29:f35c with SMTP id cd20-20020a170906b35400b009533e29f35cmr9901128ejb.45.1682344388585;
        Mon, 24 Apr 2023 06:53:08 -0700 (PDT)
Received: from [10.105.146.163] ([88.128.92.195])
        by smtp.gmail.com with ESMTPSA id x3-20020a170906710300b0094f2f0c9ed9sm5479848ejj.167.2023.04.24.06.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 06:53:08 -0700 (PDT)
Message-ID: <8d6042cd-f690-d274-c658-e83ff3a5776e@linaro.org>
Date:   Mon, 24 Apr 2023 15:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 2/2] dt-bindings: i2c: brcm,kona-i2c: convert to YAML
Content-Language: en-US
To:     Stanislav Jakubek <stano.jakubek@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <9875ec0211187e4f5e2a4379c63eacdb69b31d7a.1682252615.git.stano.jakubek@gmail.com>
 <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <72ba28004afb733224f7294a146fc2a6a5a834a7.1682252615.git.stano.jakubek@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 23/04/2023 14:40, Stanislav Jakubek wrote:
> Convert Broadcom Kona family I2C bindings to DT schema.
> 
> Changes during conversion:
>   - add used, but previously undocumented SoC-specific compatibles
>   - drop references to SoCs that are not upstream
>   - add supported clock frequencies according to the Linux driver [1]
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/i2c/busses/i2c-bcm-kona.c#n731

This line points to moving reference in next, so might no be accurate
later. If you need external reference, then it should be some stable
tag. But anyway if this is in mainline (is this?) then, why referencing
via external link?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

