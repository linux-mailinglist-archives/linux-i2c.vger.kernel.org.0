Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 834AD471C35
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Dec 2021 19:23:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhLLSXn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Dec 2021 13:23:43 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41264
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231236AbhLLSXn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Dec 2021 13:23:43 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1B78E3F1B3
        for <linux-i2c@vger.kernel.org>; Sun, 12 Dec 2021 18:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639333422;
        bh=zsFvDymLAE62cochR5JV+hqkToOtqvgjd65ScGiDZ8Q=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=kNdwRhJvPvuvp1HhVDaWOwUv5W+UeCecVmW4E/A96J7PxyfdA2ktS6pOKp5YqicpB
         kvLfp7KvegmUNXjZrST0ml05JTIQ7zLzbgxEnlrACb0TFKZTcQPvonYgRisUxmK54V
         TbVmOXKgLEStLf+2Qmvync6mrDRbWdbbvbhBrT/W/u2QCm/HMElrSMCE98zBpXbmIm
         sK6gpUjHMsPPVmF2h1Jmex5Kqwr5lXkcETvXXlbCRZ8qEc9dlcUdfPhcAePkyBXbXq
         5GhDhDfk9S0/qPKf4pT8eJuhFswBfdeH2VI3e+RH7eykWW70VgFrVRbbEv2HBn0ggF
         ZcI0JEdd25Frg==
Received: by mail-lf1-f71.google.com with SMTP id c40-20020a05651223a800b004018e2f2512so6491763lfv.11
        for <linux-i2c@vger.kernel.org>; Sun, 12 Dec 2021 10:23:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=zsFvDymLAE62cochR5JV+hqkToOtqvgjd65ScGiDZ8Q=;
        b=JsrUkpThl4vTlgU5cJeEqHbQDCCVRbG7KwNo5aXkU8B4qmR+xXSf4tCG7inUANW/m8
         aOgJXfNdwOlunIlUusgidfy/BuQre5LP0uV6S8zTkFvAVJ/wenCcFmi3b+gO7XzAm3s0
         KsG1D+AvMdHAoHtTvmLTk3pgJQ3VwTZYHu+qW3Z8P2Kw12+nRMEpx2AmFd9K1d1RKlE9
         m6/sQv0Cu47uvrog4cGSR7bKzZK+vJbzdLHI+GbM8GGDrBzJxOWmix/6ObrtKlvjDEGo
         GQkuQZXOv96JlustcZWHswg2bFjJx3iT1TOs4dzo8CyOOB9r7Ny8lNb+j1GV3Pcqg9Nu
         Olnw==
X-Gm-Message-State: AOAM532LHGy0ohi3ryAbJf2JJB0wml7orYQ/pw8mZ47i6X30IiAszFFx
        CgFd33hkZeZhUvQ3AhMIBCj/Ckg9kbCO7J+SwYtL15SR/Pyf8oBifQSOP38VS3e/pgfIwoWKtt3
        cjAgrkbmBEy92wFoljkCYgGuj3Nn/Yf6p921cqQ==
X-Received: by 2002:a19:f241:: with SMTP id d1mr24604058lfk.131.1639333421349;
        Sun, 12 Dec 2021 10:23:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdFZTcAiz+yLH3ynk5vBF+dbiNtcpA+ioYNpceWPBWGhHfcQ30v344oKq6PRrfsrAO9LYLCw==
X-Received: by 2002:a19:f241:: with SMTP id d1mr24604048lfk.131.1639333421187;
        Sun, 12 Dec 2021 10:23:41 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k6sm1111431lfu.218.2021.12.12.10.23.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Dec 2021 10:23:40 -0800 (PST)
Message-ID: <ad05297f-9252-15b3-fc9d-e358052bd983@canonical.com>
Date:   Sun, 12 Dec 2021 19:23:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] i2c: exynos5: Fix getting the optional clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211212181057.20210-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211212181057.20210-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/12/2021 19:10, Sam Protsenko wrote:
> "hsi2c_pclk" clock is optional and may not be present for some SoCs
> supported by this driver. Nevertheless, in case the clock is provided
> but some error happens during its getting, that error should be handled
> properly. Use devm_clk_get_optional() API for that. Also report possible
> errors using dev_err_probe() to handle properly -EPROBE_DEFER error (if
> clock provider is not ready by the time I2C probe function is executed).
> 
> Fixes: c93ac09df2a8 ("i2c: exynos5: Add bus clock support")
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
