Return-Path: <linux-i2c+bounces-12716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F96B47BC3
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 16:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CF117AA54C
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Sep 2025 14:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAFA26FD91;
	Sun,  7 Sep 2025 14:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="CWQr8+g+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp134-31.sina.com.cn (smtp134-31.sina.com.cn [180.149.134.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C59A1EC006
	for <linux-i2c@vger.kernel.org>; Sun,  7 Sep 2025 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=180.149.134.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757254265; cv=none; b=Z6TcadOdVOpI6THDs38ZBLiIyj9/MAAhH8z8ZOB/ic1z3R7OYPh0i/yGmDwea2JeSkO/wONrHEN3hhCuCemGqMTZHYBpVr/dhmtR3A1X3v1NVz9mANw4bqwx/dlWBSxo+Ma/EYYHm4ialBQxpKyRxjc+lQDbjVfLEzRLYqzrjqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757254265; c=relaxed/simple;
	bh=uG1Jkf/u9EMldF97dncH5aRZZNOhTA2dYNcpzI5hMZc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jKQdd5tFc/MySrXdtjoWBWkicxt11VwoPQ0F1xFZlNsBtUhkENQry69YbkDOQHiVqhKVuoUWZX7bQXn5I5CpI5yzR6cqF9IHgisF63NwEr0tFrsSUQnrwfoik97OxE4WTXc1JBI1dEWX1xVLl81gSE1H/VcUAC7H77GrwDhVXtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=CWQr8+g+; arc=none smtp.client-ip=180.149.134.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1757254255;
	bh=9FZz83ytcuXFk2CAxAf/otiWAiJLxGCf4fEcEtIN62E=;
	h=From:Subject:Date:Message-Id;
	b=CWQr8+g+ds7Nq7QzM2JpLZST0nahHiYUG/B2eeHh3mW+wKSDBKBK67Fu1YN4E8/yE
	 aku3rFfd8dkkWZ0XfNxyvqwxTd3DPy0wd9c+laxrzmlYI5lbypY/8t005+0WmwMjXM
	 iNUMn9Xmc/E+eNok9pXr/NHQssWQfh+OwXYsuM1w=
X-SMAIL-HELO: Yoga..
Received: from unknown (HELO Yoga..)([182.100.33.65])
	by sina.com (10.185.250.21) with ESMTP
	id 68BD902900006A34; Sun, 7 Sep 2025 22:01:15 +0800 (CST)
X-Sender: landegao@sina.com
X-Auth-ID: landegao@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=landegao@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=landegao@sina.com
X-SMAIL-MID: 602283408288
X-SMAIL-UIID: 5C638566D76A4FBAAE1C332FAD87E68B-20250907-220115-1
From: Degao Lan <landegao@sina.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Degao Lan <landegao@sina.com>
Subject: [PATCH] i2c: fix comment typo in i2c.h
Date: Sun,  7 Sep 2025 22:01:11 +0800
Message-Id: <20250907140111.40925-1-landegao@sina.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a typo in comment. We should fix this.

Signed-off-by: Degao Lan <landegao@sina.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51..f1136cff0 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -335,7 +335,7 @@ struct i2c_client {
 					/* Must equal I2C_M_TEN below */
 #define I2C_CLIENT_SLAVE	0x20	/* we are the slave */
 #define I2C_CLIENT_HOST_NOTIFY	0x40	/* We want to use I2C host notify */
-#define I2C_CLIENT_WAKE		0x80	/* for board_info; true iff can wake */
+#define I2C_CLIENT_WAKE		0x80	/* for board_info; true if can wake */
 #define I2C_CLIENT_SCCB		0x9000	/* Use Omnivision SCCB protocol */
 					/* Must match I2C_M_STOP|IGNORE_NAK */
 
-- 
2.34.1


