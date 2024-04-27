Return-Path: <linux-i2c+bounces-3257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC558B47F7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:37:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE28B1C20BAD
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8B5157463;
	Sat, 27 Apr 2024 20:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L3+0fY2u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ADB1487D8
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250188; cv=none; b=WahPYSW+1lKNmaXlf73bS9metth+gcXdlLMOs1TQq8hoA45WTU4UfDuM0umsY6uiN77xyXhjsme2waXKf668/dI0eTuS1esOjqwGjGYnoYJmOUxFf+NlmAGpkou6jwd4OkVGnfJjXQsqrmzX8Yk7HivJ6UIx/wAGyltmzMU3d/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250188; c=relaxed/simple;
	bh=62a58IoiDwdzg1R5YDL7NnQnvuavWO4JwBPh7wx8jzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oc1FCyhVAPtB0YAd6t+pPtqUIjChThqpeoru+QZvH+AZ59l+ZvoVQoxz977SutSNxv8SguDM7tztOy5xuoJ3IDzzeyFs6Iq0Rh+wEJKGsQwhkyfZ/JPerDrW2lTS2LvkYziUy6ZIhIXa+wtrDbsVH5Ov3QV6FmuoYff3fx4fQb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L3+0fY2u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=jQGvpOTQ/PjbdH5046gFtuRjUEd3lekowRVy2kqHuxw=; b=L3+0fY
	2uYQG3EhoYZpe+4Nm3trYbjv5xdSoDowK0mlML3oaSeTLKvLofCRl2QgsHkTCVFL
	Xi4qIO3vXmbTFZzVktEELXmK4wgzC+DVFgxBX9spvuKpHgRPWJgImPsOTHDEImJl
	589uZhyjYbpZKEQm8x3S1YPLTTyh7MDyqQxymNgX3BOFm0AZU51rcPKsNjiAIMyl
	UzNTvSfoyqpSNkT3qrjAO0pRjk2yJgWbuIdCj687oICRtqjYqmvQvynJi/uY5JKx
	Xnlw0ZjaINRgGuV0lAkUJq1pQCHSYTZooBG4pW5xZEejR6WwMPXzJPwsbNpzcRLY
	kihhCbhoroao6qZA==
Received: (qmail 1781932 invoked from network); 27 Apr 2024 22:36:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:19 +0200
X-UD-Smtp-Session: l3s3148p1@NaD5+BkXws9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Vignesh R <vigneshr@ti.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] i2c: omap: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:58 +0200
Message-ID: <20240427203611.3750-7-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-omap.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 36bebef36740..30a5ea282a8b 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -660,7 +660,7 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 			     struct i2c_msg *msg, int stop, bool polling)
 {
 	struct omap_i2c_dev *omap = i2c_get_adapdata(adap);
-	unsigned long timeout;
+	unsigned long time_left;
 	u16 w;
 	int ret;
 
@@ -740,18 +740,18 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	 * into arbitration and we're currently unable to recover from it.
 	 */
 	if (!polling) {
-		timeout = wait_for_completion_timeout(&omap->cmd_complete,
-						      OMAP_I2C_TIMEOUT);
+		time_left = wait_for_completion_timeout(&omap->cmd_complete,
+							OMAP_I2C_TIMEOUT);
 	} else {
 		do {
 			omap_i2c_wait(omap);
 			ret = omap_i2c_xfer_data(omap);
 		} while (ret == -EAGAIN);
 
-		timeout = !ret;
+		time_left = !ret;
 	}
 
-	if (timeout == 0) {
+	if (time_left == 0) {
 		omap_i2c_reset(omap);
 		__omap_i2c_init(omap);
 		return -ETIMEDOUT;
-- 
2.43.0


