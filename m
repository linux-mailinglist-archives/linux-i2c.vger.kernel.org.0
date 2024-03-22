Return-Path: <linux-i2c+bounces-2535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83740886D51
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B34D91C24E23
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8394E64A9F;
	Fri, 22 Mar 2024 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CqkWjw9V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70863121
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114044; cv=none; b=ejy79bYc+rp3FM1LP2IwUo+R4ca9/I5XbaISaRdQAu9PPildZXzbZOI9YnAz3btxk7GDHkF9zAv5iwrAjh+yZfQ4NTE6ZpbAwoePveHigzVdACMMJ9PNqdJRdk/xA5a7I+QVHk00grM0ZRQKcjAgRnPcdkumeHChsSnVAmtKBW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114044; c=relaxed/simple;
	bh=gSJCKAfsXYEX11Ce8qfxfrsskafXE1oEiD5eqfxB7XU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rqxU3pe/gRsNLPuKuzHPEvPL0bWWH7DpTkL36JdORrO0v1SWfEiqLtnAtdmWofxYpIdyk8f5JFeQHWMlw5L+fGFryyspLmLKkMTcgISI3uTgKReFp9NHb5O4InCahPEv9wqvCyKqHcvsLrgBozvLPX3wZi09Pp42sVATWtDKiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CqkWjw9V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ZOkUyh2PPBfs/TtcNX0aDE3PwaWXSyikNW3QoCUR2Z4=; b=CqkWjw
	9VgMuR9+QAuQGKhGWBPrNS4twp5dh801okqJ4FsWHkJO0ID01OQifoo23+kYXSXi
	BtRtTf2YCDxqhsX74M1OsbX853qlr8m1lHJHRzd+SXE5O0caEX9Wtw5NTjFNa3jA
	QsO+mzvVFNHSg+8LTyZIyH8SNyMtl4xpXHkKiYKz/B0WehSFiMNg6sQyRUh/JL1I
	4EMpFiRrlS2kq9TsR8jLsolth6KCrs80cbsjGucYx33gzig2wF8Sit5X/pmy1QqF
	yjfH/azHRK1dUhfy4nNTem9u3sDIW9s6nqCkZx58wB6Nj+QMch8biRMHTFJwkYb4
	nD7mhMkDykfwDhxw==
Received: (qmail 3871838 invoked from network); 22 Mar 2024 14:27:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:02 +0100
X-UD-Smtp-Session: l3s3148p1@s0R6xz8UIpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 50/64] i2c: sis5595: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:43 +0100
Message-ID: <20240322132619.6389-51-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-sis5595.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-sis5595.c b/drivers/i2c/busses/i2c-sis5595.c
index 32476dc10ad6..198ba39a2651 100644
--- a/drivers/i2c/busses/i2c-sis5595.c
+++ b/drivers/i2c/busses/i2c-sis5595.c
@@ -257,7 +257,7 @@ static int sis5595_transaction(struct i2c_adapter *adap)
 	if (temp & 0x20) {
 		dev_err(&adap->dev, "Bus collision! SMBus may be locked until "
 			"next hard reset (or not...)\n");
-		/* Clock stops and slave is stuck in mid-transmission */
+		/* Clock stops and client is stuck in mid-transmission */
 		result = -EIO;
 	}
 
-- 
2.43.0


