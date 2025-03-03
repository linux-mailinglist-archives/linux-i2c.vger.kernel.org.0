Return-Path: <linux-i2c+bounces-9698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C2BA4CC48
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 20:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC421748D2
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 19:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1F23535D;
	Mon,  3 Mar 2025 19:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="Qb37ZCW9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-79.smtpout.orange.fr [80.12.242.79])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41782343B6;
	Mon,  3 Mar 2025 19:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031616; cv=none; b=o+ajZKSGIYXGdiXsE+Ahim0E1TTThxSRUZvCAD1/pztSOcnopYJUErUq6jNhwB1FrDIY+fNsS6sS7xtO1QsgmxqKopeetliMWfjWZXfupTZvLJlQC+G/axqoogJ8y0kdSgA9h5+oIqf1LVQSli7b69cdjZqmxkzwI1hNyF36lac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031616; c=relaxed/simple;
	bh=2HuMSLYq2DSrqf0mofrBUOq/cFz+FqUp9Q+U1qYZAe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oNIbBTivOdgHpsmw0r22zroly8qNJI0QoA+qmlOxuGkrt/Fho8UAd5SduSbFGoTi0A08Yg1LzvfewmGZRO8jUs6BwOiVPp34iEXvFdan1dwCknDwyDNuU1vHMhIuFyiLQfS3gXrbxiXHyfZBcYwIFFWtdh1H8XRTe1TiwhofMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=Qb37ZCW9; arc=none smtp.client-ip=80.12.242.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pBqst88PxrKCtpBqvtVYA3; Mon, 03 Mar 2025 20:53:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741031606;
	bh=mKUNl37Fj0Xz/eh3jfD3bdoMruEL5FDROwD+T6gDO4s=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Qb37ZCW9SyDcOqmCrC+zOGkdER2kEp6XFJfP9FAkJOwcvCVQ2UbFhnemePUw6Okkd
	 8bnzz4w2WQx0qiq500DTm05lvTz2YAUgq8r43QIT2/i+Qp2MNbWACinBjMSIEQJ+8y
	 aElKPb5X0o+1uBs8CN/EGhlGMHBS64t3gLwc48tA4bo6MCEankw3hcSlrHHsbollvF
	 LHrPhT30kg+JVe3xFdMMnci2sY1it6JtgYG2J6yv+APkkilMQWb8xb3j8n7RXpdfnq
	 gpL/Ne1la+qvp2Msisc6kIWnZG5LCyLKe6IY2O5CtrvSQ7Yy1wCwiVhQNo4G9boxTS
	 ci7n7tGqdlHJQ==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Mar 2025 20:53:26 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ali1535: Fix an error handling path in ali1535_probe()
Date: Mon,  3 Mar 2025 20:53:08 +0100
Message-ID: <0daf63d7a2ce74c02e2664ba805bbfadab7d25e5.1741031571.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If i2c_add_adapter() fails, the request_region() call in ali1535_setup()
must be undone by a corresponding release_region() call, as done in the
remove function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-ali1535.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali1535.c b/drivers/i2c/busses/i2c-ali1535.c
index 544c94e86b89..1eac35838040 100644
--- a/drivers/i2c/busses/i2c-ali1535.c
+++ b/drivers/i2c/busses/i2c-ali1535.c
@@ -485,6 +485,8 @@ MODULE_DEVICE_TABLE(pci, ali1535_ids);
 
 static int ali1535_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
+	int ret;
+
 	if (ali1535_setup(dev)) {
 		dev_warn(&dev->dev,
 			"ALI1535 not detected, module not inserted.\n");
@@ -496,7 +498,15 @@ static int ali1535_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	snprintf(ali1535_adapter.name, sizeof(ali1535_adapter.name),
 		"SMBus ALI1535 adapter at %04x", ali1535_offset);
-	return i2c_add_adapter(&ali1535_adapter);
+	ret = i2c_add_adapter(&ali1535_adapter);
+	if (ret)
+		goto release_region;
+
+	return 0;
+
+release_region:
+	release_region(ali1535_smba, ALI1535_SMB_IOSIZE);
+	return ret;
 }
 
 static void ali1535_remove(struct pci_dev *dev)
-- 
2.48.1


