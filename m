Return-Path: <linux-i2c+bounces-4705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE692931C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8DA428203C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B47315F404;
	Sat,  6 Jul 2024 11:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l1Ggj8Kd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393815ECC0
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264928; cv=none; b=hSqoOzHSrA5A5o1pID184d4aRHDzgWyaoxklg/xBBie62npIzDmSfSGMFc4GlZWpWph8hzH4HJZqi0d0tr6cDFYM+OGvCoZOCXALscePORM2M9lI60QgBwc1SbmlRSw3+EJBB533J6IqZl8vt3Aq5Da32f10J3a8ezVQ5nGC5SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264928; c=relaxed/simple;
	bh=SMo1+G58Da0cnxrv2+Ymv41Xnq0euK7lrerRkMD65rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M4ZpzSxiqdTTSZBRah2opThRHs+kZaz+u58PKq+cH2JdCMvhl3wT3kilu3gKL+vRH0too7L/o13w06fGT4yM4srgfBiSRofp6L59QuX4zWGOlr0Y78ENVnCA944Vp30VrReOlnMp6ag/tRCB4kKN7/sD+jBaH6B3AU4sWejsuys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l1Ggj8Kd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=uRNQSfAVpo9Svrbvvr9vmil5A+5LzFem8tfy/6QTdoc=; b=l1Ggj8
	KdOeRtO1G7Ym9OwkgOKoIGRy+E1Libnk1rfOihW+A2m565tZwrWbaraTBtszukp2
	RvKhPICmk1WnRWApH6QfqyZDACtZ3mfhkBj+Tja0axHEjJzs5CH69EvgAxNbJuFC
	p/WmXwDmoPGQ6ZGdVZ/XWtuKZLtoF+pCKHkI/K+dDnYrIiVjNDWNYQyOZ/iuXaJ2
	9UAwIp5E7qxLB39cODPTxd1LCYg6d/ioZNPqxGSF5NnNsaWLZKMMqx+8LYzDL4mV
	HtBU+Rdtw9VMLGEgKNo7yp/6RyanNnU9gjIqjrcj2MW2kOGXHJeOo/iSO4pQs66j
	qXRdny6n9U4AXpOQ==
Received: (qmail 3810611 invoked from network); 6 Jul 2024 13:21:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:49 +0200
X-UD-Smtp-Session: l3s3148p1@CxPSYpIcKsJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 38/60] i2c: piix4: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:38 +0200
Message-ID: <20240706112116.24543-39-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-piix4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-piix4.c b/drivers/i2c/busses/i2c-piix4.c
index 6a0392172b2f..84aa18d1003b 100644
--- a/drivers/i2c/busses/i2c-piix4.c
+++ b/drivers/i2c/busses/i2c-piix4.c
@@ -589,7 +589,7 @@ static int piix4_transaction(struct i2c_adapter *piix4_adapter)
 		result = -EIO;
 		dev_dbg(&piix4_adapter->dev, "Bus collision! SMBus may be "
 			"locked until next hard reset. (sorry!)\n");
-		/* Clock stops and slave is stuck in mid-transmission */
+		/* Clock stops and target is stuck in mid-transmission */
 	}
 
 	if (temp & 0x04) {
-- 
2.43.0


