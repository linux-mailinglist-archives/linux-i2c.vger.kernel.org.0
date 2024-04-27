Return-Path: <linux-i2c+bounces-3251-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7668B47E4
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 22:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB9D1C20BD7
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 20:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9DB914534A;
	Sat, 27 Apr 2024 20:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lY3a4uzf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A57829C
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 20:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714250180; cv=none; b=STt4+7mhPL64yx/dAATPimJEw4Z2s3MO5saEBklBi8e4MFNO3F/8cJGFWSYJpuH8u4hTseZ/Gu9wmP8Wsko63sjTDAjH/oB7yc8n9X4E8L3vxsfu273sBEEG0a12e3YcF1JyMxYdWzNpBa/IDw4E7WqN4OUdMwTpUv6nPFNVqKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714250180; c=relaxed/simple;
	bh=WrCXJ1CR/Fi/XZH8dRI39xCZyW9nwXbeXRXPF7QQjI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZDoPd/xPA10VWOFeL/Ocr7BZxjsbkJMREGVqYUSaJMNC/AFw49SC5TujkOC2l1/EbkWkcN8hRMz3zY/LyYs3/9nDuOTf/mZGDpianSQxySa5lej9dEEzQAQ25zQO89hn1i3ynsZjdEhi1borD4H3Vy1oU0hSUoDO1sqPj3//Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lY3a4uzf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=5CaGINr/VQqkg0HtDZ9KeFK/+9trW1V6dMyw4Bgc270=; b=lY3a4u
	zfld32wfH4WUL8Fm84yFopCDkgAwUrowvJJrQNd5QaqfufIDme8DSb1wMhKQcBtb
	KzzyDsm3FGV/G74PQox/1wqS8Hzl74zYDADALvgzSC5cFjos/By4eJu5b5sW90i/
	vlxQmRI986OUKIjZelr6xYkJY97E+lFH8nClZRlHCgkZvacWvRBkZp3ZTR2uQE+t
	LAgq89wrnzqT7Z4M301GBI4QHVEQN8nkructC2lMlwcdmKVpelFjlLqvZASfau9K
	5jkn0EsKI8jcPEiqvRSaPGPqwqORgEmZ1bSyPGggq79AGk0tknqdxFu1xM7YBujx
	3ud/TAFNGhfIRi8g==
Received: (qmail 1781809 invoked from network); 27 Apr 2024 22:36:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 22:36:14 +0200
X-UD-Smtp-Session: l3s3148p1@YMW1+BkXtI9ehh9l
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/15] i2c: amd-mp2-plat: use 'time_left' variable with wait_for_completion_timeout()
Date: Sat, 27 Apr 2024 22:35:53 +0200
Message-ID: <20240427203611.3750-2-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-amd-mp2-plat.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-plat.c b/drivers/i2c/busses/i2c-amd-mp2-plat.c
index 112fe2bc5662..d3ac1c77a509 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-plat.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-plat.c
@@ -97,17 +97,17 @@ static void i2c_amd_cmd_completion(struct amd_i2c_common *i2c_common)
 static int i2c_amd_check_cmd_completion(struct amd_i2c_dev *i2c_dev)
 {
 	struct amd_i2c_common *i2c_common = &i2c_dev->common;
-	unsigned long timeout;
+	unsigned long time_left;
 
-	timeout = wait_for_completion_timeout(&i2c_dev->cmd_complete,
-					      i2c_dev->adap.timeout);
+	time_left = wait_for_completion_timeout(&i2c_dev->cmd_complete,
+						i2c_dev->adap.timeout);
 
 	if ((i2c_common->reqcmd == i2c_read ||
 	     i2c_common->reqcmd == i2c_write) &&
 	    i2c_common->msg->len > 32)
 		i2c_amd_dma_unmap(i2c_common);
 
-	if (timeout == 0) {
+	if (time_left == 0) {
 		amd_mp2_rw_timeout(i2c_common);
 		return -ETIMEDOUT;
 	}
-- 
2.43.0


