Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6AEC458375
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 13:39:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbhKUMmT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 07:42:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58482
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234112AbhKUMmT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 07:42:19 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EA48840020
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 12:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637498352;
        bh=TFA1LNPBLrquSyjdPdpl7pD/tLLoRLNXb4nnei/Z6/0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ng+3AzcwfCspD2AuZwwXQ+Kk7Nfr/2JtueH2s9RjDKI0XXrvPbwpViMdkoBYNGUOI
         aJzhnQVTy89UWso8J4svS8M0ququoiyXb0IDyF0VuKcRAoRrRNYSsob350mWWly9eF
         q0gn82iGhC4XfY8abUy0PgOdJSOIOflO8aHfpJWnUG/V5zpHK95hVBHGj5N2TUqmdM
         ZbMCAc2a6hh1JhEo/9HFc88jdogHyPD8jm5pLcI2A5i3GLIgLhV/vKUGxEiumP5dNs
         VUjHbaN9vyzhzR3A1K45Gafqzg76tcTBWpule/5lw21vnYcy2NlK4RTu+UyQM0iDmY
         8TU/VCkJ9PMCg==
Received: by mail-lf1-f69.google.com with SMTP id c15-20020a05651200cf00b0040524451deeso9990457lfp.20
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 04:39:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TFA1LNPBLrquSyjdPdpl7pD/tLLoRLNXb4nnei/Z6/0=;
        b=8MiDXC+fKSTw50Ig0TA7HhzJDxXHiiqxq+ZEEUeMzG78Mk8OoNh1FwZ/9CcAZkyrkV
         hW77XqE7OVpzkX5xRDU3LzWis0uzzg2hE8pwv8Io97HrWBVfv/hjtT+kZxdjbuph6RxG
         1UiwxhjDdP1/u0YCzYZDk5v7BEUkz51og2eV1mfphmAJ7Toiu/ktM6aDPaMaMjXFWgtW
         3P2S3+i386yCb3Fxbysm4hgKHoM0BOkRFcyEPZ2boddg8T+Lq9tf/Ff6o4egwG1o9ST7
         JWf3y2KvVfi/lic7qh4fBIGaJ6C9rql4CWBpPnXiZlMwp9bkFhIU15YnuWMj2aTNT69U
         0gpw==
X-Gm-Message-State: AOAM530RRobLoRU/9YvfUkN1EbM6J36bu/hEl4N+3zq6LAoe3Kypdgp2
        HQoNzux5oaWK/AEtYIV+reaXeXQaQZ3J/JZb5YtLusUAVSY/m55KWB8tiVqmYQGAw68IzKyqGiZ
        dZPsugOmV6uB+RxAkV+ZV5m42phUm9iYKRzFWAg==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr49746436lfm.369.1637498352232;
        Sun, 21 Nov 2021 04:39:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYMWr4FvuZ7Nqv9X59p0QzJvAJXMV+d9GpFfumZBpc0w/0S1Kvup1vykMeuihBU1HnXXXRUA==
X-Received: by 2002:ac2:4571:: with SMTP id k17mr49746416lfm.369.1637498352038;
        Sun, 21 Nov 2021 04:39:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a28sm426341ljm.65.2021.11.21.04.39.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Nov 2021 04:39:11 -0800 (PST)
Message-ID: <b374d1a6-6478-cf2f-924e-425825731ad5@canonical.com>
Date:   Sun, 21 Nov 2021 13:39:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct
 dependencies
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211108134901.20490-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/11/2021 14:49, Sam Protsenko wrote:
> A separate Kconfig option HAVE_S3C2410_I2C for Samsung SoCs is not
> really needed and the i2c-s3c24xx driver can depend on Samsung ARM
> architectures instead. This also enables i2c-s3c2410 for arm64 Exynos
> SoCs, which is required for example by Exynos850.
> 
> This is basically continuation of work made in following commits:
>   - commit d96890fca9fd ("rtc: s3c: remove HAVE_S3C_RTC in favor of
>     direct dependencies")
>   - commit 7dd3cae90d85 ("ARM: samsung: remove HAVE_S3C2410_WATCHDOG and
>     use direct dependencies")
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  arch/arm/Kconfig                  |  1 -
>  arch/arm/mach-exynos/Kconfig      |  1 -
>  arch/arm/mach-s3c/Kconfig.s3c64xx |  1 -
>  arch/arm/mach-s5pv210/Kconfig     |  1 -
>  drivers/i2c/busses/Kconfig        | 10 ++--------
>  5 files changed, 2 insertions(+), 12 deletions(-)
> 

This does not apply, which is weird because there were no changes here.
It seems you based your work on some older tree, so please rebase and
re-test on current tree (my for-next branch or linux-next).

Best regards,
Krzysztof
