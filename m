Return-Path: <linux-i2c+bounces-2857-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4B889F0A3
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:26:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2701F22A11
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4918E1598F7;
	Wed, 10 Apr 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RenlmC1L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7BC15B0EE
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748315; cv=none; b=cXXfubS40fhk8VFNZBfFW5yHu9bKwBtQ1YSoa1kmfu+i6fkJ/l5nrIHmxxf9CPbbhW+mV+4tHhwQgbgxIajOge6wPcTQCQWo0/+CHZ0xbNvfM8ZRoKn7qo+yTWh8u7YIKLtrmytSH2GxU1FvZAonsP03Y/y8fhZlBWfe+D6+FL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748315; c=relaxed/simple;
	bh=YcRydtjXNLVuXa4H/6WF5MRtX2A+FlVhs2A96BKY3U4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FPZu3Ff5WSIiSZlUEJgPs9UxAiNzTdL+UxxN8bY/nvelEewm/O6nqli4OEtjCCn7LtaWiuA1RJLFaUrHbLiBfLcSatTrJhBgamQr8lH19hrOwKOtUR6NEMiFv/TXdah35CoAMvZ/9N2OZCyTzHwrD14UX1QeFwq2GP7msRbfgVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RenlmC1L; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=KtqWGbx2zAusZTYwsY4cWx/AjOyEcwI/aftE7eByqLo=; b=RenlmC
	1LB35XLh8+w9chF68T65rl7eY0yq78VMEN87td+UQGkXO5ydB5cHoWZ64cShv8U1
	TOFXT/7A84131Ihj6rsOK9/hdxTYfR2c6pWS/7G/KAHkxwxNPnuCZ6pK5d7zBpbK
	hUGeZ16mTryaKpScltBUeXsq2x2tqDK2woO4MyV973pDCV/XudPplTS3MxMB41yH
	SbTpEALhyyZGkNZt2IZiJ6JF90HcUCDJ2ltbdD/kSLLWaawGjQOdJo/eFws68GRu
	BB9ymH0YIb5ncxvS7NB4XHQAcC355JZkxR9GDwT0U1/HwtopFb/YUjVwVelz8ToY
	Ygz5n4lJTITDERhA==
Received: (qmail 521532 invoked from network); 10 Apr 2024 13:25:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:05 +0200
X-UD-Smtp-Session: l3s3148p1@rkBOSrwVtFFtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/18] i2c: i801: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:20 +0200
Message-ID: <20240410112418.6400-26-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
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
should just pass this information upwards. Turn all timeout related
printouts to debug level.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Here, I did not delete the printout to support checking the termination
process. The other drivers in this series do not have this SMBus
specific termination step.

 drivers/i2c/busses/i2c-i801.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4294c0c63cef..a42b5152f9bd 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -400,7 +400,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	 * If the SMBus is still busy, we give up
 	 */
 	if (unlikely(status < 0)) {
-		dev_err(&priv->pci_dev->dev, "Transaction timeout\n");
+		dev_dbg(&priv->pci_dev->dev, "Transaction timeout\n");
 		/* try to stop the current command */
 		dev_dbg(&priv->pci_dev->dev, "Terminating the current operation\n");
 		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
@@ -411,7 +411,7 @@ static int i801_check_post(struct i801_priv *priv, int status)
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


