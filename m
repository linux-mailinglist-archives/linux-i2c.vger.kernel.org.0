Return-Path: <linux-i2c+bounces-12171-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAEFB1F2AE
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 08:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54EAD1AA772F
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B75279DA9;
	Sat,  9 Aug 2025 06:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="t6ATM8kv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E50279798;
	Sat,  9 Aug 2025 06:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754722486; cv=none; b=Tymbdx73JFoATiVXWjtREY0dMRcP4lMQu5DqyN1/QseLNO6lanDzE/ggQe8ZZs83GH8D8szXWRGPgNEyJv/Bsj6OyNRKRiZkqe3jTO8K1TGMFmYCR2sYPWOmKL2QwTg1IvBe4TqA79T1Nrb4h3GNlJxEOnSG23ezUozHoEsK7k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754722486; c=relaxed/simple;
	bh=ry2mzpIV+ijJMEbOlKoI492sS7VM9xIO8f90/1yC9yU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bdGcrHXgWJTGvqDp+nVsAzriwmiGd6H+zNfpz5TN8cBStMCJfz2WYdu/5Rr6s0/6HWgV4fd5RKhJXqEuH9pUmQfzKObQCIRdQQ6buy4bOlIpct01bwRYZsHdXXaPAU3qWqRWgzIlFW3dT4bPve9OCV3NhmP/aoMrvDMrWGLXFww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=t6ATM8kv; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id F17D72034F;
	Sat,  9 Aug 2025 06:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754722483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=64pSjaKyHfILDigOeA9DX9A3lbnXs3tSMHJP11l669E=;
	b=t6ATM8kvLGf7XKjGL7H+9vAseqd3shmCiZApLfgQ0HR0JEDdfRKmIalCOWT6hx7rF5uYGf
	18uuieXo3BEC2nBfu/4/xs1NJcT8s9Tly9tMgC9vOwMMqWMqtyr4Ko2qGM0X7VivCINETB
	XE6BPoN1uvkd2RWD+BfLhDHyY8NqYrc=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 09 Aug 2025 08:40:58 +0200
Subject: [PATCH i2c-host v4 5/5] i2c: rtl9300: Implement I2C block read and
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250809-i2c-rtl9300-multi-byte-v4-5-d71dd5eb6121@narfation.org>
References: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
In-Reply-To: <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4067; i=sven@narfation.org;
 h=from:subject:message-id; bh=2VvM0c3LAsoRzX49VQFdbGfDq24IIqerJWzXAwSWXG4=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnT3m7o2br72QHjWO8v4scNP0u7cjg1Ze76YnEnNP3gO
 abEsLb2jlIWBjEuBlkxRZY9V/LPb2Z/K/952sejMHNYmUCGMHBxCsBE9kcxMkxnep22+pQJ57rJ
 v8yuv15q/T5HIu/+yqQwLf5txlr/X5UwMnT5Krb936QSKOYcfeP4I+Ws7zabF2YKrqm7W+m4dZW
 7KBcA
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
 drivers/i2c/busses/i2c-rtl9300.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index cfafe089102aa208dde37096d5105d4140278ca9..2ccc139ffbf606ed825042818e1a3edaf06a7b8f 100644
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
@@ -314,6 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
 	       I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 

-- 
2.47.2


