Return-Path: <linux-i2c+bounces-3750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F7B8D7D11
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 10:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1A881C20B66
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA9153804;
	Mon,  3 Jun 2024 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X4wxBFKn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BF524EB30
	for <linux-i2c@vger.kernel.org>; Mon,  3 Jun 2024 08:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.50.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717402367; cv=none; b=Pz41608XDJed+pwXYFJA6AmjDLfmM1O8OBR7aU1AUpeQUidplhYBzc92WDDcjd2UkVGbidGG+fePEHShybutI1DMWX8/Q3I8GLT21c1UWvKYvNVlMQxHLVX2Vycd9Y0M3F1Of99rvJ+hBIFORKfqZSMzGYl/epd/bCIMTlJdJfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717402367; c=relaxed/simple;
	bh=BwZT1qhEW0wWEBSf8ZBijjJL3vLh8Q8tRNYB2KL0W48=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lM8py6qGifounoBfpOnkD9X+QPodKJ+5QhBo7a4avPtIYJ7p2SYrwEv5GYmZ7mcSnQx87VIKuUyjeov9ifNQkaLVCMoLDrqhmIk+VZsAeN8VaHc+IWK+fYL2dXSQGnOjvO/ryboHHrGVq1MD69hze7MpsdIF4bVT0LjV7kmS0M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X4wxBFKn; arc=none smtp.client-ip=45.254.50.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=wz6u1
	fv1qF1PPCtjKxBKuhVJsff46+jrBP2vDPFZrus=; b=X4wxBFKn8x2JmcTKYmzSY
	dkqVEXIC+rE8gwhOjum8kuR2LxlKk6X6cJkeYy3VRLWm65qeWb2bx96pl+OsZiTX
	U3qPjlE/dQFJ+BJFPRwBG2U0raRYgfTJ3YXXbFaSg6Am+ZUrzHA8ACZcNCJadWNF
	zTG95ILM9YTvMabtCqkxxU=
Received: from localhost.localdomain (unknown [39.156.73.13])
	by gzga-smtp-mta-g0-2 (Coremail) with SMTP id _____wD3n9_jel1msyBxGw--.47889S2;
	Mon, 03 Jun 2024 16:12:20 +0800 (CST)
From: guoqi0226 <guoqi0226@163.com>
To: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	guoqi0226 <guoqi0226@163.com>
Subject: [PATCH] i2c: smbus: Fixed uninitialized variable msgbuf in i2c_smbus_xfer_emulated
Date: Mon,  3 Jun 2024 16:12:18 +0800
Message-Id: <20240603081218.3759742-1-guoqi0226@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3n9_jel1msyBxGw--.47889S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7trWfZFyDZw1rKF1UXF17Awb_yoW8Cw4kpa
	y7WrZ8ur1jgF4jv3WrZw1UuFWYgws7ZryUJFZxWwn8ua1DJwsFkryIqFyF9F18Arsag3Wf
	Aayjyay8Aas0yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRLNVgUUUUU=
X-CM-SenderInfo: 5jxr1xaqsslqqrwthudrp/xtbBzgTyaGV4I+guFAAAs8

1. msgbuf1 definition: unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
2. msgbuf1 initial initialization:
   status = __i2c_transfer(adapter, msg, nmsgs);
3. msgbuf1 data return:
   if (read_write == I2C_SMBUS_READ)
	case I2C_SMBUS_BYTE_DATA:
		data->byte = msgbuf1[0];
		break;
	case I2C_SMBUS_WORD_DATA:
	case I2C_SMBUS_PROC_CALL:
		data->word = msgbuf1[0] | (msgbuf1[1] << 8);
		break;

Based on the original logic reference, the following situation is analyzed:

- Under normal circumstances:
  The master device sends data reading action, obtains data through __i2c_transfer and hardware controller driver,
  initializes msfbuf1 data in msg, and returns the obtained data.
- In this case, the I2C secondary device is a pluggable battery
  When the I2C bus is transmitting normally, the slave device is abnormally disconnected (the battery is removed).
  According to the I2C protocol, the entire process cannot receive an ACK, resulting in communication interruption.
  If the I2C controller driver does not do exception handling, __i2c_transfer returns with msbuf1's uninitialized data (random data).

Therefore, when i2c_smbus_xfer_emulated uses the random data of msgbuf1, the back-end data is also abnormal.

Signed-off-by: guoqi0226 <guoqi0226@163.com>
---
 drivers/i2c/i2c-core-smbus.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index e3b96fc..f7b0980d 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -351,6 +351,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
 	bool wants_pec = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
 			  && size != I2C_SMBUS_I2C_BLOCK_DATA);
 
+	memset(msgbuf0, 0, sizeof(msgbuf0));
+	memset(msgbuf1, 0, sizeof(msgbuf1));
 	msgbuf0[0] = command;
 	switch (size) {
 	case I2C_SMBUS_QUICK:
-- 
2.7.4


