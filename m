Return-Path: <linux-i2c+bounces-7067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48207988D70
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 03:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0310C1F2244B
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2024 01:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9374125BA;
	Sat, 28 Sep 2024 01:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="DexV4vXj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39050168BD
	for <linux-i2c@vger.kernel.org>; Sat, 28 Sep 2024 01:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727487878; cv=none; b=WpVxvcLyGIinOtXGyDT+PuAMweOZIpoDjyfDnzJK5hh8iWmaiNa1HzE8P/cesYqwZP4cLtYPC/uq/X0cDKQ8BLwL6+Rp4lCgVIPFuV1DzksDKNHZOHec39gDOV0WaVO9baQms/VtQX2qqpBXlTV5Yfm0splyk0Dxx//gnoG4GWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727487878; c=relaxed/simple;
	bh=LkpDOInVXNnRdKkg+0NkqIrVPsZaln1w4yoFHZ5X+h4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SuDLe/5w9KuJM9eJSZ4vnn9y2YN2hNj96qt9TyxVp3Xoq67PdUwl01uoGMElry+cVHpqkWleDUwb3ezzvV0r6uT+mSfyV2Ub6hsNX4bM614mf3Cw7EvVqQTUwIhltwtfRzyxSfG/1Pb5kiBc8DtoVJb3kBuJEeV0F9wPDfCem1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=DexV4vXj; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 212F688A0E;
	Sat, 28 Sep 2024 03:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727487872;
	bh=vu7FmJqwmK0upibpguVPBxeCH3pRk8VsOtdb0A5Iw5M=;
	h=From:To:Cc:Subject:Date:From;
	b=DexV4vXj+UlTW55BXfJrW/bC/Y9Ztf5mdE64kG/ApYcxINnVMbS59IxzaLjoX8+N7
	 b9t7DGQcOLITD0SN/QLhIAEkzFBgUQyMq6WUbhp680tq6v4l2MXOvQx9Tuyih/Kzig
	 4a03w+vcbbKzR6b64jhwGhy7yCj1rg2tUYeVHEZu/hoMsdzPOlAZr40YaaldMHkipJ
	 ZtJAnHjUnJgdBcUW4mqtr1LeO4IHvPMUvWe3hwMb3HHXyaADjtGkx888nkNYJETxEE
	 n1lVIjivBJLwdHW4V64HMPX+kprfTdgZDpS5qCBGjDnLVsov8Qg3uGnvY3PjjNuCGB
	 2yNyJWZvd2gsQ==
From: Marek Vasut <marex@denx.de>
To: linux-i2c@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH] i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
Date: Sat, 28 Sep 2024 03:43:46 +0200
Message-ID: <20240928014409.633542-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

In case there is any sort of clock controller attached to this I2C bus
controller, for example Versaclock or even an AIC32x4 I2C codec, then
an I2C transfer triggered from the clock controller clk_ops .prepare
callback may trigger a deadlock on drivers/clk/clk.c prepare_lock mutex.

This is because the clock controller first grabs the prepare_lock mutex
and then performs the prepare operation, including its I2C access. The
I2C access resumes this I2C bus controller via .runtime_resume callback,
which calls clk_prepare_enable(), which attempts to grab the prepare_lock
mutex again and deadlocks.

Since the clock are already prepared since probe() and unprepared in
remove(), use simple clk_enable()/clk_disable() calls to enable and
disable the clock on runtime suspend and resume, to avoid hitting the
prepare_lock mutex.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 drivers/i2c/busses/i2c-stm32f7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index cfee2d9c09de3..65c035728a4fa 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2395,7 +2395,7 @@ static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
-		clk_disable_unprepare(i2c_dev->clk);
+		clk_disable(i2c_dev->clk);
 
 	return 0;
 }
@@ -2406,7 +2406,7 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 	int ret;
 
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev)) {
-		ret = clk_prepare_enable(i2c_dev->clk);
+		ret = clk_enable(i2c_dev->clk);
 		if (ret) {
 			dev_err(dev, "failed to prepare_enable clock\n");
 			return ret;
-- 
2.45.2


