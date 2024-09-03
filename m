Return-Path: <linux-i2c+bounces-6034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD296A06D
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72D51F26426
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4920E187571;
	Tue,  3 Sep 2024 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mW2a3S4J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3083618734F;
	Tue,  3 Sep 2024 14:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373536; cv=none; b=dtlGD+IxiXCyBi3xKY2/bgyN21f+9+cnoAU+pT4TDSDpy7Jb+mfHTbK9lYfP7HhP50Ec+kJjl7W2Nwd9aYqgZFTUmqY1TKlxDiK+5zfOiyxuRrKD2zd4rtnSsYHa9qq0gYgU1F3BVc6CxZl9d36HrdOZ0AAXR/lOckzRDuZTYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373536; c=relaxed/simple;
	bh=KG72mTIMDmwKrMVTpaSWmAQDsmU/2k7lYdXrKMY1wm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFYRaRS2Op+bJFBdf/3yQ7D1e9DdTPqbKEL5TiC9JNR4pyRaT8jFQz6UZPVAPBBCX4cTAi7m/VGc7XrfV+T13eAX7f7fHAIHDJ6gEfSURu+py93fpVXVN3bNJn58+rcBdTyV3atWG4N8jFxdQgGq1Xv67l1DIcCowSjBi3GChlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mW2a3S4J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725373534; x=1756909534;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KG72mTIMDmwKrMVTpaSWmAQDsmU/2k7lYdXrKMY1wm0=;
  b=mW2a3S4J7XHD4qprk10d6lVRjQM+dsCb1IZHphObJUv8kEDcMhbdNKNh
   FipO7gsjptnAhnXLjHK1FSsG/TyUjazEf02GwJJYQbnZKaJmpVzNPawMo
   ajqvxZdmPdJJEZvnzxcZHHhBcBoZsCRnTp4PyFtnPDUH/5NKsNXN6yQmg
   XEvn3jK0BFyeRh9RYVPTYPSBKmEvaygQ2sTFiCweGNhd8/P9Dx9TP52IC
   1N24SzLfAk/PmhevZiHK2mkasgnXHXgVJSw2iVUI2wv1mUJCpI46k5n5H
   D6Rjn4k2eBHGhCxtzG/rwx4oRAHhm758ct/h0XOIP1bdciXU3TIoYHRF1
   A==;
X-CSE-ConnectionGUID: qd9bJBDvRi+kSNrJvej5jg==
X-CSE-MsgGUID: Gv7qjKLNQWqqSQ6ntSh0NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="23541377"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="23541377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 07:25:34 -0700
X-CSE-ConnectionGUID: onglsi2NTkeRhPKGwfNH5A==
X-CSE-MsgGUID: dudb/VWgR3CPWwla7T6YDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65658882"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 03 Sep 2024 07:25:30 -0700
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 6/7] net: txgbe: Fix I2C Kconfig dependencies
Date: Tue,  3 Sep 2024 17:25:05 +0300
Message-ID: <20240903142506.3444628-7-heikki.krogerus@linux.intel.com>
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
drivers for the platform and PCI buses depend on
I2C_DESIGNWARE_CORE. Right now this driver prevents that
update because it selects I2C_DESIGNWARE_PLATFORM.

To make the dependency on I2C_DESIGNWARE_PLATFORM consistent
with the other drivers in kernel that depend on it, and
allow the dependency handling of the Synopsys DesignWare I2C
drivers to be updated, change the "select" into "depends on".

Cc: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/net/ethernet/wangxun/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/wangxun/Kconfig b/drivers/net/ethernet/wangxun/Kconfig
index 85cdbdd44fec..e46ccebcfd22 100644
--- a/drivers/net/ethernet/wangxun/Kconfig
+++ b/drivers/net/ethernet/wangxun/Kconfig
@@ -41,10 +41,9 @@ config TXGBE
 	tristate "Wangxun(R) 10GbE PCI Express adapters support"
 	depends on PCI
 	depends on COMMON_CLK
+	depends on I2C_DESIGNWARE_PLATFORM
 	select MARVELL_10G_PHY
 	select REGMAP
-	select I2C
-	select I2C_DESIGNWARE_PLATFORM
 	select PHYLINK
 	select HWMON if TXGBE=y
 	select SFP
-- 
2.45.2


