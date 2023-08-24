Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9C87870A1
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 15:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241426AbjHXNmR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 09:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241457AbjHXNl5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 09:41:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86A119B4;
        Thu, 24 Aug 2023 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884501; x=1724420501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b/q1FciQ7xxMYTgNQ5K4S4rY9fGLYfMfkQmS4JrRWPY=;
  b=nnEFytCXfIv8sWcvdxcYRcXXqT9vyWWOkgqhl6y9U0o9UJQnrDW5VKB1
   FY2vx3bqPQMbcN8aa4gF+UjreX4GlSZbPBg2Maj3wb5y8ErqK4x6oJGl0
   O0A+069WJY3IlQH78mx85exI4bAky8FoErDBnhKutF27+owYT+VKsCqKE
   dJxKDiV9iN93StJ6jiTC2EYOhkUZ522tFsq8hloGUZ1J8SYENCs3vHZP3
   BDaOlOVC8TS5+Zp1bJJm1KSQgp9vCOeYKvDbZZHpY9xWX96lrPKAUkB08
   lRHJzzIf7n/Prc957DwQsoYy4OVcjc7A0coyxu9xpQMNfpKqGWPHTiUAQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440792443"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440792443"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802539898"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802539898"
Received: from abedekar-mobl1.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.251.213.29])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:14 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 09/14] I2C: sis5595: Do PCI error checks on own line
Date:   Thu, 24 Aug 2023 16:28:27 +0300
Message-Id: <20230824132832.78705-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
References: <20230824132832.78705-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Instead of if conditions with line splits, use the usual error handling
pattern with a separate variable to improve readability.

No functional changes intended.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/i2c/busses/i2c-sis5595.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index c793a5c14cda..486f1e9dfb74 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -175,11 +175,11 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 
 	if (force_addr) {
 		dev_info(&SIS5595_dev->dev, "forcing ISA address 0x%04X\n", sis5595_base);
-		if (pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base)
-		    != PCIBIOS_SUCCESSFUL)
+		retval = pci_write_config_word(SIS5595_dev, ACPI_BASE, sis5595_base);
+		if (retval != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_word(SIS5595_dev, ACPI_BASE, &a)
-		    != PCIBIOS_SUCCESSFUL)
+		retval = pci_read_config_word(SIS5595_dev, ACPI_BASE, &a);
+		if (retval != PCIBIOS_SUCCESSFUL)
 			goto error;
 		if ((a & ~(SIS5595_EXTENT - 1)) != sis5595_base) {
 			/* doesn't work for some chips! */
@@ -188,16 +188,16 @@ static int sis5595_setup(struct pci_dev *SIS5595_dev)
 		}
 	}
 
-	if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-	    != PCIBIOS_SUCCESSFUL)
+	retval = pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+	if (retval != PCIBIOS_SUCCESSFUL)
 		goto error;
 	if ((val & 0x80) == 0) {
 		dev_info(&SIS5595_dev->dev, "enabling ACPI\n");
-		if (pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80)
-		    != PCIBIOS_SUCCESSFUL)
+		retval = pci_write_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, val | 0x80);
+		if (retval != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val)
-		    != PCIBIOS_SUCCESSFUL)
+		retval = pci_read_config_byte(SIS5595_dev, SIS5595_ENABLE_REG, &val);
+		if (retval != PCIBIOS_SUCCESSFUL)
 			goto error;
 		if ((val & 0x80) == 0) {
 			/* doesn't work for some chips? */
-- 
2.30.2

