Return-Path: <linux-i2c+bounces-12114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1D1B18E03
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 855561AA22BD
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 10:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C7E222562;
	Sat,  2 Aug 2025 10:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="ZzaWYyn3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5316E2206B7;
	Sat,  2 Aug 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131347; cv=none; b=JjAncsnK4X8QyACKN7sa07j4NUTIMcP8esSJBxEbSxyULdCw9GyhqKYBjWC8uf38SNZRkX+Tu3VAzfty0owhD+k5KhFrapMPu37xDLnJet55mlQfyzmwPuWhMUjD62vIF3hO6pMpWfzchpM6wanJ6O2hyIayUFwgsZppKgC606k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131347; c=relaxed/simple;
	bh=29F1+RXPw1Dc/x/sjm2BkHuKggNrrD6bpYFT21Gu5Z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S1f0A9WjgtcjJHCxF4mbLfjhF+tB6oawEWFeT3zOWhpiH26wosw0jJNqdu/OYMY4Kdd/MMwgOBAWtW6P/o9MVbnwNKhOacikZRX9Ogg4YaMIQXPHLh+stPPpvjRtfFjUJjCWv99mQpEPT8N65AQj+4DSYYS3hQ050yMJNfSnMX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=ZzaWYyn3; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id A156421799;
	Sat,  2 Aug 2025 10:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754130743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+5xOplr6ovXoGtviwtawCgHS3qIHk1mZlTK35oAHU/o=;
	b=ZzaWYyn3Q5yQmOYY/vgRQEOcnnqL+lYQOJMqd7SvdnoNU6CwhMe3Il7NCVyrQcbkRN1O+h
	JKcEWQKxlpuLZvdgy9n7txRgukiGmx9ZYzV2/igJZAMd48oFkHzJnDf1vHczIVQ2Fpm7rR
	7nCDkcUwFd6vo1ECWcTUlvmGzjNHufI=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 02 Aug 2025 12:32:03 +0200
Subject: [PATCH 4/4] i2c: rtl9300: Implement I2C block read and write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250802-i2c-rtl9300-multi-byte-v1-4-5f687e0098e2@narfation.org>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3814; i=sven@narfation.org;
 h=from:subject:message-id; bh=wU1p33zKAgTDAe62H5t47SqeyXmVfEZJanT+0snjcS8=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBm9L028ed3fBKmcz6uwPMJnligSNbXk6M5Fv2UETutyn
 FGdcXZVRykLgxgXg6yYIsueK/nnN7O/lf887eNRmDmsTCBDGLg4BWAith2MDNdfWSsLGno7Xw/m
 rnzawD9fcJXi8ozuL9K3QlnvPdKp9mb4zX6BtTDNZmdr1azU/u2XS8RfTypcvGZ/XOrhPzsTbwS
 85AYA
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

From: Harshal Gohel <hg@simonwunderlich.de>

It was noticed that the original implementation of SMBus Block Write in the
driver was actually an I2C Block Write. Both differ only in the Count byte
before the actual data:

  S Addr Wr [A] Comm [A] Count [A] Data [A] Data [A] ... [A] Data [A] P

The I2C Block Write is just skipping this Count byte and starts directly
with the data:

  S Addr Wr [A] Comm [A] Data [A] Data [A] ... [A] Data [A] P

The I2C controller of RTL93xx doesn't handle this Count byte special and it
is simply another one of (16 possible) data bytes. Adding support for the
I2C Block Write therefore only requires to skip the count byte (0) in
data->block.

It is similar for reads. The SMBUS Block read is having a Count byte before
the data:

  S Addr Wr [A] Comm [A]
            Sr Addr Rd [A] [Count] A [Data] A [Data] A ... A [Data] NA P

And the I2C Block Read is directly starting with the actual data:

  S Addr Wr [A] Comm [A]
            Sr Addr Rd [A] [Data] A [Data] A ... A [Data] NA P

The I2C controller is also not handling this byte in a special way. It
simply provides every byte after the Rd marker + Ack as part of the 16 byte
receive buffer (registers). The content of this buffer just has to be
copied to the right position in the receive data->block.

Signed-off-by: Harshal Gohel <hg@simonwunderlich.de>
Co-developed-by: Sven Eckelmann <sven@narfation.org>
Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
 drivers/i2c/busses/i2c-rtl9300.c | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index ed82e6c21aaf46000a263740123ffba833578cc2..e136f774fd1a6be03339a3c1b70c1a93a92ee55c 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -186,22 +186,32 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 		return -EIO;
 
 	if (read_write == I2C_SMBUS_READ) {
-		if (size == I2C_SMBUS_BYTE || size == I2C_SMBUS_BYTE_DATA) {
+		switch (size) {
+		case I2C_SMBUS_BYTE:
+		case I2C_SMBUS_BYTE_DATA:
 			ret = regmap_read(i2c->regmap,
 					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
 			if (ret)
 				return ret;
 			data->byte = val & 0xff;
-		} else if (size == I2C_SMBUS_WORD_DATA) {
+			break;
+		case I2C_SMBUS_WORD_DATA:
 			ret = regmap_read(i2c->regmap,
 					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
 			if (ret)
 				return ret;
 			data->word = val & 0xffff;
-		} else {
+			break;
+		case I2C_SMBUS_I2C_BLOCK_DATA:
+			ret = rtl9300_i2c_read(i2c, &data->block[1], len);
+			if (ret)
+				return ret;
+			break;
+		default:
 			ret = rtl9300_i2c_read(i2c, &data->block[0], len);
 			if (ret)
 				return ret;
+			break;
 		}
 	}
 
@@ -295,6 +305,21 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		len = data->block[0];
 		break;
 
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		if (ret)
+			goto out_unlock;
+		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
+		if (ret)
+			goto out_unlock;
+		if (read_write == I2C_SMBUS_WRITE) {
+			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+			if (ret)
+				goto out_unlock;
+		}
+		len = data->block[0];
+		break;
+
 	default:
 		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
 		ret = -EOPNOTSUPP;
@@ -313,6 +338,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
 	       I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 

-- 
2.47.2


