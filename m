Return-Path: <linux-i2c+bounces-2529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E4C886D3E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 776DBB26732
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9900B62A1A;
	Fri, 22 Mar 2024 13:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gu6ckw/j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B9481A5
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114037; cv=none; b=DevGCjO8RKjT/z/txgq5yunxUrn06tezqCNIsHkTq7M4RktU3l9NwmGXVlcQruS5rkXH0kdiKIqDnq+5GJ2rIiJTP7OMp2++oWtAib9aSQonmuuzJJe7+bumYk+uZWTGYL3ImCZCNtndAicVGkVVhnTG/1PjnPjvbyGQ8GmWU1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114037; c=relaxed/simple;
	bh=hrwddtOWhwwpqzStqurX6HURaRQDq+BjbBtzHhWU8Bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VyWAjlo5kD+osW/puq6dX/0rGmjzzZmGVO5Ro5l34pSu/QgB2wVqjVinqr9G5CeDzPy15gp57mfNZo2as43948M+SAAuAdFxYGw/9h0KVLan6xjF75DbBii32DOeJwbaUpjm2WEI7RhvNpy33d2ZDGP1mdQLH7Wrc2iLac2r6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gu6ckw/j; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=8yl6l8CkHfdh1vd7TC3m/0eTvcj1wzr11O3P2GhLYlk=; b=gu6ckw
	/j1sujDiqodFSTHjDoqOUHGPeCyL4rRf6TDUR15YE8Bx+n60+uvG/bVjzECbXKw3
	HgSWA7Rag2IveYUbgNN4x1hMtqMNfORBMSVXV+QwRjL9cmxhc8ARL/wzRkHhOgYt
	QsmoiscxE/zj8O6Hubzg9eKU+IUH1Co3t8/QYlMo3kNWK/ylwB0bLBmoGE3tuiZP
	z1xfxVdkvYAVEFt8Ans04dp9aFSgTNtPNnoJGO989x6DvkKeHCoZhRDyPrEsDc7s
	2zIg3bUAfdhrja5nm7Rebb8jKn9vmyx/tp+F0fmN/QNAR6qGct2bONNaSbnfS7qs
	d9I/d1ig8x+fj6rA==
Received: (qmail 3871579 invoked from network); 22 Mar 2024 14:26:57 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:26:57 +0100
X-UD-Smtp-Session: l3s3148p1@a9wuxz8UkLBehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 44/64] i2c: qup: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:37 +0100
Message-ID: <20240322132619.6389-45-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 598102d16677..2aeb5c33a711 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -380,7 +380,7 @@ static int qup_i2c_poll_state_mask(struct qup_i2c_dev *qup,
 	u32 state;
 
 	/*
-	 * State transition takes 3 AHB clocks cycles + 3 I2C master clock
+	 * State transition takes 3 AHB clocks cycles + 3 I2C host clock
 	 * cycles. So retry once after a 1uS delay.
 	 */
 	do {
@@ -1607,12 +1607,12 @@ static u32 qup_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm qup_i2c_algo = {
-	.master_xfer	= qup_i2c_xfer,
+	.xfer	= qup_i2c_xfer,
 	.functionality	= qup_i2c_func,
 };
 
 static const struct i2c_algorithm qup_i2c_algo_v2 = {
-	.master_xfer	= qup_i2c_xfer_v2,
+	.xfer	= qup_i2c_xfer_v2,
 	.functionality	= qup_i2c_func,
 };
 
-- 
2.43.0


