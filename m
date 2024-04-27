Return-Path: <linux-i2c+bounces-3263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CE48B4805
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FF24280FC7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF40E15B543;
	Sat, 27 Apr 2024 20:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SQfDD+nq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB5115AD95
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250196; cv=none; b=Gby/aaiWuuWecxNhA1Ma0cQoLsereQODCtkVK9FvuqGCqkjhO5eujPJWJQpd5edgWnFGQhj8jeiv9cVcCdC0vx2HIf571pgAei7TmQWdAu6ADelGd4Zoi0GFIk9J5e33xJSU4zgz299DP22E42Z69SBVn4MzPUyhwweY2Bcjdz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250196; c=relaxed/simple;
	bh=9xH6xQ0iM5hWBrxXUfKOBqLqw+/88LiBx0LmN8wQM+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG7C5o6FlBG6lf3woMlg9MfpAfGNsIqrcvoe4iW2ZY8ZFMEh3YJwj046PpbzIFOW/SKHtHW60R7EKIaUam7OzaFq0tIjPgsYSPvbG8GyVxQk3qSbik5q8TusBvJC7fanklWv+LhY2asUjDxZdsytOKTtKeQ2s0bH80qenl/yE9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SQfDD+nq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=cTlq5+NeurWDjBC43r6sTnS6ae5jK95Gz2jK8PwGMpI=; b=SQfDD+
	nqamKv0HLFYg+o9mTGxdZI99eK8DpiOQXl2bwmqlDEzxaLvDil0CuTKV/f+4K2Hr
	O+FfuoVmtMXuvI5cB3472PyEZmWA6rKaEN66Sr64/Cx/OKbKxTPRDqS4nPPdZVZi
	M1e/O2g+pHDavELKX/Ms800bRXRGkHfgZKIQMhuzox7TmE2MG8eyR3ezOTd6kLDy
	H4r4z+ZotMno2uiIi+cP3T0RlzY7kGWjnFkooO7+mCcx6j3ofkvGPq9ra6vTIOD+
	IVCWx4AKXPZAuUzOf7zlvXp4TfC7r9MjEDtM/SpkCyknsxc+/p4W/76VzenzjwFE
	0Nio/4WWwheNDxnA==
Received: (qmail 1782081 invoked from network); 27 Apr 2024 22:36:24 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:24 +0200
X-UD-Smtp-Session: l3s3148p1@beZD+RkX8M9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] i2c: qcom-geni: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:36:04 +0200
Message-ID: <20240427203611.3750-13-wsa+renesas@sang-engineering.com>
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

Fix to the proper variable type 'unsigned long' while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 090b4846ed62..0a8b95ce35f7 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -586,7 +586,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 {
 	struct dma_slave_config config = {};
 	struct gpi_i2c_config peripheral = {};
-	int i, ret = 0, timeout;
+	int i, ret = 0;
+	unsigned long time_left;
 	dma_addr_t tx_addr, rx_addr;
 	void *tx_buf = NULL, *rx_buf = NULL;
 	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
@@ -629,8 +630,8 @@ static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], i
 
 		dma_async_issue_pending(gi2c->tx_c);
 
-		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
-		if (!timeout)
+		time_left = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+		if (!time_left)
 			gi2c->err = -ETIMEDOUT;
 
 		if (gi2c->err) {
-- 
2.43.0


