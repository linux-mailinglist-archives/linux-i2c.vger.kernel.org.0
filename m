Return-Path: <linux-i2c+bounces-3256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B8D8B47F3
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B08D1C20B49
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4168014D71C;
	Sat, 27 Apr 2024 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="FNRdal9N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261651487E9
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250185; cv=none; b=YVt5z/w3XElO0wW90H//642VeRrFvDB5DnQgHteR8tQVm4BUAyKmQwyws5niwWIUP6kl03EGTAASrGTYwkBBXyuZWNZm6nF/kb/KySnNyMr3tSUQs2m/K2/tDyF36N82yppfK+KKNJ/hz1bmRvWUSOtZ372E/GDZ/4XRKKzO1EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250185; c=relaxed/simple;
	bh=n4hQc5gZqdrk//Rxy2JOXADtiKMOzaMTzzXO1IINnr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYa6UfBhXPrDzQXGFkp6eeP2zUVNdjVbXtSTBkBeXS/p8jWzqybXERmzJcRma23TudOYrAA5G3Jy4j9GYx/gw7T/vbn2RCj4b5ETKwtn9yNAVNNURJ0ywp8ytqngT5d1sMo/eTBb5EjBymLRu8nfXWuqQgaB+q0jqZ19pAe6h9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FNRdal9N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=lgb5SzZOxsbM5nweq0hf5zFbKk9/34W+E/fPoNu8BgM=; b=FNRdal
	9NQ6vzfXBzcTkf+PgQZ1TcO7TXIwlE2qCZcth2/uSaa76PiE6woabAXEq4BcjnQT
	Ob67SFbg8SmjEONMw50ZZ7Xt+rp4mGVb085+TH7Z3l16ZMe7zWwfmzB+u+64DUtH
	kAM/2qBP0dK3Ux1E3tPslg+feGkWQetQSDPPwfeZIhZFCbDrstt9amQ+GWS5SdXt
	e4/rDMN5l3HT5jqJlstfd935xijmv+n9839AYqyD8fOF5UjFNJZChsXrTYyO+lAW
	buIei5S4w89RfPWb/6BX6n4TOGf1EyhKjGzwllDrAnIk6Zj0vWCdiA97hjNdVcSl
	3GBUnGbQ5NLGJOvg==
Received: (qmail 1781911 invoked from network); 27 Apr 2024 22:36:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:18 +0200
X-UD-Smtp-Session: l3s3148p1@Rr/s+BkXts9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] i2c: imx-lpi2c: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:57 +0200
Message-ID: <20240427203611.3750-6-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-imx-lpi2c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 36e8f6196a87..0197786892a2 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -307,11 +307,11 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 
 static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)
 {
-	unsigned long timeout;
+	unsigned long time_left;
 
-	timeout = wait_for_completion_timeout(&lpi2c_imx->complete, HZ);
+	time_left = wait_for_completion_timeout(&lpi2c_imx->complete, HZ);
 
-	return timeout ? 0 : -ETIMEDOUT;
+	return time_left ? 0 : -ETIMEDOUT;
 }
 
 static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
-- 
2.43.0


