Return-Path: <linux-i2c+bounces-9535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD64AA408C2
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 14:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94BD3701647
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Feb 2025 13:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4528E142659;
	Sat, 22 Feb 2025 13:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B0yifpRA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63B13AD38;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740231523; cv=none; b=LZYQKmriYQzuQtZDpVbPcHbL7v0+bEXObuG4wbSFOuyaJwpejdzT6Xs7Wa9pCJhfIfAnaLWKPMpGExT59x8a21o/sL7s31rdvK3gCP/mipN1cOGSESeJQVee3dW1BeuIdC3c7bidshwMFhGxOARll46njzTK4QjWJmQzvDuI5iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740231523; c=relaxed/simple;
	bh=stV9tpnov4yN5EBBC898RB20QY2wQygLqqMwvyDN5Eo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PXHlBMfftRADmbmsyriQDEqqTlTkdwXJOkrBHdlH/eSP56+un4mReRY9KetHV4hDIEadK7jOUH1UkjWYri6Fce/qeb81VQTKro142VNUlkwJgVBhQJx7XfksDJPB9coaj0MK82RpPaDcNiMa6hscMuw5DpuJ8+F+KZWroHfGJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B0yifpRA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63EAAC4CEE8;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740231522;
	bh=stV9tpnov4yN5EBBC898RB20QY2wQygLqqMwvyDN5Eo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B0yifpRAfaIfxTZ/0+9c3+UJ6qN5Dz2MYeH33+yGul4+clHOoYOKj7b62QejMT/8g
	 S2CYW0YgBcPqT15Iel2fnamnYJtolkQujb5QiIQsPTkZdjqLWXT7CU4ksITzjNvJme
	 3d4WC6R1R5DAgSMl2jSpFMrFEJJBtx0cnCv/iiaAk1XbvL4U+/1lDEIgAQ3UBcvPw3
	 njE1qDOjvXAQliL9xTzqGJZOjKRdSCHxoWzDjLva1JB9wYfEweoMyEP4bsx9JsX2qP
	 d6ZJpK0fstVTAsVJaPQsaRyx+bQOaO0r7zTn6AnlWTFK8XsWNWrUJuxSIBDSlNgPIs
	 12puhG4AUFbeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EF4C021B5;
	Sat, 22 Feb 2025 13:38:42 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sat, 22 Feb 2025 13:38:34 +0000
Subject: [PATCH 2/4] i2c: pasemi: Improve error recovery
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250222-pasemi-fixes-v1-2-d7ea33d50c5e@svenpeter.dev>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@svenpeter.dev>, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4391; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=FOQIV4q7QbwGt8D9/MCWC8cZNMpith++DiclVxlmaig=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ/rOyzHXHGYEMRdvvZQdf+b35HAG7jV1fXEBv+3epzBOj
 Pfwu3K+o5SFQYyDQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCRhpmMDGfYv3fz+dwVN3j+
 47OXaKGTUe2hyf/CpdvNZfxfSR8pY2Rk6BTTbD4r61F6tmjvwZU3dq5/MKWRSXnxd41XE9lvpYp
 PZwYA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
Reply-To: sven@svenpeter.dev

From: Hector Martin <marcan@marcan.st>

The hardware (supposedly) has a 25ms timeout for clock stretching
and the driver uses 100ms which should be plenty. The error
reocvery itself is however lacking.

Add handling for all the missing error condition, and better recovery in
pasemi_smb_clear(). Also move the timeout to a #define since it's used
in multiple places now.

Signed-off-by: Hector Martin <marcan@marcan.st>
[sven: adjusted commit message after splitting the commit into two]
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 drivers/i2c/busses/i2c-pasemi-core.c | 70 +++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
index bd128ab2e2eb..770b86b92a10 100644
--- a/drivers/i2c/busses/i2c-pasemi-core.c
+++ b/drivers/i2c/busses/i2c-pasemi-core.c
@@ -52,6 +52,8 @@
 #define CTL_UJM		BIT(8)
 #define CTL_CLK_M	GENMASK(7, 0)
 
+#define TRANSFER_TIMEOUT_MS	100
+
 static inline void reg_write(struct pasemi_smbus *smbus, int reg, int val)
 {
 	dev_dbg(smbus->dev, "smbus write reg %x val %08x\n", reg, val);
@@ -80,23 +82,45 @@ static void pasemi_reset(struct pasemi_smbus *smbus)
 	reinit_completion(&smbus->irq_completion);
 }
 
