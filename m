Return-Path: <linux-i2c+bounces-87-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3457E9182
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 16:48:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0075FB20946
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Nov 2023 15:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5A714F8C;
	Sun, 12 Nov 2023 15:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H3bHIkmU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC0814F6E
	for <linux-i2c@vger.kernel.org>; Sun, 12 Nov 2023 15:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5E2BC433C8;
	Sun, 12 Nov 2023 15:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699804124;
	bh=VvasmWmuUkVFb4Rzqz2xkBM+ndmJKBYSPi5Ywx0daa0=;
	h=From:To:Cc:Subject:Date:From;
	b=H3bHIkmUFgy89dakAjEdOMtLoLtkGAu8VBgZ3GcMudwG4SVIc75hgmwFYltkDZ4lM
	 LlaCRcN88xe3b01wgQAxjhJk4c3Ggt6k4rSZvgSUF7jBMJo5DS0TFccy8gscqRHmRc
	 2nk4+D+3fSLczs0SXmhNGu7g5o/4B4F9ZsiVcUf2NV8N+Tg1lApy733YKRZ/GW6qm2
	 RZD5tQb0Gkech3KHThLiTwIylHXcAFVUjMR83N+WpQVQGm/I2x/3N3Gcx2TNTa62dR
	 67g1SkCeW+FxMRqmyuFrl8jR7TBwPNp2Ixdxga5IcKH1mdIxluGcJ5wKsLvAh8O4pu
	 ZhDH3rku1oc+Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Philipp Stanner <pstanner@redhat.com>,
	Dave Airlie <airlied@redhat.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15] i2c: dev: copy userspace array safely
Date: Sun, 12 Nov 2023 10:48:41 -0500
Message-ID: <20231112154841.229268-1-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.138
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
index 6fd2b6718b086..9fefceb3a95d4 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -450,8 +450,8 @@ static long i2cdev_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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


