Return-Path: <linux-i2c+bounces-4692-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 894ED929302
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAF521C20F34
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CCE14D452;
	Sat,  6 Jul 2024 11:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="TfUmRLTM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1EE149DEE
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264917; cv=none; b=e3zhoBHlenj5Hr8kpMm373gU2CKoimo+v0s3A3zjl6/BNlkvitmr/LsACY9aGxcRpzBd6t49bS9+Fnel4p3qkQfXc3nM0lh0BH5QcwRx4cfZAFshfPmH5GJF2jwXKoDpCC3Ms0A+M/NIBJMXepfR/KTb4nMAMDM4lqHMHEXdehM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264917; c=relaxed/simple;
	bh=WhEB32QR5+vdGbvGdgr3ulOt2WUVoQ3ffFanTD/1Jfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0401q7RBur3Pg0AXlb6KDzoYZkx6F01kq68JxmAb6QMR9K30uy3Cv/cEaspAK+q+SrIKm8iOpUMkbJqWEeu0vXX0zR/OBoa3Xt7b9dTcK+pr/rvZ4KeZz4Wnuh0vQ8c7OAyJ0l9fhuoh97HADfM/PSbXrDXaKxmV18z+B4sDFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=TfUmRLTM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=SUv9JzPme2t2ffHT1WQETFl0fRpIq23L/uCConbVk74=; b=TfUmRL
	TMcxkA3B5h7c0w1f7WC7ZMoTodBusywCSAmpn6EBIfkDhKr3XYFbZSUPw0FLcSQS
	uiFC9Qxr9+xSogAxd2GkLo6Lmfukzj55bf6wXakgvPvRKVngH+J5WV9a4g1qde2f
	5TiSxh3sotHmt/7KiJWrKV/ZL6Gufb9SCjmQZurBZT0GLTrvuqIr4Gs2psCJSe3b
	mZiGSi+RJdWk+S9lkUTpjO+DjC1u6VG8C+UAWAb50RyJMLQPQidBijoeGUN6k+ST
	ZvqEdo+imf407W0nxG5eVZG+Kfl9+f8tx8ferqbcdL0W3GTSmMI6D85Zo4j6kZZ/
	irJsNYFrzdMIXFDA==
Received: (qmail 3810210 invoked from network); 6 Jul 2024 13:21:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:40 +0200
X-UD-Smtp-Session: l3s3148p1@ovlPYpIcXoZQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 26/60] i2c: ljca: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:26 +0200
Message-ID: <20240706112116.24543-27-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-ljca.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index b4927622177c..0b70621cf9d3 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -76,7 +76,7 @@ static int ljca_i2c_init(struct ljca_i2c_dev *ljca_i2c, u8 id)
 	return ret < 0 ? ret : 0;
 }
 
-static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
+static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 target_addr,
 			  enum ljca_xfer_type type)
 {
 	struct ljca_i2c_rw_packet *w_packet =
@@ -88,7 +88,7 @@ static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
 
 	w_packet->id = ljca_i2c->i2c_info->id;
 	w_packet->len = cpu_to_le16(sizeof(*w_packet->data));
-	w_packet->data[0] = (slave_addr << 1) | type;
+	w_packet->data[0] = (target_addr << 1) | type;
 
 	ret = ljca_transfer(ljca_i2c->ljca, LJCA_I2C_START, (u8 *)w_packet,
 			    struct_size(w_packet, data, 1), (u8 *)r_packet,
@@ -107,7 +107,7 @@ static int ljca_i2c_start(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
 	return 0;
 }
 
-static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr)
+static void ljca_i2c_stop(struct ljca_i2c_dev *ljca_i2c, u8 target_addr)
 {
 	struct ljca_i2c_rw_packet *w_packet =
 			(struct ljca_i2c_rw_packet *)ljca_i2c->obuf;
@@ -169,16 +169,16 @@ static int ljca_i2c_pure_read(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
 	return 0;
 }
 
-static int ljca_i2c_read(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr, u8 *data,
+static int ljca_i2c_read(struct ljca_i2c_dev *ljca_i2c, u8 target_addr, u8 *data,
 			 u8 len)
 {
 	int ret;
 
-	ret = ljca_i2c_start(ljca_i2c, slave_addr, LJCA_I2C_READ_XFER_TYPE);
+	ret = ljca_i2c_start(ljca_i2c, target_addr, LJCA_I2C_READ_XFER_TYPE);
 	if (!ret)
 		ret = ljca_i2c_pure_read(ljca_i2c, data, len);
 
-	ljca_i2c_stop(ljca_i2c, slave_addr);
+	ljca_i2c_stop(ljca_i2c, target_addr);
 
 	return ret;
 }
@@ -213,16 +213,16 @@ static int ljca_i2c_pure_write(struct ljca_i2c_dev *ljca_i2c, u8 *data, u8 len)
 	return 0;
 }
 
-static int ljca_i2c_write(struct ljca_i2c_dev *ljca_i2c, u8 slave_addr,
+static int ljca_i2c_write(struct ljca_i2c_dev *ljca_i2c, u8 target_addr,
 			  u8 *data, u8 len)
 {
 	int ret;
 
-	ret = ljca_i2c_start(ljca_i2c, slave_addr, LJCA_I2C_WRITE_XFER_TYPE);
+	ret = ljca_i2c_start(ljca_i2c, target_addr, LJCA_I2C_WRITE_XFER_TYPE);
 	if (!ret)
 		ret = ljca_i2c_pure_write(ljca_i2c, data, len);
 
-	ljca_i2c_stop(ljca_i2c, slave_addr);
+	ljca_i2c_stop(ljca_i2c, target_addr);
 
 	return ret;
 }
@@ -266,7 +266,7 @@ static const struct i2c_adapter_quirks ljca_i2c_quirks = {
 };
 
 static const struct i2c_algorithm ljca_i2c_algo = {
-	.master_xfer = ljca_i2c_xfer,
+	.xfer = ljca_i2c_xfer,
 	.functionality = ljca_i2c_func,
 };
 
-- 
2.43.0


