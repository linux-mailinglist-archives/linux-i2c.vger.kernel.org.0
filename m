Return-Path: <linux-i2c+bounces-8439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEFB9EC469
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 06:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67214283F9A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 05:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014DC86334;
	Wed, 11 Dec 2024 05:46:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 10.mo583.mail-out.ovh.net (10.mo583.mail-out.ovh.net [46.105.52.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D381F942
	for <linux-i2c@vger.kernel.org>; Wed, 11 Dec 2024 05:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.52.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733895996; cv=none; b=cAwzy0zpCfGLKo/78v5fOHRIbXwF5kpKAeahSKOXlb1B2UIZqn++JtPRAeTZfC0G6RdRCMnTQQUOWlONg/olzCXl7/GeHrCbYJuBBW+5W/lR2gf68Fe/9Lkug4od8cVbQtonvtE/UhajpNVZUSqpymtnu4DfWeK3azShFS9rB5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733895996; c=relaxed/simple;
	bh=73voq1+nS2AOlJ+wC0SqcovZv5fdtDSPoC5dfRhQmpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FybZg/ZvxPUWePQsMfVFkb1PmXfh6J7ZEHHp9QBrOg6FWG+1S3008/4E3TqiD2ntf4s/lri5n4zEBJ7+eTZTKxLhlxsHe7xu3YgL1V3FV2rD5IVjsmhw1lUDOslQs0X+s9E/GvveTn9ZZ7gQJlxIkKpN5yPAN9bo1sL+zsTrwec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.52.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.17.76])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4Y7Ckm3FTmz1T7p
	for <linux-i2c@vger.kernel.org>; Tue, 10 Dec 2024 22:16:48 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-cqbzp (unknown [10.110.118.5])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1493C1FDB7;
	Tue, 10 Dec 2024 22:16:48 +0000 (UTC)
Received: from etezian.org ([37.59.142.104])
	by ghost-submission-5b5ff79f4f-cqbzp with ESMTPSA
	id R4zCOM+9WGcUOAgA/GfvJg
	(envelope-from <andi@etezian.org>); Tue, 10 Dec 2024 22:16:48 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-104R0053cdd9557-f5ee-49d9-9e92-21227a38084a,
                    5F80FEE13E57FB08D6B3077815429B018F997372) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] i2c: nomadik: Enable compile testing for the Nomadik driver
Date: Tue, 10 Dec 2024 23:16:41 +0100
Message-ID: <20241210221641.2661577-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13677432069076683366
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrjeekgdduheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddtgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth

The AMBA bus header files do not generate compilation errors even
when the AMBA bus is not enabled in Kconfig via ARM_AMBA.

This allows the Nomadik driver to be compiled for testing
purposes with the COMPILE_TEST option enabled.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index ceb3ecdf884b..ae4772faa876 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -910,7 +910,7 @@ config I2C_MXS
 
 config I2C_NOMADIK
 	tristate "ST-Ericsson Nomadik/Ux500 I2C Controller"
-	depends on ARM_AMBA
+	depends on ARM_AMBA || COMPILE_TEST
 	help
 	  If you say yes to this option, support will be included for the
 	  I2C interface from ST-Ericsson's Nomadik and Ux500 architectures,
-- 
2.45.2


