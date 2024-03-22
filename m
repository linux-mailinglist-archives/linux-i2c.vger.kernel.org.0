Return-Path: <linux-i2c+bounces-2511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4500A886D13
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76CB31C21479
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEDB6088E;
	Fri, 22 Mar 2024 13:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dAN0vM62"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D989605AE
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114019; cv=none; b=pN9Pxlopv4ZXTtVa9MHRZdz6/lGp3DKLXdMu+YN+koQIgziT/8t17zcQNqqTF368W6dNtlpNH5+Z0ezZxugAwatHoQY+p4pSNHNlpt2Ku+zjlXL71Adu6IsPXCPSsqGEZ/RIQuvT7iFTDyasewYDiELPOhRbfHwTtMtLEJvShuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114019; c=relaxed/simple;
	bh=KMlPjhymqUnFrcOezsGlxN4z0c5hiNab6hv/WcMS95s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HNaFi2kEEmAsTpoCL0UT/f9O813ikUUR2zT3n/CD3pSdm6AKw8FrVUOzb6PBxRBO0QLg8RlNejWRZOO9z6Vt7jEoQ+KhVni/ijjC0ARFIEhnvkjbqdJ+HkZFj30cRJv0ZWOaBKW9F9lIKDOqAjNE4GWGdsk9B31RuO7dG1Y2U1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dAN0vM62; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ELobiikT/EftdANZZNCWbmYEFMap38mTRb0PD3v43fw=; b=dAN0vM
	62K1vHo9Ig88LNbKifyqaPmYYbUwnxrG6m7RtS1JzQPnwj9vhgxKQNoh4ekGjktW
	X+uN8FXdTbuyQ/PTyf0GOxoipXoWNr1Qum9c1zEGavTc2wp6qAbfw4LEBeuX7wBF
	bRG8GvBftkLNLBmOleniGhumM26A9+XXkoY8wn9HCR3j8KIIzk6T7r9yDFS1jhkU
	kBDT0vZ50ug8ci8bbZ5olezjWhNaJ51OfYO/VBGyitdAIkrj6KIiS5CUgLtB7/Gr
	IDfB4+E0Ffid8d9WosfStsYkTja6W0nf450JWcRO+V0B7UeJ62XyTtmFrHQYj0UO
	fuM6vzljcwadKqvg==
Received: (qmail 3870679 invoked from network); 22 Mar 2024 14:26:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:41 +0100
X-UD-Smtp-Session: l3s3148p1@hVcvxj8UqJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 24/64] i2c: i801: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:17 +0100
Message-ID: <20240322132619.6389-25-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-i801.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a6861660cb8c..68983f0a7fef 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -87,7 +87,7 @@
  * Block buffer				yes
  * Block process call transaction	yes
  * I2C block read transaction		yes (doesn't use the block buffer)
- * Slave mode				no
+ * Target mode				no
  * SMBus Host Notify			yes
  * Interrupt processing			yes
  *
@@ -1274,10 +1274,10 @@ static void register_dell_lis3lv02d_i2c_device(struct i801_priv *priv)
 	i2c_new_client_device(&priv->adapter, &info);
 }
 
-/* Register optional slaves */
-static void i801_probe_optional_slaves(struct i801_priv *priv)
+/* Register optional clients */
+static void i801_probe_optional_clients(struct i801_priv *priv)
 {
-	/* Only register slaves on main SMBus channel */
+	/* Only register clients on main SMBus channel */
 	if (priv->features & FEATURE_IDF)
 		return;
 
@@ -1304,7 +1304,7 @@ static void i801_probe_optional_slaves(struct i801_priv *priv)
 }
 #else
 static void __init input_apanel_init(void) {}
-static void i801_probe_optional_slaves(struct i801_priv *priv) {}
+static void i801_probe_optional_clients(struct i801_priv *priv) {}
 #endif	/* CONFIG_X86 && CONFIG_DMI */
 
 #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
@@ -1756,7 +1756,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	/* We ignore errors - multiplexing is optional */
 	i801_add_mux(priv);
-	i801_probe_optional_slaves(priv);
+	i801_probe_optional_clients(priv);
 
 	pci_set_drvdata(dev, priv);
 
-- 
2.43.0


