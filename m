Return-Path: <linux-i2c+bounces-3255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC828B47F2
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:37:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4FA81F2177A
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D1914A4E9;
	Sat, 27 Apr 2024 20:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HZjJONq+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B51487D3
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250184; cv=none; b=TFkUZutaMWHJ1Aq+X15MrSb+llaN1Euy7zxT6WRnzl5mLnOCBBrNXLtJcwxAxyH6RUrflI0HHdHDp502KNamTi0ZrzKq6Pl0pJ8tw/96TD+MCr1buOwPDN3DcNEa/8SWw2JP6t7F5eY3qUDtdbs55wueSm0gUlEaRB0cXtozISs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250184; c=relaxed/simple;
	bh=GA20x9tiztOUcMRH1FpY/DCyyt7eX+luNbboYOEjcPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iporF/OvRup8vZuD02UKJ4WnDJIOaStkcSYfJWi0Dlhk1cKm9JRVNbWfzQjtush6+D7MTPNtsI66vTJqh9vOA60/TxMFrS9uezYR0PDcp5FDuZ+IDox+EMAitvxpYaBdc/Olv0N0HQP4nt7GYz5FjPwrykEETwOcpFcLpR0kPBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HZjJONq+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=oEViMnEeQh7c6qFI7c71gpMDemDVCP/zHpYArgFPMWA=; b=HZjJON
	q+9hbgCHYqRSse7kQ9X730Juffrh4t3/5Cy9U7md22+oeBwczkNnmU0iXPnGi089
	Xvl/3dfTTfO5krroDEZ30Sqspp0FKDgd/x8R5hw7STXYXYcqtOGQeNiaHAr0rCuO
	jvxGZrCOS+upr2JzYnRQXhPYqpviGBhTaTJ5nGgksefRayCJgnR+Ib2GHybbIdCq
	gVLBt73Zp92rrBjPBH3EH3frfXeGUMsdetHun3/0lKsYbbPcNP77wIw794zdiV8g
	24tNX1GrN+Z3CSS15TMILkmOHUOEhVYrU93d4BYJ+fUm13uOCQK+ldT2e0HEijTv
	KyD6zK3GuHdUMO3w==
Received: (qmail 1781896 invoked from network); 27 Apr 2024 22:36:17 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:17 +0200
X-UD-Smtp-Session: l3s3148p1@l6Lf+BkXps9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] i2c: hix5hd2: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:56 +0200
Message-ID: <20240427203611.3750-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_for_completion_timeout() causing patterns like:

	timeout = wait_for_completion_timeout(...)
	if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
self explaining.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-hix5hd2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 8e75515c3ca4..a47b9939fa2c 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -314,7 +314,7 @@ static void hix5hd2_i2c_message_start(struct hix5hd2_i2c_priv *priv, int stop)
 static int hix5hd2_i2c_xfer_msg(struct hix5hd2_i2c_priv *priv,
 				struct i2c_msg *msgs, int stop)
 {
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	priv->msg = msgs;
@@ -327,9 +327,9 @@ static int hix5hd2_i2c_xfer_msg(struct hix5hd2_i2c_priv *priv,
 	reinit_completion(&priv->msg_complete);
 	hix5hd2_i2c_message_start(priv, stop);
 
-	timeout = wait_for_completion_timeout(&priv->msg_complete,
-					      priv->adap.timeout);
-	if (timeout == 0) {
+	time_left = wait_for_completion_timeout(&priv->msg_complete,
+						priv->adap.timeout);
+	if (time_left == 0) {
 		priv->state = HIX5I2C_STAT_RW_ERR;
 		priv->err = -ETIMEDOUT;
 		dev_warn(priv->dev, "%s timeout=%d\n",
-- 
2.43.0


