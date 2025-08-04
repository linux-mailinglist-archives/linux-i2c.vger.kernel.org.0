Return-Path: <linux-i2c+bounces-12149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51CB1A97A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 21:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D1CB623570
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 19:19:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A998726FA58;
	Mon,  4 Aug 2025 19:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="MfevM9aj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFBA29117A;
	Mon,  4 Aug 2025 19:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754335091; cv=none; b=JJcPpLEc0r1Zl9M1XDh6IB6apKoX8fx+u4jqlE5Sr64mSneDqOOIWykwtihJn6Vk9LCOPU9eN2gtyC70MbW29YBNazfh0DGPrjYgaFOQp30tKiN3E5YFtbtITJQaY5pklNwcTUIsH21Ygmzh2iIYbW1sb5Dy7vdZKe3VXpue5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754335091; c=relaxed/simple;
	bh=1x+TVFg1EE/G/icLAxbMuHtD3kejMkgtnyrVojEfsxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUyno9VvznIisD3NLS+yn5gz6+ZIxrZKOl3pWvh0WRq6xS/A32P9kFeaLt4BGhv3ztKeqA8lkyMp9JItMaKAvMcbSkIpVreqlZxfdMoSKgVOevE4+OAM5AbtQiLD2QwIcBSgfYAMnNCwh8S4hX9+nEd/MKRtMlt6JcaTN7SMJ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=MfevM9aj; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 402652034F;
	Mon,  4 Aug 2025 19:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754335088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ovzcnQ/xHGgA/gscprR6UDZ8vi5gGtYCjZ76laWNKFw=;
	b=MfevM9ajZMSDO6ynAxHauMF6zCgBqXRCS14SdahXbqnUV3eg5aXUuUnxPo/wqD+TzjCWKM
	85gYUOvK8cEt8I9GdXzc6X1z9pcEUGnjdOnfLSNBx+2s56eSk7rW54IUk6quT+ldn+yb8m
	HmXuwYYZtlYg6c5eMTryuYq29FxRFek=
From: Sven Eckelmann <sven@narfation.org>
Date: Mon, 04 Aug 2025 21:17:04 +0200
Subject: [PATCH v3 5/5] i2c: rtl9300: Implement I2C block read and write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250804-i2c-rtl9300-multi-byte-v3-5-e20607e1b28c@narfation.org>
References: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
In-Reply-To: <20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066; i=sven@narfation.org;
 h=from:subject:message-id; bh=qPUvBuXwx+gCbsn+FKrdc55Ikb834EBPsr9ria12TBc=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBkT2cOrCquuOax/8eXDv9csXZ88Z82/KsRTH/hi3Unnh
 R0cWlZlHaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJfHBn+GcQ3pFmsOhi0rfM
 hZZHjVLMtS/H9j27rsK0dc+80Dm8tZkM/2s8XZwPzdeQqIvQWvp7w3Gte/oHd8zkO5vl/SzNhS3
 WgAsA
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
Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-rtl9300.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 8310675668fdddc9626a5813bee050cc55a61c09..2fa425b141ea394a7c1857d3ccd073b12a187520 100644
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
 
@@ -299,6 +309,25 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
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
@@ -317,6 +346,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
 {
 	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
 	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
 	       I2C_FUNC_SMBUS_BLOCK_DATA;
 }
 

-- 
2.47.2


