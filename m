Return-Path: <linux-i2c+bounces-9700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D408A4CCA0
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 21:27:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C112189314E
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 20:27:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D2622FF4F;
	Mon,  3 Mar 2025 20:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="De+Z1Xgf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0911A0BD0;
	Mon,  3 Mar 2025 20:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741033638; cv=none; b=e7PSB+h0VeStjEWgN4wEuiF9KMU/1EK9DUrMOwcqxWCwgowWz60Jtx/QTB/iEqYcQSk4ERS3s5xw/ZHgTqkXv2pkPJUYAvFsDyh+2NdffKGy6l4s9oL+GHUDI0D7PlooxyLzNMDCQ5o2+xmNIKVRA2CFLWeMQTl/c8GhnAQZvXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741033638; c=relaxed/simple;
	bh=KU6yFd0rnOagjj1V6nucd1EOEOOkdLXDyb8NO4f+bIo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O2Y0wZGiYNsRK6/xnd+q3iT49lgQ/x2CEhBS1IyJ4/WU5DXMBS0Q2FqRD2L+x+rC3AcHcRFg4LdpVvaQcL6/fWOHNT8Ksqh4eNWpT4NZ185uoyTxhylT5LOvjh5UhqVHyUTLSbET2xjGF1y15seu2nfP7rSsE47ihTOumx2qF3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=De+Z1Xgf; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pCNUtIET663lupCNXtetWT; Mon, 03 Mar 2025 21:27:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741033628;
	bh=0Eilo0ki6IJvjtJkMgxjZuILWpKyJbLQSwj0m7e3Dy4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=De+Z1Xgf6nsiZolJYcOOMGwUiwWtQ2ZP4VB+XWD18zvPTHig7+bIVzPuaup7NIF5r
	 5uXxc3i18qgcPZuFkV8Ia5s1Fa5Q7z+zFdOGZXXQ2gQCt2xqWv3/5NPQ2hPcj2Pepj
	 EEcUzR583gB2jW5ShgPn98xkkGqpNtPAyy9FuMkm/X8JXXg74+/qealcKQ/jIj8RQf
	 afXqp7SNNKqQYKHra9qrSNo3ncNaS3imCwvuatrdkZCTVgGawLauN+VngahleLPew/
	 WzkndiZTlFRnE1O1Yz6Z7gtTHoZWMyjgolVXhmSEPHPOkc2zpP85XzVz6eR2TPbR2a
	 WztpuXGWuQxww==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Mar 2025 21:27:08 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: sis630: Fix an error handling path in sis630_probe()
Date: Mon,  3 Mar 2025 21:26:54 +0100
Message-ID: <3d607601f2c38e896b10207963c6ab499ca5c307.1741033587.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If i2c_add_adapter() fails, the request_region() call in sis630_setup()
must be undone by a corresponding release_region() call, as done in the
remove function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-sis630.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index 3505cf29cedd..a19c3d251804 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -509,6 +509,8 @@ MODULE_DEVICE_TABLE(pci, sis630_ids);
 
 static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
+	int ret;
+
 	if (sis630_setup(dev)) {
 		dev_err(&dev->dev,
 			"SIS630 compatible bus not detected, "
@@ -522,7 +524,15 @@ static int sis630_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	snprintf(sis630_adapter.name, sizeof(sis630_adapter.name),
 		 "SMBus SIS630 adapter at %04x", smbus_base + SMB_STS);
 
-	return i2c_add_adapter(&sis630_adapter);
+	ret = i2c_add_adapter(&sis630_adapter);
+	if (ret)
+		goto release_region;
+
+	return 0;
+
+release_region:
+	release_region(smbus_base + SMB_STS, SIS630_SMB_IOREGION);
+	return ret;
 }
 
 static void sis630_remove(struct pci_dev *dev)
-- 
2.48.1


