Return-Path: <linux-i2c+bounces-4012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9190733C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 15:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5ACF51F2183C
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 13:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78A471448D2;
	Thu, 13 Jun 2024 13:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n4sR/H+V"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7B11448DD;
	Thu, 13 Jun 2024 13:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718284421; cv=none; b=rmYF91k7vNzolAISHP2l8VQ8tetUbumAg33YfdTrlKCHpwsqSCaZSs+6skCZoYYeLgxdKG5PKFLTKVU8ZDzKaRJvWZt6TUIuBz1LXzIDcujv53WXls44XMpjr4As4VqIeWq5YVR7JWREqx2lu4LxDUigIO1Ati1v7HfFkrqGojs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718284421; c=relaxed/simple;
	bh=c88ZCilto4D3Y6vZSmXpoHvp3MSBbJyyFDct46CSzCQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bfA044D+OTjYOAF8d+1uxBCsC5jrHBpnJ0e+zBlOw/0fHNo2K/UM0e2tLDBVKGqPzD+aFIrA5mxm737MMGqPdVgmqGsK1WMhizJLETp/pB/lGmemjOq9N/m3NUl8yK3VO9L/SQL8dugP54aAt42xik+Q2Vsb+GKJWJ8OoWSg1Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n4sR/H+V; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A11D620011;
	Thu, 13 Jun 2024 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718284416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=P/fueTuzPX+npqEtb6YMMbPx/Wvb3LcWrFA3x/uKoSg=;
	b=n4sR/H+Vq9KcKn1EwBXmmQMv/Qyke6+YWCHndXKG5fS6pIh2hKSKHB8X8b7qQNwqXTbeuc
	CSxDV6nGe9OjBRhNhcy8Aws+PZEooR07Xk3WgdJMczaOLmNefCeOQ1BVQeFozKfqemn4Qz
	zyZ01tAVhCoHB2b1TDtAWFkB/S7R5EoZd9U45HvLQcfZL7pg7c9jCy/wGLxhR6GA6WnGLu
	eINPFvHGWzFLFjJsudtNqKBXEIyP/0kFr5aQUAUMPNuJVWEoN47WswLHKknMtGVSjavOhQ
	LGmEuImvPn1313fLKYiUzH0JeJhd0up737zBqAjlPiyfKgqSbPMo0V0vM2VC1Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Subject: [PATCH 0/2] Wakeup the i2c-omap controller during suspend stage
Date: Thu, 13 Jun 2024 15:13:26 +0200
Message-Id: <20240613-i2c-omap-wakeup-controller-during-suspend-v1-0-aab001eb1ad1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbwamYC/x2OwQrCMBBEf6Xk7EIarai/Ij2kybZdrJuwa1Uo/
 XcTLwNvBh6zGUUhVHNrNiP4JqXEBdpDY8LseUKgWNg460723B6BXID09Bk+/oFrhpD4JWlZUCC
 uQjyBrpqRI1yunY9jCWs7U3yDV4RBPIe5GtUJ1KpOWXCk7//Gvd/3HyNHP0aWAAAA
To: Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, gregory.clement@bootlin.com, 
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.12.0
X-GND-Sasl: thomas.richard@bootlin.com

The patches of this series were originally in the series "Add suspend to
ram support for PCIe on J7200" [1].
There is no changes compared to the patches in the series [1].

The goal is to wakeup the controller during the suspend stage to be able
to use it during suspend_noirq stage.
As autosuspend is enabled, the controller can be suspended at suspend_noirq
stage. But runtime pm is disabled in suspend_late stage. So it's not
possible to wakeup the controller during suspend_noirq.
The trick is to force the wakeup of the controller during suspend stage.

[1] https://lore.kernel.org/all/20240102-j7200-pcie-s2r-v6-0-4656ef6e6d66@bootlin.com/

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
Thomas Richard (2):
      i2c: omap: switch to NOIRQ_SYSTEM_SLEEP_PM_OPS() and RUNTIME_PM_OPS()
      i2c: omap: wakeup the controller during suspend() callback

 drivers/i2c/busses/i2c-omap.c | 36 +++++++++++++++++++++++++++++-------
 1 file changed, 29 insertions(+), 7 deletions(-)
---
base-commit: 0719fea199617c798ad3a9158916066ac17219b2
change-id: 20240613-i2c-omap-wakeup-controller-during-suspend-895adf95a005

Best regards,
-- 
Thomas Richard <thomas.richard@bootlin.com>


