Return-Path: <linux-i2c+bounces-2509-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB869886D0F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 826EB1F25604
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844C2605DC;
	Fri, 22 Mar 2024 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SH4q4sck"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542A0604AF
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114018; cv=none; b=lBpB/O8a6hhn7scy03guT3+hcVdhxyijNzJjF8oe0xECEAB/SigqBL/WbCVOtbBNa3qwJha90O/H9VHoMH1XjTYx69tXTMF2IiGpf+ONShwglnR4w1VM5Ypd4yzhLeiahOa/5ALLWyeovfNfrprCYtcJIfeYQRPryeBC4d22Hmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114018; c=relaxed/simple;
	bh=m7oBZiPiCYpAs48i0suwGRxvQW5vIb79oo+w8VDHE58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAcDLCTwhTTEo+vnrNAKphkXKKYnOMO0skJyyhls7vszMagE80oN8gt8h6H/5JdZxboI2bqdAqTg+/2VeXq6RPC13fUBK9vpuBw5bmkES46O5+b0p+RgG7KIVyL5RfRnp3qPphBb6486UDTEtOegHNayKPNXjhtoX4zAtd/cKBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SH4q4sck; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zHWcrqcqGocHIBXF4RitcyOSKbklqY+OmlrTvuEauIc=; b=SH4q4s
	ckAA+8fPDc59KFMUlUUyeLDLg+nI7lwTpVTrZ1ZDYtAf9Yp+3tfFzElEg1E5ZsXS
	8Uzblu2k9EFn3Y9kVphWMLp5mDpFJASJuvWmJwTYRRVgaBPkKcNKyqGIHLR5EzWX
	mQME/y1cwEcFymaUfcdHW+GoaNNB+1jvSANciScJT4oZoa/PU97vKizpeoho1LGM
	SUlMm4ms7Kq1OCXE6DzJ3ygiSZrO2D8UExUtb1GSxn7xoupr0TSrD2X2eN0ppDxE
	B/gZNC4eTqJ0TTfTafFCRrwTj80g73t9aFEb9MpBwECSYkw3EgMvO++jxMFfh04g
	2KwyBBje2379BtVg==
Received: (qmail 3870645 invoked from network); 22 Mar 2024 14:26:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:40 +0100
X-UD-Smtp-Session: l3s3148p1@MQ4ixj8UnpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/64] i2c: hix5hd2: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:16 +0100
Message-ID: <20240322132619.6389-24-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-hix5hd2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 8e75515c3ca4..d7a834a7fec5 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -200,7 +200,7 @@ static void hix5hd2_read_handle(struct hix5hd2_i2c_priv *priv)
 		/* the last byte don't need send ACK */
 		writel_relaxed(I2C_READ | I2C_NO_ACK, priv->regs + HIX5I2C_COM);
 	} else if (priv->msg_len > 1) {
-		/* if i2c master receive data will send ACK */
+		/* if i2c controller receive data will send ACK */
 		writel_relaxed(I2C_READ, priv->regs + HIX5I2C_COM);
 	} else {
 		hix5hd2_rw_handle_stop(priv);
@@ -384,7 +384,7 @@ static u32 hix5hd2_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm hix5hd2_i2c_algorithm = {
-	.master_xfer		= hix5hd2_i2c_xfer,
+	.xfer		= hix5hd2_i2c_xfer,
 	.functionality		= hix5hd2_i2c_func,
 };
 
-- 
2.43.0


