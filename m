Return-Path: <linux-i2c+bounces-13228-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A16BA5D20
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 11:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F1A53B585E
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Sep 2025 09:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714D62D7817;
	Sat, 27 Sep 2025 09:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="yOzPFfPC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8761628B51E;
	Sat, 27 Sep 2025 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758966755; cv=none; b=OR4jI++vMtXSOz15WkZBDxfL5ADk5HHU5pzL5AkC6brIh+r2Lv1Oo6z5Km/X/qBH7u/rFivSBqPX2VYP3wI4887yhsLmGk6GxnURYiUxP73GA/t3EU/JYAyDYt2+DLuXilfO4P+L4yABr/r5+UJ5aaBprjOWyKCryyrrMMxflqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758966755; c=relaxed/simple;
	bh=x+RH/ip/P+h8q7ETYQJpzbEz3bdTRz34dJXxPqI7sxc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fwXYL76dSbZOsjFYuBB9nEYZLptMJXgCCXy+SeMDWi94vHfjlgIYsH8P+Fkrl4HVMCNrbue+M0jVvup/DtjmFX3H7K+IttIYDgw+hnOZaThQXOoYIN2F/hvklTqb1Sc1bJHT+iCZVNe02z/XCnldY26riDgCwLadtU10JRfKD0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=yOzPFfPC; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id DD47121913;
	Sat, 27 Sep 2025 09:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758966746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdCBlLeJmYIJQu2+c6/SEaJzaE7s0OC2l8uGU4aE8yQ=;
	b=yOzPFfPCpORaS1sQ0bpxV7H2uoUrj3Ru0dr+o4RQBNEsalJNwxhU1f8aHvUAGvN5VWhF8/
	ePm/NARBPJxfAzNAiAeQ2sddF8Ja6hVsXxZZjcla20avwu41WWD9QPJgHz24s3U7evKtuH
	MGe1vfFguaxvXumYEf+sXBrSjUbDz9Q=
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 27 Sep 2025 11:52:17 +0200
Subject: [PATCH i2c-host v7 2/2] i2c: rtl9300: Implement I2C block read and
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-i2c-rtl9300-multi-byte-v7-2-c0fd0e78b818@narfation.org>
References: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
In-Reply-To: <20250927-i2c-rtl9300-multi-byte-v7-0-c0fd0e78b818@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4308; i=sven@narfation.org;
 h=from:subject:message-id; bh=K2dGS0+NbLJHPMJ7iSZGBxQC8+dX5Z65+NrznVOh5MM=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnXN1/yKUmZaftJp7pyX8SheR+fGBiocS6VVDgSIiNsM
 G/xmWX9HaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJ6OxmZLgs9q3BTumQt2fa
 eoctx2W+6t2at7Hx4AbZE+2PW1cbTFJgZHh/OvZ5mVTwD4HWKBPR6M8C/m+nHN8Uv8wz/uAbNUO
 PQH4A
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
Reviewed-by: Jonas Jelonek <jelonek.jonas@gmail.com>
Tested-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index af991b28e4f83591a3212f7e5cf8137e36a7693a..9e623207513718970dc1af82aa8756144a771819 100644
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
 
@@ -290,6 +300,25 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
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
@@ -307,7 +336,8 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA |
-	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA;
+	       I2C_FUNC_SMBUS_WORD_DATA | I2C_FUNC_SMBUS_BLOCK_DATA |
+	       I2C_FUNC_SMBUS_I2C_BLOCK;
 }
 
 static const struct i2c_algorithm rtl9300_i2c_algo = {

-- 
2.47.3


