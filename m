Return-Path: <linux-i2c+bounces-2491-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39865886CE6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9D6F282564
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889DD481DB;
	Fri, 22 Mar 2024 13:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ngzh/f2u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D246426
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114000; cv=none; b=qGfxvcHPxT2k6KCXWrptD2LaGlbWkaYm3kZHTWxVD9iBWZ4hw5bMLZP08fRsefDSXDz6vxNFGHb5PBZ1mtWm6mWitMYVfxyiTGivDI25KkG8lNmfc8gmlSPRqmt9p70hX+JwXULUWxLIlTFQvW4+QoHRVP3Yw0S/prseDubcWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114000; c=relaxed/simple;
	bh=fvv1sG3VG+bSgIpSE5KkC2vSc06VSykF5euhM2XlNLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn90GVoY4BSLAft1wDnNoUGKRO2/CtVVuQbSAYs1hFLhpMNTPdtJs43S4mfYFkJffTr3OMEaxulBa9ItNdjw0+YM8N6gr94f41v94tNfy82BZMBuJnD2Jdbqp/kZTgPBGS8TGTnoBGqtsoEjRFjMWx6sx/Xdc1JPlNdkJ83S3sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ngzh/f2u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=BTYhgMQerKfjHZPgtx2s+my80JPp21aQgBykclcGkH0=; b=Ngzh/f
	2uEAONEwVF7yBI6NiJbGG1dXLeFqxFemsWOgjDWl0MRW9JLz31eMbzRHVQxV2VdI
	egmQdfrJ8MQxiFclvhhx3eGg5siVkA9kLi7//Wzn9gg3fg1ib/6hmHVUMZIm4JJO
	YrvMfkD1abWklEZdeKfrEjSyxFoLJmqAZaezWH/2zrEMsZszQgBz8TDL1etl3enh
	ibeztCwyFoDgGa+BG1U2pWSCZQ1jbDiCyh+p2w6MJM3Q9cVDRY15YonLWpYaPxyC
	FEo5xPOYY0IW1qMZ2R//xzG0/L67jP0+/49TSkdvGtXHCGgr0IusoZRak9f30Ixp
	BjakT+N8uIaLcqyQ==
Received: (qmail 3870189 invoked from network); 22 Mar 2024 14:26:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:25 +0100
X-UD-Smtp-Session: l3s3148p1@Yk5IxT8UZJNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/64] i2c: au1550: reword according to newest specification
Date: Fri, 22 Mar 2024 14:24:59 +0100
Message-ID: <20240322132619.6389-7-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-au1550.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-au1550.c b/drivers/i2c/busses/i2c-au1550.c
index 8e43f25c117e..77d85feda631 100644
--- a/drivers/i2c/busses/i2c-au1550.c
+++ b/drivers/i2c/busses/i2c-au1550.c
@@ -81,11 +81,11 @@ static int wait_ack(struct i2c_au1550_data *adap)
 	return 0;
 }
 
-static int wait_master_done(struct i2c_au1550_data *adap)
+static int wait_host_done(struct i2c_au1550_data *adap)
 {
 	int i;
 
-	/* Wait for Master Done. */
+	/* Wait for Host Done. */
 	for (i = 0; i < 2 * adap->xfer_timeout; i++) {
 		if ((RD(adap, PSC_SMBEVNT) & PSC_SMBEVNT_MD) != 0)
 			return 0;
@@ -120,12 +120,12 @@ do_address(struct i2c_au1550_data *adap, unsigned int addr, int rd, int q)
 	if (q)
 		addr |= PSC_SMBTXRX_STP;
 
-	/* Put byte into fifo, start up master. */
+	/* Put byte into fifo, start up host controller */
 	WR(adap, PSC_SMBTXRX, addr);
 	WR(adap, PSC_SMBPCR, PSC_SMBPCR_MS);
 	if (wait_ack(adap))
 		return -EIO;
-	return (q) ? wait_master_done(adap) : 0;
+	return (q) ? wait_host_done(adap) : 0;
 }
 
 static int wait_for_rx_byte(struct i2c_au1550_data *adap, unsigned char *out)
@@ -175,7 +175,7 @@ static int i2c_read(struct i2c_au1550_data *adap, unsigned char *buf,
 
 	/* The last byte has to indicate transfer done. */
 	WR(adap, PSC_SMBTXRX, PSC_SMBTXRX_STP);
-	if (wait_master_done(adap))
+	if (wait_host_done(adap))
 		return -EIO;
 
 	buf[i] = (unsigned char)(RD(adap, PSC_SMBTXRX) & 0xff);
@@ -204,7 +204,7 @@ static int i2c_write(struct i2c_au1550_data *adap, unsigned char *buf,
 	data = buf[i];
 	data |= PSC_SMBTXRX_STP;
 	WR(adap, PSC_SMBTXRX, data);
-	if (wait_master_done(adap))
+	if (wait_host_done(adap))
 		return -EIO;
 	return 0;
 }
@@ -246,7 +246,7 @@ static u32 au1550_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm au1550_algo = {
-	.master_xfer	= au1550_xfer,
+	.xfer	= au1550_xfer,
 	.functionality	= au1550_func,
 };
 
-- 
2.43.0