-static void pasemi_smb_clear(struct pasemi_smbus *smbus)
+static int pasemi_smb_clear(struct pasemi_smbus *smbus)
 {
 	unsigned int status;
+	int timeout = TRANSFER_TIMEOUT_MS;
 
 	status = reg_read(smbus, REG_SMSTA);
+
+	/* First wait for the bus to go idle */
+	while ((status & (SMSTA_XIP | SMSTA_JAM)) && timeout--) {
+		msleep(1);
+		status = reg_read(smbus, REG_SMSTA);
+	}
+
+	if (timeout < 0) {
+		dev_warn(smbus->dev, "Bus is still stuck (status 0x%08x)\n", status);
+		return -EIO;
+	}
+
+	/* If any badness happened or there is data in the FIFOs, reset the FIFOs */
+	if ((status & (SMSTA_MRNE | SMSTA_JMD | SMSTA_MTO | SMSTA_TOM | SMSTA_MTN | SMSTA_MTA)) ||
+		!(status & SMSTA_MTE))
+		pasemi_reset(smbus);
+
+	/* Clear the flags */
 	reg_write(smbus, REG_SMSTA, status);
+
+	return 0;
 }
 
 static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 {
-	int timeout = 100;
+	int timeout = TRANSFER_TIMEOUT_MS;
 	unsigned int status;
 
 	if (smbus->use_irq) {
 		reinit_completion(&smbus->irq_completion);
-		reg_write(smbus, REG_IMASK, SMSTA_XEN | SMSTA_MTN);
-		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(100));
+		/* XEN should be set when a transaction terminates, whether due to error or not */
+		reg_write(smbus, REG_IMASK, SMSTA_XEN);
+		wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(timeout));
 		reg_write(smbus, REG_IMASK, 0);
 		status = reg_read(smbus, REG_SMSTA);
 	} else {
@@ -107,16 +131,36 @@ static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
 		}
 	}
 
-	/* Got NACK? */
-	if (status & SMSTA_MTN)
-		return -ENXIO;
+	/* Controller timeout? */
+	if (status & SMSTA_TOM) {
+		dev_warn(smbus->dev, "Controller timeout, status 0x%08x\n", status);
+		return -EIO;
+	}
 
-	if (timeout < 0) {
-		dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
-		reg_write(smbus, REG_SMSTA, status);
+	/* Peripheral timeout? */
+	if (status & SMSTA_MTO) {
+		dev_warn(smbus->dev, "Peripheral timeout, status 0x%08x\n", status);
 		return -ETIME;
 	}
 
+	/* Still stuck in a transaction? */
+	if (status & SMSTA_XIP) {
+		dev_warn(smbus->dev, "Bus stuck, status 0x%08x\n", status);
+		return -EIO;
+	}
+
+	/* Arbitration loss? */
+	if (status & SMSTA_MTA) {
+		dev_warn(smbus->dev, "Arbitration loss, status 0x%08x\n", status);
+		return -EBUSY;
+	}
+
+	/* Got NACK? */
+	if (status & SMSTA_MTN) {
+		dev_warn(smbus->dev, "NACK, status 0x%08x\n", status);
+		return -ENXIO;
+	}
+
 	/* Clear XEN */
 	reg_write(smbus, REG_SMSTA, SMSTA_XEN);
 
@@ -177,7 +221,8 @@ static int pasemi_i2c_xfer(struct i2c_adapter *adapter,
 	struct pasemi_smbus *smbus = adapter->algo_data;
 	int ret, i;
 
-	pasemi_smb_clear(smbus);
+	if (pasemi_smb_clear(smbus))
+		return -EIO;
 
 	ret = 0;
 
@@ -200,7 +245,8 @@ static int pasemi_smb_xfer(struct i2c_adapter *adapter,
 	addr <<= 1;
 	read_flag = read_write == I2C_SMBUS_READ;
 
-	pasemi_smb_clear(smbus);
+	if (pasemi_smb_clear(smbus))
+		return -EIO;
 
 	switch (size) {
 	case I2C_SMBUS_QUICK:

-- 
2.34.1



