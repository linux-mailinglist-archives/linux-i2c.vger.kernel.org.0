Return-Path: <linux-i2c+bounces-12191-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEAAB1F717
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 00:09:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53AFF3AF0AB
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Aug 2025 22:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927A62C3276;
	Sat,  9 Aug 2025 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cSgGVLGe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7B02C15A5;
	Sat,  9 Aug 2025 22:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754777254; cv=none; b=snojtuLTR/njJ+y1puDmWZIsB/lXJP2ls8X4f8m1xnQ2kUuAH6xM42fWcU4K/Osp//47sA8ZcH2O954wm+o4sEW56309coGxWLFYsp5izprbzBUC1QdtIjbMy9AaXyU/h7XuM11AaFMNbTSaH176/dcq6TlCguuxqeWW00La0Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754777254; c=relaxed/simple;
	bh=mTWW1yuPjpkc2uS7XtCgY2pDhOG+KYBfJZEGYpXEYzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DNwR12lVGM7EJk94Ka6gpiMYKPfveF7wHHYfISTYEkDxF18tadedI1RoWTV5xyGbmdxwd9EtH/nw9HP+73VMxpiv2Jq3zriTjMA18z/2q3RKyUMsExSXFRFVm7pM32IUfNdEmsLzLLCyAlH4tn161xlrlnpmgPFKKJVQwupx0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cSgGVLGe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so1866259f8f.2;
        Sat, 09 Aug 2025 15:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754777250; x=1755382050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5xGRv/lBdbHM3fCwC3NEjo77I6iBTwDCL/Z14PcKO4U=;
        b=cSgGVLGe6W7FgN2/31aRNk4qkTPmXZEBXjdpEKQGv3c+WQ+IRW5OtRnF2e9rwjgvKK
         eJeysLQwDXuOWxRJ8tPorbNzgnaFr0UcHo4ryIqF2u+OeDN5Kke7whfZd78bFuR5IqSf
         K4IOeKVbLarYkp6ScvqJoSfitbVPRCI9ZanNwYbEBM0ODHoBXx+N6Qzx2mqIR6LZSsvU
         lcJcmv1g6q0oDYi2SYQglTI4wP7HXOkfbOQDevResMKqgXg1mWRMtfaHBJEIR4nUZKSU
         vaIb0Xn+6ZkL/ZOH7DO/3sRL1iAlrGDUCaLHXWATM8EklPUd0tWK/7kVIk5h3/rbHrPj
         uNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754777250; x=1755382050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5xGRv/lBdbHM3fCwC3NEjo77I6iBTwDCL/Z14PcKO4U=;
        b=Sqz2ExUvJluiNkUqhgxlhbF0azLsm+mhqSI6g/G6Ang/D+DK7sN9SzYMyJHwn5YErQ
         8sGAhC6bBcn3HV+HLQF86MWbC1sibQ4jvf7H7tNjR/XoD1ZBenAZpVrapAGzVleMpf+B
         uAUxALT9oNyXLDa6AEq/m7tJbnuoLbe0FH/hEaDDKl6TLNJXzh3FkZ1ScoHJjGT05eB+
         QoeAcDDrTL4eyawwRmRQLtUveprkTh39IW1wEt0YyOal+y95eoW4wdc1ZKnkj1hbts+4
         IuWTCQFzRm4C4P7C6VPN3IOwWujqU18Pg2Ud4U+LIoLAiUXmGNh2A+0/ZxZlDeKG63EL
         KwQw==
X-Forwarded-Encrypted: i=1; AJvYcCVna+8YcremHVR6n33C6edlMZodLwP0AkH9wFlp9/0otFJK75XEbYLFRP81B5xTqzZWVf+5l5gwgyLw87ft@vger.kernel.org, AJvYcCWd87Npwhd3AjoHcev2jkfkHPpx00u63YyyWOsOIa5rna2jrpcFCHN5looTd+avthkqklstmf+iEVrq@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd3J2cesw5vv3s48Hv5XdtXRdfCfHnaMLQ21iywyqFIGjXl1Ra
	7hweIk1lPlm3phCeGTeUG0IB1UWbMPqeOCwa6pN2JXGc+Qq81gbiOJzc
