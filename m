Return-Path: <linux-i2c+bounces-2504-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3874886D02
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55B31C21ADE
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9C545FDC9;
	Fri, 22 Mar 2024 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XsRTRX/J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681365BAE4
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114014; cv=none; b=AHS2yiCwFR0+/ihKPBsGTx3OQjJIuAxYSCkIc+W+MwvboZ77rrYpL8Tz2tbjsXxsdoz2LNi4rwZOi5NmQNAFdic5uCSq88H3SIDJ8k0G/2TV0kmV80JqZnsvlnhF0s7Ru5xUbl8bWoJKgABObK5BX+Md3qt2uis9QyMNqx/PRpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114014; c=relaxed/simple;
	bh=c7ulUloqKhHobUEojOi16OanbpAka4XnACOJyGpmHu4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gwqH7KIjFlXHOukvOcIKIQMUkbsjvpaXw3kpPmch2fJ0uLyycbeWc167nDH+e6CultKMRbPOWGrPHVMm8He/Vf1r5THHdVHe38PDn0ulxW1NzOFWz2Z/q5M7xHpoVvGAX9EhJDGpXOBw4Jow2eTSoDBLlNBulIBg6aRgEdo+HGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XsRTRX/J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=opwX34V+hA1PIYmS10OMLpeUb5fnTvJk3x0OTizccsI=; b=XsRTRX
	/JyBUCI2tpqfzHajpGbbgbmtQdXaa45fzoKqz6vlBSHo+MJKNv1D3eDxyu9kjEPq
	KB9sshddRNm8cyrNwBfFde4BslNDLUEsEeJ+A0J33b8SsBYluNWYUfdvPLw3WjKS
	07IwvfqatCPyVfJbJq+plZeuLVYgYBDwKrnCY9O7A2aQQCAh+An6yVwFVU2YQNDM
	FeLLeIv9AJ0hQMSR/qQ6G5dAtjQg2Rs/1yB014L8602cA2jd9Y+RgKFQUcMhoYom
	MnUfoKJ6F+0ffV2MmJhZ6X5YBlQCfKjmDbugOouIcbr6wPEJejy+N7inLaIvQozH
	Kn9SeHmRPccdljmw==
Received: (qmail 3870493 invoked from network); 22 Mar 2024 14:26:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:35 +0100
X-UD-Smtp-Session: l3s3148p1@0DzixT8U3uBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/64] i2c: eg20t: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:11 +0100
Message-ID: <20240322132619.6389-19-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-eg20t.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-eg20t.c b/drivers/i2c/busses/i2c-eg20t.c
index 4914bfbee2a9..e95793036f5d 100644
--- a/drivers/i2c/busses/i2c-eg20t.c
+++ b/drivers/i2c/busses/i2c-eg20t.c
@@ -337,7 +337,7 @@ static int pch_i2c_wait_for_check_xfer(struct i2c_algo_pch_data *adap)
 	adap->pch_event_flag = 0;
 
 	if (ioread32(p + PCH_I2CSR) & PCH_GETACK) {
-		pch_dbg(adap, "Receive NACK for slave address setting\n");
+		pch_dbg(adap, "Receive NACK for client address setting\n");
 		return -ENXIO;
 	}
 
@@ -382,7 +382,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 	buf = msgs->buf;
 	addr = msgs->addr;
 
-	/* enable master tx */
+	/* enable host tx */
 	pch_setbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
 
 	pch_dbg(adap, "I2CCTL = %x msgs->len = %d\n", ioread32(p + PCH_I2CCTL),
@@ -406,7 +406,7 @@ static s32 pch_i2c_writebytes(struct i2c_adapter *i2c_adap,
 		addr_8_lsb = (addr & I2C_ADDR_MSK);
 		iowrite32(addr_8_lsb, p + PCH_I2CDR);
 	} else {
-		/* set 7 bit slave address and R/W bit as 0 */
+		/* set 7 bit client address and R/W bit as 0 */
 		iowrite32(i2c_8bit_addr_from_msg(msgs), p + PCH_I2CDR);
 		if (first)
 			pch_i2c_start(adap);
@@ -500,7 +500,7 @@ static s32 pch_i2c_readbytes(struct i2c_adapter *i2c_adap, struct i2c_msg *msgs,
 	buf = msgs->buf;
 	addr = msgs->addr;
 
-	/* enable master reception */
+	/* enable host reception */
 	pch_clrbit(adap->pch_base_address, PCH_I2CCTL, I2C_TX_MODE);
 
 	if (first) {
@@ -708,7 +708,7 @@ static u32 pch_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm pch_algorithm = {
-	.master_xfer = pch_i2c_xfer,
+	.xfer = pch_i2c_xfer,
 	.functionality = pch_i2c_func
 };
 
-- 
2.43.0


