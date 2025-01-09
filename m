Return-Path: <linux-i2c+bounces-9004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3BA07599
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 13:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03910188B029
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 12:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9D3217716;
	Thu,  9 Jan 2025 12:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E6q4n0IW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7621770E
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736425285; cv=none; b=szeFyqhb951ioWoYNhfDOncCH6XJtfxjRy1vkf5xlsC0zA1w+8+BxH9r76Cvg+cPr+6UyCRG/4JidqccOMt749oHriyFn+GokK/HowDn5YF6BK9mBJ+ZzGvP4XCslt5ELnn2qe4aoO/LSfjrZjXj5ua5nlzFlpcDIPcfKIoTIYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736425285; c=relaxed/simple;
	bh=Vl7aEibJYyHLkU899tI+Ja6Fj2+G/QAcR+0T3tzOPX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjF6Nh8X9JEm8yT9zvoS5jOfuBdaXzxRyj84fKyoogbR60GHxDfJqBVOr7p4+rlE0JtdqI2B1uvgjn6aGG9Jiut2b4Kw5Mn+RqH5o5tcFsPAO3XeMg+4AfDAsDn1stBqfcyVB3LOrsrPIiKN9sKaDR3iPvtbdfQhyiu0xIPXuyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E6q4n0IW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=454BCUBzqC7PUbBBGcyFvNB53HXu7K7rZZdfoXl0+O8=; b=E6q4n0
	IWnculoAFt/x8iGBeWHC/UIcrvh+ohKaFokm/f3iXehbBnFIqhyw+3e3lgFxg4w/
	LrvYW/2+mLAKNZY23ro5GBQn/acP9Tp1vKbh2bAmmpx9qXWjcm/nFoRuP7xLXk9K
	sLnky8bvUF7IEEIAj5j7fwMwesNWYX34h7Ev+AnEs6ekHXM6xCZDFdPvP+DF/SX+
	pl0MKK3osrxW1P6EF54AaHQ6vhNRCcW19q2ZZGVBwximetC+vPZflc5a1qICFnHD
	nRsMP35GMPJf81RlXpsuhcepalwhJnZZEDtbhQ4aS0ipFAbSoWVUurfx3loT/9/B
	oZLFGbcbViOOD3KA==
Received: (qmail 2902248 invoked from network); 9 Jan 2025 13:21:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 13:21:18 +0100
X-UD-Smtp-Session: l3s3148p1@kuHdA0UrZr0gAwDPXw20AOMQ2KO98fSH
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: add core-managed per-client directory in debugfs
Date: Thu,  9 Jan 2025 13:21:10 +0100
Message-ID: <20250109122112.45810-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
References: <20250109122112.45810-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

More and more I2C client drivers use debugfs entries and currently they
need to manage a subdir for their files on their own. This means
inconsistent naming for these subdirs and they are scattered all over
the debugfs-tree as well. Not to mention the duplicated code.

Let the I2C core provide and maintain a proper directory per client.

Note: It was considered to save the additional pointer in 'struct
i2c_client' and only provide a subdir when requested via a helper
function. When sketching this approach, more and more corner cases
appeared, though, so the current solution with its simple and unabiguous
code was chosen.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 4 ++++
 include/linux/i2c.h         | 1 +
 2 files changed, 5 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b072030a9105..00f171ebc01f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1015,6 +1015,8 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	if (status)
 		goto out_remove_swnode;
 
+	client->debugfs = debugfs_create_dir(dev_name(&client->dev), adap->debugfs);
+
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
@@ -1058,6 +1060,8 @@ void i2c_unregister_device(struct i2c_client *client)
 
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
+
+	debugfs_remove_recursive(client->debugfs);
 	device_remove_software_node(&client->dev);
 	device_unregister(&client->dev);
 }
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 66fb3d6cf686..36de788dc7fe 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -347,6 +347,7 @@ struct i2c_client {
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
 	void *devres_group_id;		/* ID of probe devres group	*/
+	struct dentry *debugfs;		/* per-client debugfs dir	*/
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
-- 
2.45.2


