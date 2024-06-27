Return-Path: <linux-i2c+bounces-4396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E896B91A6BE
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 14:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52F86B24F47
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 12:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CBB15EFB2;
	Thu, 27 Jun 2024 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fokESkpj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8795E15688D
	for <linux-i2c@vger.kernel.org>; Thu, 27 Jun 2024 12:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719492209; cv=none; b=qmwsD+VHf1ypiXkBSYoXGR0TjnDImAcLgiTuk1Q7IG8jqV5NPSGufknp2PgZFnK/buDmolrtdcNzH/LYLY54uo1riKEAdwnQbohA8cOGIz0zW3k6p33CxPtb0ltc6p1L0lehJZfF7VGFoIvu0cVdX9cTFrswf8vL5kpuUrGaTUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719492209; c=relaxed/simple;
	bh=ExYCtX63CEn0F/NNc5KVhjdf/D7j6mzWCPKtIhlu6BY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H9ivOOXPu0F1F/Py5/uBRIGycvJ6TNN3/DW4yuj0kz1Jjqak9EXuQTEABSAtz4yWimKQ78BBo6TicX9RNG/hmo9feEBnmFs39IyPfm3O1B57FwCl7e+Gd25+UzOJPQodVfXCaeoyh8ZmRf8IPO0nPGYIAYy4o0woIjs/CVnngUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fokESkpj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=D4snzyMAEU6JEF
	0uM9tuR/L4oH5JoDjLeAevy1y8a4M=; b=fokESkpj6GLroTNQ3xYIayYKXpC58C
	eCbROShd3XPjSEp8vis8ixX7v8yaJzOWcKPKKGCsuSDosYnYX1h5UMJot2AM4TFb
	dOFP0rVeqSX3LeZAMaqcEuY/GjKJFailrkDttSie5WPAPtZvaBTNjURhIBpiZRj5
	j2uS0Atb3xg0Ka26HH4Mk5/j6IADSOyuOcRkRNH+mWF/ynuKWuYw+U3Lx9T3worI
	hb5lErOMUFMm5go63R0SdtTqY+7Tr7FSR2jt83jUQQLd/ZGtbSuN9n7gdMrokWVm
	+Xh6FIobT8qGQOolBBynRkcmlv7NmjRd4r+/QXeLKvaJ79Q88V3zISfA==
Received: (qmail 911777 invoked from network); 27 Jun 2024 14:43:21 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Jun 2024 14:43:21 +0200
X-UD-Smtp-Session: l3s3148p1@HUvded4bZtkgAQnoAGk/AEN12aawIPYB
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: add debug message for detected HostNotify alerts
Date: Thu, 27 Jun 2024 14:43:14 +0200
Message-ID: <20240627124313.1811-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting up HostNotify can be tricky. Support debugging by stating
whenever we received a HostNotify alert independent of the irq being
mapped. Especially useful with the in-kernel i2c testunit.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-core-base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index db0d1ac82910..b94594e90a66 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1468,6 +1468,8 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr)
 	if (!adap)
 		return -EINVAL;
 
+	dev_dbg(&adap->dev, "Detected HostNotify from address 0x%02x", addr);
+
 	irq = irq_find_mapping(adap->host_notify_domain, addr);
 	if (irq <= 0)
 		return -ENXIO;
-- 
2.43.0


