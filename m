Return-Path: <linux-i2c+bounces-3176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D04D8B2B2A
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 23:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 773DBB22165
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Apr 2024 21:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E1E15622F;
	Thu, 25 Apr 2024 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hxQAc0yZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1D15572F;
	Thu, 25 Apr 2024 21:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714081485; cv=none; b=GkKu4Zs50t3S+dI7zrv0onn4LkXmn+OQTqEe1C/725YTPKfFgkdbjjmD+IUU+xpG+sbUyZRWa5gcb2ppiBdyHe8WaxMXPpsDJcBX4uGa+IX34ISM3mItfu6uuuHmd+cZe2gHJEw+NSkc/OB3bjUESUnk0GlpaWO+XCmgdvKDVB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714081485; c=relaxed/simple;
	bh=bgYCW8aseELL+zqdy/zQWvlFQOP8m9UJ/7Tg6+4zcqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DqRNim8pguTsgqU9JYiiXYKcnvTMkP+GJ7kJH+PKAn1N44Y/XWyRdRqY2AT1k5esuNYbgz6TM2Qe/TvbJCFC9uYoEAICYqMJL5KUSK59X2jtpswf9WB/bd2wpw7rPTAhIJi1R2V4qq5BasS8w884JKWICP9Dq2QKfrM5FKYzi8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hxQAc0yZ; arc=none smtp.client-ip=192.19.144.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 8FA67C0000EC;
	Thu, 25 Apr 2024 14:44:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 8FA67C0000EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1714081482;
	bh=bgYCW8aseELL+zqdy/zQWvlFQOP8m9UJ/7Tg6+4zcqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hxQAc0yZeCMheMQRZnITAggRvpAonTQWOkFLuNyfM4XJv2lq+R4xETd8r94P1oTrB
	 WBKditV9aw9/iiZG6pb3CFDiSpDc9o+q8MoI8HWg+mawAIUN2i0QU7BsSNaHGCyNAW
	 KXTJOpq8Xj0bVt4sbnzlkErZTCl/Ef+VIB1snX2c=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 906BA18041CAC4;
	Thu, 25 Apr 2024 14:44:40 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
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
Subject: [PATCH v3 3/5] mfd: intel-lpss: Utilize i2c-designware.h
Date: Thu, 25 Apr 2024 14:44:36 -0700
Message-Id: <20240425214438.2100534-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
References: <20240425214438.2100534-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than open code the i2c_designware string, utilize the newly
defined constant in i2c-designware.h.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/mfd/intel-lpss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 2a9018112dfc..1327a6a07d1f 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -33,6 +33,7 @@
 #include <linux/io-64-nonatomic-lo-hi.h>
 
 #include <linux/dma/idma64.h>
+#include <linux/platform_data/i2c-designware.h>
 
 #include "intel-lpss.h"
 
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


