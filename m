Return-Path: <linux-i2c+bounces-5160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB847948DC4
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 13:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 194521C21F80
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Aug 2024 11:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE9E51C2326;
	Tue,  6 Aug 2024 11:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VG/Gb5qC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02E913B2AC
	for <linux-i2c@vger.kernel.org>; Tue,  6 Aug 2024 11:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722944140; cv=none; b=Nzxa1fgF+f/oahg8q8JeCAlVuOSjcRJ1wuCs0l1oRnPouA+OMiXxbaf1NnmHzS/7raW8gUnsGHUfXybznSSavwh5f0/3+UgWCWKzm6XKJalXCcp2HRP+0V6Tgq+w+X7cY2KkKQrIR/EzkRAZu3K6U2oNpgA5BKSOi2o2Z0akBp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722944140; c=relaxed/simple;
	bh=hR1D8R6RtWA38dHj7kG7HTDjVu4WfZ5aFM7bBEsRu5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9YyrMuunqpQctGeQrdj024WU00/CfJ+QDaZfOFpR5VC353kHc79DW9LT+rx7/QkDCme79X2t8OO1zUFLu3JkR3CdthYjElzex0DrLzjKqQzg24M0newTDXLbFZhsaNPc2XRyeMlF3Mca7T1amrMLBalyYx6ZwW64LHQEbgZQ2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VG/Gb5qC; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Xqmxp4UIFhVWz/
	Q31+BUaJ2PV6A0jXU+mnyEW/BC3Sc=; b=VG/Gb5qCWE3s/rmoiDe1drYu97Ty7N
	asAGmdm/5pCRryZJCDSY44kFDVsp9snKdPzz+EGApIPptgp7uI6tyGDMUhlTvymB
	MvepFxpsuSg2bngoaRSUgrlnVzHRZRWzV6HsvAxhVyud+bSmCkP5f0F9un73WT3B
	ssECzK+/AUfMGqXLR+trvCbUflG+q5eoT2RvFPkLPIc29+yZJnvT8L3eKO7MBbcC
	CZpduYxcmXtWb7Ng7w1gINhbcJKIa4RUWuO08eOTKSU3mXnPq/ZIwbbv2CsAKzTT
	HWbFq68GxTizQrIrjSkdKuOzDG7bH2mF5BAr7e25kNBBPOG4YBLpIqdA==
Received: (qmail 202165 invoked from network); 6 Aug 2024 13:35:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Aug 2024 13:35:35 +0200
X-UD-Smtp-Session: l3s3148p1@0PgjMQIfeNUgAwDPXxLGAIH3oZkcU6AS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: testunit: match HostNotify test name with docs
Date: Tue,  6 Aug 2024 13:35:33 +0200
Message-ID: <20240806113532.32679-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure the test has the same name in the code as it has in the docs.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/i2c-slave-testunit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-slave-testunit.c b/drivers/i2c/i2c-slave-testunit.c
index 4e03b75f9ad7..4c550306f3ec 100644
--- a/drivers/i2c/i2c-slave-testunit.c
+++ b/drivers/i2c/i2c-slave-testunit.c
@@ -18,7 +18,7 @@
 
 enum testunit_cmds {
 	TU_CMD_READ_BYTES = 1,	/* save 0 for ABORT, RESET or similar */
-	TU_CMD_HOST_NOTIFY,
+	TU_CMD_SMBUS_HOST_NOTIFY,
 	TU_CMD_SMBUS_BLOCK_PROC_CALL,
 	TU_NUM_CMDS
 };
@@ -60,7 +60,7 @@ static void i2c_slave_testunit_work(struct work_struct *work)
 		msg.len = tu->regs[TU_REG_DATAH];
 		break;
 
-	case TU_CMD_HOST_NOTIFY:
+	case TU_CMD_SMBUS_HOST_NOTIFY:
 		msg.addr = 0x08;
 		msg.flags = 0;
 		msg.len = 3;
-- 
2.43.0


