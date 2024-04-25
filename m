Return-Path: <linux-i2c+bounces-3119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B408B17FC
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 02:27:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA8621C23714
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 00:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7675A4C7E;
	Thu, 25 Apr 2024 00:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="oNHPcBwV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562DA34;
	Thu, 25 Apr 2024 00:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714004813; cv=none; b=U8aBTUshMqGkMQ++k0IKCsVNz9AAv//qgcPb7RVga/s8lmb/MKebi3eStdOlpf96wesbeahEZRenx0EeIOhNmB4wYegmC8INmNOB3tYy7lMmFMDePgomu1OBZNsshavwtjrFNqQ/TMGKS3MmWDnbKYPBRy4D6pC7KpFMRZc0An0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714004813; c=relaxed/simple;
	bh=Gjv+z3avNl60Oy8+L5J449oxNFE+QwgWYIbUkzovjOo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rfxeMWJq/qVxaIU/gkwJ9745y3p2qKqizIQ7Ym0FODRRbx25ThH4Av98+qbWl+pUrC/vI4ZF+8yJ/qMiaXPkVXdnZId5P63J0QMRMMoGW9FWEF29s0zkimIqtq8swpbX1bhrOPuehXXVzWzmpPtruqi+5hpgxMnh7HSvRTYzVeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=oNHPcBwV; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id ED0D1C000C8F;
	Wed, 24 Apr 2024 17:26:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com ED0D1C000C8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714004805;
	bh=Gjv+z3avNl60Oy8+L5J449oxNFE+QwgWYIbUkzovjOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNHPcBwV+kFa+lTiPRT6JW1wGLCQiJWrNmwfLElceB8RILTlibeQHit6Vlmj0IUkl
	 swnXFVPWYv7RMYaVkTn8JRoA7iIfsDwcCEcpEyTDRokQX6g33M/RfL4vkX0YF51+og
	 J+Kna409akRvAwG1FNiPTHLLnJRUBG8nchqmUzq4=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id F365918041CAC7;
	Wed, 24 Apr 2024 17:26:42 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Duanqiang Wen <duanqiangwen@net-swift.com>,
	linux-i2c@vger.kernel.org (open list:SYNOPSYS DESIGNWARE I2C DRIVER),
	netdev@vger.kernel.org (open list:WANGXUN ETHERNET DRIVER)
Subject: [PATCH v2 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Date: Wed, 24 Apr 2024 17:26:40 -0700
Message-Id: <20240425002642.2053657-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
References: <20240425002642.2053657-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than open code the i2c_designware string, utilize the newly
defined constant in i2c-designware.h.

Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mfd/intel-lpss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 2a9018112dfc..551560beff7b 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -24,6 +24,7 @@
 #include <linux/ioport.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
+#include <linux/platform_data/i2c-designware.h>
 #include <linux/pm.h>
 #include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
@@ -116,7 +117,7 @@ static const struct mfd_cell intel_lpss_idma64_cell = {
 };
 
 static const struct mfd_cell intel_lpss_i2c_cell = {
-	.name = "i2c_designware",
+	.name = I2C_DESIGNWARE_NAME,
 	.num_resources = ARRAY_SIZE(intel_lpss_dev_resources),
 	.resources = intel_lpss_dev_resources,
 };
-- 
2.34.1


