Return-Path: <linux-i2c+bounces-9697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DCEA4C339
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 15:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C87463ADD06
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 14:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75B4212B14;
	Mon,  3 Mar 2025 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="r1TdMit6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4342116F0;
	Mon,  3 Mar 2025 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741011461; cv=none; b=fY2Kx39CvKOfciw5zpw5Ke1uteF3B+5bevctlg7iLfItzrcNokEVjA0Lx57qO30+l8u7DaRlP9Ig/TrYrqRyYk1dQjRKu6I7mhYHACqR9M/fHyVBx0ZT7PbGAyjCS5+KWWkNpgvW+PFAWtnP23QljmogrKuZ/du3AxMY6NhvBq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741011461; c=relaxed/simple;
	bh=WbmEJYpG+ez+XRUdtekHHlARVzaRz80/lQZKN6iRpDU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=awyYfmXt79GdQi9cRi9m6Xc1K6nNfkjO8IzEprX+munQOIV0iq/1G3Uq/MBa7E/XrnYEnCX/tEoOtoxpYThvXmryLEew2WLY9eQUN3BFDZiQGN6+Cn2HO7Xlz1p+2kVf3zhvuRMYGHyxCCeIoK8SFfC1ArF3lxy/ONfkasmDXGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=r1TdMit6; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Received: from ldvnode.intra.ispras.ru (unknown [10.10.2.153])
	by mail.ispras.ru (Postfix) with ESMTPSA id 49CE440CE18C;
	Mon,  3 Mar 2025 14:08:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 49CE440CE18C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1741010894;
	bh=e/tq6LrrxRI4HjyCL7aW8miot1l+ge0sIlibb8wrupQ=;
	h=From:To:Cc:Subject:Date:From;
	b=r1TdMit6+TLG+eMiHJdSUCRE9P5rh75vEJEB8mlvrOQ0laRWMK21/JLXn89Z1TrLJ
	 6hAA3RMAccZG5qqIODMYZLerMuQGIrPPe3l29Nohtu0XG4IwCZeg35PSQkWjyCVOhR
	 2glkB4lmMg/jG1Vf3lpPws5T5U6vn4Wv4KG/PViU=
From: Vitalii Mordan <mordan@ispras.ru>
To: Michal Simek <michal.simek@amd.com>
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Harini Katakam <harinik@xilinx.com>,
	Wolfram Sang <wsa@kernel.org>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	Vadim Mutilin <mutilin@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: [PATCH] i2c: cadence: fix call balance of id->clk handling routines
Date: Mon,  3 Mar 2025 17:08:05 +0300
Message-Id: <20250303140805.644143-1-mordan@ispras.ru>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the clock id->clk was not enabled in cdns_i2c_probe(), it should not be
disabled in any execution path. If the clock was not enabled, the probe
function should return an error code.

Use the devm_clk_get_enabled() helper function to ensure proper call
balance for id->clk.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Fixes: df8eb5691c48 ("i2c: Add driver for Cadence I2C controller")
Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
---
 drivers/i2c/busses/i2c-cadence.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b64026fbca66..07564a962dcb 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1541,7 +1541,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	snprintf(id->adap.name, sizeof(id->adap.name),
 		 "Cadence I2C at %08lx", (unsigned long)r_mem->start);
 
-	id->clk = devm_clk_get(&pdev->dev, NULL);
+	id->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(id->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->clk),
 				     "input clock not found.\n");
@@ -1551,10 +1551,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(id->reset),
 				     "Failed to request reset.\n");
 
-	ret = clk_prepare_enable(id->clk);
-	if (ret)
-		dev_err(&pdev->dev, "Unable to enable clock.\n");
-
 	ret = reset_control_deassert(id->reset);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret,
@@ -1617,7 +1613,6 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
 err_clk_dis:
-	clk_disable_unprepare(id->clk);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	return ret;
@@ -1642,7 +1637,6 @@ static void cdns_i2c_remove(struct platform_device *pdev)
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
-	clk_disable_unprepare(id->clk);
 }
 
 static struct platform_driver cdns_i2c_drv = {
-- 
2.25.1