X-Gm-Gg: ASbGncvgKE5eRdzCspHLsPoT743xPtEW4/H3JJRRcqvQ4+ZwVB2+6pkOPDs+s1MEO1A
	eBkx1sGdPfvmEWMQITNCUG+uGp7Yfe2GKf+aMTFotfBOZccW6ZZukEIR9QpNTkFePzTb1bIMkVF
	aK2YLttPsRdRplk9C/+XOt945EObfyVS9TY5q6vT2cvWvm+qaeJ+Vgu/dA0USrIz1tqhRrSF1RT
	UJhFqSvcs37laYbAi4ydvqFVCKu5NjkX95oWTzYI7/zqnpFksIpWntOCeacAH4wHkd4jbYTU6Ya
	zSEOf/R9gqJPqj8evwNn1SiZy21w6tUswkFFwKinf1Znxy/015Lvn0ziWa9jLscRs0K3FFn/GNb
	X+uvrKvwno/IRX/MoDSW6LheLrUsEC2l2hCc5X2PIiRs9Zr+Feu0Z
X-Google-Smtp-Source: AGHT+IHfRrqdAw9YEbkvpmoKz3MAIH97GoyYgR+iPu629ffODtyDGna3+R5lFpjQsc2CIbkdHngr7g==
X-Received: by 2002:a05:6000:22c4:b0:3b7:93df:39d0 with SMTP id ffacd0b85a97d-3b9009402e9mr8186524f8f.15.1754777249637;
        Sat, 09 Aug 2025 15:07:29 -0700 (PDT)
Received: from builder.. (188-9-142-46.pool.kielnet.net. [46.142.9.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459c58ed0ecsm145592185e9.4.2025.08.09.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 15:07:29 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH v5 09/11] i2c: rtl9300: separate xfer configuration and execution
Date: Sat,  9 Aug 2025 22:07:10 +0000
Message-ID: <20250809220713.1038947-10-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
References: <20250809220713.1038947-1-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, the rtl9300_i2c_smbus_xfer code is quite a mess with function
calls distributed over the whole function setting different values in
different cases. Calls to rtl9300_i2c_config_xfer and
rtl9300_i2c_reg_addr_set are used in every case-block with varying
values whose meaning is not instantly obvious. In some cases, there are
additional calls within these case-blocks doing more things.

This is in general a bad design and especially really bad for
readability and maintainability because it distributes changes or
issues to multiple locations due to the same function being called with
different hardcoded values in different places.

To have a good structure, setting different parameters based on the
desired operation should not be interleaved with applying these
parameters to the hardware registers. Or in different words, the
parameter site should be mixed with the call site.

Thus, separate configuration and execution of an SMBus xfer within
rtl9300_i2c_smbus_xfer to improve readability and maintainability. Add a
new 'struct rtl9300_i2c_xfer' to carry the required parameters for an
xfer which are configured based on the input parameters within a single
switch-case block, without having any function calls within this block.

The function calls to actually apply these values to the hardware
registers then appear below in a single place and just operate on the
passed instance of 'struct rtl9300_i2c_xfer'. These are
'rtl9300_i2c_prepare_xfer' which combines applying all parameters of the
xfer to the corresponding register, and 'rtl9300_i2c_do_xfer' which
actually executes the xfer and does post-processing if needed.

Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
---
 drivers/i2c/busses/i2c-rtl9300.c | 234 +++++++++++++++----------------
 1 file changed, 114 insertions(+), 120 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index 4d3fcb5efc36..73eb35052077 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -8,6 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/unaligned.h>
 
 enum rtl9300_bus_freq {
 	RTL9300_I2C_STD_FREQ,
@@ -71,6 +72,22 @@ struct rtl9300_i2c {
 	struct mutex lock;
 };
 
+enum rtl9300_i2c_xfer_type {
+	RTL9300_I2C_XFER_BYTE,
+	RTL9300_I2C_XFER_WORD,
+	RTL9300_I2C_XFER_BLOCK,
+};
+
+struct rtl9300_i2c_xfer {
+	enum rtl9300_i2c_xfer_type type;
+	u16 dev_addr;
+	u8 reg_addr;
+	u8 reg_addr_len;
+	u8 *data;
+	u8 data_len;
+	bool write;
+};
+
 #define RTL9300_I2C_MST_CTRL1				0x0
 #define RTL9300_I2C_MST_CTRL2				0x4
 #define RTL9300_I2C_MST_DATA_WORD0			0x8
@@ -95,45 +112,37 @@ static int rtl9300_i2c_select_scl(struct rtl9300_i2c *i2c, u8 scl)
 	return regmap_field_write(i2c->fields[F_SCL_SEL], 1);
 }
 
-static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
+static int rtl9300_i2c_config_chan(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan)
 {
 	struct rtl9300_i2c_drv_data *drv_data;
 	int ret;
 
-	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	if (i2c->sda_num == chan->sda_num)
+		return 0;
 
-	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
-				       BIT(chan->sda_num));
+	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
+	drv_data = (struct rtl9300_i2c_drv_data *)device_get_match_data(i2c->dev);
+	ret = drv_data->select_scl(i2c, 0);
 	if (ret)
 		return ret;
 
-	ret = regmap_field_write(i2c->fields[F_SCL_FREQ], chan->bus_freq);
+	ret = regmap_field_update_bits(i2c->fields[F_SDA_SEL], BIT(chan->sda_num),
+				       BIT(chan->sda_num));
 	if (ret)
 		return ret;
 
-	return drv_data->select_scl(i2c, 0);
-}
-
-static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_chan *chan,
-				   u16 addr, u16 len)
-{
-	int ret;
-
-	if (len < 1 || len > 16)
-		return -EINVAL;
-
-	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], addr);
+	ret = regmap_field_write(i2c->fields[F_SDA_OUT_SEL], chan->sda_num);
 	if (ret)
 		return ret;
 
