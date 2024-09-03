Return-Path: <linux-i2c+bounces-6032-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C6E96A065
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7D462862CB
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E384D181B88;
	Tue,  3 Sep 2024 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gm3mN6KE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C4815CD49;
	Tue,  3 Sep 2024 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373528; cv=none; b=Dt4O6Ksw/IbLlhIVxgg/SLu+5X47JndW6SVDwCuegPFQF91UKfpWUZAzxqGYDlXjKqZ0ChyJ1oFSDuEwjyfXCaH3m7xJW4HtU0TbGIOh+ZhUFmzCZ3CLwOMXZ901BbEQKuB/eJzcVBM7DTHPZiEQYIuhLDMVpqu6RkmWvKq5j60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373528; c=relaxed/simple;
	bh=LCqHLIufQVnQxElRmCIl8tdY8vuEFHA7k1V2lzEs8pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PB0hugc2gb20PF97BFq/LUWllsM+Rkb4jAni0wc9mgRSslHABhtTTLyn6hs8s1jQpaOF7F5eZITPR8Mxwa+wak14na4ceFeh3PIVl3bSEvlGpOVGUPIIVjqVd36yjGHJhy16npL7u3yLvwMhvAphDdE30EFt6iPJzFH7PgiKm6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gm3mN6KE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373527; x=1756909527;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LCqHLIufQVnQxElRmCIl8tdY8vuEFHA7k1V2lzEs8pM=;
  b=gm3mN6KEhkdGtSBRDFHUwCU8oRUPNFY//Fh5cqlTH/eHyKtoVzObOpfz
   XtAuqg3zV1KBBaXjG91fraYy7PqTs9MFe6mJe799DV8mfxOpgCy/QTRGJ
   Uln/qJaCkgjZLrVMnXVVksBPE/h2WYgORmShCP+H5lHHSmzeC7R/eUzmJ
   ktmxBjr1jYiqvGUsstzq2JHjitoFpWmYddFcKsCfN0cX3WdMMNfT83TI6
   y4COorthe9wtYf9ft840TbqoLncXue5ck9yFfl40KpFN/Z8iOEYW5Oppp
   ai229Bpd2Vapu+N0YOgjChXOoDRH3fgdY4ELYFT7dZAvne2E9TZ4MPDgi
   g==;
X-CSE-ConnectionGUID: iiuARooYT1OcPSEk/rm4FA==
X-CSE-MsgGUID: 9ZhJ+ZloQp+ktrgS9YOszA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541334"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541334"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:26 -0700
X-CSE-ConnectionGUID: h1pA1EUAQceBlfxK4qk2zA==
X-CSE-MsgGUID: K2IiswiNTzuHfN6VPSOa9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658857"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:23 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	UNGLinuxDriver@microchip.com,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org
Subject: [PATCH v2 4/7] mips: configs: enable I2C_DESIGNWARE_CORE with I2C_DESIGNWARE_PLATFORM
Date: Tue,  3 Sep 2024 17:25:03 +0300
Message-ID: <20240903142506.3444628-5-heikki.krogerus@linux.intel.com>
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

The dependency handling of the Synopsys DesignWare I2C
adapter drivers is going to be changed so that the glue
drivers for the PCI and platform buses depend on
I2C_DESIGNWARE_CORE.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: UNGLinuxDriver@microchip.com
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 arch/mips/configs/generic/board-ocelot.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/configs/generic/board-ocelot.config b/arch/mips/configs/generic/board-ocelot.config
index 8cfbafa532e0..a5b5b5102472 100644
--- a/arch/mips/configs/generic/board-ocelot.config
+++ b/arch/mips/configs/generic/board-ocelot.config
@@ -31,6 +31,7 @@ CONFIG_MICROSEMI_PHY=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
+CONFIG_I2C_DESIGNWARE_CORE=y
 CONFIG_I2C_DESIGNWARE_PLATFORM=y
 
 CONFIG_SPI=y
-- 
2.45.2


