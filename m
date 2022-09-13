Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28A515B7859
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Sep 2022 19:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbiIMRk6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Sep 2022 13:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiIMRjt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Sep 2022 13:39:49 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6667B7D1C0;
        Tue, 13 Sep 2022 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663086777; x=1694622777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k11LCc77TrkmYe+60oQhVeO6H7+ymxQKl+achfaYq9M=;
  b=Qy2qfX95XoSvSDptAj6nZS02cVKogvI6tHxUHYBmJKf1T2oe3arXGJ5g
   LYwLQ523M8qvZuNztuWzWRdq0RCkP1ky8WEH1RIrbOKCkUhx7XZDufVdU
   bhYPZk7FZgImD4eUsMNywjDKvPOU17esjPOxYuJOCrOY0IS3REbRnvT9d
   WyOclyqH8FwA1TD1TvFNJUVHcsIBbejIwcH6WExc8q64VCcHDnFzZii3U
   qgHsefyEpZCEQjSdm5NiWx/gRrdAuWgxcWkzaAeJinMapXX7XXKK/DFCy
   mYKWOQ/lLRvGhvkoIGa4Rw8LuFDLuvqarntmLhwyE+ZwFBE126AU7iF1T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="324433037"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="324433037"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2022 09:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; 
   d="scan'208";a="594008320"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2022 09:31:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8A2235E4; Tue, 13 Sep 2022 19:31:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mark Brown <broonie@kernel.org>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
        devel@acpica.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Elie Morisse <syniurge@gmail.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Robert Moore <robert.moore@intel.com>
Subject: [PATCH v3 7/8] spi: pxa2xx: Refactor _UID handling to use acpi_dev_uid_to_integer()
Date:   Tue, 13 Sep 2022 19:31:46 +0300
Message-Id: <20220913163147.24258-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220913163147.24258-1-andriy.shevchenko@linux.intel.com>
References: <20220913163147.24258-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ACPI utils provide acpi_dev_uid_to_integer() helper to extract _UID as
an integer. Use it instead of custom approach.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi-pxa2xx.c | 37 ++++++++++---------------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index 986ffc4bf1ed..2bf21c2e7a52 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1441,31 +1441,6 @@ static const struct of_device_id pxa2xx_spi_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, pxa2xx_spi_of_match);
 
-#ifdef CONFIG_ACPI
-
-static int pxa2xx_spi_get_port_id(struct device *dev)
-{
-	struct acpi_device *adev;
-	unsigned int devid;
-	int port_id = -1;
-
-	adev = ACPI_COMPANION(dev);
-	if (adev && adev->pnp.unique_id &&
-	    !kstrtouint(adev->pnp.unique_id, 0, &devid))
-		port_id = devid;
-	return port_id;
-}
-
-#else /* !CONFIG_ACPI */
-
-static int pxa2xx_spi_get_port_id(struct device *dev)
-{
-	return -1;
-}
-
-#endif /* CONFIG_ACPI */
-
-
 #ifdef CONFIG_PCI
 
 static bool pxa2xx_spi_idma_filter(struct dma_chan *chan, void *param)
@@ -1479,13 +1454,16 @@ static struct pxa2xx_spi_controller *
 pxa2xx_spi_init_pdata(struct platform_device *pdev)
 {
 	struct pxa2xx_spi_controller *pdata;
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
 	struct ssp_device *ssp;
 	struct resource *res;
-	struct device *parent = pdev->dev.parent;
 	struct pci_dev *pcidev = dev_is_pci(parent) ? to_pci_dev(parent) : NULL;
 	const struct pci_device_id *pcidev_id = NULL;
 	enum pxa_ssp_type type;
 	const void *match;
+	int status;
+	u64 uid;
 
 	if (pcidev)
 		pcidev_id = pci_match_id(pxa2xx_spi_pci_compound_match, pcidev);
@@ -1529,7 +1507,12 @@ pxa2xx_spi_init_pdata(struct platform_device *pdev)
 
 	ssp->type = type;
 	ssp->dev = &pdev->dev;
-	ssp->port_id = pxa2xx_spi_get_port_id(&pdev->dev);
+
+	status = acpi_dev_uid_to_integer(ACPI_COMPANION(dev), &uid);
+	if (status)
+		ssp->port_id = -1;
+	else
+		ssp->port_id = uid;
 
 	pdata->is_slave = device_property_read_bool(&pdev->dev, "spi-slave");
 	pdata->num_chipselect = 1;
-- 
2.35.1

