Return-Path: <linux-i2c+bounces-10802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 210B4AAB6B6
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 07:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C4151C223F5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 05:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65DAC43E208;
	Tue,  6 May 2025 00:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYrtfPgZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B536F884;
	Mon,  5 May 2025 22:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485880; cv=none; b=s3MPmwEWR3LpPKf/JsTlJbRfUQuIZq61Y1VdTE89zKqUpd8iHaw/buVT/jEXzzXPtZLD5tUDlfi53VG0Ef1KiX5F8/UMflp4SP1lCaeT9ZMBrjgxeuW9VYa28vNHAqHMXqEbfH3/YwXmHPUzOH5mOa/OcwOfAGOZCsBQDrULWy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485880; c=relaxed/simple;
	bh=9fb7gPx76H9hbHFncxQLWWnDmT/rk+JxEnduSOhGaEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ln2PKleH5bRT7C/y/X2YZeFNJf/sS53/Mhf0hg32l6AUEDJlb1FC4IOw+/2DiNg8vsHLpFfgpXCoRckXlcwqD11SLB/FsXJpRnnDCzworpJeyIf5Ra4RNdKl0aMd0L1oZrlsnKoc2uXNRacWxUrhKQSDNm9MKU+rN41reuYat3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYrtfPgZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8C7C4CEEF;
	Mon,  5 May 2025 22:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485879;
	bh=9fb7gPx76H9hbHFncxQLWWnDmT/rk+JxEnduSOhGaEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LYrtfPgZoHCAaeENO3F2A679K1jx4sW8CLWnpUTW9d5TNQ/o5X80YaLWOpvh5F1oB
	 3XRZnTjUQV+B77wWCAI1GqAbez3JnOUdnu4OyjzHdd0HowzvCjcqJMDQtw4s+WJPuM
	 kmrWiulwI/oV0qjNnoRDS9fbYaYBt3wW5Bt9DUyN6txS7Ba1OT9obZsfz8Lv8bJ/TY
	 B+jUPgEhHnsi2Kik8G7c3MecSOGNVLSpmhEIdBojmCMAcJuPZZ8SRRjGsExfJO6gan
	 KYfCX/ubKRdFEztYdD3VLl6p5kY4tBfBFvMxSDIe3dT8fJBK62mBDrSG6MqvBe2J2a
	 SoX/f54aorTtA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vitalii Mordan <mordan@ispras.ru>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 043/294] i2c: pxa: fix call balance of i2c->clk handling routines
Date: Mon,  5 May 2025 18:52:23 -0400
Message-Id: <20250505225634.2688578-43-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
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
index 3bd406470940f..affdd94f06aaf 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -1504,7 +1504,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
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


