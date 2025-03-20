Return-Path: <linux-i2c+bounces-9929-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 843E8A69DAE
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 02:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4A763BCC6F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 01:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7E31CAA7F;
	Thu, 20 Mar 2025 01:38:42 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 7.mo561.mail-out.ovh.net (7.mo561.mail-out.ovh.net [46.105.57.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87951C3C07
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.57.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742434722; cv=none; b=ty28jMjfsDNw3Cilq7hwCEplzItQ1HXeh3KmEESqij7H5ZSjoxPQDHvhmNO96ockQ+aF5xYHLRJYfbs6xWpLWf5xqUXike4k+CUMIh0Efv4/ILZ3Q942kiadZqk9XQKPPqKzOQV/deoE267ZrVlTuywdHvSDxn153pSYzBCimsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742434722; c=relaxed/simple;
	bh=bCkV5BwAu8o/fgxHLWzERHt3VFsuf963BAcMBrPponE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H2PBBFIDP5Ac7aGQAqxC784Ufk3IYAuJtJHx3uef22rNwjzTWqmHMZC5VBY72rODKwstDHX2yfH8gN6GdTatNpBucKJvzE7QNaLmUB3IXqOA2cEEA2ezIkdLHonVmHH2JeEY/UrK1Pl33Q9ayzv9nR7GVFCG54hbRBPn6gvayk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.57.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.109.140.73])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZJ6JQ1qGsz17M6
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 00:43:34 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-nlt9b (unknown [10.111.182.10])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 97C891FD21;
	Thu, 20 Mar 2025 00:43:32 +0000 (UTC)
Received: from etezian.org ([37.59.142.114])
	by ghost-submission-5b5ff79f4f-nlt9b with ESMTPSA
	id Dit9FbRk22fm9wAAAOykqQ
	(envelope-from <andi@etezian.org>); Thu, 20 Mar 2025 00:43:32 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S0083c68eb70-94d2-4425-a073-ce94d69c8a06,
                    7E69928ED4D8A226BEDEC5E8D42620266DA13BA9) smtp.auth=andi@etezian.org
X-OVh-ClientIp:178.39.90.92
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>,
	Zhang Songyi <zhang.songyi@zte.com.cn>
Cc: Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: npcm7xx: Remove redundant ret variable
Date: Thu, 20 Mar 2025 01:43:21 +0100
Message-ID: <20250320004321.1914366-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7256987850828089927
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeeikedtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnhepgeevuddvfffhhfdthfekhfduffekueeukefhhfeigeetffekheeuleetffdvhffgnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkphepuddvjedrtddrtddruddpudejkedrfeelrdeltddrledvpdefjedrheelrddugedvrdduudegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht

From: Zhang Songyi <zhang.songyi@zte.com.cn>

Return value from npcm_i2c_get_slave_addr() directly instead of taking
this in another redundant variable.

This improvement has been suggested by Zeal Robot <zealci@zte.com.cn>

Signed-off-by: Zhang Songyi <zhang.songyi@zte.com.cn>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

I'm just fishing this patch from the past[*]. I made some tiny
changes in this v2.

Andi

Changelog:
v1 -> v2:
 - Rebased on top of the latest kernel.
 - Removed Zeal Robot's credit as "Reported-by:" tag as this is
   used mainly for bug reports.
 - Capitalized Zhang's name in the SoB.
 - Removed redundant cast to integer inside ioread8.

[*] https://patchwork.ozlabs.org/project/linux-i2c/patch/202211031628039654230@zte.com.cn/

 drivers/i2c/busses/i2c-npcm7xx.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npcm7xx.c
index de713b5747fe..a31d9a6677a8 100644
--- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -1115,14 +1115,10 @@ static void npcm_i2c_master_abort(struct npcm_i2c *bus)
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 static u8 npcm_i2c_get_slave_addr(struct npcm_i2c *bus, enum i2c_addr addr_type)
 {
-	u8 slave_add;
-
 	if (addr_type > I2C_SLAVE_ADDR2 && addr_type <= I2C_SLAVE_ADDR10)
 		dev_err(bus->dev, "get slave: try to use more than 2 SA not supported\n");
 
-	slave_add = ioread8(bus->reg + npcm_i2caddr[(int)addr_type]);
-
-	return slave_add;
+	return ioread8(bus->reg + npcm_i2caddr[addr_type]);
 }
 
 static int npcm_i2c_remove_slave_addr(struct npcm_i2c *bus, u8 slave_add)
-- 
2.47.2


