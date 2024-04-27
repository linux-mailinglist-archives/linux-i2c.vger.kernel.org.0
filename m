Return-Path: <linux-i2c+bounces-3258-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC08B47F9
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:37:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D60D6B21E20
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C76156C5C;
	Sat, 27 Apr 2024 20:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OZ72CkTE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B923156C6A
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250189; cv=none; b=IeFAOwwquE053zkaBT9OLPKLIUx9VVrpINQ1MAUMlHee9gtSidcWd4CuXoyX1SOmy8PSRWHVdDQMwR+2m5AjqVDifFljNHgHgf8a/DHoV0jBklgIb7ou3GvXboXr1kXWAx2DOGl4gKrbJywlp3dC1DggdnDIQUWR+//U9d5hLrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250189; c=relaxed/simple;
	bh=ZffgLvLA2ct8aLiK6ss8TTRJQX3H7E7IWykoPfEgyUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lL6UiPg2ZhHSzZX5szf+dl2AKIk2q4RKcGrjzOKEvJfdMAVRCS6yBNScmhEINfYQugeCXQKXVLYYaGibjUys2a6b7afit+ZbzhCP43SlNPzVQfl4d322OgYl5Djmou8paDOWSPKhUnP1Q9XRYWeWS9dNEO/hQ3h/jyVbM7lPl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OZ72CkTE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mYFMXe+0a2Lv486QWPuwKd2ikamhuuadZolEfiYMi6k=; b=OZ72Ck
	TERAhl8Xe2RgegXCDutBZrcxPMoIw3MEFtFWCeljqKZZ0KL05IYHCufNLy1bxihR
	oEkTS3wbglGUNKN+cDm9gbsVUD/1QPRIMaMg0VRECPwm9nPACERE+JMvIqN3LwiY
	UJypdqmTeMhUJRcz3JUAW3jeGMqtbhejFbo2LLUu9DU10U05VZFM/UfF8byg3Mx0
	5D0Og+34V+qUXGaPiAk5ICTS+yCaifcaQMLaYdhIvJsvdfPdQD1pYdrSILUMatym
	LTJl1YJKuDoBHhCsPtGIA42wls6Mc66QSqySeWi69XGlec0W+A+DEy59Tz5UuHX0
	FiTHl4RGwsw6ycjw==
Received: (qmail 1781948 invoked from network); 27 Apr 2024 22:36:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:20 +0200
X-UD-Smtp-Session: l3s3148p1@txgG+RkXxM9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/15] i2c: st: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:59 +0200
Message-ID: <20240427203611.3750-8-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-st.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index dbb93394ff94..5e01fe3dbb63 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -647,7 +647,7 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 {
 	struct st_i2c_client *c = &i2c_dev->client;
 	u32 ctl, i2c, it;
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	c->addr		= i2c_8bit_addr_from_msg(msg);
@@ -685,11 +685,11 @@ static int st_i2c_xfer_msg(struct st_i2c_dev *i2c_dev, struct i2c_msg *msg,
 		st_i2c_set_bits(i2c_dev->base + SSC_I2C, SSC_I2C_STRTG);
 	}
 
-	timeout = wait_for_completion_timeout(&i2c_dev->complete,
-			i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->complete,
+						i2c_dev->adap.timeout);
 	ret = c->result;
 
-	if (!timeout)
+	if (!time_left)
 		ret = -ETIMEDOUT;
 
 	i2c = SSC_I2C_STOPG | SSC_I2C_REPSTRTG;
-- 
2.43.0


