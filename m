Return-Path: <linux-i2c+bounces-12220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A4FB1FB98
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 20:07:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5133A1899A9E
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 18:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EA5279DAB;
	Sun, 10 Aug 2025 18:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="m/dUMBp7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A5B279798;
	Sun, 10 Aug 2025 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849186; cv=none; b=Xone5+XLaIhACsCFMXnntuWFiiuHqomtD7KXqwnxQM418/zzBJLK9Xj75kJpy+OBS9RezoQMNNKP+nie45eLI/lHzsNAEixMGaYYsURcIYCKA335BzhhPvDLXtys6e8XRX/faV9pssoF27IOJtsmtZ5c9AyuhMXktU9cCbJPNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849186; c=relaxed/simple;
	bh=ooTLaHmQybwGGge1entEvKAX8SQk8v+ORITWDFz5als=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7TGb35FcrcN4/+1RbfK1KSHtbuJAkENY6a3sBv72U3zOA9XIIfXfeFRwB3dy0JWqL3076MhaHKTGcTGvO2U4QXnyUAcNKY2TKvVQtldLdX3HsLTA6QeK4QSvvUbL42ozuW6MelS0dcxtHECCGznDmYaN6QWyQdN8+GveIy+GLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=m/dUMBp7; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 8E60020019;
	Sun, 10 Aug 2025 18:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754849183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SW0zXfcM4Brk/3nLi6+7vIwA4ZjqI+kW+3oPZQZhzOI=;
	b=m/dUMBp7G9I2F1pV73HSek5Ht7UeBTGruEVNsQ0KgpVNJUDqKPY3f5A7c/najIg5oaZK80
	YvLCMu4hEP5Nw4WmUcRi1q97gfdLc8mcFUwI5kCOKqAs0gQaZSSXVHvaWpJPopeECBwtaI
	mAl7CVHGVTuEi+ippx1KtD4QD7VFUYQ=
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 20:05:17 +0200
Subject: [PATCH i2c-host v5 5/5] i2c: rtl9300: Implement I2C block read and
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-i2c-rtl9300-multi-byte-v5-5-cd9dca0db722@narfation.org>
References: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
In-Reply-To: <20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4114; i=sven@narfation.org;
 h=from:subject:message-id; bh=OTG3ecUJ9kF3MgzJErbZLX8C+EA6bsD6pcX+Od1rdNE=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkz7ncY7orXvCN3b3Z3VkTFUab4eZFpN14WCX1Oea+zZ
 aHD6jzvjlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBEZscw/K92Cde98DJ+8urs
 rRmHdLYru7IZpEcG3uvap8t3aHvKsb0M/90mi6zO4ZvYujcy4sNCCdNpuyKFZeVfntT6v8xko7+
 uLy8A
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
I2C Block Write therefore only requires skipping the count byte (0) in
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index cfafe089102aa208dde37096d5105d4140278ca9..4b215f9a24e6aeb8ff078cfc03a54c7bd9a60c38 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -183,22 +183,32 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
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
 
@@ -296,6 +306,25 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		len = data->block[0] + 1;
 		break;
 
+	case I2C_SMBUS_I2C_BLOCK_DATA:
+		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		if (ret)
+			goto out_unlock;
+		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
+			ret = -EINVAL;
+			goto out_unlock;
+		}
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
@@ -314,7 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
-	       I2C_FUNC_SMBUS_BLOCK_DATA;
+	       I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
 static const struct i2c_algorithm rtl9300_i2c_algo = {

-- 
2.47.2


