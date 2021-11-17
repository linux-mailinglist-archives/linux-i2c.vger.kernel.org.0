Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D91845504A
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Nov 2021 23:18:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241133AbhKQWVN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 17 Nov 2021 17:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241100AbhKQWVM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 17 Nov 2021 17:21:12 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB12C061570;
        Wed, 17 Nov 2021 14:18:13 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id y12so17611523eda.12;
        Wed, 17 Nov 2021 14:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=uwaJGhx917BJGzmEA12X6fG6XxZWYSzTmRZkffjSJ9A=;
        b=boPWvSAdRPsQcp1xrzCbOVLo6NvHJXRgB/uBhddLwm4vOztoJbDBHUFAg+9qNx/mIl
         5OnQdDVbzgCYRSnSIuTxyCnZR6yzDB+FAsoJQ7wytbT94AKMT8QsIEoiittY3nve0oRI
         Md1xWZhxdISj/QA5eSDWrsvjRfI5EWP06wQHaAIEAu628KxflvuzG3/LYfAKj+WHgeWc
         JXhEtOyDJKkl59yXejYAPuPVMfpTdNcOHOr8vWMqCjU29TlhQLKh/Ks2fYN3OaagZftI
         gYVt59QWip+XUyWuRfleqWbamEt1GeRWPuAlo8ur/kXLQX9GE3vyt572oGKLzaPFlHuz
         hLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=uwaJGhx917BJGzmEA12X6fG6XxZWYSzTmRZkffjSJ9A=;
        b=HGpIlCZmuzvQrhoKUqMH2xxvfDZ2RT153ubEAlv2Zb11U0QmJ3Y9MQ6kxTOz9XTsoW
         GZqvaHuiUVlrEj7uxEJbbY5XTQn128J+ZE2EWgtleQxe5D2YbmEeCdEwgbeVKj/7li9r
         LsiHG5wyrzcYBNP6lieSw+TRpswOuLYKD17pLTDDQigcC8OkYd4LaJ4M93n+5jh1cX+W
         wHd1WnfcywAXFzNU4fD7naq4AZvmeT3iQ5e7X6ndsZQGPRl8YEdqMSZqlCffWakjOeFS
         ohHcV6wKhZ5exMYRnOdidtkbRj8yPqYnNqGwlVp3/pVuWr2BEinypuir7MkmePSkamxt
         fV6g==
X-Gm-Message-State: AOAM532KcP90tR51B0dN4Hi8FjEktp/FEAvsVnwGRuD/AY0nqOpIPo3H
        jWjMN+RhPv3WarTuti9Qt5I=
X-Google-Smtp-Source: ABdhPJy52mXAuwaFzuszO3cNDfb51dXVqQPAC0VHCpaWesxHmfSAxn9hxqCLxBnU1pZl/C/9iG28LQ==
X-Received: by 2002:a05:6402:35d2:: with SMTP id z18mr3416427edc.188.1637187492003;
        Wed, 17 Nov 2021 14:18:12 -0800 (PST)
Received: from ?IPv6:2a02:ab88:368f:2080:eab:126a:947d:3008? ([2a02:ab88:368f:2080:eab:126a:947d:3008])
        by smtp.gmail.com with ESMTPSA id mp5sm522733ejc.68.2021.11.17.14.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 14:18:11 -0800 (PST)
Message-ID: <9ee9584833d948188347414991a117ca86edfaaf.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
From:   David Virag <virag.david003@gmail.com>
To:     Chanho Park <chanho61.park@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>,
        'Jaewon Kim' <jaewon02.kim@samsung.com>
Cc:     'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>,
        'Wolfram Sang' <wsa@kernel.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Date:   Wed, 17 Nov 2021 23:17:55 +0100
In-Reply-To: <001401d7da86$f7ebd660$e7c38320$@samsung.com>
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
         <20211112010137.149174-1-jaewon02.kim@samsung.com>
         <20211112010137.149174-3-jaewon02.kim@samsung.com>
         <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
         <001401d7da86$f7ebd660$e7c38320$@samsung.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

> Current version of USI is v2 which means there is a v1 version as well.
> It might be a non-upstream SoC so we don't need to consider it so far.

The Exynos7885 I'm working on has USI v1. It doesn't seem to be heavily
used as the SoC has just 3 USI blocks if I didn't miss anything.

The most obvious difference I saw was instead of having 3 modes (SPI,
UART, and HSI2C) It has:
 - SPI
 - HSI2C0 (meaning I2C pins are connected to the first 2 pins out of
the 4 if I understand it correctly)
 - HSI2C1 (connected to last 2 pins)
 - HSI2C0_HSI2C1 (2 I2C devices connected to first 2 and last 2 pins)
 - UART
 - UART_HSI2C1 (first 2 pins are UART, rest is I2C)

Also there doesn't seem to be any USI_CON or USI_OPTION registers in
SPI, UART, or I2C. It seems like it's just the USI driver doing all the
work (just setting up the SYSREG) and the I2C driver writing values to
the SYSREG at suspend/resume for some reason. 

From the looks of it, it doesn't look like it'd be hard to add this to
USI v2 drivers when needed. (USI driver (if that's the way it will go)
would just need minor modifications to add v1 modes and UART/SPI/I2C
drivers may just work with non-USI compatibles/would only need SoC
specific data added).

Best Regards,
David
