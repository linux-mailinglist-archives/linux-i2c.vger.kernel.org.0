Return-Path: <linux-i2c+bounces-3261-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB02F8B4800
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDB301C20BAD
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B84E15AACC;
	Sat, 27 Apr 2024 20:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KlcFqedh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87145158DD5
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250194; cv=none; b=rwaWO1CsmXDxwk2snb6zUuRXF5iQ0RQ1Or1wzmm8hrAZT/9E+FGvt6n7Z8KPD1EGJwHJEd2C886y/Kp8D5Djp2UwbOPGJQKFmadUBThxPOUD7v4mV/u+phaNqA8c9tfupGyHYwVpMLNnxptjOX+sylXScNXiMhJVPs62WWyklcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250194; c=relaxed/simple;
	bh=FtVdbC/U+l3sGLK8ZjsebvbxA/VMSsQcdOcx5l5rRRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5f1EpKMvWyFy/7RAgUuyzKqzD7+qGfxY6BPpPuqe9/4R1wyJiyO133mRXFrJG5Ek2qi/ViAcx5dDWaUluX1VaPi2yOKfAMebazhAtH8GHpEOEyuXC5jQsdYIP9TVebHhYIv86OsC711nbfCK7ZYx+cXg3hDtg85p7oZF0POM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KlcFqedh; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=TosNpVR11Gbh2os3Snnrhjp03ukLw8+MsWgLfBAsKaU=; b=KlcFqe
	dhq+bjZ/SZMwpB56m5o0iNHhDcAfUVEYFwPbIMPH5pvi7snaN65Ktv3yfDxzZA0d
	JlixcTIoAw9LYijnAKEoTLCShCdJgDnZoLr1yt2cCuP9ZHFobBNdjZmHKLVQDDSZ
	yn+qTER3IG2YwggPCkykkbJkUP/0eN6Xoyc8LOKBywrBY2eeaIbMIc2YsFOeW7lA
	jQdySzRISMN+pPJgiSQTX2kI+N/v24cCOrSygJ5CyDqKLBrMEL9bMwQQkCSxvzbD
	H6TU5CctN4oKOHMxaJWNPXhJeD+eToHiYQbtaNG8CqMqwIiThRQdnFY561GHlAKh
	ofYGi2phDhiPaG6A==
Received: (qmail 1782046 invoked from network); 27 Apr 2024 22:36:22 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:22 +0200
X-UD-Smtp-Session: l3s3148p1@wtIq+RkX4M9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] i2c: synquacer: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:36:02 +0200
Message-ID: <20240427203611.3750-11-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-synquacer.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index bbea521b05dd..bf9bcfefa30e 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -311,7 +311,7 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
 				struct i2c_msg *msgs, int num)
 {
 	unsigned char bsr;
-	unsigned long timeout;
+	unsigned long time_left;
 	int ret;
 
 	synquacer_i2c_hw_init(i2c);
@@ -335,9 +335,9 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
 		return ret;
 	}
 
-	timeout = wait_for_completion_timeout(&i2c->completion,
-					msecs_to_jiffies(i2c->timeout_ms));
-	if (timeout == 0) {
+	time_left = wait_for_completion_timeout(&i2c->completion,
+						msecs_to_jiffies(i2c->timeout_ms));
+	if (time_left == 0) {
 		dev_dbg(i2c->dev, "timeout\n");
 		return -EAGAIN;
 	}
-- 
2.43.0


