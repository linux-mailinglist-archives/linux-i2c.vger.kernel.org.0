Return-Path: <linux-i2c+bounces-2856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A1B89F0A2
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 13:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D60BB1C2196D
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Apr 2024 11:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB38715B14C;
	Wed, 10 Apr 2024 11:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lWenHIyt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA915A480
	for <linux-i2c@vger.kernel.org>; Wed, 10 Apr 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712748314; cv=none; b=f2zNAI9ay4RPWsfqcmFOokfolNNehqPXZtBFHsnIrL3TZsbhey/opxkmUrzcP+u3e69tjrpmysAJz7vNzou2ZZ+HvI4gUSqFem7cschfqaxxedr1QpDkBciutHjE6W6UyqUaCrFgoe1GexVjOCOjzUC6vBnpmhr+PGrEKdWthAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712748314; c=relaxed/simple;
	bh=LuYiLQYpXnLNQ7RViJwM96fp2OtM5TMOTmCzc8ieNjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pl/dvx4HgBH4/XGEjE4HvoU7vnVREN1BsltFxOSiQnfqTzzMT0nmMpBQ8kiAhI5JMSm2WicJTt+CcGRxHl3RlUFprd0gMifrCZoKekZk5cVUFEabn1/V7FR9mLzkBCyu/FtcRIfGvQhHkTWaVKBjYZdmg01TSbeFJ4BDftFn378=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lWenHIyt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=q5jkr9/WM9vH86xqE+ltTHo/KtY4HZuCeBtACkBfJFo=; b=lWenHI
	ytoeCjSQDSkx0iz1ocAdTupCRi3QvuCSWs9BjyFctMM7jbinxlmB0DDLVZ9IVdTC
	WJB2GPpFINtxSKOmuUGqhtoEOoji6KndgfHhIzarj1T8MVueDYlCXOxU/6I6yDYI
	ENtPl0mMrV/KL2nBY+z6njeFHn0i3HjdxgF2qPbf/R6nWDfvGgNuYBxd5XVr71cq
	JCCZpi75etxa5d5Bjy22TX8uN0H0z6JH0bYEDST3X7BPuh/zh3Uk+93Jn+vMy/YH
	XcZDocjV5wMEQRh1xnYWA91DZFo3elBiSVsFEXtIXI3K9E+abOQVoL4959teXxNx
	UHyGT3gkagV/b/Jg==
Received: (qmail 521490 invoked from network); 10 Apr 2024 13:25:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2024 13:25:04 +0200
X-UD-Smtp-Session: l3s3148p1@sBY6SrwV/yZtKPEL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/18] i2c: davinci: remove printout on handled timeouts
Date: Wed, 10 Apr 2024 13:24:19 +0200
Message-ID: <20240410112418.6400-25-wsa+renesas@sang-engineering.com>
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
should just pass this information upwards. Remove the printout.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-davinci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 02b3b1160fb0..7ae611120cfa 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -489,7 +489,6 @@ i2c_davinci_xfer_msg(struct i2c_adapter *adap, struct i2c_msg *msg, int stop)
 	time_left = wait_for_completion_timeout(&dev->cmd_complete,
 						dev->adapter.timeout);
 	if (!time_left) {
-		dev_err(dev->dev, "controller timed out\n");
 		i2c_recover_bus(adap);
 		dev->buf_len = 0;
 		return -ETIMEDOUT;
-- 
2.43.0


