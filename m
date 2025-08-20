Return-Path: <linux-i2c+bounces-12358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A60B2E180
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 17:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C2C0622A00
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Aug 2025 15:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA22322779;
	Wed, 20 Aug 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u45PGUAp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCCB31DD8D;
	Wed, 20 Aug 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755704924; cv=none; b=iGIMV7vsGwnItWFfNX+2UPFmE64Ttf8Sdee8DHR9MU7xrQ8nDDxoX49QQ7IP+m915/jkM6lfoK60SQ3UxTxAEWj6wZhy5CD2ljLcRKuLzxkI4g98jEVDJ1AHUA1bfgxQWdO85qYLg0USnr9wheqisJCtoKjWPvD38RbedhuxPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755704924; c=relaxed/simple;
	bh=3jk8lXKf8bNegg8oz1RN0LjzQDm8KFDzfVDm5LG70DM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N2OKATwu/v8KlIfb7UdQeM7zT0/ap7Gp5WJsYxNKiYw6b43gp6ZSRdWlNTSZAeGalpAPh1ZdpDQmXikFBGgFqtfxPuFN85KLzcjSu7yRD9US97f7JL9X1e2bRYXlqvYzt1GaA4EtULEc81s9NAsV+TopwvXTq0CPnUsg7SToMtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u45PGUAp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491F9C113CF;
	Wed, 20 Aug 2025 15:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755704923;
	bh=3jk8lXKf8bNegg8oz1RN0LjzQDm8KFDzfVDm5LG70DM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u45PGUApdLxBEi0dRsM6LsgkDNwdc0yvQ7tuxroApvKBCckDQ87GEJLyJASVwi+wL
	 wLC08L/VbJ+lYVnQP9yx7docx/UiX+IpQzz5/9y1TsVL13aGgJnoBmJNUm8R5RRHlc
	 EjWXHfrRdDANZuGpTbhvQtiW0PbawWVrXQHzwhhRup4OJNeeZFc33H7AXveNctWjjc
	 MM2FXmruM9mAHEbbAUd2s/FonBCmLazFKspkBAG42Ph7bYmHedzTcRoO8Jm2XbdFlr
	 bIuTW1r6WP6VRv5F5KzzxVxHMydfrtSgiaDTaf5OKHvQlK7MhuBMCrl4LDvLdxa6aH
	 dDYxjzOELTaOg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH 1/2] i2c: designware: Avoid taking clk_prepare mutex in PM callbacks
Date: Wed, 20 Aug 2025 23:31:24 +0800
Message-ID: <20250820153125.22002-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820153125.22002-1-jszhang@kernel.org>
References: <20250820153125.22002-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is unsafe, as the runtime PM callbacks are called from the PM
workqueue, so this may deadlock when handling an i2c attached clock,
which may already hold the clk_prepare mutex from another context.

Fixes: 1fc2fe204cb9 ("i2c: designware: Add runtime PM hooks")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/i2c/busses/i2c-designware-common.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..b4e38bc0f876 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -776,7 +776,8 @@ static int i2c_dw_runtime_suspend(struct device *device)
 		return 0;
 
 	i2c_dw_disable(dev);
-	i2c_dw_prepare_clk(dev, false);
+	clk_disable(dev->clk);
+	clk_disable(dev->pclk);
 
 	return 0;
 }
@@ -794,8 +795,10 @@ static int i2c_dw_runtime_resume(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
-	if (!dev->shared_with_punit)
-		i2c_dw_prepare_clk(dev, true);
+	if (!dev->shared_with_punit) {
+		clk_enable(dev->pclk);
+		clk_enable(dev->clk);
+	}
 
 	dev->init(dev);
 
-- 
2.50.1


