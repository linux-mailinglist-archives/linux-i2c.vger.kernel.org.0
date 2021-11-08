Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D284F448138
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 15:18:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbhKHOVK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 09:21:10 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52040
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240276AbhKHOVK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 09:21:10 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 756BA3F1D2
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636381103;
        bh=HiqLyGrHJ8vZ1EU008SBhCNuKX+ktJLcgyrfTZqVUQQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ZrDB2o3XsslR/K+l/kADIa1CimlgAromNIUUE4lJ4Xbh29tcXxxG4qDMR4hPA0SNq
         vjUk0SHNy+TwH9n0ywttP3B0nsJsLeqw7az66I2FxHtKe9I13p/AJ/ulSVkMvT7/7j
         +5cOeL84vBDabLiVoeNpbvwmjQp74AErHzetJ+Be3JFrSssxzaLSD2DZaVridbMM1Z
         Qgm3wNVGyw+SqyOYx5bPswLEQT6KkGndo9rFAaDZ5ynT8efMsh9bZ1xmK0VFf0LlLL
         e7CRsZRIhSGJnQdyo68odq/A0mfYvWAuY67lRK4k0bk6d7/MsyS2aPIJDXei93k47h
         t0w/fIvLGfP8A==
Received: by mail-lf1-f69.google.com with SMTP id w2-20020a0565120b0200b004036bc9597eso1795682lfu.14
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 06:18:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HiqLyGrHJ8vZ1EU008SBhCNuKX+ktJLcgyrfTZqVUQQ=;
        b=Q5ivIjd+fDeGNzlTcgCyi/XlWsLaYjzyhF/exPB6Cfk6ZqAJebnwznP5dV8QXOJDpA
         W/CRc7s0OPoVFg4FF7LMKcRZfjB8cTkOcUhrtLztWmHfSQBK4r0+cNpVDdry2V2zGRma
         TPzmIGimAy3gHOfE/3+S6zvV6IbTLSdElNbJGW3bq3TCjlcoPUWqujXPRrAVUX0mDX0x
         B7iuoAlO+bf5RxYUymQZo5tHOaQ6u8h1mmKpSr4QHTczojg2RHjXirjs4Ov+V3FU4EZv
         WPzTnvRmQ3aLLXbjKVX3aczG31xgak753NpP8Zu1zvWTirQA7ra7o0W58Z9el1+qFt0N
         858A==
X-Gm-Message-State: AOAM530/vI/OU6KSMkcipyp4QZ+AOv+CV2DGgvUpYV7aLBIkToleu+Sd
        XLGwW/rnV/dNAue2xKvHP5eD0XFRXUAO4Dk7/O7ci3hXctqx37kd0SCQx92U2Q3Iox2/jaq4zyx
        4mf9x7IDk5kZSkHcrR+nOuPxiGPcaX9TMnvfiOg==
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr28429582lfl.565.1636381102901;
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoBnzQ2brUYZsVEzHJHGfIUeAE1W1YmKzWFRbwndi941x319xZJkbtd8QCDTyFmriLopVtVg==
X-Received: by 2002:ac2:4c99:: with SMTP id d25mr28429568lfl.565.1636381102755;
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id m20sm209636lfg.42.2021.11.08.06.18.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 06:18:22 -0800 (PST)
Message-ID: <433f2d77-90d0-53d9-2e04-a8c5feb16349@canonical.com>
Date:   Mon, 8 Nov 2021 15:18:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] arm64: defconfig: Enable Samsung I2C driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
 <20211108134901.20490-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108134901.20490-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 14:49, Sam Protsenko wrote:
> i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Hm, that's a little bit unexpected. I thought you will be also using the
HSI2C driver (where Jaewon is adding USI support).

Best regards,
Krzysztof
