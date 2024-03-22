Return-Path: <linux-i2c+bounces-2487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67721886CDF
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23172282174
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A0C47A48;
	Fri, 22 Mar 2024 13:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c/AJNyJA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8037B4654F
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711113997; cv=none; b=eWqxbfXp5DyF3bEO1eTLrp53uZddfWzYluZYcD6ciwuA8MqU5CUIlhlIhvR/1oX/YwnToSUef+J8tNr/lYF60RfKIRq9bmMXaYH5fpmLmZJMVRuqVYzcUUTR+7I2ZCU3ypTmKDTkLHHZjxX4vmgkulamPIDnGUhRssbJJE2RUtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711113997; c=relaxed/simple;
	bh=w5Phmd069KLC2yVdx/Retzyvj1HQN44l5T592JcKHPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtXRIBzFdTXNb+MNXFdAPWzKY+T/38y/JtFlOLIliCqO4aKr/S51iFQR44OhFf8AckpiQ6e7B73n6mOSWKEbrF+TSun/XIIIkKEi1zRnOM/QZ/5svn/03SofPCmoXOzdkeFuULjMars3X2vowwkd8v+jfr5JEWtLfZDvvZdhk7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c/AJNyJA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=qvWF/G6afHnYDj7KH1Olgads4nkNb+hPCV9G17SIDxI=; b=c/AJNy
	JAptAhw77DUsPBzwXEfLOItB0E+WqViqs5IqH8TXTokfQHJNGjWSZAGcmxqBzNys
	Yiqb/2HU1fVmLbQLAi9KcKW2/d3WlW/ctwZRmHSMEz+A0OPdBvv4WOYjtATThv7y
	muDw9CjA19QAHXvw0I5HH1IQIw7GCIKbhiHo8G+f4btH21mC17MCmC3/bF2IZuHz
	fOv4D6dX+ygcUUwV6DtzMZMUB1mRiPAv6yhX4JEm3w38hgbcBtJGZ52ukcmJ84vq
	nxIKabTuUtBKugClXtrD56ngvgbT4hX+TVEx63POvphz8I/XBbOskecS76uEMKWi
	CFCRe4TgZ3Knqu9Q==
Received: (qmail 3870099 invoked from network); 22 Mar 2024 14:26:21 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:21 +0100
X-UD-Smtp-Session: l3s3148p1@cSUDxT8UPpNehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/64] i2c: reword i2c_algorithm according to newest specification
Date: Fri, 22 Mar 2024 14:24:54 +0100
Message-ID: <20240322132619.6389-2-wsa+renesas@sang-engineering.com>
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

Start changing the wording of the I2C main header wrt. the newest I2C
v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
appropriate terms. The first step renames the members of struct
i2c_algorithm. Once all in-tree users are converted, the anonymous union
will go away again. All this work will also pave the way for finally
seperating the monolithic header into more fine-grained headers like
"i2c/clients.h" etc.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 include/linux/i2c.h | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 5e6cd43a6dbd..9acab1d21655 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -548,10 +548,18 @@ struct i2c_algorithm {
 	 * master_xfer should return the number of messages successfully
 	 * processed, or a negative value on error
 	 */
-	int (*master_xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
-			   int num);
-	int (*master_xfer_atomic)(struct i2c_adapter *adap,
+	union {
+		int (*xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
+			    int num);
+		int (*master_xfer)(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				   int num);
+	};
+	union {
+		int (*xfer_atomic)(struct i2c_adapter *adap,
 				   struct i2c_msg *msgs, int num);
+		int (*master_xfer_atomic)(struct i2c_adapter *adap,
+					   struct i2c_msg *msgs, int num);
+	};
 	int (*smbus_xfer)(struct i2c_adapter *adap, u16 addr,
 			  unsigned short flags, char read_write,
 			  u8 command, int size, union i2c_smbus_data *data);
@@ -563,8 +571,14 @@ struct i2c_algorithm {
 	u32 (*functionality)(struct i2c_adapter *adap);
 
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
-	int (*reg_slave)(struct i2c_client *client);
-	int (*unreg_slave)(struct i2c_client *client);
+	union {
+		int (*reg_target)(struct i2c_client *client);
+		int (*reg_slave)(struct i2c_client *client);
+	};
+	union {
+		int (*unreg_target)(struct i2c_client *client);
+		int (*unreg_slave)(struct i2c_client *client);
+	};
 #endif
 };
 
-- 
2.43.0


