Return-Path: <linux-i2c+bounces-10794-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DA7AAA722
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 02:26:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFE11886220
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 00:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFA429ACF1;
	Mon,  5 May 2025 22:36:12 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 18.mo583.mail-out.ovh.net (18.mo583.mail-out.ovh.net [178.33.45.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FA029ACC9
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 22:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.45.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484571; cv=none; b=tu4V+SHnNMWLTV2cQjKKU73sDfR0abpKoOiW1/BoqYTJm/coBSFNRikT51Uqscbczn4cjt473+CHFZo/okV2wUxCz8E0mIkLf80S2Ml5DKNbpegGawRkYQ5aGCPsZ85r+mZzCo7IBPnhyxOh/U2XGjyGhVOprUTVm0+dBMS4i14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484571; c=relaxed/simple;
	bh=0n77nqDH2VOz7wEa9efLuLLSrXCuzKT3mFw1jNTKCGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCzwxwbrMKeI1zCXgDoYZekkOZHJD02crKHq+07BJL2Wcu2eVtcbBwx3hi6z/sLHjnOh8qfg9zXQ+oAWYk0+hTmXWK9mVPLVMIU6CopQReJXF68Mm3XXHsxtSiLd4fuMWymHJP7Z9gllkMs6A5LZQU7b5ykHscblcOyBtkMljDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.33.45.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.139.93])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZrwQv3Y6xz1WZr
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 21:59:03 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-79r2f (unknown [10.111.174.155])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1862B1FE0F;
	Mon,  5 May 2025 21:59:03 +0000 (UTC)
Received: from etezian.org ([37.59.142.102])
	by ghost-submission-5b5ff79f4f-79r2f with ESMTPSA
	id IXL9MaY0GWgTAAAAURc+rw
	(envelope-from <andi@etezian.org>); Mon, 05 May 2025 21:59:03 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-102R00426fefde4-4c18-406c-9206-cad9652fb832,
                    947DC8955DF830370B505A772261845D5CB3C479) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH] i2c: mlxbf: Allow build with COMPILE_TEST
Date: Mon,  5 May 2025 23:58:54 +0200
Message-ID: <20250505215854.2896383-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3794001215257381585
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkedvvdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddujeekrdefledrledtrdelvddpfeejrdehledrudegvddruddtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth

Extend the Kconfig dependency to include COMPILE_TEST so the
Mellanox BlueField I2C driver can be built on non-ARM64 platforms
for compile testing purposes.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Khalil Blaiech <kblaiech@nvidia.com>
Cc: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index adb2910525b1..9f216d5db91d 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -855,7 +855,7 @@ config I2C_LS2X
 
 config I2C_MLXBF
         tristate "Mellanox BlueField I2C controller"
-        depends on MELLANOX_PLATFORM && ARM64
+        depends on (MELLANOX_PLATFORM && ARM64) || COMPILE_TEST
 	depends on ACPI
 	select I2C_SLAVE
         help
-- 
2.49.0


