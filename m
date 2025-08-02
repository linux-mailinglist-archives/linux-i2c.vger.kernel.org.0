Return-Path: <linux-i2c+bounces-12116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6444AB18E0C
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:42:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336AD1AA22AE
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 10:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B252264B5;
	Sat,  2 Aug 2025 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="ejbwAO4N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD1222068B;
	Sat,  2 Aug 2025 10:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131347; cv=none; b=SEtcFpZt+r+EcGJ/DAsS4x3mpclFjk1+IPd26+Wx1hlUgq1xRlQv21QyBtvFMOtSKXRdtBahfYJsL55Yk6PeKxVK6JsCBCQDOeMeFq7WBbqxgpj5ec6BiTwLRefcTxMYvipqoDa4jtwzABx++TGcGpL6Ri/gohebWOTkJEA1fGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131347; c=relaxed/simple;
	bh=xSUK/j01UG865sOU+RsV5k6Ch4ClwFDItzSTQLmO21c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EQaEzt73DXGYRTZ2l+igeZMmtrbyDSUPuGgn1gd80EhWYZ9MvbKX1IFHn+Opb+K12XjODKZ1zTw7yQ1Z48rOkNACpSxVPY1wIQ/UZyw4PJrdTh6ej4uXsJbwbAhcjE05AKbrQDMSIQdN9rclQ7ATY9DfzBdoxp/RCSYl1zTqcUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=ejbwAO4N; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Received: from sven-desktop.home.narfation.org (unknown [IPv6:2a00:1ca0:1d86:99fc::8c24])
	by dvalin.narfation.org (Postfix) with UTF8SMTPSA id 3CC88203BF;
	Sat,  2 Aug 2025 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754130741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dDLiRoVeRuEyGD5JJcCaUvZvWoRM9yWClaoTfsHbcLs=;
	b=ejbwAO4NWSU6QimuC1fH61DFZMHZxhceEWmN8bFb5687NyqCTyut53h/hSrD3W8+4kwp57
	BXQC1QXoUdFZLqRTmPvY29bHIxyv3N6ETjg9XUoXgoEMf2rZNPTOZeHXE5u9JnvC1d42Dk
	+dRKUtWvnFqyLJ/Sjor5Ki+XDQpAv48=
From: Sven Eckelmann <sven@narfation.org>
Subject: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Date: Sat, 02 Aug 2025 12:31:59 +0200
Message-Id: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB/pjWgC/x3MQQqDMBBA0avIrB0YR8TYqxQXSRzbAbUliaUSv
 LvB5Vv8nyFKUInwqDIE+WnUz1bQ1BX4t91egjoVAxN3ZIhR2WNIy9AS4bovSdEdSVAma5vZken
 ZQ4m/QWb93+PneJ4XsBodQWgAAAA=
X-Change-ID: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c
To: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonas Jelonek <jelonek.jonas@gmail.com>, 
 Harshal Gohel <hg@simonwunderlich.de>, 
 Simon Wunderlich <sw@simonwunderlich.de>, 
 Sven Eckelmann <sven@narfation.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2926; i=sven@narfation.org;
 h=from:subject:message-id; bh=xSUK/j01UG865sOU+RsV5k6Ch4ClwFDItzSTQLmO21c=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBm9L01WLVS7/uThTBe3N95ZVU9+lk4PdJfVSuyd9ZSFe
 6f9u9TXHaUsDGJcDLJiiix7ruSf38z+Vv7ztI9HYeawMoEMYeDiFICJ6HQyMpxnuvUmWtXz8Lst
 q/1rUuUCfLa//PSmOOTnC42dG6W+BnYz/JXaeyUzcKdtSf2Gyeuqss7NK3rO92xTlPKWxMcuC6x
 qDnMCAA==
X-Developer-Key: i=sven@narfation.org; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF

During the integration of the RTL8239 POE chip + its frontend MCU, it was
noticed that multi-byte operations were basically broken in the current
driver.

Tests using SMBus Block Writes showed that the data (after the Wr + Ack
marker) was mixed up on the wire. At first glance, it looked like an
endianness problem. But for transfers were the number of count + data bytes
was not divisible by 4, the last bytes were not looking like an endianness
problem because they were were in the wrong order but not for example 0 -
which would be the case for an endianness problem with 32 bit registers. At
the end, it turned out to be a the way how i2c_write tried to add the bytes
to the send registers.

Each 32 bit register was used similar to a shift register - shifting the
various bytes up the register while the next one is added to the least
significant byte. But the I2C controller expects the first byte of the
tranmission in the least significant byte of the first register. And the
last byte (assuming it is a 16 byte transfer) in the most significant byte
of the fourth register.

While doing these tests, it was also observed that the count byte was
missing from the SMBus Block Writes. The driver just removed them from the
data->block (from the I2C subsystem). But the I2C controller DOES NOT
automatically add this byte - for example by using the configured
transmission length.

The RTL8239 MCU is not actually an SMBus compliant device. Instead, it
expects I2C Block Reads + I2C Block Writes. But according to the already
identified bugs in the driver, it was clear that the I2C controller can
simply be modified to not send the count byte for I2C_SMBUS_I2C_BLOCK_DATA.
The receive part, just needs to write the content of the receive buffer to
the correct position in data->block.

While the on-wire formwat was now correct, reads were still not possible
against the MCU (for the RTL8239 POE chip). It was always timing out
because the 2ms were not enough for sending the read request and then
receiving the 12 byte answer.

These changes were originally submitted to OpenWrt. But there are plans to
migrate OpenWrt to the upstream Linux driver. As result, the pull request
was stopped and the changes were redone against this driver.

Signed-off-by: Sven Eckelmann <sven@narfation.org>
---
Harshal Gohel (2):
      i2c: rtl9300: Fix multi-byte I2C write
      i2c: rtl9300: Implement I2C block read and write

Sven Eckelmann (2):
      i2c: rtl9300: Increase timeout for transfer polling
      i2c: rtl9300: Add missing count byte for SMBus Block Write

 drivers/i2c/busses/i2c-rtl9300.c | 43 +++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)
---
base-commit: b9ddaa95fd283bce7041550ddbbe7e764c477110
change-id: 20250802-i2c-rtl9300-multi-byte-edaa1fb0872c

Best regards,
-- 
Sven Eckelmann <sven@narfation.org>


