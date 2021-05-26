Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 167FB3917A5
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 14:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234691AbhEZMpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 May 2021 08:45:16 -0400
Received: from mga09.intel.com ([134.134.136.24]:35379 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234729AbhEZMoy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 May 2021 08:44:54 -0400
IronPort-SDR: 7SNAp/d/nkUtNy+9vbWRKLq96AOnme3lPrB6me9KeKgPl++fohvU0Dc53I+j+KPnkjV16wnYCa
 3mvTLcSNuUiw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="202465789"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="202465789"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2021 05:43:11 -0700
IronPort-SDR: US5eylIamLHu1xhHFH1BUCVEeg3n3s7XnfpZPb1txTaFuAuaAmWN3z6P/0T0fvBFBVk2KpKAut
 iQTgivWSMM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; 
   d="scan'208";a="476924265"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2021 05:43:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 485CAD7; Wed, 26 May 2021 15:43:30 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v1 2/6] staging: atomisp: Replace open-coded i2c_acpi_find_client_by_adev()
Date:   Wed, 26 May 2021 15:43:18 +0300
Message-Id: <20210526124322.48915-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
References: <20210526124322.48915-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

gmin_i2c_dev_exists() is using open-coded variant of
i2c_acpi_find_client_by_adev(). Replace it with a corresponding call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../staging/media/atomisp/pci/atomisp_gmin_platform.c    | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 135994d44802..a1064d1a3d6b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -378,19 +378,14 @@ static struct i2c_client *gmin_i2c_dev_exists(struct device *dev, char *name,
 					      struct i2c_client **client)
 {
 	struct acpi_device *adev;
-	struct device *d;
 
 	adev = acpi_dev_get_first_match_dev(name, NULL, -1);
 	if (!adev)
 		return NULL;
 
-	d = bus_find_device_by_acpi_dev(&i2c_bus_type, adev);
-	acpi_dev_put(adev);
-	if (!d)
-		return NULL;
+	*client = i2c_acpi_find_client_by_adev(adev);
 
-	*client = i2c_verify_client(d);
-	put_device(d);
+	acpi_dev_put(adev);
 
 	dev_dbg(dev, "found '%s' at address 0x%02x, adapter %d\n",
 		(*client)->name, (*client)->addr, (*client)->adapter->nr);
-- 
2.30.2

