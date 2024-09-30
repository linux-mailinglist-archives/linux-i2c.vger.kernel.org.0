Return-Path: <linux-i2c+bounces-7102-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A3898ACEE
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 21:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FB632830B7
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 19:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 594B5199E9E;
	Mon, 30 Sep 2024 19:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="cq+9CnS9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FBA199E82
	for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2024 19:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727724514; cv=none; b=jH63tA+0I38pPAX2lWfAJoqLGNtvukndSygn9uX9ADoHjMQXMM7jtKCNFsBGIXE3DuzvVls9dh65+lz6DrFp4dXkMEjYgNbXzSQlFBOrqUJSRz++eQOW6DNZqrx6yUcCKHjSVzMjad62j3pYPKj28JUL6ekQmD62wi/tAVsb+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727724514; c=relaxed/simple;
	bh=uu88EUXjFWcy03PwDl8NN69s5uvQhQ7Rhr1Rc67vYBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W18YEwOA1d+nZBwlKKzBWM3juoDmRmPxqsYrszFs41/xr8pifVWWVBgkJRZsdJ5IcCwdhOR+Z58mjDhu/nr4J6dhQYdWGrtb85zB+NaOK55v/M8AwaW6BkP1zC0yHTgAaeDsNj6YInAKs44FJGLXlECmTcTEFSSIW0wLh6wz56Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=cq+9CnS9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6144A88F6F;
	Mon, 30 Sep 2024 21:28:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1727724510;
	bh=OREwX1JcqK3oMMSoTvHvNaOWPllgrNDfzP8nZJ/yKEw=;
	h=From:To:Cc:Subject:Date:From;
	b=cq+9CnS9d+E3rGsryG4+eZnuluwTcS9FWDxkyVy7dCJ+3Ca+QxTlmqv010KC0qlht
	 1VpCmA3OjzuoQtM5U03ronMScYDEviuGM3osMEu4iDe2uyRJv9NLDS969uPLI8lm+0
	 cyP0Vawvxm4cYEA9VRnMSiAU/EOTvfS8Xot3d2qnYOx1UgM5RE9yyk+w8863ejSRpK
	 JzQkk11k3zdl0Sq1s8ctwG14BGOvqdLUyE6f9xiJCYI3zkr5QaaCdrzdnSVB8np46T
	 WlWunMsO8RudfS85o2LxkhsPYp0tl5XCJJ1iNIFM+TcyZsRLV2IfS8H4+Mcxnz8Kgo
	 DXg8D4Cn14glg==
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
Subject: [PATCH v2] i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
Date: Mon, 30 Sep 2024 21:27:41 +0200
Message-ID: <20240930192820.59719-1-marex@denx.de>
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

Acked-by: Alain Volmat <alain.volmat@foss.st.com>
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
V2: - Update the error message
    - Add AB from Alain
---
 drivers/i2c/busses/i2c-stm32f7.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index cfee2d9c09de3..0174ead99de6c 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -2395,7 +2395,7 @@ static int __maybe_unused stm32f7_i2c_runtime_suspend(struct device *dev)
 	struct stm32f7_i2c_dev *i2c_dev = dev_get_drvdata(dev);
 
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
-		clk_disable_unprepare(i2c_dev->clk);
+		clk_disable(i2c_dev->clk);
 
 	return 0;
 }
@@ -2406,9 +2406,9 @@ static int __maybe_unused stm32f7_i2c_runtime_resume(struct device *dev)
 	int ret;
 
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev)) {
-		ret = clk_prepare_enable(i2c_dev->clk);
+		ret = clk_enable(i2c_dev->clk);
 		if (ret) {
-			dev_err(dev, "failed to prepare_enable clock\n");
+			dev_err(dev, "failed to enable clock\n");
 			return ret;
 		}
 	}
-- 
2.45.2


