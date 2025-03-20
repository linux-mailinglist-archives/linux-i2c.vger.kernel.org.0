Return-Path: <linux-i2c+bounces-9946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A497BA6A53B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 12:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 807194625D8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 11:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E603224AE3;
	Thu, 20 Mar 2025 11:44:15 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 5.mo575.mail-out.ovh.net (5.mo575.mail-out.ovh.net [46.105.62.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826E8220683
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 11:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.62.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742471055; cv=none; b=kaQm3F+jJVV0ox5flVm6mxE/GMr0YlcIsowJDXGPuwsqTcwc2PpQASI4AG0I8CzNOp5rVrg78Tv24/QVSY6n4DUshwaiiLJ0C7c2q6s0kp+4tOZAkAUNK4HI4GV4/NIVpbQFfOmt4xsGv/zg9hL373yOaHqk6qpZNjOaN2yy3Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742471055; c=relaxed/simple;
	bh=q1JDobvctWfZvBFVRjNdCwbpGJZnUiXZyOJku4vtQz4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbJLy8B5Gsthi2yAamQt03CBWnYaTmz/nHkid7ycOWXDFOMIfsazEhUB48BWTTXFmGGvXZqso711TGb+O/FgNMNTxAfZA9UdG5g08+sub3PrUltXNqmgUCFkjnqtPjOjYWLJ8h+faYj4bfiWr3rAnzsf1wJVtmhyMn1VDFgkk8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.62.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.139.47])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZJNml1Km2z1rwh
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 11:35:35 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-v6m65 (unknown [10.110.188.207])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 6D3E21FEB8;
	Thu, 20 Mar 2025 11:35:34 +0000 (UTC)
Received: from etezian.org ([37.59.142.98])
	by ghost-submission-5b5ff79f4f-v6m65 with ESMTPSA
	id UB6VD4b922egZQAAPxPWZw
	(envelope-from <andi@etezian.org>); Thu, 20 Mar 2025 11:35:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R002cbf36733-db7b-4af7-b6c7-8b4b7dacfd1b,
                    7E69928ED4D8A226BEDEC5E8D42620266DA13BA9) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: k1: Initialize variable before use
Date: Thu, 20 Mar 2025 12:35:21 +0100
Message-ID: <20250320113521.3966762-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18268570414810598108
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeekuddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdfgvedujefhgfelkeffkeevudekheevieejhfelkedtieehleeuffdvueefjeffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdelkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth

Commit 95a8ca229032 ("i2c: spacemit: add support for SpacemiT K1
SoC") introduced a check in the probe function to warn the user
if the DTS has incorrect frequency settings. In such cases, the
driver falls back to default values.

However, the return value of of_property_read_u32() was not
stored, making the check ineffective. Fix this by storing the
return value in 'ret' and evaluating it properly.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503200928.eBWfwnHG-lkp@intel.com/
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>
---
Cc: Alex Elder <elder@riscstar.com>

 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 0d8763b852db..5965b4cf6220 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -514,7 +514,7 @@ static int spacemit_i2c_probe(struct platform_device *pdev)
 	if (!i2c)
 		return -ENOMEM;
 
-	of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
+	ret = of_property_read_u32(of_node, "clock-frequency", &i2c->clock_freq);
 	if (ret && ret != -EINVAL)
 		dev_warn(dev, "failed to read clock-frequency property: %d\n", ret);
 
-- 
2.47.2


