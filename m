Return-Path: <linux-i2c+bounces-3071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 803FD8AE5BE
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 14:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F4931F242FF
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 12:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF00126F32;
	Tue, 23 Apr 2024 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fkPO8oQ7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2059E84DF7
	for <linux-i2c@vger.kernel.org>; Tue, 23 Apr 2024 12:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713874416; cv=none; b=R8AODwvKeRbf7VL6Ue1wj7bn1wvf9NEvWFVHQ5PW5doslOX1G0czp8uenXIDfbNjDIcCBM5Ecb/AiprGx2K1Nr6FQyftVBLRiKlAbEvlTh58vAomOG8YoE4Za5qSa+InDB5EWB+ljCANJNy4Xm4rd0apV4RnwJuSuIFbSY5Swkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713874416; c=relaxed/simple;
	bh=QziFJ4eR9MDTLjiQuJbhBL0X5FR4zAfiumoOpS9k6I4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d9UbJnBpAt8rY7PkTqYTUgkx5QpaDcbq7VrXppU52EA9VqahUmwTsoPJQ/ioWRH5CneFFO7xoSIp6BY+luoGdS7xUuEA6o06XsSf/jsUb2tquyzSufc6eImPsDZUymDhEyKuQzJgla3WonBmMyWf4VWjzo5/1jVXP1J6f2ndfDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fkPO8oQ7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ALUIroL5Av0kBMBvQS1RV7KXY+AGT262FLPxDnV1Shw=; b=fkPO8o
	Q7rcOlTzDXY8qqk7U2qIrnrGr4CGPQIueh03T4tmybAvE2Smxur2HkmXv6sBY5cL
	LiB0j3FfELdsHUeitZocHUc/+4CUZAmzy2ZqTRT8YsZmxCXEn9YPovAgmubTab4Q
	eiuxh8Vbg3ETN2pV3kwtSlAfblTblPy6miVYkR0KGSpY1S/bUJBtCWbXI/6lUo/m
	oJ3OJX6hFYmWPKgZrhsUNaFgGaApkib7UzbA8Gd/LcOr8ednRYQy4T4bt8nnTPBG
	9rcSFAMV/Xfdv158toGlNzaLW6Ra2IVe3bkAyXaubvoA/P2UrOBonHVA3rInSCBa
	ZQCK0J6lkHy5aQog==
Received: (qmail 215894 invoked from network); 23 Apr 2024 14:13:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Apr 2024 14:13:28 +0200
X-UD-Smtp-Session: l3s3148p1@TNhLe8IWRMIgAwDPXxiyACzheF6dGXh7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] i2c: i801: remove printout on handled timeouts
Date: Tue, 23 Apr 2024 14:13:18 +0200
Message-ID: <20240423121322.28460-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
References: <20240423121322.28460-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I2C and SMBus timeouts are not something the user needs to be informed
about on controller level. The client driver may know if that really is
a problem and give more detailed information to the user. The controller
should just pass this information upwards. Remove the printout and turn
the SMBus-specific termination message to debug.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index e577abc776c1..d2d2a6dbe29f 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -399,9 +399,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	 * If the SMBus is still busy, we give up
 	 */
 	if (unlikely(status < 0)) {
-		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
 		/* try to stop the current command */
-		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
 		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		usleep_range(1000, 2000);
 		outb_p(0, SMBHSTCNT(priv));
@@ -410,7 +408,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		status = inb_p(SMBHSTSTS(priv));
 		if ((status & SMBHSTSTS_HOST_BUSY) ||
 		    !(status & SMBHSTSTS_FAILED))
-			dev_err(&priv->pci_dev->dev,
+			dev_dbg(&priv->pci_dev->dev,
 				"Failed terminating the transaction\n");
 		return -ETIMEDOUT;
 	}
-- 
2.43.0


