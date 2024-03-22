Return-Path: <linux-i2c+bounces-2524-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C790886D32
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:34:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9721C23F2C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ABB627F1;
	Fri, 22 Mar 2024 13:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="e/SN81VT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94C62160
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114032; cv=none; b=kbb8s0ooKI94HflmoX/4OiyBAiOm4owpKKkkk9YDj++ay8mQqr1Zc8NusS6ZDP9zEMi1VyOFM7Qua3JmK4NqMLlD3tCcEoAhjGXGfZtnnekHl70VGR8QZWK8O1DzOuHa/GE4CYnLaUWhqkPgTb9hAKu1rMK4T1/SiAEHtQw7gVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114032; c=relaxed/simple;
	bh=FYnBTFpKVQeWLm0SBhcUe8AAmDxIAkTBFh0KEqCtkgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlHDzfz3StB0AKLx0CChDi0xAhGWfU/agYEhqIlP2sn/nSLjeia/caHtHlrlS1rHdBwzA+nNOPl5YfLvc997yFT6UNGQif6dyFFxkJShPy/UAOI5F5h9MMC1uJYtT8KLlSYhWz2ju6I5AA0JKZfmByaicj5TQRHzMXohka9oDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e/SN81VT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=yAE6JmthRrlChk2Hy2WlGkeEMuMtkH5UUitAAJeFiNw=; b=e/SN81
	VT4ZooC20O7AFo7XIzW3sE6T/Z7TlVwP8fwf7bYvfX0Xbdpg85d7f94AeWX649P5
	nxA+hzSd6QZFLBRyT4KcSy6/MPWaq5pE5ZXh/shtLku4C/JtGpbqfXzNhQqWclgZ
	j//Lm1KhmIe8drTLOog1b8uXhVppdsh0Qgg10Pad20v5kWC48Zss51baUk3CWdng
	7/sohoDbJhrVhrdDY0c+kSnRvf+Jj6DMw1V7IaJR61PmrhDNdK+tubgs78nX4sLp
	Zr7n/fmFBUMJ1JZ5bUSGZOrTgHGQMbF9RZv4anjWYdOvizN19nrDz3GF1jVRlR8Z
	yRRBtUJVSKlH+Fcw==
Received: (qmail 3871294 invoked from network); 22 Mar 2024 14:26:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:52 +0100
X-UD-Smtp-Session: l3s3148p1@Hc7ixj8UYrBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 38/64] i2c: mv64xxx: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:31 +0100
Message-ID: <20240322132619.6389-39-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-mv64xxx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index dc160cbc3155..0814f5bc8362 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -89,8 +89,8 @@ enum {
 	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
 	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
 	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
+	MV64XXX_I2C_STATE_WAITING_FOR_CLIENT_ACK,
+	MV64XXX_I2C_STATE_WAITING_FOR_CLIENT_DATA,
 };
 
 /* Driver actions */
@@ -279,7 +279,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 		} else {
 			drv_data->action = MV64XXX_I2C_ACTION_SEND_DATA;
 			drv_data->state =
-				MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK;
+				MV64XXX_I2C_STATE_WAITING_FOR_CLIENT_ACK;
 			drv_data->bytes_left--;
 		}
 		break;
@@ -307,7 +307,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 			drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
 			drv_data->bytes_left--;
 		}
-		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA;
+		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_CLIENT_DATA;
 
 		if ((drv_data->bytes_left == 1) || drv_data->aborting)
 			drv_data->cntl_bits &= ~MV64XXX_I2C_REG_CONTROL_ACK;
@@ -797,8 +797,8 @@ static int mv64xxx_i2c_xfer_atomic(struct i2c_adapter *adap,
 }
 
 static const struct i2c_algorithm mv64xxx_i2c_algo = {
-	.master_xfer = mv64xxx_i2c_xfer,
-	.master_xfer_atomic = mv64xxx_i2c_xfer_atomic,
+	.xfer = mv64xxx_i2c_xfer,
+	.xfer_atomic = mv64xxx_i2c_xfer_atomic,
 	.functionality = mv64xxx_i2c_functionality,
 };
 
-- 
2.43.0


