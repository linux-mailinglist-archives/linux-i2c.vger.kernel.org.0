Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A4A78709D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 15:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjHXNmP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 09:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241433AbjHXNlw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 09:41:52 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E911BDB;
        Thu, 24 Aug 2023 06:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884493; x=1724420493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tiyfUtMuorXZJjAwz/eazM7LhieZM+Nv43GEbBvNdcY=;
  b=UCu619Lv8QDwEDdyISoTPHsvpwo+GLz/d/rX1PsYM5TGyvH+vc/tKb+s
   trB033AkWcApd724D0FcWZt+f/RRtk8fZv4Jmu/rcEjlbcY6naEXecURq
   46fHwDsHUYlVOuH2W5VviWnj0ipNpfKbBR2gXGqptDKyuKyglExiKdGNL
   xJy0cWOxIWvzzLSs6oFqxQYg4CWYeXeXRrZOkk/JCueJ2qRjYavPsphHs
   B5q9P7LKCCOFqO56y9MY7WeGj6zAgnSsSeAuwQUAHK1Y5ekjF2LblH7hW
   nq0REwPN7alCkY7uLuQm6iqnxmzHdNdmiN5yJFIY/3ixFFqKfvENV/3lp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440792375"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440792375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802539832"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802539832"
Received: from abedekar-mobl1.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.251.213.29])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:07 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 07/14] I2C: ali15x3: Do PCI error checks on own line
Date:   Thu, 24 Aug 2023 16:28:25 +0300
Message-Id: <20230824132832.78705-8-ilpo.jarvinen@linux.intel.com>
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
 drivers/i2c/busses/i2c-ali15x3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index cc58feacd082..6fedecef9df3 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -122,6 +122,7 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 {
 	u16 a;
 	unsigned char temp;
+	int ret;
 
 	/* Check the following things:
 		- SMB I/O address is initialized
@@ -167,12 +168,11 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	if(force_addr) {
 		dev_info(&ALI15X3_dev->dev, "forcing ISA address 0x%04X\n",
 			ali15x3_smba);
-		if (PCIBIOS_SUCCESSFUL != pci_write_config_word(ALI15X3_dev,
-								SMBBA,
-								ali15x3_smba))
+		ret = pci_write_config_word(ALI15X3_dev, SMBBA, ali15x3_smba);
+		if (ret != PCIBIOS_SUCCESSFUL)
 			goto error;
-		if (PCIBIOS_SUCCESSFUL != pci_read_config_word(ALI15X3_dev,
-								SMBBA, &a))
+		ret = pci_read_config_word(ALI15X3_dev, SMBBA, &a);
+		if (ret != PCIBIOS_SUCCESSFUL)
 			goto error;
 		if ((a & ~(ALI15X3_SMB_IOSIZE - 1)) != ali15x3_smba) {
 			/* make sure it works */
-- 
2.30.2

