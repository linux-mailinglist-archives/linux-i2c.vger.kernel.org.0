Return-Path: <linux-i2c+bounces-4620-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 10358926E0D
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 05:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1DB41F2290E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Jul 2024 03:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 038CF1AAD7;
	Thu,  4 Jul 2024 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DoCNbuw+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8387517C98
	for <linux-i2c@vger.kernel.org>; Thu,  4 Jul 2024 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720063797; cv=none; b=EiJIF6K90fgErH9EMJSPT2cqeZ+jYtkkltTLtDiSKGHLz70nqFgJo7iASF7iF5QpM4ZChR4sTVji9Z2UTqEzv1eIj0E8gBuR0JPGhsNZRk/TO9IG7hKWRNMTkwo/b1uPkNQxgkK41yxGGGXK4fEO/Ny0UlYbwGETuA4FHvSLt9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720063797; c=relaxed/simple;
	bh=K66/k4OrxD3yOShdH7RyMX56w7kmOb0xTzgS6oo0PIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lfnqdC2Eo33POYv1E2Zh0q6W5xvlzD3vOzYf1s8xOG0wJD3UL/UORN2CAeda/H9VxEWq9HznziYYsAEoL8qxNj9+cCiURfDBf1shWy827m1sqEVU4b5tlrzvTFLm/V4zqK1Ta3JZiXw1JFA3gE68QFwzhBW0IcxHpWC3JHcrWMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DoCNbuw+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=+FwVn2hoDoZllu
	xY/VlBMmu0HlEHODSX1vgatzGd2NI=; b=DoCNbuw+eLCBD8NjZumwHQxYqtDPd5
	5urbiGaHd2ZpWDUAf5Kn/TAxmBDTXcyNpPf3C9p3LhyMCIOQSq7TJ/eTb63YADZV
	nx+95+EBii+rJtfa83bk3PRIg6jFPobwB833jqNNbyReSuNausoffIbu9NYzhRsr
	hFq+inBZH+NQMeeDiGGx9SzztyDU/E63JzXXzJ3OLf/AHXobIJDvfSxYv2GgA60F
	/UpqE7XPVzN7bdXIzl5+IKg3skS6ZBjUji0uzyOt7DzMayt826h6lLivRbhhM4/R
	s6eN4vd9dVz16VE0XA2OoFhT8WdLkDRVM5qlrsCGCCfwL4ITeDbE63wA==
Received: (qmail 3004017 invoked from network); 4 Jul 2024 05:29:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2024 05:29:49 +0200
X-UD-Smtp-Session: l3s3148p1@AnYpj2McZNQujnsa
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: add debug message for detected HostNotify alerts
Date: Thu,  4 Jul 2024 05:28:59 +0200
Message-ID: <20240704032940.4268-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setting up HostNotify can be tricky. Support debugging by stating
when a HostNotify alert was received independent of the irq being
mapped. Especially useful with the in-kernel i2c testunit. Update
documentation as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---

Changes since v1:
* added docs
* added tags (Thanks, Andi!)

 Documentation/i2c/slave-testunit-backend.rst | 5 +++++
 drivers/i2c/i2c-core-base.c                  | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/i2c/slave-testunit-backend.rst b/Documentation/i2c/slave-testunit-backend.rst
index 0df60c7c0be4..37142a48ab35 100644
--- a/Documentation/i2c/slave-testunit-backend.rst
+++ b/Documentation/i2c/slave-testunit-backend.rst
@@ -99,6 +99,11 @@ Example to send a notification after 10ms::
 
   # i2cset -y 0 0x30 0x02 0x42 0x64 0x01 i
 
+If the host controller supports HostNotify, this message with debug level
+should appear (Linux 6.11 and later)::
+
+  Detected HostNotify from address 0x30
+
 0x03 SMBUS_BLOCK_PROC_CALL
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
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


