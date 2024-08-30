Return-Path: <linux-i2c+bounces-5961-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C69D966058
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 13:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AEA491C2183A
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 11:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FBD19882E;
	Fri, 30 Aug 2024 11:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwewwOHG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728781AD419
	for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2024 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725016348; cv=none; b=kiDUSsT+XS0xNV/wcxL8Az8c4I5yeimQcq2C0DmKB85itV/L32/1iVMGxj4iRp2IqkKY54N5F2yAI11eckiK1MnbItUcJJ5gqm+e//b9jc2Nxc0xzIJoz0zhps043919tU5bpGRA+u0A3tZXVy4g0kMKTmHCBgrpFDFJxlF9TQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725016348; c=relaxed/simple;
	bh=YV1TgjQTB4AD4Udab6oFm6CG380ExJ5jA/KsRWBOZfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gijPXLyDUMwWLwJpNegVvDMMdpdIDivPRypyW6XiiKn/FtV0TTG8Ig8q5b8lyRCvQIwsNxQW8KQDEAoSjn5xnhPAMyCi1si7ps4eNHkjHnvkaEFSoZCa87U9H73wwgGnXYusnruF3HpXAMPqYc9JgPHvpj5ED7EJOOHUB43dUvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwewwOHG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725016346; x=1756552346;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YV1TgjQTB4AD4Udab6oFm6CG380ExJ5jA/KsRWBOZfM=;
  b=TwewwOHGPyaLBVsW0WQbQ8YiQUqTSqVVt8u9S/85MN+d54OY3yrXNmHE
   bFIU5Qd+CCaCkFWSbT57kLjSuFgsW/gXXvONR4xrpfhQYmGKPOanw3NPo
   YDtifXXF894AN2Twj3gkySfFDIzL2jW0qsAAKridKD+4iiVT4bm/oHBan
   BZzNkcztRJN53o7mkALI4o6MbYA9ElAjQZzkXgb/rBqHxPnFwIb/Y99Un
   aJK7G80/ucZPcei9Q3DFXzPnC3mp2FzexHaFwWa2jquYRSRM3NybJIrZo
   Nad+CUeMpYxJAQHMlR1b3P0Sr5nKAd+tSOQbpdCog/bdz/TTiL0Mbga5u
   A==;
X-CSE-ConnectionGUID: mtpMip0sQ02GSI2rAPFp0g==
X-CSE-MsgGUID: 5JM25XHGSMGv3uGI5ktj+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="41152886"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="41152886"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 04:12:26 -0700
X-CSE-ConnectionGUID: lAh6KPArTmOpliDt4a5t4A==
X-CSE-MsgGUID: 6pUXEhMHTmq0sd6662Hmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64219376"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 30 Aug 2024 04:12:24 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: designware: Group all DesignWare drivers under a single option
Date: Fri, 30 Aug 2024 14:12:22 +0300
Message-ID: <20240830111222.2131172-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are quite a few drivers and options for the DesignWare
I2C adapter in the menuconfig. Grouping all of them under the
I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
easier to understand.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/Kconfig | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..027724358d28 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -559,28 +559,33 @@ config I2C_DAVINCI
 	  For details please see http://www.ti.com/davinci
 
 config I2C_DESIGNWARE_CORE
-	tristate
+	tristate "Synopsys DesignWare I2C adapter"
 	select REGMAP
+	help
+	  This option enables support for the Synopsys DesignWare I2C adapter.
+	  This driver includes support for the I2C host on the Synopsys
+	  Designware I2C adapter.
+
+	  To compile the driver as a module, choose M here: the module will be
+	  called i2c-designware-core.
+
+if I2C_DESIGNWARE_CORE
 
 config I2C_DESIGNWARE_SLAVE
 	bool "Synopsys DesignWare Slave"
-	depends on I2C_DESIGNWARE_CORE
 	select I2C_SLAVE
 	help
 	  If you say yes to this option, support will be included for the
 	  Synopsys DesignWare I2C slave adapter.
 
-	  This is not a standalone module, this module compiles together with
-	  i2c-designware-core.
-
 config I2C_DESIGNWARE_PLATFORM
-	tristate "Synopsys DesignWare Platform"
+	tristate "Synopsys DesignWare Platform driver"
 	depends on (ACPI && COMMON_CLK) || !ACPI
-	select I2C_DESIGNWARE_CORE
 	select MFD_SYSCON if MIPS_BAIKAL_T1
+	default I2C_DESIGNWARE_CORE
 	help
 	  If you say yes to this option, support will be included for the
-	  Synopsys DesignWare I2C adapter.
+	  Synopsys DesignWare I2C adapters on the platform bus.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-platform.
@@ -613,17 +618,19 @@ config I2C_DESIGNWARE_BAYTRAIL
 	  a BayTrail system using the AXP288.
 
 config I2C_DESIGNWARE_PCI
-	tristate "Synopsys DesignWare PCI"
+	tristate "Synopsys DesignWare PCI driver"
 	depends on PCI
-	select I2C_DESIGNWARE_CORE
 	select I2C_CCGX_UCSI
 	help
 	  If you say yes to this option, support will be included for the
-	  Synopsys DesignWare I2C adapter. Only master mode is supported.
+	  Synopsys DesignWare I2C adapters on the PCI bus. Only master mode is
+	  supported.
 
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-designware-pci.
 
+endif
+
 config I2C_DIGICOLOR
 	tristate "Conexant Digicolor I2C driver"
 	depends on ARCH_DIGICOLOR || COMPILE_TEST
-- 
2.45.2


