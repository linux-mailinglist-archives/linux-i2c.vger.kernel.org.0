Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13A9A5F2B64
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Oct 2022 10:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiJCIEj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Oct 2022 04:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiJCIEI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Oct 2022 04:04:08 -0400
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF8E0286EA
        for <linux-i2c@vger.kernel.org>; Mon,  3 Oct 2022 00:40:08 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id hy2so20260523ejc.8
        for <linux-i2c@vger.kernel.org>; Mon, 03 Oct 2022 00:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ua3/Yq6pE+E6VT066jpB76qJ00RlV5Rf+my1G3LOuw8=;
        b=NnAGWf0fgEthCAU1J7h0H6oBj4jtdnSVSxUs9RsOK7nxkcEjVus6mDRXoEKHDuJElP
         KOJ91f/rZwSo30DKuqCR4uZRjKzY+JhfpXvndGYE7FnRojh0BqlvQEUNGF6oS3q980uR
         5lT2VjcsbRuFJfO7cwRUvRcuMqTcec0pEL0wCP5qF5mmsz8zSiAGihntt2lsX3v/yoLd
         W9NhdfyVl0lsAX5RS+oHTz44oTBs50jL0ybGzravM+/uOAZ60/67ol9LW3cKxn87jTJ/
         L4zRHQPM+Iy/t+NiXvaYdQSqhXW8C8liG2PowgI1ZPoru9YostcDUoNS7BfNnCo+OQzh
         rQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ua3/Yq6pE+E6VT066jpB76qJ00RlV5Rf+my1G3LOuw8=;
        b=abZ3hQwLu9Mmz/zpl7J3/L1Rv+Ae32KZFWUeOgptEdXGXtd0bPGKD5Nd8GU68Z6fC/
         ObfXn6rJZMdkVFNH4Pg4VEo+NQNCF/izI6paCuBh0RkDooxYAtIyUkD4JUSdsAIYF4QK
         QgUboRXNbMkvnpJco3poa27lIbY2MmyFqf6pkX6r5by8F1UbWkgTBVOSsekoRaOKaWR6
         n5o++bJbL/+gsdkv9xeUb7K8V1/uA53bxJUtC9TchipeGOTgleBPgLkdMvvy1+8/atew
         hNTPGvYAFbMtUFK3ilMBVLds2zUqej5RJCWCgHTsrLbflxfJ0/Ex0mn1Cm05FucpcHp8
         WqMw==
X-Gm-Message-State: ACrzQf1cwWtytTS4gW47c/Ss2P1uI0kTQ+LjsDIL2Li+0c4JFL2Mpnu/
        AL2koyoTNx+UhwI9BERxQ+7l+0kp/Q+aRQ==
X-Google-Smtp-Source: AMsMyM4kUIkDgRtU08BCBHxyQw19PsWsHSzVj2+D9Dyfae9PXxMLabP6hVXquujn84cf0DteJirSAA==
X-Received: by 2002:a05:6512:11e9:b0:49d:7909:ff9b with SMTP id p9-20020a05651211e900b0049d7909ff9bmr6530866lfs.568.1664781928013;
        Mon, 03 Oct 2022 00:25:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f5-20020a056512228500b00492e570e036sm1347482lfu.54.2022.10.03.00.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:25:27 -0700 (PDT)
Message-ID: <b20c81a6-42fc-cdcd-80da-7aa2e574c318@linaro.org>
Date:   Mon, 3 Oct 2022 09:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 2/6] dt-bindings: i2c: qcom,i2c-cci: Document MSM8226
 compatible
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002122859.75525-1-matti.lehtimaki@gmail.com>
 <20221002122859.75525-3-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221002122859.75525-3-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/10/2022 14:28, Matti Lehtimäki wrote:
> MSM8226's Camera Control Interface has one master and 3 clocks.
> 
> Signed-off-by: Matti Lehtimäki <matti.lehtimaki@gmail.com>
> ---
>  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

