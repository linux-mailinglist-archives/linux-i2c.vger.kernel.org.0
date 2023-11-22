Return-Path: <linux-i2c+bounces-383-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D184B7F4ABF
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 16:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 47BADB20E56
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Nov 2023 15:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB01D4CE06;
	Wed, 22 Nov 2023 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlT2Sb5q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA7E4CDFB
	for <linux-i2c@vger.kernel.org>; Wed, 22 Nov 2023 15:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A989C433CC;
	Wed, 22 Nov 2023 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700667352;
	bh=wy23UtIXrthgj2eEEYgrBaW36bslAFzoQLlkGnSsD+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AlT2Sb5qadUUsNXXF6i3wA7QdvERdZ0b532Tl2g2Z1wo78frdU5w6tJzUOE/dxVpp
	 E7GF9jLYwy2f/+AgSPEHFFPzgc3OjvlrgAl+H28U2UrV5BZhk4ugWhnxSlyP4xVj5n
	 LQtcTGTAGgwgmJBzU0ga8vgX88sqY/lWYIC4M57+0djFvewBbtTHxBXT1H+LouVIb6
	 8FumhQsXmMoYDzqR0mSykXbYcMMqj5KxUAY5kyMY4pnXV9aU9npb/e6b/zWZc9jEGY
	 MXBdQCgq+VGGf6fw9WJ6gJDRs5tB28IhyBQREi8lBOiYkGTo8tAzAGolUeE29l/FyZ
	 r2CMmQ8ZKN6ow==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Bottorff <janb@os.amperecomputing.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 2/7] i2c: designware: Fix corrupted memory seen in the ISR
Date: Wed, 22 Nov 2023 10:35:30 -0500
Message-ID: <20231122153541.853179-2-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231122153541.853179-1-sashal@kernel.org>
References: <20231122153541.853179-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.201
Content-Transfer-Encoding: 8bit

From: Jan Bottorff <janb@os.amperecomputing.com>

[ Upstream commit f726eaa787e9f9bc858c902d18a09af6bcbfcdaf ]

When running on a many core ARM64 server, errors were
happening in the ISR that looked like corrupted memory. These
corruptions would fix themselves if small delays were inserted
in the ISR. Errors reported by the driver included "i2c_designware
APMC0D0F:00: i2c_dw_xfer_msg: invalid target address" and
"i2c_designware APMC0D0F:00:controller timed out" during
in-band IPMI SSIF stress tests.

The problem was determined to be memory writes in the driver were not
becoming visible to all cores when execution rapidly shifted between
cores, like when a register write immediately triggers an ISR.
Processors with weak memory ordering, like ARM64, make no
guarantees about the order normal memory writes become globally
visible, unless barrier instructions are used to control ordering.

To solve this, regmap accessor functions configured by this driver
were changed to use non-relaxed forms of the low-level register
access functions, which include a barrier on platforms that require
it. This assures memory writes before a controller register access are
visible to all cores. The community concluded defaulting to correct
operation outweighed defaulting to the small performance gains from
using relaxed access functions. Being a low speed device added weight to
this choice of default register access behavior.

Signed-off-by: Jan Bottorff <janb@os.amperecomputing.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Signed-off-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-designware-common.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 682fffaab2b40..c9f7783ac7cb1 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -63,7 +63,7 @@ static int dw_reg_read(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = readl_relaxed(dev->base + reg);
+	*val = readl(dev->base + reg);
 
 	return 0;
 }
@@ -72,7 +72,7 @@ static int dw_reg_write(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writel_relaxed(val, dev->base + reg);
+	writel(val, dev->base + reg);
 
 	return 0;
 }
@@ -81,7 +81,7 @@ static int dw_reg_read_swab(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = swab32(readl_relaxed(dev->base + reg));
+	*val = swab32(readl(dev->base + reg));
 
 	return 0;
 }
@@ -90,7 +90,7 @@ static int dw_reg_write_swab(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writel_relaxed(swab32(val), dev->base + reg);
+	writel(swab32(val), dev->base + reg);
 
 	return 0;
 }
@@ -99,8 +99,8 @@ static int dw_reg_read_word(void *context, unsigned int reg, unsigned int *val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	*val = readw_relaxed(dev->base + reg) |
-		(readw_relaxed(dev->base + reg + 2) << 16);
+	*val = readw(dev->base + reg) |
+		(readw(dev->base + reg + 2) << 16);
 
 	return 0;
 }
@@ -109,8 +109,8 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
 {
 	struct dw_i2c_dev *dev = context;
 
-	writew_relaxed(val, dev->base + reg);
-	writew_relaxed(val >> 16, dev->base + reg + 2);
+	writew(val, dev->base + reg);
+	writew(val >> 16, dev->base + reg + 2);
 
 	return 0;
 }
-- 
2.42.0


