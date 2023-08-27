Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CF1789F8E
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Aug 2023 15:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjH0Nh6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Aug 2023 09:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbjH0Nhr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Aug 2023 09:37:47 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57A0EB;
        Sun, 27 Aug 2023 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693143462; x=1724679462;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Hp62hkXnsdbPu6r2nygWmKt+RVTGhVdLv7Jsjvo35+0=;
  b=NC3IlOXPtjvOgR/OBY9I/KiVtbydBD23aUUa17zW8+kNMOmQY0urLv8t
   gpTsnYuPFkTNl0tZ+oOCUmAVy0wmdFNn3wLVJn5OXPS6Esa61lZHxJifE
   aTvk6ES/MTWTKJJDf+3vvAAnCTxhyLqiAAPx7OKA5pGCt+1n8q+xRyDlW
   U2ZlgX6V5DR6BoLmf1qWEV+Vy5CR53+x+p7T9n6B//8K1oWWHweBTZQc1
   H9s0gM5t3pXwAmP9UhvfZQn7B6nNAEn9ROKj5l2Ntaa4Kx7Lr8tYEeL9N
   /1qXOITJ3Jk4BrCioAJpFJsNUvjnUiKCqtpUsHQPCvgwStQnXbzG/z/Eh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="354471028"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="354471028"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 06:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1068752176"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="1068752176"
Received: from dplotkin-mobl.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.249.41.231])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 06:37:39 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 5/8] I2C: ali15x3: Do PCI error checks on own line
Date:   Sun, 27 Aug 2023 16:37:02 +0300
Message-Id: <20230827133705.12991-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230827133705.12991-1-ilpo.jarvinen@linux.intel.com>
References: <20230827133705.12991-1-ilpo.jarvinen@linux.intel.com>
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
 drivers/i2c/busses/i2c-ali15x3.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index cc58feacd082..0231c5be6354 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -165,14 +165,15 @@ static int ali15x3_setup(struct pci_dev *ALI15X3_dev)
 	}
 
 	if(force_addr) {
+		int ret;
+
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

