Return-Path: <linux-i2c+bounces-4738-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C788F929719
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 10:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 834C828196A
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jul 2024 08:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9456315ACA;
	Sun,  7 Jul 2024 08:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="I9mpWEmL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD91B812
	for <linux-i2c@vger.kernel.org>; Sun,  7 Jul 2024 08:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720340944; cv=none; b=oURt3UaYACeuqsgnCcsm/LYvcvJNOWer8nIuko/SJ6QRO48AsBFZnSlWCeYyXxwC+28LjWHMs0AIQs9YeeVopOPQIGbpU/O4e8rmEMvjvt34t67V/dAfEUMw32TRI8wmgzD3Uwc+x0meXdzn3R18c7yGSGbU+RJfYKXmhQ23AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720340944; c=relaxed/simple;
	bh=rWimE53SIFix03EogSYRf4378RNS1VjsHSoDcBxxJc0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VWdDhn1ogAfZRB2xgRyrJkxC9iQbTe64kL3yQvatxNuDl0tCYVIyDFgKhYAVBvNhhzo2NKDwdp6hZk6HdmgIdKXvT/UqvwLe1/VwTlARXqsjEQHXyQ0JJFE4ICV4tPoGjt0TWwL8w8CfixVP4FwSXFwSIEbfNxJyPyN4M6YARQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=I9mpWEmL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=RJ+RFuONiNQ0O0OKXLh0rnK9Um9lqzu/jQ5EGqLvwWc=; b=I9mpWE
	mLhn8WbyOkTJmf4544NUgynDTTKWjSV2o/TTQaZ9+c1b3TiAwBhEAfcfUfu0g9Gx
	Yp4SBa09F+fl6msKDJ3xxGLM+csjD/ABb5AijplekhV3p0rYgwuo6hP/MtVsftxf
	+KES5X9lFQaMoV4J2h0RwVPIS2McGHRYDO9/BvSyKupTAkd1Mo+jEZdEyGTjC58B
	zk/yBffJN2O1j43v9bMqSboGrT2jTggigNqz+zpF7tq/yuRIvdMQM0Oz1BnVFi7U
	eefrzf1oKOqPOT7+dITBrwz7L7vHahIw8oKbrXjOF7ivesSbTpyyuVUacQFEKUqU
	yPZ8L9bN6YoccE5g==
Received: (qmail 4044257 invoked from network); 7 Jul 2024 10:28:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jul 2024 10:28:58 +0200
X-UD-Smtp-Session: l3s3148p1@queKFqQcWJRQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] i2c: rcar: minor changes to adhere to coding style
Date: Sun,  7 Jul 2024 10:28:48 +0200
Message-ID: <20240707082848.5424-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
References: <20240707082848.5424-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A newline was missing and closing braces of functions do not need a
semicolon.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Should go to for-next.

Changes since v1:
* new patch

 drivers/i2c/busses/i2c-rcar.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index d7688d702b65..29c7fafeb8a9 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -192,7 +192,7 @@ static int rcar_i2c_get_scl(struct i2c_adapter *adap)
 
 	return !!(rcar_i2c_read(priv, ICMCR) & FSCL);
 
-};
+}
 
 static void rcar_i2c_set_scl(struct i2c_adapter *adap, int val)
 {
@@ -204,7 +204,7 @@ static void rcar_i2c_set_scl(struct i2c_adapter *adap, int val)
 		priv->recovery_icmcr &= ~FSCL;
 
 	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
-};
+}
 
 static void rcar_i2c_set_sda(struct i2c_adapter *adap, int val)
 {
@@ -216,7 +216,7 @@ static void rcar_i2c_set_sda(struct i2c_adapter *adap, int val)
 		priv->recovery_icmcr &= ~FSDA;
 
 	rcar_i2c_write(priv, ICMCR, priv->recovery_icmcr);
-};
+}
 
 static int rcar_i2c_get_bus_free(struct i2c_adapter *adap)
 {
@@ -224,7 +224,7 @@ static int rcar_i2c_get_bus_free(struct i2c_adapter *adap)
 
 	return !(rcar_i2c_read(priv, ICMCR) & FSDA);
 
-};
+}
 
 static struct i2c_bus_recovery_info rcar_i2c_bri = {
 	.get_scl = rcar_i2c_get_scl,
@@ -233,6 +233,7 @@ static struct i2c_bus_recovery_info rcar_i2c_bri = {
 	.get_bus_free = rcar_i2c_get_bus_free,
 	.recover_bus = i2c_generic_scl_recovery,
 };
+
 static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 {
 	/* reset master mode */
-- 
2.43.0


