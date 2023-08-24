Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DC478709A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Aug 2023 15:42:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241421AbjHXNmQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Aug 2023 09:42:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241450AbjHXNl5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 24 Aug 2023 09:41:57 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A47F1BCF;
        Thu, 24 Aug 2023 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692884496; x=1724420496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UpEU2EkhdpSdjBtJ41JspvW8FQmMIwHorqHBLaDjTHo=;
  b=Mbe7VC3rhsRF5vV0DdPBPkkxpvRWAbphOuIG5Mkri6tuBVBhKSfDRWOV
   xFhL6LyNDhAN0p519mcwypU1ULyZQRM42m2wLL4V+G3tVMNnYLA70aYEY
   uXzaHRCVddOhDPMUXoreyHzKBW3D8tuCZfRoQC1nDs65xrvhETqEVO9mM
   OGv9q1p0FmTyfcLjYAikgXAaKUkJlidFY/qljYpnlZvJbIlV0qrcB099b
   A4aUuTMf2WyZl5E3Dp8uIvjdhk75tqLyDH4pSVC5R+VQNuYe5RceBNTjX
   0fvtBukWq01UlGn/8Tc0PeBLU5mTy5mqy+kp/Gt7mJJ32IZfmscUboMl9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="440792408"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="440792408"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="802539866"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="802539866"
Received: from abedekar-mobl1.ger.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.251.213.29])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 06:29:10 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 08/14] I2C: nforce2: Do PCI error check on own line
Date:   Thu, 24 Aug 2023 16:28:26 +0300
Message-Id: <20230824132832.78705-9-ilpo.jarvinen@linux.intel.com>
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

Instead of a if condition with a line split, use the usual error
handling pattern with a separate variable to improve readability.

No functional changes intended.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/i2c/busses/i2c-nforce2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nforce2.c b/drivers/i2c/busses/i2c-nforce2.c
index 777278386f58..38d203d93eee 100644
--- a/drivers/i2c/busses/i2c-nforce2.c
+++ b/drivers/i2c/busses/i2c-nforce2.c
@@ -327,8 +327,8 @@ static int nforce2_probe_smb(struct pci_dev *dev, int bar, int alt_reg,
 		/* Older incarnations of the device used non-standard BARs */
 		u16 iobase;
 
-		if (pci_read_config_word(dev, alt_reg, &iobase)
-		    != PCIBIOS_SUCCESSFUL) {
+		error = pci_read_config_word(dev, alt_reg, &iobase);
+		if (error != PCIBIOS_SUCCESSFUL) {
 			dev_err(&dev->dev, "Error reading PCI config for %s\n",
 				name);
 			return -EIO;
-- 
2.30.2

