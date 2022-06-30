Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE1156251F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 23:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237574AbiF3V2j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 17:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237560AbiF3V2a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 17:28:30 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D3A5073B;
        Thu, 30 Jun 2022 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656624509; x=1688160509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=N5lyFqnVhHtCOFomEyKwnEiEJIcX2aeyjWniqc32Y2A=;
  b=a6gUA8IS3yo6z+b3z2uNx/V/2hCNR4sSB+KWs5Wlg7I3DHT/15tIA38g
   Zd88VmNDqt3T1mfOzXQDRDHe9Y4vWwsuVK9enO05zcmf4qXY8pll5Bwxo
   Wa9U1/XMcrk5ObtpJu5pXRKlvlQMkudmlpMeY2w40d2FoM+PXwJa7xdgX
   wQZBHKO3jtYaWtmrig83P0MufahQlZYTeZbyihNEJKGWEn+kQHiTTif3K
   R4QN6uqDSPdw7a5OdMDwjby7u7r77S7B5N6Ru73Gk5h07DeF+RcABS/Gl
   y1ChCWqK4B4n64cxCFuVwS6Ub4oKQdQfVVAj2UP12hnB4bRcHYt9n1dYQ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="271246007"
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="271246007"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 14:28:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,235,1650956400"; 
   d="scan'208";a="681143807"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2022 14:28:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1674F67; Fri,  1 Jul 2022 00:28:31 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v1 2/5] ACPI: video: Convert to use acpi_match_video_device_handle() helper
Date:   Fri,  1 Jul 2022 00:28:16 +0300
Message-Id: <20220630212819.42958-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
References: <20220630212819.42958-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Replace open coded variant of acpi_match_video_device_handle() helper.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/video_detect.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index becc198e4c22..14ddbd821a46 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -59,16 +59,10 @@ static void acpi_video_parse_cmdline(void)
 static acpi_status
 find_video(acpi_handle handle, u32 lvl, void *context, void **rv)
 {
-	struct acpi_device *acpi_dev = acpi_fetch_acpi_dev(handle);
 	long *cap = context;
 	struct pci_dev *dev;
 
-	static const struct acpi_device_id video_ids[] = {
-		{ACPI_VIDEO_HID, 0},
-		{"", 0},
-	};
-
-	if (acpi_dev && !acpi_match_device_ids(acpi_dev, video_ids)) {
+	if (acpi_match_video_device_handle(handle)) {
 		dev = acpi_get_pci_dev(handle);
 		if (!dev)
 			return AE_OK;
-- 
2.35.1

