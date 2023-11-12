Return-Path: <linux-i2c+bounces-88-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23F7E9184
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 16:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3C61F20F7D
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 15:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E322C14F6E;
	Sun, 12 Nov 2023 15:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/vtTlKU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E68414F6C
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 15:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584B2C433CC;
	Sun, 12 Nov 2023 15:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699804128;
	bh=XPWJGZALjZK7J71TiOpQmIGmPkfODPV/wRHmnmjv6EU=;
	h=From:To:Cc:Subject:Date:From;
	b=t/vtTlKUvrShLvdKQug8GcH2Ccq02/Df+e/rMnxZMKuRJGDg73uUziKkA2Vn3BTDt
	 qqpLjm2wBWVreTp9Kr86L8lL6mY4B6k0RQokKFsrEU/7EawcSlq/WqiZRi/8Hhshia
	 TYTtCIizbKTtbOFG3QJtqVzY9qU2L9Sx7/KHcs1plZkEX2RIOF1fta54Z4lTxMZjQr
	 OfMRISXfSBuGwSj/DuY9yj8rKEt+FhiQV1PxptKT8bGbUUDCLsOwJcdTfOmsc/E88b
	 WdVzsCOaXe4cWzE7t2bXkKQ2ibO2xrxFZUnlEQUjut2vHAyH4L9bHpaJSa2ChFEtlm
	 ePQkdJziZ4yjw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Stanner <pstanner@redhat.com>,
	Dave Airlie <airlied@redhat.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10] i2c: dev: copy userspace array safely
Date: Sun, 12 Nov 2023 10:48:45 -0500
Message-ID: <20231112154845.229303-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.200
Content-Transfer-Encoding: 8bit

From: Philipp Stanner <pstanner@redhat.com>

[ Upstream commit cc9c54232f04aef3a5d7f64a0ece7df00f1aaa3d ]

i2c-dev.c utilizes memdup_user() to copy a userspace array. This is done
without an overflow check.

Use the new wrapper memdup_array_user() to copy the array more safely.

Suggested-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/i2c-dev.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index dafad891998ec..eef58daf1f013 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -451,8 +451,8 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 		if (rdwr_arg.nmsgs > I2C_RDWR_IOCTL_MAX_MSGS)
 			return -EINVAL;
 
-		rdwr_pa = memdup_user(rdwr_arg.msgs,
-				      rdwr_arg.nmsgs * sizeof(struct i2c_msg));
+		rdwr_pa = memdup_array_user(rdwr_arg.msgs,
+					    rdwr_arg.nmsgs, sizeof(struct i2c_msg));
 		if (IS_ERR(rdwr_pa))
 			return PTR_ERR(rdwr_pa);
 
-- 
2.42.0


