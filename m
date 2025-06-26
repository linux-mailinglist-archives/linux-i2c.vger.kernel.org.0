Return-Path: <linux-i2c+bounces-11615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC55AEA34D
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 18:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58C971C24F73
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 16:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0305C204592;
	Thu, 26 Jun 2025 16:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="koMlh+GG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A418871F;
	Thu, 26 Jun 2025 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750954554; cv=none; b=m4PMVaz92Zkh7hdKQAdPPtK7qTlRccLNyIU7/EIMi3Fmzsjehn6FVZDTjlsS7P6WYfdiOUdzkAajciiFa2U/GIgUERBDtwa7naG1ug/8tHQ7UOdKcEw4N3aJ2irL3unv9ZRdapVsoZZBJ4aU5A5t/ejiarrDA/BSbCGQStWJ8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750954554; c=relaxed/simple;
	bh=UPQJ9/ySRx9F4mbgx74DfVVygNUzL3PE4kp8RxE//NU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PhJ0+r0Q5MkkG7KdQuIs3Moz8uftiXE9R5htlBTSbxFnboR/9yYW/8UFeCsmOTRih2DF9o44jo6V1imMbka6Z/2ZsvI62ZWk8Xm9OjeA7Ax2irpbbv4nLsHxz4hrzzG46hJ0b4ehnEQPdcJ9CbEjeYKD+Tz46l2N3Iste51nlX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=koMlh+GG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6C0C4CEEB;
	Thu, 26 Jun 2025 16:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750954554;
	bh=UPQJ9/ySRx9F4mbgx74DfVVygNUzL3PE4kp8RxE//NU=;
	h=From:To:Cc:Subject:Date:From;
	b=koMlh+GG8pnpzcrs9A188ovv6igw1vOowrVM5Si6dNUVyjyxM6gx2eQKaXNxgRhfE
	 cmsgMTuESvXtR5UZt/cL6LIlHMRzsJkMRwERrL4QJEsT+r0SkRRUZXP/88aoV0u39k
	 96EXhCTcAKIpZo7qu6PX+og9gcSUBF5s74WUIR68nIpbIDP0UvFNW9kH91VJNnd+Uj
	 o2mHDI0fx5/Aa6tvH08qj9UXARlYY+koX/0q7j8bgxvRT3ItJ+fmROH1Ok4wiZ1gXQ
	 DfpPzqBGuRjvc9lnMQbNv4ZNFIkrP7D8PFjapljtYZmBnAuJLGYrfGSdAcXSk1Qc1P
	 GBx7NycqqPncQ==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: microchip-core: re-fix fake detections w/ i2cdetect
Date: Thu, 26 Jun 2025 17:15:39 +0100
Message-ID: <20250626-unusable-excess-da94ebc218e8@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1799; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=fIvtvwMYYl6tUpwOuz+kFd2uiocO78d237zD4bZ8dPI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmxRdpLdfJMi96+CqsSUPWaoFcxUez17qMBrAvt8vZZb bJUatnTUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIm0L2D4p3D607zEft7PaUvT 3E5ITn6hNuOZbVXOf+mjNV21uy4d3MLwh+PE4n0mP59cvsWy8QbPBz+N+T+3GphLpvfMmPYxSSP DlBUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

Introducing support for smbus re-broke i2cdetect, causing it to detect
devices at every i2c address, just as it did prior to being fixed in
commit 49e1f0fd0d4cb ("i2c: microchip-core: fix "ghost" detections").
This was caused by an oversight, where the new smbus code failed to
check the return value of mchp_corei2c_xfer(). Check it, and propagate
any errors.

Fixes: d6ceb40538263 ("i2c: microchip-corei2c: add smbus support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
- replace "if (ret)" with "if (ret < 0)" because the xfer callback,
  which the smbus code re-uses, can return positive numbers in success
  cases.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-microchip-corei2c.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c
index 492bf4c34722c..7505bce3a06cd 100644
--- a/drivers/i2c/busses/i2c-microchip-corei2c.c
+++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
@@ -435,6 +435,7 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 	u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
 	u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
 	int num_msgs = 1;
+	int ret;
 
 	msgs[CORE_I2C_SMBUS_MSG_WR].addr = addr;
 	msgs[CORE_I2C_SMBUS_MSG_WR].flags = 0;
@@ -506,6 +507,9 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned
 	}
 
 	mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
+	if (ret < 0)
+		return ret;
+
 	if (read_write == I2C_SMBUS_WRITE || size <= I2C_SMBUS_BYTE_DATA)
 		return 0;
 
-- 
2.45.2


