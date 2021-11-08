Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34D3644808A
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 14:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240104AbhKHNv5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 08:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238197AbhKHNvz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Nov 2021 08:51:55 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36328C061767
        for <linux-i2c@vger.kernel.org>; Mon,  8 Nov 2021 05:49:06 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id y26so36272584lfa.11
        for <linux-i2c@vger.kernel.org>; Mon, 08 Nov 2021 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0gjDtZyn15X3kTimy0RoEkC8ib1mpgy6W5NT1wcHcys=;
        b=feUQtXs9k99VsJAxmytIgDEH90K6qL0jZpgZCmKsXwLKLe6lZYJTXGsMtFhyMywlJk
         38WIHfQfPmDXfIhJ3QNr+MsFZf9F1NpOSGC0HtUE+zQgDVsr7WB/HfM8rgMd+Shkc62A
         RUvnUJoDT4tY2SJ+0oINotp5dgp4kahD9yN3VJ6YI9pFd+E3ZiHZhu/n29wTxenNc/cV
         QyxN6mofwdcKg/GnsjoAIjXdW3/4HF/7P2IpStfc2Vemm4IDcjT3qrVHhptn0roryxZ5
         YATTaWkKNaRfe7UYNxWvXtXN+U5d4Vrc2XIRslOaPNiQjXs4HHgoyTxe1jXR2QFQlDiq
         zUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0gjDtZyn15X3kTimy0RoEkC8ib1mpgy6W5NT1wcHcys=;
        b=lJrUEOBYj8XpvIrunCUdWlOdYeJLqEoESZ6WSYJCUG9RSMCAUlLp8SzAET1TE02sLd
         JW61vX8B5xxJS1BK9+sahpnKwtAL5AhqNStFIG1JrsweBY5RaJkdikxYzxYtnkiiz2pX
         Xcy3QkJStYdWAD6AxJTBBsTKkHFiAhI/4Mtpha0PSB1G8z0c15y2AhjwGk3qojnhR0bu
         aYV67R40NjnMm8K39rCqJz+RNhoI8JrB7AiZ1KnOC1Vlk6S5l8LhLIDsymJr2ZmyfOjo
         ZilVhuMa2IoHV0i5PnVC9VtxhN1mhJCU4zbBauLSk5uqh/qNMLgDuK53Awd2l13HQ70y
         BImQ==
X-Gm-Message-State: AOAM532yRDgIo8JgBDVErtz3jlzhf6BHgvnh7cwbx6OMXOqRzWHvt4fa
        OeIGtlIyh//U6X9NTNAglLpANlu7HZtoVkbb
X-Google-Smtp-Source: ABdhPJz2mqqO5lcRy+OTg3aNweJ2v20tqd4fcl+GUINwIspD6PI5q/g372E2+f5rM+4O7+6jdZ25ug==
X-Received: by 2002:ac2:4313:: with SMTP id l19mr44994988lfh.132.1636379344522;
        Mon, 08 Nov 2021 05:49:04 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c21sm1278437lfv.29.2021.11.08.05.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 05:49:04 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
Subject: [PATCH 2/2] arm64: defconfig: Enable Samsung I2C driver
Date:   Mon,  8 Nov 2021 15:49:01 +0200
Message-Id: <20211108134901.20490-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211108134901.20490-1-semen.protsenko@linaro.org>
References: <20211108134901.20490-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 545197bc0501..7c6a3b91e55d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -461,6 +461,7 @@ CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RK3X=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
-- 
2.30.2

