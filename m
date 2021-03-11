Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF3A337757
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Mar 2021 16:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234206AbhCKP0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Mar 2021 10:26:36 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34067 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234256AbhCKP0L (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Mar 2021 10:26:11 -0500
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lKNCU-00055b-7S
        for linux-i2c@vger.kernel.org; Thu, 11 Mar 2021 15:26:10 +0000
Received: by mail-ed1-f69.google.com with SMTP id u2so10022081edj.20
        for <linux-i2c@vger.kernel.org>; Thu, 11 Mar 2021 07:26:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kUT7ytcjB6VCPdAxIBqG0E5rhLsqE5uC2TbGUeGX+rU=;
        b=r1U+EyelSBE5O+M2d7izZFfNR7b65IYGC+/+wetoc20iimPbx+JHqbq2zEb0iwSNJS
         kT4vMvK4KNdaqmpmjmFn6jk5Ld8A9e6ayOPGeSsxbUNQ+pXF8mihnUtEyHEjQYEfaKiN
         oDNuvO4zZGyAb78aLWy527PkS+oU44U1hzr9G4GsqyclP+YPb5HAPokr4j/xV/6kAL7S
         7mTVJIVY0KYqebBBhFYcyqTTl4E3D423KHg/KQajrKYBDq1WA26ltrfIIXt2l+YgVDSD
         90LBHMsGxHYphm6ssWmKklxdCh+ipfIpeUygGaiQghx08zwAxk9flxlPSp6s0z6D08zy
         zCgA==
X-Gm-Message-State: AOAM532rfnnrgQLQVPb0cNnmGuQ4wQJzE8zuHfWWaak7L2s6upN9UVfh
        qj5ojgkLTTRvWGgBQugIaISuEv5GAysaVitmrwx4/rqlodUDpUnkpZYfCZbMoV4YI0kpy/3nkrU
        FZH5vfOUw9WrhDeLV9wDBLZUBmRsp5dxjqd1UBw==
X-Received: by 2002:a17:906:894:: with SMTP id n20mr3550489eje.57.1615476359031;
        Thu, 11 Mar 2021 07:25:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzewwKul+qByKNtSAFVbtVEtU+PJVW0lvuxaGwwO1QNpVsWLj92RBZH/7UiX/uUZip32n7cVA==
X-Received: by 2002:a17:906:894:: with SMTP id n20mr3550472eje.57.1615476358839;
        Thu, 11 Mar 2021 07:25:58 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id v25sm1517826edr.18.2021.03.11.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 07:25:58 -0800 (PST)
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
Subject: [PATCH v3 07/15] EDAC: altera: merge ARCH_SOCFPGA and ARCH_STRATIX10
Date:   Thu, 11 Mar 2021 16:25:37 +0100
Message-Id: <20210311152545.1317581-8-krzysztof.kozlowski@canonical.com>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/edac/Kconfig       |  2 +-
 drivers/edac/altera_edac.c | 17 +++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 27d0c4cdc58d..1e836e320edd 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -396,7 +396,7 @@ config EDAC_THUNDERX
 
 config EDAC_ALTERA
 	bool "Altera SOCFPGA ECC"
-	depends on EDAC=y && (ARCH_SOCFPGA || ARCH_STRATIX10)
+	depends on EDAC=y && ARCH_INTEL_SOCFPGA
 	help
 	  Support for error detection and correction on the
 	  Altera SOCs. This is the global enable for the
diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index e91cf1147a4e..5f7fd79ec82f 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1501,8 +1501,13 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 	dci->mod_name = ecc_name;
 	dci->dev_name = ecc_name;
 
-	/* Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly */
-#ifdef CONFIG_ARCH_STRATIX10
+	/*
+	 * Update the PortB IRQs - A10 has 4, S10 has 2, Index accordingly
+	 *
+	 * FIXME: Instead of ifdefs with different architectures the driver
+	 *        should properly use compatibles.
+	 */
+#ifdef CONFIG_64BIT
 	altdev->sb_irq = irq_of_parse_and_map(np, 1);
 #else
 	altdev->sb_irq = irq_of_parse_and_map(np, 2);
@@ -1521,7 +1526,7 @@ static int altr_portb_setup(struct altr_edac_device_dev *device)
 		goto err_release_group_1;
 	}
 
-#ifdef CONFIG_ARCH_STRATIX10
+#ifdef CONFIG_64BIT
 	/* Use IRQ to determine SError origin instead of assigning IRQ */
 	rc = of_property_read_u32_index(np, "interrupts", 1, &altdev->db_irq);
 	if (rc) {
@@ -1931,7 +1936,7 @@ static int altr_edac_a10_device_add(struct altr_arria10_edac *edac,
 		goto err_release_group1;
 	}
 
-#ifdef CONFIG_ARCH_STRATIX10
+#ifdef CONFIG_64BIT
 	/* Use IRQ to determine SError origin instead of assigning IRQ */
 	rc = of_property_read_u32_index(np, "interrupts", 0, &altdev->db_irq);
 	if (rc) {
@@ -2016,7 +2021,7 @@ static const struct irq_domain_ops a10_eccmgr_ic_ops = {
 /************** Stratix 10 EDAC Double Bit Error Handler ************/
 #define to_a10edac(p, m) container_of(p, struct altr_arria10_edac, m)
 
-#ifdef CONFIG_ARCH_STRATIX10
+#ifdef CONFIG_64BIT
 /* panic routine issues reboot on non-zero panic_timeout */
 extern int panic_timeout;
 
@@ -2109,7 +2114,7 @@ static int altr_edac_a10_probe(struct platform_device *pdev)
 					 altr_edac_a10_irq_handler,
 					 edac);
 
-#ifdef CONFIG_ARCH_STRATIX10
+#ifdef CONFIG_64BIT
 	{
 		int dberror, err_addr;
 
-- 
2.25.1

