Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2EB4584BE
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Nov 2021 17:47:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbhKUQuk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Nov 2021 11:50:40 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49316
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231519AbhKUQuk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Nov 2021 11:50:40 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AD2AC3F1B9
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637513252;
        bh=XsoOn3ND/sAh8NvQQ/Y8cZAkyJcKJL0OKHYA60c2Nrg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=J57g+2R4lZJY1pViwSwuno+DQRf18ijqYdd3Mo+sVbYuz8RUyBz8I5XoIp2EiJumL
         Yp7qz7YT2cehe3O9HDO4098syfFw3f8ADCJ+Qev1VO639CTpDH2Vwgz3dz2vMKT0Vu
         1VtAQKCEuA1+ACTBglrm/WUWhGlEeBEj7ncL15O861gAm5IUIlnCTpA7kZRWBV32fz
         Qh42f3U/J7lx16lNIPbahDznxp6X16PVO3fdX0O5JnocJFz++ocCaZMh9U1njctfx6
         gPmJHMeF36J0QOWkAKr/3cxjMhZGVSjlcB6UIQlUtpLpk4Gav9Jwk3WfntyK3exrjT
         kILr5IeazFz7g==
Received: by mail-lf1-f72.google.com with SMTP id k5-20020a05651210c500b0040934a07fbdso10321570lfg.22
        for <linux-i2c@vger.kernel.org>; Sun, 21 Nov 2021 08:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XsoOn3ND/sAh8NvQQ/Y8cZAkyJcKJL0OKHYA60c2Nrg=;
        b=nf+wBOgMUAsp+GNomOkp1e0TMqMDcwv50EF47ve68eoXteoHCq6YagtIC8YMNcCw4l
         QVB2zivUEwQIcS2XEcAJk10SABpJApE/s2PhMzlQBDQbea+rMKsQMOY5h99xHyYPQn0k
         HQ7XiJLTnqXgdeg97rqiv5YT2duBzgFfRjT1/x/qt3n6zi+Ro7642vqOtrEpS0mWPKcl
         M75JQeuGcTd9pBMo218sy/95mG8kAV5T1KDYlcPAlDVyIPAXLq0Kx2ocmeVhgsvo/kIM
         7R/Fxa9j8V1LOvgi+iQDeE+vXlO27CvYpdN9VvwauHSo4ju3xhBR3PHKgSKrNw9UkX02
         N6/w==
X-Gm-Message-State: AOAM530ESAabeBnrSjckxgST3pwKo+JdIKQdWaZiQm4qbPatla3KP7N2
        CLWWNAxj/fGpoNrIvu4JDfGa2x6D9Jx5ZHxrOYve7pXecPYVuxT1YS8hz43Knxv8rUV+srRL/zm
        3WCca1u7aHk9v4+LDMckRHCStMRkWxSvSUVKP2w==
X-Received: by 2002:ac2:42c6:: with SMTP id n6mr48523143lfl.553.1637513252033;
        Sun, 21 Nov 2021 08:47:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4hlDfeLcmS9sY/YWfSzCQe00z2kJ8KKHqYotO5YUEAImib8DLKRzP+dSEWcZ5jYW2Y1Jxyg==
X-Received: by 2002:ac2:42c6:: with SMTP id n6mr48523115lfl.553.1637513251856;
        Sun, 21 Nov 2021 08:47:31 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s15sm631835ljj.14.2021.11.21.08.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:47:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrew Morton <akpm@linux-foundation.org>,
        Russell King <linux@armlinux.org.uk>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: defconfig: Enable Samsung I2C driver
Date:   Sun, 21 Nov 2021 17:47:29 +0100
Message-Id: <163751324653.4740.10340111836301836511.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211121150558.21801-1-semen.protsenko@linaro.org>
References: <20211121150558.21801-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 21 Nov 2021 17:05:57 +0200, Sam Protsenko wrote:
> i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.
> 
> 

Applied, thanks!

[1/2] arm64: defconfig: Enable Samsung I2C driver
      commit: 0e9a9debf0427164fb845403a6eb9439558f1684
[2/2] arm: samsung: Remove HAVE_S3C2410_I2C and use direct dependencies
      commit: 3ac5f9db26bb7a227ccbf160c36a5567b5394299

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
