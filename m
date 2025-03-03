Return-Path: <linux-i2c+bounces-9699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C35A4CC51
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 20:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DDD71896622
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Mar 2025 19:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D7623498F;
	Mon,  3 Mar 2025 19:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="AIJhs9Y9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-65.smtpout.orange.fr [80.12.242.65])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A310F1E1C1A;
	Mon,  3 Mar 2025 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741031908; cv=none; b=dO62pcSPHa8FsSl6rfljh44b2dfclMU1TUDfPfXwbdnNPfzYECej+6ohIWsmGZ5lWNRlGsVRUahFeTfUGrFv0/qN5JnFJhdMg1p4sbh7pewdGL6S88moddQYXDA55D7J7LZ3nLAotdboSHwBcRIgpUXGJJ7rPLSDL/qnwG5U+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741031908; c=relaxed/simple;
	bh=K2Q+AFeiszz6C1lv09sCDBgrUMlDisN6Lkp/AfFLBfc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mHeHCJuGdgfjm2fHe/THJ9S5gHBYIh6ADa5Qk8yDxDl3Kdni7nJlIlCG9pSrMZpMjeIf8JTFcGYdMFVbbyO9jeGLa98u5N6hOi12FFzQiNjylaGZD3aDWgBgh95/uF7ssCL8qhNIxB7pD68eZzPoBkAUeEcEL93tepPSRN3DxSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=AIJhs9Y9; arc=none smtp.client-ip=80.12.242.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from fedora.home ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id pBvctEjajIXoFpBvftj8tU; Mon, 03 Mar 2025 20:58:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741031899;
	bh=kJbxcMGXHH3h8T8nkg10LduDp7krf9ekP3X2Gt2ijPA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=AIJhs9Y9ipKe3tYru49eqqa0YKLVd8iGNxr5MkL1ubw58aOQYSy4TYcLSxHOt6jyW
	 iib3ykhrcV/rE7wduYUd4qPrWc5Cn7C9D9+pHNZYSed7jzMnZ8e1xyBk/3AkBthzV5
	 9cqLsPDIBZkE7q84T3ZCjGgZy3/QaNRUjPA6tL9GlN5DHnRNh0kvRZSAN7P3iV/Uzx
	 DoOrSlzu5xoA8kTDylUcXoDJrt2jnD4WbztTFkc43Rzi4tBFOR6aJMmRTqc2WADQbN
	 ic1vP4ibFDe9DgoiHtDUHU1CWGdV0FrN8GgKx6zAEyN0rKRW1H2Rnt44Gewo2xVt95
	 4NojBdySRKvMw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 03 Mar 2025 20:58:19 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: ali15x3: Fix an error handling path in ali15x3_probe()
Date: Mon,  3 Mar 2025 20:58:06 +0100
Message-ID: <9b2090cbcc02659f425188ea05f2e02745c4e67b.1741031878.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If i2c_add_adapter() fails, the request_region() call in ali15x3_setup()
must be undone by a corresponding release_region() call, as done in the
remove function.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/i2c/busses/i2c-ali15x3.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-ali15x3.c b/drivers/i2c/busses/i2c-ali15x3.c
index 4761c7208102..418d11266671 100644
--- a/drivers/i2c/busses/i2c-ali15x3.c
+++ b/drivers/i2c/busses/i2c-ali15x3.c
@@ -472,6 +472,8 @@ MODULE_DEVICE_TABLE (pci, ali15x3_ids);
 
 static int ali15x3_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
+	int ret;
+
 	if (ali15x3_setup(dev)) {
 		dev_err(&dev->dev,
 			"ALI15X3 not detected, module not inserted.\n");
@@ -483,7 +485,15 @@ static int ali15x3_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	snprintf(ali15x3_adapter.name, sizeof(ali15x3_adapter.name),
 		"SMBus ALI15X3 adapter at %04x", ali15x3_smba);
-	return i2c_add_adapter(&ali15x3_adapter);
+	ret = i2c_add_adapter(&ali15x3_adapter);
+	if (ret)
+		goto release_region;
+
+	return 0;
+
+release_region:
+	release_region(ali15x3_smba, ALI15X3_SMB_IOSIZE);
+	return ret;
 }
 
 static void ali15x3_remove(struct pci_dev *dev)
-- 
2.48.1


