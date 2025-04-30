Return-Path: <linux-i2c+bounces-10686-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B10B0AA49BC
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 13:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2681B1C01D91
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 11:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78A5238171;
	Wed, 30 Apr 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7UvqYa2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A190420C00C;
	Wed, 30 Apr 2025 11:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012238; cv=none; b=ppPTm7Xl5YgzBA7a2kQMYp7kAbgJ6nfivoYfX/FGi5iCjVe4xcN8byr12oO+LTCLhjnm1O8A1pRoawdaS1kdv6NMSgWkz9MZzPQse7TugKUgvPNM6hWEYiDFUe7Mv0qWkCnh/RsY/aiZJZVq1ioqUekd4jLXzKUIJgCa5H63JwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012238; c=relaxed/simple;
	bh=+cKJuVrv6mu3F3XLqTDdTVwEQs3UEVa20t8ObcadCjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrXFcPg+HwVEc2alcwXSO0ywciQdT89r2+jJRxvijdTR/RAI62rwmZm7izyG/JDaH96gx+HZnX9TC1mcvFhKhgiFzMtHCT7MjUm53DjaLIFOSgPcgEN/DjuYowKQcSxPPRUrjfbE4xNmfQuK2lYq3pS1cjSTNsobzjufQ5uhyqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7UvqYa2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B2A2C4CEE9;
	Wed, 30 Apr 2025 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746012238;
	bh=+cKJuVrv6mu3F3XLqTDdTVwEQs3UEVa20t8ObcadCjM=;
	h=From:To:Cc:Subject:Date:From;
	b=V7UvqYa2MSiQwq9FPpQl+b7Nv7EFIUHbAJ6aJh/UfmpGtZ8v8HcLFDwipz/dKHoTQ
	 yyDg/K+e3LbnOruu9DfVC67mFaA+FKzKWyzcpVfsBtcFfSH+yXLAL/4vXCavZTOvBk
	 UHlYZvwvhSdZE45CnXQnuXEoDFexAmsVsd5c6IOoTSfVu7tDgksy3p04k80DmxRNvS
	 Cy67146zBy+aSMPXIxVtQAmbZmd8aGxnfY5HHk4blaPmI+1v+HCjKjJxV6fy2OU+dX
	 Tdd+ZgHZ/3JP84B9mPUufNiZiSfBbHoxGoyKA+k26Psfj5l43yCEh8m6pmuwvGpDKX
	 pMDE85+ZfW99w==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] i2c: microchip-corei2c: add smbus support
Date: Wed, 30 Apr 2025 12:23:39 +0100
Message-ID: <20250430-preview-dormitory-85191523283d@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2Hmg/cLZzXgULghrfpO4UhHKZF4LEVjUpZ6KOXOTqJ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlCHNb5TPltNvxzF3zbsMBtodaGk/69clmnBdsfsgsmi WWYborpKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwER4oxn+yj587HfzViRj3bJc VUvtjet+cm2Z/s/k3MyyVI3drVsY/jL8z7Fdv/4EQ8Yvh9q78sfi1SbMM3HbIKj5u/fDkbneU6T vMQMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>

In this driver the supported SMBUS commands are smbus_quick,
smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.

Signed-off-by: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
smbus block read is not tested, due to lack of hardware, but is supported
by the controller, although we have tested smbus i2c block read.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 102 +++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 5db73429125c0..492bf4c34722c 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -76,6 +76,8 @@
 #define CORE_I2C_FREQ		(0x14)
 #define CORE_I2C_GLITCHREG	(0x18)
 #define CORE_I2C_SLAVE1_ADDR	(0x1c)
+#define CORE_I2C_SMBUS_MSG_WR	(0x0)
+#define CORE_I2C_SMBUS_MSG_RD	(0x1)
 
 #define PCLK_DIV_960	(CTRL_CR2)
 #define PCLK_DIV_256	(0)
@@ -424,9 +426,109 @@ static u32 mchp_corei2c_func(struct i2c_adapter *adap)
 	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
 }
 