-	return regmap_field_write(i2c->fields[F_DATA_WIDTH], (len - 1) & 0xf);
+	i2c->sda_num = chan->sda_num;
+	return 0;
 }
 
-static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
+static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, u8 len)
 {
 	u32 vals[4] = {};
 	int i, ret;
@@ -153,7 +162,7 @@ static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
 	return 0;
 }
 
-static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
+static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, u8 len)
 {
 	u32 vals[4] = {};
 	int i;
@@ -176,16 +185,51 @@ static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
 	return regmap_write(i2c->regmap, i2c->data_reg, data);
 }
 
-static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
-				    int size, union i2c_smbus_data *data, int len)
+static int rtl9300_i2c_prepare_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_xfer *xfer)
 {
-	u32 val;
 	int ret;
 
-	ret = regmap_field_write(i2c->fields[F_RWOP], read_write == I2C_SMBUS_WRITE);
+	if (xfer->data_len < 1 || xfer->data_len > 16)
+		return -EINVAL;
+
+	ret = regmap_field_write(i2c->fields[F_DEV_ADDR], xfer->dev_addr);
+	if (ret)
+		return ret;
+
+	ret = rtl9300_i2c_reg_addr_set(i2c, xfer->reg_addr, xfer->reg_addr_len);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_RWOP], xfer->write);
+	if (ret)
+		return ret;
+
+	ret = regmap_field_write(i2c->fields[F_DATA_WIDTH], (xfer->data_len - 1) & 0xf);
 	if (ret)
 		return ret;
 
