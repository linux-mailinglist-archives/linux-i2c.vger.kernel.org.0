Return-Path: <linux-i2c+bounces-10203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 75240A7FB10
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 12:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B547416EE07
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 10:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A482266F06;
	Tue,  8 Apr 2025 10:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="n623/6Jv";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="k00Fyls/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84819266597;
	Tue,  8 Apr 2025 10:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106601; cv=none; b=kO514VhvWlXVxYrFJaxkW6Ifx4xagDXTdhEScZ6ANguTVIoIxOqz/6zJg0PpdgCB4jDS2phIbzf6v2lQ/RhB/Cm/9Spik0+M9ZPB0jNkjYkkqtLhpHxn1kcnogvECcddo+f/6frJidLNWy1XcWY2PtaeAgY124OOFRIyErhjhMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106601; c=relaxed/simple;
	bh=wYU/aYREgE3W0hdTscAVN9PMVpiUQEmQ1AJFcZuwLi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=exy+hd5wudtOP21iOCMTS/T0knU0jJ+06b1gLnzg07n5UjqPhNvDnimSIw3PXA8esVBS8eP3gVkxzXG5zgSBz5PKJyUxbnmkvS+niXYRz/7o1jR5QVDpWgXzbcwwCC1LwddT8T/V9F7OvjtB2mWa3ywGztHsUsrHJCrknsM+Pmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=n623/6Jv; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=k00Fyls/ reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744106597; x=1775642597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NRu5VEWAgUj7SCiDTK/gXnFvCKSyajFgcf/tgq1fgrU=;
  b=n623/6Jv0Y69pnMrGfpg1ByHd9aSOjcWAVF1qScWjPeufBFVU93KMbCg
   reGleM7seuItDe1KI+H3AggD3lQYS+9uoRIHyF6s9MxDaiu+LyPJGk7YT
   RSS+y4wHFwm96EdTqUfTkiwu5hk8nwg6eeoqIxgLcWj98A4SR7MHcsVrl
   EpvgG095y08aVipjfmB35ELn88XQg3/I6JxJPaw/Mr8j7WTS9OZ2vY15D
   4nZX0fXWo2b29/sG40VzflOGHGkHUHY+lMXPcSRpZMsCHKlw1oJmxgOH3
   pDvUKz4Qkb8Id+ZEKjFepmG9zG5zP19iCqEyQjKPYcx5OLR00e3JWkukr
   Q==;
X-CSE-ConnectionGUID: ro84a8UtRg+nnfyWNlRU3A==
X-CSE-MsgGUID: bDfvC6sCQ2Kpg3otsM4lRA==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43398465"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 12:03:13 +0200
X-CheckPoint: {67F4F461-4A-B1D34AC3-DEA5B19F}
X-MAIL-CPID: BE892603A1D2EC333F5B88991BFBD7E4_4
X-Control-Analysis: str=0001.0A006376.67F4F464.006A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B32AA168E33;
	Tue,  8 Apr 2025 12:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744106589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NRu5VEWAgUj7SCiDTK/gXnFvCKSyajFgcf/tgq1fgrU=;
	b=k00Fyls/m3KgLE78hcX0bEq5oEHb8Gr95YN8sD62t2wdIHHvcWNow22U+tSsihSlt33/dw
	kHCHIOIOyPhnuGPnmH4pogzbiRM0upVGyySZqVQ9ni5FJjWECfLRb2/Rjm/ztbWzXMOc23
	s/yKOcEJoHkmrK1qZZmGkv/9qXZSjMVyE5kIKd85QeZ+135uUlhcTe7ou4BI2+o1fz2dcM
	gVg/Lg4ixlcothZ3vL8QGyXDkJswfzwWLC1m1VruUKt91Cf11Y/10V1Ox1IANPOCRpmn3a
	9lG6Tk+ZRpRGA+S6VNPk0NwzzB5Tf9UtDhqSpZC13+KvGO/9Mne3Fnd++4UCoQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] i2c: imx: add some dev_err_probe calls
Date: Tue,  8 Apr 2025 12:02:59 +0200
Message-ID: <20250408100300.556703-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add corresponding error messages if DMA channels are not available during
probe. Using dev_err_probe adds deferred probe messages as well.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
* Improved commit message
* Collected Frank's R-b
* Put error message into a single line

 drivers/i2c/busses/i2c-imx.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318e..de01dfecb16e6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1711,11 +1711,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(&pdev->dev, irq, "can't get IRQ\n");
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
-		return PTR_ERR(base);
+		return dev_err_probe(&pdev->dev, PTR_ERR(base), "can't get IO memory\n");
 
 	phy_addr = (dma_addr_t)res->start;
 	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
@@ -1810,13 +1810,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	 */
 	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
 	if (ret) {
-		if (ret == -EPROBE_DEFER)
+		if (ret == -EPROBE_DEFER) {
+			dev_err_probe(&pdev->dev, ret, "can't get DMA channels\n");
 			goto clk_notifier_unregister;
-		else if (ret == -ENODEV)
+		} else if (ret == -ENODEV) {
 			dev_dbg(&pdev->dev, "Only use PIO mode\n");
-		else
+		} else {
 			dev_warn(&pdev->dev, "Failed to setup DMA (%pe), only use PIO mode\n",
 				 ERR_PTR(ret));
+		}
 	}
 
 	/* Add I2C adapter */
-- 
2.43.0


