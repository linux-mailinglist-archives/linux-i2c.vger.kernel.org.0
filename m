Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E558E469169
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 09:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbhLFIbF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 03:31:05 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40214
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239172AbhLFIbF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 03:31:05 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2078F3F1BC
        for <linux-i2c@vger.kernel.org>; Mon,  6 Dec 2021 08:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638779256;
        bh=bKEJIZAQjQgq4md0kg/pxei579CQyZfJWJdDIldzueQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=oblectKt7cLJcYNOeBpiFzPje9WAmLLU4iik0XMs8wRBX+rg7WKgsEeBa0nqtSFcC
         dLmqx0ebpmlLSn3S/Qaky7yZGJNrdrqcAQttQOKyb3JUJxpFikJiuDa8t+HEFpqId2
         fljUgIvxuP6jkydR40tYMMnFYbr08yN6qPZBxc5U0ALv9RVIn83+5xjnpSlIU8SwUK
         P47nGMJ+9Q5U3SrZeU2mD23nQSZoGBbTySU8Eth1tktAmLC10VE7FLawjj40Uwi1yU
         S3Y9wwT+UX4xYYYmhulx7dus86RkKIKfNJg31AMbLnpnR/m/jRm8yYHhA+nqGs1Ywf
         rrR/VUDXvZ1Pg==
Received: by mail-lf1-f70.google.com with SMTP id bi30-20020a0565120e9e00b00415d0e471e0so3539427lfb.19
        for <linux-i2c@vger.kernel.org>; Mon, 06 Dec 2021 00:27:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bKEJIZAQjQgq4md0kg/pxei579CQyZfJWJdDIldzueQ=;
        b=nMDqHHr4ABifo6fA+bnLL6TPeLAQm+zWlqUGuShu6RIdcK0y+RAUNobKTDTmnQlN6A
         xACBd76fwd1B0Ou6NvLj3TEWz6On51/42KkbqKJhnE2/CqwToG0TDCDx3kwAxbUzoFIg
         rzLBtCoAef4q7mXh4HLg6Wks5rbb+3TEXmUFIQXUGCARhvzfk/X1YkpZtguhy5dnrtW5
         S5keaGy3JFRVp2oUYwC/2jTf9eUN8skQ09pi+BqoSSPFxAkF0A+HyuEDIqC/kU/CuBQe
         UjqWz7mqLw8jiQtWM3tDLBBK3JoHfkZYfUEp5DTHO2uyYXl8oMjSpRmTFSor7j/5ppCz
         S2/g==
X-Gm-Message-State: AOAM531qNLcH3dZWaBR5dQ2wDrAq8ysj0UYDS/sbDLs2XepMa0ZOfLoJ
        MzqZkQlyuWrAZ0AExm87ZsxYdY6gq1rYMWbxMJc3FIBJ1+1Q4cuCfaNvSY85tTFS/PzQhfBIl6L
        /uqwgHYFoAbtVA+rZTz3+P3e9lNpbUEHFrywtLA==
X-Received: by 2002:a19:4312:: with SMTP id q18mr34592515lfa.299.1638779255278;
        Mon, 06 Dec 2021 00:27:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzzjKn8LjK/5lmCMNpVPgrp0RN3Vobgp5kXibfWPy43zCCeGy55FntekQYEglNs6rllZXWBUw==
X-Received: by 2002:a19:4312:: with SMTP id q18mr34592489lfa.299.1638779255102;
        Mon, 06 Dec 2021 00:27:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id f22sm1287181lfa.171.2021.12.06.00.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:27:34 -0800 (PST)
Message-ID: <98414edc-18fa-c759-9c73-490078d8c93c@canonical.com>
Date:   Mon, 6 Dec 2021 09:27:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 RESEND 3/8] dt-bindings: i2c: exynos5: Add bus clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204215820.17378-1-semen.protsenko@linaro.org>
 <20211204215820.17378-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211204215820.17378-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/12/2021 22:58, Sam Protsenko wrote:
> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> part of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
> 
> Both clocks have to be asserted for HSI2C to be functional in that case.
> 
> Modify bindings doc to allow specifying bus clock in addition to
> already described operating clock.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Added 'clock-names' property to 'required:' in case of ExynosAutoV9
>   - Added example for two clocks case
> 
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 59 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 6 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
