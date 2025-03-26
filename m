Return-Path: <linux-i2c+bounces-10030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C9A71311
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 09:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5F98188311F
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6221A2860;
	Wed, 26 Mar 2025 08:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="k38PEtqH";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="em4EobGm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102E3D6A;
	Wed, 26 Mar 2025 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979022; cv=none; b=KU58YRE+bHCjxcFMUi94fGy79FusxoFr7UYs/4yguhRhEqg8sndkMe6Dt7oxbeTWYgyR0fhE6vNxTx6mFoNqDvLX8D1z5JrHeB50nGBag4qPkdJaq+QLCG+8b8ULmdo8/W0ZH4lU9S7aKTJfDnEdkAKd8AgMV+6w9mcOaeygb20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979022; c=relaxed/simple;
	bh=zckyWCR8co9b4ewG7tpvLex3uvCol9oBpbVIwzyjzag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5L0iLQX2AaXiCK7C0Tvs2ZmO3oD2HaaAtr/htZTl4662PcI/1u2lJUp/Fv3BpPgqff0sSj1BEjUsP9C7Pzqkm3kf3JvXNLl2xiNd0rMb2lcB+Y7vpgl7411NFgyS0tFtHcpFhjeGoW7i4QQWtzOrvdLHMPzDDNLQuJc7pfp9cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=k38PEtqH; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=em4EobGm reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1742979019; x=1774515019;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZP0l56nxJaRM6ya5wloLaFklD8MUTQmVk56fPxgwkqI=;
  b=k38PEtqHQa4FtgjmkFzE5l8gZ4o9xLKE0M3sXYwcTpkEuWtfwZwcJRvd
   Fy2ghc8PMpbPUfFUxE8VjP7hE3ZcrGLnB+3DZWicWEDrl7HXIlQ+3nrZO
   AfLmWvfoDpEq5NKoJFU3ndDL1SVrdsGYI9uFflvs0BDYHUJ0R6ytan2GO
   11rMhAkE2w6yvOEDXB5kr5uiTs8lxcbbrBVfgeSCXfaXGT6bQLq0PUt4F
   LQLW3B9GOuu0dflJw54GxVExN7xAlEEQHZGUvsS9Mx11DLlCvoYeWKGJI
   W6ZVkvuUuT53MccGFfixZTVPgX9V5/2B6T02Pn0kilWvbe6l6UO4XWVXM
   Q==;
X-CSE-ConnectionGUID: MfDwbYMlScqJ+JJEsYNc2Q==
X-CSE-MsgGUID: QpMB02+nQjmsFCzLs9HGZA==
X-IronPort-AV: E=Sophos;i="6.14,277,1736809200"; 
   d="scan'208";a="43164243"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 26 Mar 2025 09:50:15 +0100
X-CheckPoint: {67E3BFC7-37-903EAEAC-E04C76C8}
X-MAIL-CPID: F04AAAF7416FCDBA5B861161D3D6F77C_5
X-Control-Analysis: str=0001.0A006368.67E3BFCE.0036,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95F75166EFA;
	Wed, 26 Mar 2025 09:50:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1742979011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZP0l56nxJaRM6ya5wloLaFklD8MUTQmVk56fPxgwkqI=;
	b=em4EobGmpORctKzGb651E+9YPDv0naO9NFFUwMSq7jZ9NonsqAQMfMPyCACKdSXs8EsPNC
	5/3FYn0z+iyPvaoayosYcCwpUhYzVgUGZoxC83kijimQdRdmWSiyYN3ZJ0hbr5gpH9UlNT
	kMw3gIs0lIvqbswdrIMXItqebsaOmmva2IMPdUZ6u3F83JGxBK5QU3UNTe0/mP2fD1eT+2
	+E5YGY6y3FZqWzUegymx+CzAaoRcFq6l7iysU23V+MHx6VdtTlOnmjdpOVqVYoYkzL5O3m
	/cNTer68kHH7+HGNffpgKuNMo/FBqvLUCfD1KDiAcZOTfc59mbVlYpROxflPDw==
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] i2c: imx: add some dev_err_probe calls
Date: Wed, 26 Mar 2025 09:49:36 +0100
Message-ID: <20250326084937.3932383-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Especially DMA channels might not be available. Add some deferred probe
messages accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/i2c/busses/i2c-imx.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9e5d454d8318e..e6e09d5a2bbd4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1711,11 +1711,13 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-		return irq;
+		return dev_err_probe(&pdev->dev, irq,
+				     "can't get IRQ\n");
 
 	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
-		return PTR_ERR(base);
+		return dev_err_probe(&pdev->dev, PTR_ERR(base),
+				     "can't get IO memory\n");
 
 	phy_addr = (dma_addr_t)res->start;
 	i2c_imx = devm_kzalloc(&pdev->dev, sizeof(*i2c_imx), GFP_KERNEL);
@@ -1810,13 +1812,15 @@ static int i2c_imx_probe(struct platform_device *pdev)
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


