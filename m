Return-Path: <linux-i2c+bounces-6035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D058996A070
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 011B71C2347A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586BF188581;
	Tue,  3 Sep 2024 14:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM4TXl4r"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25DE18784F;
	Tue,  3 Sep 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373538; cv=none; b=CrRdTpM+lg5Q+9y+9McQh4MNI9DReS+wpMgaKZFdhSGrFKYYy2LBna2gcTb0BrZ97d3Eu5TusntE54STjXdm7Ahf5FmYe25tsr9o6oGOfKIMhh6UM/Z5OD1bP+9uNa3/Kt1qvXu4Ml9fezjuHlwlZTTF4U8tYzyC4I0H1t8OJuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373538; c=relaxed/simple;
	bh=vlXcYHXcM7ekhzgNyjdKdwkzgO633TVanFbWzjVtOhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzSO7D5dwy/dfXjRyBEgL/UFkW7WUcLWyTR5lwiDNg9kGFal77mob80qPjz4hrViAe1H5+3bH3UETAPYTtOrs93x4XrRJnRGtX15rWgvyTxS9QJDY5MzwyT/9B8CB8d1ollxwszzxxwur8zJLZKfbGQ1zQuypMIo9x68IHYJkfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM4TXl4r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373536; x=1756909536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vlXcYHXcM7ekhzgNyjdKdwkzgO633TVanFbWzjVtOhw=;
  b=BM4TXl4rdgp0wPKV6nM74yYDJbnk/IS/T6F7DIOrcOgPD3BkmCbvXJpo
   QWmZPj8DZiL7Rh5F2LmGzQPGRKwSzBGAoW1Z5Y0FKCeT7RkLcyM581E42
   Dy9BZeIfQDk90yd0krzB15GCX05hCCaCehC7aAMJz9/+3GMwClZ0UyYc0
   i2UGIsxIDpQfuSAFnNW9Pgkt41fCMWeq8edt3H7jCi2Tec+5eSeIUMxVp
   m724c+4spS29EN+gGd7BIYVGSakjQWNFNWRdqpNJNXfd2dZL3bjOC6O2+
   uD7XqDS7pb2nXwwK1fka6QTrtnqCjxv77vHa+tTbT1Q03bXPy9YLRm+0n
   Q==;
X-CSE-ConnectionGUID: pdalVBetQ6uswIP022wieQ==
X-CSE-MsgGUID: q1ouB/RqSwSM/cSIL4HBzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541400"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541400"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:36 -0700
X-CSE-ConnectionGUID: lbTkBKsKQNiNx/BlJ1Hu6w==
X-CSE-MsgGUID: wze16VBBSiKfr0AenaW9AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658902"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:34 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers under a single option
Date: Tue,  3 Sep 2024 17:25:06 +0300
Message-ID: <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are quite a few drivers and options for the DesignWare
I2C adapter in the Kconfig. Grouping all of them under the
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


