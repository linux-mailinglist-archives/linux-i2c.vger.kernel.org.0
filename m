Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2132D465F55
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Dec 2021 09:28:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356086AbhLBIbo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Dec 2021 03:31:44 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46850
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1356097AbhLBIbn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Dec 2021 03:31:43 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 761FE3F1B2
        for <linux-i2c@vger.kernel.org>; Thu,  2 Dec 2021 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433700;
        bh=1eBIeWyYOLfAkd1ORESuyZ3/vrhRYjsquv2xZv/KG6g=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=TKhYJHSJREzSAqp5lzqMarIR48iFr+DQamRzcmhqd82kBIXnPGOPkpeoHvZLstfmp
         GMoRo+7+bRuO8/0FXnLJadFBODRj/A80Me/sZEO0wsBd/mRHflD6zYoBeJH1Jc2m5/
         OmCE94YCNv6ydu9/HHVhum3kOPDq/EAaVhXiFW6tha5QYoEyDFkH8TxFew/+j5drRn
         xLMUsXRwwB78aW5jzWBgDPE/Vv0TS81Sf5MXW9qDGymXcfTYhUNeJZYbla++OFfqfb
         bvQ2PUs7BR65Fh/GYSxA5XHYQuEaB2iQ2dSwAP8k4o6yxmpchVEjYfj2RqikSOQ1PV
         UfjNNIpjrQNgA==
Received: by mail-lf1-f69.google.com with SMTP id c15-20020a05651200cf00b0040524451deeso10843743lfp.20
        for <linux-i2c@vger.kernel.org>; Thu, 02 Dec 2021 00:28:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1eBIeWyYOLfAkd1ORESuyZ3/vrhRYjsquv2xZv/KG6g=;
        b=pHerZLsZsTTb1HswBCPwibO2iYQftN/qeM9iOb/f4p3NIlUgOak0zDDuvdZOkjsO+q
         0Myf6Vfg5UGXomm5E/iVctSPcDiNsg28zc8j2PKXOz4e6yzggtf7AwMrHP9QaIUW78Zr
         dUv8HhNnw6JVAfKX8V7vzaZ62dTVrctrPICk68xgDYBEnahB+kqzB7mHXWRuAxC0QxnR
         mJ78snOuwmTYiaXEAqi0gCr2OGwoMc77q2452oLUS760QUYOeg8ULPHDdS1S/nI53W9p
         TORIn5GwrIeHFBYDMzYDH9cU2NB7cYfVhU6/0Xj9ted391ARCc2Z6uNre7EaDf+Rpa8K
         lCYw==
X-Gm-Message-State: AOAM532sDvlWj9osCmAPSBndsrJE7rNyBczsihUQNbququhwXQibxOeB
        yt6Ryj0spWROBm/LW6ikReSh1c8QXdDQT+1Rt6o8aydcQ80p9RPKXOfuHL3KkJ8xKEzcQd0Qs7e
        EmP/V7BySKjeMRY9lm2yODwitOAhOGgnaYxj3pw==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr10469527ljg.125.1638433699893;
        Thu, 02 Dec 2021 00:28:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeJ/jbkXZLjr07M46afb4m/Ji/F2WVbQsP2Rfg1PNpFWz/eDCLOEHIBPBg9cOh30Cj6//snw==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr10469505ljg.125.1638433699723;
        Thu, 02 Dec 2021 00:28:19 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c1sm234837ljr.111.2021.12.02.00.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:28:19 -0800 (PST)
Message-ID: <38601fab-816c-37aa-1839-96fa7c6a3959@canonical.com>
Date:   Thu, 2 Dec 2021 09:28:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 5/6] i2c: exynos5: Add bus clock support
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
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
 <20211201190455.31646-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> In new Exynos SoCs (like Exynos850) where HSI2C is implemented as a
> part of USIv2 block, there are two clocks provided to HSI2C controller:
>   - PCLK: bus clock (APB), provides access to register interface
>   - IPCLK: operating IP-core clock; SCL is derived from this one
> 
> Both clocks have to be asserted for HSI2C to be functional in that case.
> 
> Add code to obtain and enable/disable PCLK in addition to already
> handled operating clock. Make it optional though, as older Exynos SoC
> variants only have one HSI2C clock.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 46 ++++++++++++++++++++++++++------
>  1 file changed, 38 insertions(+), 8 deletions(-)
> 

You could use clk_bulk API, but for two clocks, where one is optional,
it won't reduce much of code, so I am fine here:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