+	if (xfer->write) {
+		switch (xfer->type) {
+		case RTL9300_I2C_XFER_BYTE:
+			ret = rtl9300_i2c_writel(i2c, *xfer->data);
+			break;
+		case RTL9300_I2C_XFER_WORD:
+			ret = rtl9300_i2c_writel(i2c, get_unaligned((const u16 *)xfer->data));
+			break;
+		default:
+			ret = rtl9300_i2c_write(i2c, xfer->data, xfer->data_len);
+			break;
+		}
+	}
+
+	return ret;
+}
+
+static int rtl9300_i2c_do_xfer(struct rtl9300_i2c *i2c, struct rtl9300_i2c_xfer *xfer)
+{
+	u32 val;
+	int ret;
+
 	ret = regmap_field_write(i2c->fields[F_I2C_TRIG], 1);
 	if (ret)
 		return ret;
@@ -200,28 +244,24 @@ static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_write,
 	if (val)
 		return -EIO;
 
-	if (read_write == I2C_SMBUS_READ) {
-		switch (size) {
-		case I2C_SMBUS_BYTE:
-		case I2C_SMBUS_BYTE_DATA:
+	if (!xfer->write) {
+		switch (xfer->type) {
+		case RTL9300_I2C_XFER_BYTE:
 			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
-			data->byte = val & 0xff;
+
+			*xfer->data = val & 0xff;
 			break;
-		case I2C_SMBUS_WORD_DATA:
+		case RTL9300_I2C_XFER_WORD:
 			ret = regmap_read(i2c->regmap, i2c->data_reg, &val);
 			if (ret)
 				return ret;
-			data->word = val & 0xffff;
-			break;
-		case I2C_SMBUS_I2C_BLOCK_DATA:
-			ret = rtl9300_i2c_read(i2c, &data->block[1], len);
-			if (ret)
-				return ret;
+
+			put_unaligned(val & 0xffff, (u16*)xfer->data);
 			break;
 		default:
-			ret = rtl9300_i2c_read(i2c, &data->block[0], len);
+			ret = rtl9300_i2c_read(i2c, xfer->data, xfer->data_len);
 			if (ret)
 				return ret;
 			break;
@@ -237,108 +277,62 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 {
 	struct rtl9300_i2c_chan *chan = i2c_get_adapdata(adap);
 	struct rtl9300_i2c *i2c = chan->i2c;
-	int len = 0, ret;
+	struct rtl9300_i2c_xfer xfer = {0};
+	int ret;
+
+	if (addr > 0x7f)
+		return -EINVAL;
 
 	mutex_lock(&i2c->lock);
-	if (chan->sda_num != i2c->sda_num) {
-		ret = rtl9300_i2c_config_io(i2c, chan);
-		if (ret)
-			goto out_unlock;
-		i2c->sda_num = chan->sda_num;
-	}
+
+	ret = rtl9300_i2c_config_chan(i2c, chan);
+	if (ret)
+		goto out_unlock;
+
+	xfer.dev_addr = addr & 0x7f;
+	xfer.write = (read_write == I2C_SMBUS_WRITE);
+	xfer.reg_addr = command;
+	xfer.reg_addr_len = 1;
 
 	switch (size) {
 	case I2C_SMBUS_BYTE:
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
-			if (ret)
-				goto out_unlock;
-			ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-			if (ret)
-				goto out_unlock;
-		} else {
-			ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
-			if (ret)
-				goto out_unlock;
-			ret = rtl9300_i2c_reg_addr_set(i2c, 0, 0);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = (read_write == I2C_SMBUS_READ) ? &data->byte : &command;
+		xfer.data_len = 1;
+		xfer.reg_addr = 0;
+		xfer.reg_addr_len = 0;
+		xfer.type = RTL9300_I2C_XFER_BYTE;
 		break;
-
 	case I2C_SMBUS_BYTE_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_writel(i2c, data->byte);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = &data->byte;
+		xfer.data_len = 1;
+		xfer.type = RTL9300_I2C_XFER_BYTE;
 		break;
-
 	case I2C_SMBUS_WORD_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, 2);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_writel(i2c, data->word);
-			if (ret)
-				goto out_unlock;
-		}
+		xfer.data = (u8 *)&data->word;
+		xfer.data_len = 2;
+		xfer.type = RTL9300_I2C_XFER_WORD;
 		break;
-
 	case I2C_SMBUS_BLOCK_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0] + 1);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
-			if (ret)
-				goto out_unlock;
-		}
-		len = data->block[0] + 1;
+		xfer.data = &data->block[0];
+		xfer.data_len = data->block[0] + 1;
+		xfer.type = RTL9300_I2C_XFER_BLOCK;
 		break;
-
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
-		if (ret)
-			goto out_unlock;
-		if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX) {
-			ret = -EINVAL;
-			goto out_unlock;
-		}
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
-		if (ret)
-			goto out_unlock;
-		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
-			if (ret)
-				goto out_unlock;
-		}
-		len = data->block[0];
+		xfer.data = &data->block[1];
+		xfer.data_len = data->block[0];
+		xfer.type = RTL9300_I2C_XFER_BLOCK;
 		break;
-
 	default:
 		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
 		ret = -EOPNOTSUPP;
 		goto out_unlock;
 	}
 
-	ret = rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);
+	ret = rtl9300_i2c_prepare_xfer(i2c, &xfer);
+	if (ret)
+		goto out_unlock;
+
+	ret = rtl9300_i2c_do_xfer(i2c, &xfer);
 
 out_unlock:
 	mutex_unlock(&i2c->lock);
-- 
2.48.1