+static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned short flags,
+				   char read_write, u8 command,
+				   int size, union i2c_smbus_data *data)
+{
+	struct i2c_msg msgs[2];
+	struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
+	u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
+	u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
+	int num_msgs = 1;
+
+	msgs[CORE_I2C_SMBUS_MSG_WR].addr = addr;
+	msgs[CORE_I2C_SMBUS_MSG_WR].flags = 0;
+
+	if (read_write == I2C_SMBUS_READ && size <= I2C_SMBUS_BYTE)
+		msgs[CORE_I2C_SMBUS_MSG_WR].flags = I2C_M_RD;
+
+	if (read_write == I2C_SMBUS_WRITE && size <= I2C_SMBUS_WORD_DATA)
+		msgs[CORE_I2C_SMBUS_MSG_WR].len = size;
+
+	if (read_write == I2C_SMBUS_WRITE && size > I2C_SMBUS_BYTE) {
+		msgs[CORE_I2C_SMBUS_MSG_WR].buf = tx_buf;
+		msgs[CORE_I2C_SMBUS_MSG_WR].buf[0] = command;
+	}
+
+	if (read_write == I2C_SMBUS_READ && size >= I2C_SMBUS_BYTE_DATA) {
+		msgs[CORE_I2C_SMBUS_MSG_WR].buf = tx_buf;
+		msgs[CORE_I2C_SMBUS_MSG_WR].buf[0] = command;
+		msgs[CORE_I2C_SMBUS_MSG_RD].addr = addr;
+		msgs[CORE_I2C_SMBUS_MSG_RD].flags = I2C_M_RD;
+		num_msgs = 2;
+	}
+
+	if (read_write == I2C_SMBUS_READ && size > I2C_SMBUS_QUICK)
+		msgs[CORE_I2C_SMBUS_MSG_WR].len = 1;
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		msgs[CORE_I2C_SMBUS_MSG_WR].buf = NULL;
+		return 0;
+	case I2C_SMBUS_BYTE:
+		if (read_write == I2C_SMBUS_WRITE)
+			msgs[CORE_I2C_SMBUS_MSG_WR].buf = &command;
+		else
+			msgs[CORE_I2C_SMBUS_MSG_WR].buf = &data->byte;
+		break;
+	case I2C_SMBUS_BYTE_DATA:
+		if (read_write == I2C_SMBUS_WRITE) {
+			msgs[CORE_I2C_SMBUS_MSG_WR].buf[1] = data->byte;
+		} else {
+			msgs[CORE_I2C_SMBUS_MSG_RD].len = size - 1;
+			msgs[CORE_I2C_SMBUS_MSG_RD].buf = &data->byte;
+		}
+		break;
+	case I2C_SMBUS_WORD_DATA:
+		if (read_write == I2C_SMBUS_WRITE) {
+			msgs[CORE_I2C_SMBUS_MSG_WR].buf[1] = data->word & 0xFF;
+			msgs[CORE_I2C_SMBUS_MSG_WR].buf[2] = (data->word >> 8) & 0xFF;
+		} else {
+			msgs[CORE_I2C_SMBUS_MSG_RD].len = size - 1;
+			msgs[CORE_I2C_SMBUS_MSG_RD].buf = rx_buf;
+		}
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		if (read_write == I2C_SMBUS_WRITE) {
+			int data_len;
+
+			data_len = data->block[0];
+			msgs[CORE_I2C_SMBUS_MSG_WR].len = data_len + 2;
+			for (int i = 0; i <= data_len; i++)
+				msgs[CORE_I2C_SMBUS_MSG_WR].buf[i + 1] = data->block[i];
+		} else {
+			msgs[CORE_I2C_SMBUS_MSG_RD].len = I2C_SMBUS_BLOCK_MAX + 1;
+			msgs[CORE_I2C_SMBUS_MSG_RD].buf = rx_buf;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	if (read_write == I2C_SMBUS_WRITE || size <= I2C_SMBUS_BYTE_DATA)
+		return 0;
+
+	switch (size) {
+	case I2C_SMBUS_WORD_DATA:
+		data->word = (rx_buf[0] | (rx_buf[1] << 8));
+		break;
+	case I2C_SMBUS_BLOCK_DATA:
+		if (rx_buf[0] > I2C_SMBUS_BLOCK_MAX)
+			rx_buf[0] = I2C_SMBUS_BLOCK_MAX;
+		/* As per protocol first member of block is size of the block. */
+		for (int i = 0; i <= rx_buf[0]; i++)
+			data->block[i] = rx_buf[i];
+		break;
+	}
+
+	return 0;
+}
+
 static const struct i2c_algorithm mchp_corei2c_algo = {
 	.master_xfer = mchp_corei2c_xfer,
 	.functionality = mchp_corei2c_func,
+	.smbus_xfer = mchp_corei2c_smbus_xfer,
 };
 
 static int mchp_corei2c_probe(struct platform_device *pdev)
-- 
2.45.2


