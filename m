Return-Path: <linux-i2c+bounces-13196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CCBA2DC3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 09:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAAF41C03133
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Sep 2025 07:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 261CE288538;
	Fri, 26 Sep 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="STiyJoi+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4A3A945;
	Fri, 26 Sep 2025 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758873200; cv=none; b=hkW4tHiSClMNTPlL4Jf7FlVsrP2rFs655DMrftiun2y1tUXenOgdBoViD58ucxaVN8VhciC/fsmuYvEq917ZS7ImcXYHfyFn45K7cemwukIKIJsXhjstpkBCkaeT6/6TVvTuwAfS7YCaZ/6V8wakNtGAgslqmcQSFVILhnSvsFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758873200; c=relaxed/simple;
	bh=qrRK8wXUsZnyIrDPwfOXhBbE9CLACDDTtz6PlZeVUR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NDGJwFMwNYRJrLeiroAnIWJL5gsE22jNQNBH/r/Hf2BlY7tCwuybHx+2zpnxVK+8njDd6yOtchj7eQZ6lW8wFHmJO3AFBd07I8NhPqjUNk9byl4ZLBUV4lcoxjk9rJxOK5Fc5LhcWW+Wq+Sbr8M90z5cnX3ioGmaVXMdOuPI47s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=STiyJoi+; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: by dvalin.narfation.org (Postfix) id 6CC692037A;
	Fri, 26 Sep 2025 07:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1758873189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cwk6u+R7q1N1glorN0jTU1X4Vd5nriJP3y0+mK0HZAo=;
	b=STiyJoi+e9fKChKbLKEtJwnBmy/JVBMP4CnUzzuOpqc7/F/WGS0KZRbhRATcWDzsKOBa/U
	pRCX2E3I2HGyfSV/sfvr+qhKbRauQ7MGrz1Dh22YB1zv6Cwb6hus+pJaFsImU/wxISC4cN
	bMMGU9OVVY6lBpxTdtJortVWGGCAdrM=
From: Sven Eckelmann <sven@narfation.org>
Date: Fri, 26 Sep 2025 09:52:09 +0200
Subject: [PATCH i2c-host v6] i2c: rtl9300: Implement I2C block read and
 write
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-i2c-rtl9300-multi-byte-v6-1-a2d7d8926105@narfation.org>
X-B4-Tracking: v=1; b=H4sIAChG1mgC/4XQy2rDMBAF0F8JWldlNLZeXfU/ShZ6jBJBagdZN
 QnB/14lK0NturwDc+4wDzZRyTSxj8ODFZrzlMehBfV2YOHshhPxHFtmCCjBAPKMgZd6sR0A//6
 51Mz9vRKn6JxIHozGwNrytVDKtxf8dWz5nKc6lvurZxbP6b/kLDhwmZTRBGAN4efgSnK1Xfg+l
 hN7sjOuqW6XwkZZr72WNhF6tUV1a6rfpbpGEYICTcKjCVtUv6bsLtU3KmoRoySvBIotSq4oAbu
 UbFSINgYH0Wv886tlWX4BmxImXuwBAAA=
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6531; i=sven@narfation.org;
 h=from:subject:message-id; bh=hhBeesjlUQ+OeOYpi4V0jVH8vcGMv7HIYoi+TRMcPw4=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBnX3OwUHL7t+HP6hntW0+ot8TaZ78/ZvG4zFZ49ZXpHQ
 ZpdUqpTRykLgxgXg6yYIsueK/nnN7O/lf887eNRmDmsTCBDGLg4BWAiDxoZ/kcbWXE7LpSW/O/q
 rNBcueToKYkHLTW2mguFriyelHb5OivDPwVbr5bEhmiXpvknzjAs2cOmYG1RaVhwgOm81eqC48m
 OzAA=
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
This patch was already applied [1] but then removed. Instead, only the
chunk

  @@ -314,7 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
   {
          return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
                 I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
  -              I2C_FUNC_SMBUS_BLOCK_DATA;
  +              I2C_FUNC_SMBUS_BLOCK_DATA | I2C_FUNC_SMBUS_I2C_BLOCK;
   }

was added as part of a patch which has nothing to do with
I2C_FUNC_SMBUS_I2C_BLOCK [2] and was never submitted like this [3].

I am therefore resubmitting this patch again without the rtl9300_i2c_func
change.

[1] https://lore.kernel.org/r/a422shurtl3xrvnh2ieynqq2kw5awqnmall2wjdpozx336m26i@54ekftmkwvrv
[2] https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git/commit/?h=i2c/i2c-host&id=ede965fd555ac2536cf651893a998dbfd8e57b86
[3] https://lore.kernel.org/r/20250831100457.3114-4-jelonek.jonas@gmail.com
---
Changes in v6:
- drop all fixes patches (which were already applied)
- drop rtl9300_i2c_func chunk which was incorrectly added by another commit
  [2] (but was not intended to be in there by the original patch [3]
- Link to v5: https://lore.kernel.org/r/20250810-i2c-rtl9300-multi-byte-v5-0-cd9dca0db722@narfation.org

Changes in v5:
- Simplify function/capability registration by using
  I2C_FUNC_SMBUS_I2C_BLOCK, thanks Jonas Jelonek
- Link to v4: https://lore.kernel.org/r/20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org

Changes in v4:
- Provide only "write" examples for "i2c: rtl9300: Fix multi-byte I2C write"
- drop the second initialization of vals in rtl9300_i2c_write() directly in
  the "Fix multi-byte I2C write" fix
- indicate in target branch for each patch in PATCH prefix
- minor commit message cleanups
- Link to v3: https://lore.kernel.org/r/20250804-i2c-rtl9300-multi-byte-v3-0-e20607e1b28c@narfation.org

Changes in v3:
- integrated patch
  https://lore.kernel.org/r/20250615235248.529019-1-alexguo1023@gmail.com
  to avoid conflicts in the I2C_SMBUS_BLOCK_DATA code
- added Fixes and stable@vger.kernel.org to Alex Guo's patch
- added Chris Packham's Reviewed-by/Acked-by
- Link to v2: https://lore.kernel.org/r/20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org

Changes in v2:
- add the missing transfer width and read length increase for the SMBus
  Write/Read
- Link to v1: https://lore.kernel.org/r/20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org
---
 drivers/i2c/busses/i2c-rtl9300.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 9e1f71fed0feac41e1534709de2406c7a63fa9cd..9e623207513718970dc1af82aa8756144a771819 100644
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

---
base-commit: 217f92d91c9faeb6b78bd6205b3585944cbcb433
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


