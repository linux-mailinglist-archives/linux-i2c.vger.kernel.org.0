Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE4533774A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Mar 2021 16:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhCKP0c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 10:26:32 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33853 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhCKPZ4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Mar 2021 10:25:56 -0500
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKNCF-0004nf-14
        for linux-i2c@vger.kernel.org; Thu, 11 Mar 2021 15:25:55 +0000
Received: by mail-ed1-f72.google.com with SMTP id m8so4342444edv.11
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 07:25:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JtLWGKzddsZdneeyVDqkoKKRKkrCkmXH8NCFoh7fPmQ=;
        b=b/cGbdaYR96FpyDsXIurM8zlizFS+wx+l6aNsQS5Jf1BbdvlxYKHAIUzRkH/ws4tiu
         VBUJ67Sm0ZVRjQ680Oy6fWGusytVSOo0n1G5gog86DRrk9+Lp6G6mqrc4QCJkzcAl7A8
         fiiWmMH42br5tZeDL/H+ZQRUPchCpv7q4qJQOnvK4xCXj/QsZ7RcfaSH27j8rc2hGgHs
         WSl3s5wLuWGz2pGFuI1m7ycFKyK33g44zk0Fyr8azPHVXp+RldrxQgA3Kro2JXNBNAQE
         l9/Ch5RtqK6IY5DqZzBm9LjLrWgidZKZ44BATJY91JZMWfMGLuw+D8l2eDXod2hOLyZE
         pISg==
X-Gm-Message-State: AOAM530wCYpf3sH7r1XskOoYpTIKd/EZ1UVyhCZ5BJZp5HqM/5gzxetm
        I3X/xiz09GdyETgzIdFmLKrwLJgti3DdjaYlPOm2w8TD8h9J76nZSe62qnrVNn6jobpxXI+mAke
        D0YzJ/TbiDeQLe8FZbNu6mwIIz45Taskk3Hz02g==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr3657272ejb.510.1615476354696;
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGGDs0d4jf9iY6zfDpEMPiHECUlKXPHLkk7gQWMVmAU9DMsqo4KBX6VOy9u5EuqygNiPRNmA==
X-Received: by 2002:a17:906:c1ca:: with SMTP id bw10mr3657235ejb.510.1615476354507;
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:25:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-fpga@vger.kernel.org, linux-i2c@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 03/15] mfd: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date:   Thu, 11 Mar 2021 16:25:33 +0100
Message-Id: <20210311152545.1317581-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
References: <20210311152545.1317581-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Simplify 32-bit and 64-bit Intel SoCFPGA Kconfig options by having only
one for both of them.  This the common practice for other platforms.
Additionally, the ARCH_SOCFPGA is too generic as SoCFPGA designs come
from multiple vendors.

The side effect is that the MFD_ALTERA_A10SR will now be available for
both 32-bit and 64-bit Intel SoCFPGA, even though it is used only for
32-bit.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a03de3f7a8ed..8af8c3196f1d 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -21,7 +21,7 @@ config MFD_CS5535
 
 config MFD_ALTERA_A10SR
 	bool "Altera Arria10 DevKit System Resource chip"
-	depends on ARCH_SOCFPGA && SPI_MASTER=y && OF
+	depends on ARCH_INTEL_SOCFPGA && SPI_MASTER=y && OF
 	select REGMAP_SPI
 	select MFD_CORE
 	help
@@ -32,7 +32,7 @@ config MFD_ALTERA_A10SR
 
 config MFD_ALTERA_SYSMGR
 	bool "Altera SOCFPGA System Manager"
-	depends on (ARCH_SOCFPGA || ARCH_STRATIX10) && OF
+	depends on ARCH_INTEL_SOCFPGA && OF
 	select MFD_SYSCON
 	help
 	  Select this to get System Manager support for all Altera branded
-- 
2.25.1

