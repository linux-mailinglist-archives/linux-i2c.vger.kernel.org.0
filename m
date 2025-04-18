Return-Path: <linux-i2c+bounces-10491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495CA940A3
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 02:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1931F17EDC6
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Apr 2025 00:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBDD13AC1;
	Sat, 19 Apr 2025 00:55:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net [178.32.127.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1DD20ED
	for <linux-i2c@vger.kernel.org>; Sat, 19 Apr 2025 00:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.127.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745024130; cv=none; b=N4elPdBo0et5sr7hXLRMmnRQD0kQk0X/fB0C1Hvii6+O+nUY7SGd5tddiuS1d5tfwQe7Nmo3fon52XRA9BYAQrfSgBLp4ez81JxYgfVJtHvIeQdO2td7L8uG+bUuQtVUs/FeFWLeQWxcnEByX6jcAAcHxVcm25MC4PF4wSfmukQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745024130; c=relaxed/simple;
	bh=SvBQs+xgaH3rzs3Fm52JvwCT3jY0Enxx/F/kY40Dtn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gzihjRawXaUVeJa0d1QFQDdZ33vBRiXoJpH8MjkOS/yBGKjfZuvxySKfsjMT8U+iiRyKe6n6dIq74bK0KGDzw49PNVmKv8Q2xPqc56BzYpSbMU1ZhnDtr95akcB1FOm+hK68lArqQe71ugGkRb/gzbd5qf790UAp1Z7zBBpEb7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.127.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director11.ghost.mail-out.ovh.net (unknown [10.108.9.127])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4ZfSJ54Bwnz1P8N
	for <linux-i2c@vger.kernel.org>; Fri, 18 Apr 2025 21:16:53 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-5pxxj (unknown [10.110.164.236])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4B24B1FD7E;
	Fri, 18 Apr 2025 21:16:53 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-5b5ff79f4f-5pxxj with ESMTPSA
	id FdMgC0XBAmiD9AMAoF5Zmg
	(envelope-from <andi@etezian.org>); Fri, 18 Apr 2025 21:16:53 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002bbfe6eed-130f-45f7-be39-a1244d88b3ce,
                    9BBFD0B8C49B6260DDB62D1D32C292C5393E7E6E) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH 03/10] i2c: iproc: Use u32 instead of uint32_t
Date: Fri, 18 Apr 2025 23:16:28 +0200
Message-ID: <20250418211635.2666234-4-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418211635.2666234-1-andi.shyti@kernel.org>
References: <20250418211635.2666234-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13926537424641985095
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefvddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtdgmpdhmohguvgepshhmthhpohhuth

In the kernel u32 should be used instead of unit32_t.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2e24959bc9af..3816ceb713d9 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -542,7 +542,7 @@ static bool bcm_iproc_i2c_slave_isr(struct bcm_iproc_i2c_dev *iproc_i2c,
 static void bcm_iproc_i2c_read_valid_bytes(struct bcm_iproc_i2c_dev *iproc_i2c)
 {
 	struct i2c_msg *msg = iproc_i2c->msg;
-	uint32_t val;
+	u32 val;
 
 	/* Read valid data from RX FIFO */
 	while (iproc_i2c->rx_bytes < msg->len) {
@@ -977,7 +977,7 @@ static int bcm_iproc_i2c_xfer(struct i2c_adapter *adapter,
 	return num;
 }
 
-static uint32_t bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
+static u32 bcm_iproc_i2c_functionality(struct i2c_adapter *adap)
 {
 	u32 val;
 
-- 
2.49.0


