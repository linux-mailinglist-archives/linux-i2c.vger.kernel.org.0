Return-Path: <linux-i2c+bounces-9089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D7BA1126F
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 21:45:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D151A188B305
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Jan 2025 20:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5856220DD79;
	Tue, 14 Jan 2025 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QWrb2y8u"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303D31E4AE
	for <linux-i2c@vger.kernel.org>; Tue, 14 Jan 2025 20:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736887541; cv=none; b=pzabcHKxeW/mkjcQmooCOjAADREi8/O1shHp50Fm2H57Vj9SiJ4U5+8yrQpCUcOhMERFrcBvQF3pLYbrS3w4g+urNPDuCQ2TgSEp47tSPULPzW8pG7LA795VwxN+LEXJ5jbhKcUI94J6UB9/yUgaWqnjHlD3xe+Iyf5TbKNTepM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736887541; c=relaxed/simple;
	bh=+ijy8i3cqds7w4Z4ccJhKFfRb2LipIiUGlezk7uR3Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gOQB+USwGPbKmabDZvJsfgbC09DBYYhhJVJ0NcT7PmDWRY3BLnCp/rrKluGh7vZTh2gPw92I+ajqJ+qazkGHMtnJfzF/N2P0fDK4TABRen3eVYLk2mCPTXGbQaVwbOaimPmldjJRkTNEuNFWUABLzzT2Ci0IMLMW+RMlwtCKDvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=QWrb2y8u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=FCknVfKdKqpwcV
	ujR3yXZi+YFzM3P4I4A5f9KeiWB9M=; b=QWrb2y8uqnS0MXHWBw3Lif9jLuCqGB
	8hARUCX5rNhUhxuaj2doXXsIjLlFP5CCdDEpZjjBV709xw2hHTOfRg7KyFsilVJc
	j+WjOB6uaI7BxdKtXNmxQSabRaCwoYKaIJpGHRcx1qPY3qTV4E6+4miQ3L4/65oQ
	bY2iRqAk/DQ/tWbGvF96GKDflffrYTm+Q52Rlecs5qylCp4VPULSynWatBTV6k4v
	BWxG+knbKB48rFlwV+x2p/mTlTF4iqKOMvL8OFvTzcaAe3V+9NCeuCV2+V3NHaAx
	bsgKNCJ8i4wlVbc4fOHo/+C8CIbTwVzlXEwon+DTrWzZpRqcI9CMUQaQ==
Received: (qmail 340352 invoked from network); 14 Jan 2025 21:45:32 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2025 21:45:32 +0100
X-UD-Smtp-Session: l3s3148p1@J4ZepLArBpcujns1
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>
Subject: [PATCH] i2c: mux: demux-pinctrl: correct comment
Date: Tue, 14 Jan 2025 21:45:16 +0100
Message-ID: <20250114204516.10093-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two characters flipped, fix them.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/muxes/i2c-demux-pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-demux-pinctrl.c b/drivers/i2c/muxes/i2c-demux-pinctrl.c
index dce18f763a09..82a6580a3c60 100644
--- a/drivers/i2c/muxes/i2c-demux-pinctrl.c
+++ b/drivers/i2c/muxes/i2c-demux-pinctrl.c
@@ -68,7 +68,7 @@ static int i2c_demux_activate_master(struct i2c_demux_pinctrl_priv *priv, u32 ne
 	}
 
 	/*
-	 * Check if there are pinctrl states at all. Note: we cant' use
+	 * Check if there are pinctrl states at all. Note: we can't use
 	 * devm_pinctrl_get_select() because we need to distinguish between
 	 * the -ENODEV from devm_pinctrl_get() and pinctrl_lookup_state().
 	 */
-- 
2.45.2


