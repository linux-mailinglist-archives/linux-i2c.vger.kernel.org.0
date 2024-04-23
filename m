Return-Path: <linux-i2c+bounces-3080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7348AFCB9
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Apr 2024 01:36:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24254286D0F
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 23:36:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9B0535DC;
	Tue, 23 Apr 2024 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="jCIos/7x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B223F524B1;
	Tue, 23 Apr 2024 23:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.19.144.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713915397; cv=none; b=QkoOLTqHYGxiVgdh2bGTL1TNnvxtBVfb0yAUSLFOjDz/DjYzpKoVp3gaqrTKZ6x7So0GsnrUhCVeTKJopTHcnUTGr3JIsGnl0lIrzuD11K0QSStszDMdi5T+mg2JX5bIPQOCyuLG+dQ8TKDAWS+cCoNxpnz+h2O6PTdtVL7hCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713915397; c=relaxed/simple;
	bh=PXRU+ibr6SKuP9QT0b3EPSKEz0aQPxjM2+Jkz/k9tiI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AaExoh0IrZ7E5i482rmi61CRJUmX3XxzcFy29OGk38Djd3ji+fBgy6dCUBtlWqH67EqKeHnVFI8Yd3GpoymqcCVsziPjgl3gVn4oEAGdb4k4vGkNJYpEiSWKiiyT5qZ/iG9F51reUhh1MKmn0/CmuTvOQvj+URdmrwpquLbmYK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=jCIos/7x; arc=none smtp.client-ip=192.19.144.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 40E2EC001504;
	Tue, 23 Apr 2024 16:36:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 40E2EC001504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1713915389;
	bh=PXRU+ibr6SKuP9QT0b3EPSKEz0aQPxjM2+Jkz/k9tiI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jCIos/7xOtGTYAOZx0IIQqYVf9p1N7LhoeumlxUOyoTl3PzYGiWVeS1GoEar44rA3
	 TzwwGsnloBRZ/RCfFIGCO3jH0XKwxxcFWf8dfz//IwbjUeELy+ULkcg326q8GCF21M
	 +BXSS2aAJ9OWYYUKkPAoJA0gADHoB6Nja4tGs9JY=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id 4FD1F18041CAC7;
	Tue, 23 Apr 2024 16:36:27 -0700 (PDT)
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
Subject: [PATCH 2/4] mfd: intel-lpss: Utilize i2c-designware.h
Date: Tue, 23 Apr 2024 16:36:20 -0700
Message-Id: <20240423233622.1494708-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
References: <20240423233622.1494708-1-florian.fainelli@broadcom.com>
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
index 2a9018112dfc..4d2c5250046f 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -19,6 +19,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gfp_types.h>
+#include <linux/i2c-designware.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
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


