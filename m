Return-Path: <linux-i2c+bounces-4698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD2492930F
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 467242817A6
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20FA15698B;
	Sat,  6 Jul 2024 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hKd5UCvE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4940154454
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264922; cv=none; b=GD+Ha2ElDj7zEjfm3R6Aii0xbV0XhTbyyMUv4seMbPNOM9Chojzo7mzkvPwt35UMCeuhR9kRflcD+ATTfsTRvhtIxdz25RqvFZOOGSAhW+IO7nCO1Nr1f8nogJZiPW05sG7fnGmfuppA9qjT+YYQkkExzCur/qXW8FMCG89BoyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264922; c=relaxed/simple;
	bh=6jC+GwaNH6JmxBwsDgfSQuHLXozf4vHpzv45HFTYqkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cyIB8Mrwfoy/fgkeQHf8KfYsPJ7ZvVxVVgYa6eHru3fp8TFcir3H03qxS7trpo6PDNnaogk5YBLZhKObmiB3Z9pDhPnvIP31iPI7ZyzC4RWfN2Jd1slSYJ6qt0NfGAso240Sl9ehjRo++plJvVJ6Oen3u2Zn07JLGRAkfHU89d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hKd5UCvE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VgZrsbp9k+FQorho2Fp2hQDSX4SGk3CY29bDccymkiY=; b=hKd5UC
	vE5ysgzL0JMV7F+x095BF0B3yEJUMVLmVdQOa7x2gp9KQCygft/shzC7vD9r0f4j
	gzJpGhNf9HepQFBdNZ84Eso7zdUIxFYOQPQRx7Wk5SFK+Drsv1uRBVkHTdkFhoGC
	tF8q/9nlrjYve4o88SZALT9q/hXfMFxQbHipgpeikB5k74D7BaxiaLf7urg+rCeP
	dZSmsTS9Tj0ZzL4R4a8iM4LKFwyruI/ukFeHEY9iT2r6JYRJgHHE3Q+rtOm0SqGz
	dcJUI/XGSWYUrqMLMyJEvFbFTGxZdZP71y8IwwCze85q2OSyJip8h+0RHyEQqutB
	3TTg08S26QNWODPQ==
Received: (qmail 3810424 invoked from network); 6 Jul 2024 13:21:45 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:45 +0200
X-UD-Smtp-Session: l3s3148p1@EsGRYpIchoZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 32/60] i2c: mv64xxx: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:32 +0200
Message-ID: <20240706112116.24543-33-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-mv64xxx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index dc160cbc3155..29f94efedf60 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -89,8 +89,8 @@ enum {
 	MV64XXX_I2C_STATE_WAITING_FOR_RESTART,
 	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_1_ACK,
 	MV64XXX_I2C_STATE_WAITING_FOR_ADDR_2_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK,
-	MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA,
+	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK,
+	MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA,
 };
 
 /* Driver actions */
@@ -279,7 +279,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 		} else {
 			drv_data->action = MV64XXX_I2C_ACTION_SEND_DATA;
 			drv_data->state =
-				MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_ACK;
+				MV64XXX_I2C_STATE_WAITING_FOR_TARGET_ACK;
 			drv_data->bytes_left--;
 		}
 		break;
@@ -307,7 +307,7 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
 			drv_data->action = MV64XXX_I2C_ACTION_RCV_DATA;
 			drv_data->bytes_left--;
 		}
-		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_SLAVE_DATA;
+		drv_data->state = MV64XXX_I2C_STATE_WAITING_FOR_TARGET_DATA;
 
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


