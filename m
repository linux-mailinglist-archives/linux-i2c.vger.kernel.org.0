Return-Path: <linux-i2c+bounces-10795-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BFEAAA924
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 03:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC1CE1887F06
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 01:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64611359042;
	Mon,  5 May 2025 22:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnCs/ZAV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986827D78A;
	Mon,  5 May 2025 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484912; cv=none; b=UnjjObl324S/YeIi51A5vRMVPMHKhubxJejk/pihT77uRxky+VC+QPsSB3pwauq3oDpiA5RflZbYd8kx+W84KKkAqcoGonkDUpE0WGwKLBUz6reQDfSChB6MMgIBLI1fp7nQx9LSYpJ385GV9obv3eN47kV28q355+JzCKnTeeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484912; c=relaxed/simple;
	bh=qwYCagQop5BpTjSn3yF121cknD/oRVQ9uIR8lwKt7tc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hanhQhiLzq+mU24JVqxOSECvjZnuBre+sqo6ICamWGDZZkWfaPNGaz0gQvYHimxp8701Rw+WuaYWix0nmbnwxiSZ0x/wwKGLJMOQKfeoS7ovns22/YeUGV07NOKdUe3Hz4QKW1nePnXnTC6SHXeEA8VRXvfVpu8T8XAOWpER0Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnCs/ZAV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DE50C4CEEF;
	Mon,  5 May 2025 22:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484911;
	bh=qwYCagQop5BpTjSn3yF121cknD/oRVQ9uIR8lwKt7tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnCs/ZAVLVNtqy0/bbjiUEdxOmSkbsCRyQOgly99EGkbq9glQZiuGEnxfGa4Co5rZ
	 ca2Md5FCUxmqmgkuHOnsvmmZfRA5es2kECkdtpCRLt9C3zAxgeTuPjDEsGtVLn5ACe
	 NqaiF+L4QwMCvl2SnwpIOVvDvCqbHpkjfgAXJQ3ypPkpI6cqNe2jGv1ayftreJBasE
	 4sVkfO+Jt9B2J2x+5+THjYhHb8aWMSUB6hw9eebmOcn1yGXoaOZbaHZ50HXr8YNb+2
	 kJ8arJSxlwCsuWm2ZizKMQEFq4rYfe5QIKsIh8UJvPrVKyFFjBlVDaO0GXiFVWwsnm
	 BxCF+CO9oU4sg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 071/486] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 18:32:27 -0400
Message-Id: <20250505223922.2682012-71-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
Content-Transfer-Encoding: 8bit

From: Vitalii Mordan <mordan@ispras.ru>

[ Upstream commit be7113d2e2a6f20cbee99c98d261a1fd6fd7b549 ]

If the clock i2c->clk was not enabled in i2c_pxa_probe(), it should not be
disabled in any path.

Found by Linux Verification Center (linuxtesting.org) with Klever.

Signed-off-by: Vitalii Mordan <mordan@ispras.ru>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Link: https://lore.kernel.org/r/20250212172803.1422136-1-mordan@ispras.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/i2c/busses/i2c-pxa.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 4d76e71cdd4be..afc1a8171f59e 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1503,7 +1503,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 				i2c->adap.name);
 	}
 
-	clk_prepare_enable(i2c->clk);
+	ret = clk_prepare_enable(i2c->clk);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to enable clock\n");
 
 	if (i2c->use_pio) {
 		i2c->adap.algo = &i2c_pxa_pio_algorithm;
-- 
2.39.5


