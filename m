Return-Path: <linux-i2c+bounces-11071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C1FABDF2E
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 17:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445604C765D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 15:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FDA262808;
	Tue, 20 May 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFLPnB6E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFD125FA2E;
	Tue, 20 May 2025 15:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747754765; cv=none; b=PG7CZjNa5aG4m/AMZi/NbY85+qLftwnY7hxsPGHWILPjphb6rVK29TwQkZFjU2ExeRWObZPpWzZk97w72vxBwCzjRXYJeGmy/Tea77fiE6YzMF+3AENFkJGVP9SJrjJN75qVMeq9vubvnMimIa8P3rRqr4lT28QPXoichgV+mf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747754765; c=relaxed/simple;
	bh=uma6Yq0KvtOpiTvEXjx9dMJRNblWQRQl509jbvRCsdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R8a/upJD+YVI6uBizkxiqrt8u8Se7npm0Rpqt0eTSOZoTV4Heb1MRQP8gF6BmstaFPzT4aXhb93ZD2z76ShrwhNjDg2mPidLl1OIMt9OosaD/myaPazgvKwxire+OyCAyrHHFWGdDqw8jUe2BXNFC2pauxeZ92+hB0rjeqUE4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFLPnB6E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B27FEC4CEE9;
	Tue, 20 May 2025 15:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747754765;
	bh=uma6Yq0KvtOpiTvEXjx9dMJRNblWQRQl509jbvRCsdU=;
	h=From:To:Cc:Subject:Date:From;
	b=eFLPnB6EJ/WiBwLv8/CijKvOc7dtX/mR5Y1WaPTfu5io7Mpq3SzsvnOsfpWJ5h4t1
	 y2f1CTi8fr1ZdkfVitU6k0vCRVDKEyJuQs+SEP5b6BFAsF7nWi0fzU+dO9QBHt87NY
	 oAy/NaXAfopxNDGcfdRnQqbkIuEnssxAP7SqXhXGxVqh4LklwpZFBpcBYLf6mvIrpG
	 2PfNFGqLZ//Ioq6O3a10+lbLp231gZOVsxDA7H+hFk8RDoGeZKddUonqJjyEbGuDVV
	 TQm3nK0c/lgG3pHad8Gwbs0V/Ggy3ju2fm9iM0WrqG80RxRz+wcBb+ABESLvV6ykG5
	 q4NeBSu4nlMQA==
From: Arnd Bergmann <arnd@kernel.org>
To: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: mlxbf: avoid 64-bit division
Date: Tue, 20 May 2025 17:25:45 +0200
Message-Id: <20250520152600.1975628-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The 64-bit division in mlxbf_i2c_get_ticks() causes link failures
when compile-testing on 32-bit machines:

ERROR: modpost: "__udivdi3" [drivers/i2c/busses/i2c-mlxbf.ko] undefined!

Change this to a div_u64(), which should replace the constant division
with a a multiply/shift combination in the mlxbf_i2c_get_ticks().

The frequency calculation functions require a slow library call but
should be used much rarer.

Fixes: 9c6c6fa671f9 ("i2c: mlxbf: Allow build with COMPILE_TEST")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/i2c-mlxbf.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 39359942e4d7..8345f7e6385d 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -1083,7 +1083,7 @@ static u32 mlxbf_i2c_get_ticks(struct mlxbf_i2c_priv *priv, u64 nanoseconds,
 	 *         Frequency
 	 */
 	frequency = priv->frequency;
-	ticks = (nanoseconds * frequency) / MLXBF_I2C_FREQUENCY_1GHZ;
+	ticks = div_u64(nanoseconds * frequency, MLXBF_I2C_FREQUENCY_1GHZ);
 	/*
 	 * The number of ticks is rounded down and if minimum is equal to 1
 	 * then add one tick.
@@ -1460,9 +1460,8 @@ static u64 mlxbf_i2c_calculate_freq_from_tyu(struct mlxbf_i2c_resource *corepll_
 	 * and PadFrequency, respectively.
 	 */
 	core_frequency = MLXBF_I2C_PLL_IN_FREQ * (++core_f);
-	core_frequency /= (++core_r) * (++core_od);
 
-	return core_frequency;
+	return div_u64(core_frequency, (++core_r) * (++core_od));
 }
 
 static u64 mlxbf_i2c_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_res)
@@ -1491,9 +1490,8 @@ static u64 mlxbf_i2c_calculate_freq_from_yu(struct mlxbf_i2c_resource *corepll_r
 	 * and PadFrequency, respectively.
 	 */
 	corepll_frequency = (MLXBF_I2C_PLL_IN_FREQ * core_f) / MLNXBF_I2C_COREPLL_CONST;
-	corepll_frequency /= (++core_r) * (++core_od);
 
-	return corepll_frequency;
+	return div_u64(corepll_frequency, (++core_r) * (++core_od));
 }
 
 static int mlxbf_i2c_calculate_corepll_freq(struct platform_device *pdev,
-- 
2.39.5


