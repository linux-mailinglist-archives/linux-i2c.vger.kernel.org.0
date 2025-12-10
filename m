Return-Path: <linux-i2c+bounces-14486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B4CB1DA9
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 05:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B20F330C1B48
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 04:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32A430EF81;
	Wed, 10 Dec 2025 04:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3kOs61u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A15A26158C;
	Wed, 10 Dec 2025 04:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339238; cv=none; b=dz8npzQCm35xWm89L1XO+Dev0sW27ltlh+f9L2nyUAQtTfyx1gi/3mK+jDry5v/Gd3pmNWj22J8ZosYiQdzY//bUHzcD/jj44XtGc9t/m5QgdCfPoxd/WvV9hR5JbqZtkO4t3nWgJS23VfSkq8BN6BFdZ+dhNWvq0Iap6uhg42g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339238; c=relaxed/simple;
	bh=e5DcN0BDMl/cLxJ6Vo5NsEvVed2nOK3lkHdYc9fFinY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+gwOIvzg3XT5HwC1Dbwd2W9pnhiK+mMaMfmd5sWgZeLRXfykitbAXgZFWiUc1WhFWCB960GuE8uiquqcImmOlrK/1FRaL0jK7bXIIPpJYIif9l05msB7PdirYXm+oqDLEHV65YPnKn8GiRrm+LUl7eMJVQrhmH7ZL4fJGTVSDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3kOs61u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADC5C4CEF1;
	Wed, 10 Dec 2025 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765339238;
	bh=e5DcN0BDMl/cLxJ6Vo5NsEvVed2nOK3lkHdYc9fFinY=;
	h=From:To:Cc:Subject:Date:From;
	b=E3kOs61uNjh4/NXbVOiKqs8Y9orLkBlLF0yihxMb1q81xgNf7eLXIql9lwttEHnfM
	 yRKUxLz6t6g5gmBM6k/c5ObsG3gHhuVPdPcCsjEgDn2o1bv99K6wLONcRBJGHDZcc3
	 5jGji+7T0v5j7XsuZEuB+AFZuaXYC1xLHznyJnEkCwdqkr89p/aYQcBF+ySPgfJnPh
	 th42yKGRPrKBTzlMDWgXbgSSlgPHQgX+djn1htYI3XPvspGAuHtUe8Kzbo0Uv0jZA7
	 kYEEcppfaWfjvg2lSfEEQVrNrYTWmRssVxkBE1BULFhoN/IyT+9H/WIi98WVZ/DFmV
	 uv/Xs685HcIUQ==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTBPt-00000000Fdf-2SvZ;
	Wed, 10 Dec 2025 13:03:05 +0900
From: Johan Hovold <johan@kernel.org>
To: Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2] i2c: amd-mp2: clean up amd_mp2_find_device()
Date: Wed, 10 Dec 2025 13:02:58 +0900
Message-ID: <20251210040258.60106-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the driver data pointer for consistency with the rest of the
driver and drop a redundant cast.

Signed-off-by: Johan Hovold <johan@kernel.org>
---

Changes in v2
 - rebase [1] on current mainline where the reference leak has already
   been fixed and update the commit message to reflect that this is now
   only a cleanup

[1] https://lore.kernel.org/lkml/20251121113714.4080-1-johan@kernel.org/


 drivers/i2c/busses/i2c-amd-mp2-pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 60edbabc2986..5b41d18b62d3 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -456,18 +456,20 @@ module_pci_driver(amd_mp2_pci_driver);
 
 struct amd_mp2_dev *amd_mp2_find_device(void)
 {
+	struct amd_mp2_dev *privdata;
 	struct device *dev;
 	struct pci_dev *pci_dev;
-	struct amd_mp2_dev *mp2_dev;
 
 	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
 	if (!dev)
 		return NULL;
 
 	pci_dev = to_pci_dev(dev);
-	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
+	privdata = pci_get_drvdata(pci_dev);
+
 	put_device(dev);
-	return mp2_dev;
+
+	return privdata;
 }
 EXPORT_SYMBOL_GPL(amd_mp2_find_device);
 
-- 
2.52.0


