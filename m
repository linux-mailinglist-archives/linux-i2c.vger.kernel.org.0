Return-Path: <linux-i2c+bounces-7600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1979B1445
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 05:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940BB1F22788
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2024 03:09:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C118E335BA;
	Sat, 26 Oct 2024 03:09:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C05217F43
	for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2024 03:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729912193; cv=none; b=aO0M/j9KbA/TANh2sIwDsgYlUT1bWlhDVyfOBJaAc8S6Ebhj8RO8j3fsSBsDgSpvVASsF/4S88LUEOcBYd17VJOZiVp+v/jwCUTP3dbA0tFQXR/GVltfQFopM6evTjQvIWBeV8ttLjGnbohQJNAiAwz0rtuKKu6/IuIEPH7ggHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729912193; c=relaxed/simple;
	bh=WSu1/k6ufcVyj9Qhwya9640RWvt420VAhn2FUxA2Vvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C5z3NMVP4hBGXQUvVrC4Cn38QXpX6W0MkW7wbrmJhoH6fa/bywUWwAipqqyZjb+9nt3HhDC4qE6SeABdK7I+oHPENQJ0jiK0SDgHlrTcYP1qhqTI8TPQlC9JQwp5ktE4h6VBcjsvt/wqmRTN4WgAmKlSWJS0dVgiR6BUPucWCfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Xb4Pp46Grz4f3kJr
	for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2024 11:09:34 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 053FA1A0197
	for <linux-i2c@vger.kernel.org>; Sat, 26 Oct 2024 11:09:47 +0800 (CST)
Received: from huaweicloud.com (unknown [10.84.78.15])
	by APP4 (Coremail) with SMTP id gCh0CgCn28d3XRxnzXWQFA--.26348S4;
	Sat, 26 Oct 2024 11:09:46 +0800 (CST)
From: Yang Yingliang <yangyingliang@huaweicloud.com>
To: peda@axentia.se,
	farouk.bouabid@cherry.de,
	andi.shyti@kernel.org,
	wsa+renesas@sang-engineering.com
Cc: linux-i2c@vger.kernel.org,
	yangyingliang@huawei.com,
	bobo.shaobowang@huawei.com
Subject: [PATCH] i2c: muxes: Fix return value check in mule_i2c_mux_probe()
Date: Sat, 26 Oct 2024 11:09:42 +0800
Message-ID: <20241026030942.1484-1-yangyingliang@huaweicloud.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgCn28d3XRxnzXWQFA--.26348S4
X-Coremail-Antispam: 1UD129KBjvdXoW7JFWUXrWUJFy7ZrWfKF1kAFb_yoWDtFXEka
	yDZwsxXr95Crn8ArnFkF43ZrZFvr15uFZ3J3y2kw4fA3ZxZwnavFyDuFZ3Wws5urZFyryY
	qw1j9F43uw1SyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbzkYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij
	64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
	8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE
	2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
	7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UK2NtUUUUU=
X-CM-SenderInfo: 51dqw5xlqjzxhdqjqx5xdzvxpfor3voofrz/

From: Yang Yingliang <yangyingliang@huawei.com>

If dev_get_regmap() fails, it returns NULL pointer not ERR_PTR(),
replace IS_ERR() with NULL pointer check, and return -ENODEV.

Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiplexer")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/i2c/muxes/i2c-mux-mule.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mule.c b/drivers/i2c/muxes/i2c-mux-mule.c
index 8e942470b35f..284ff4afeeac 100644
--- a/drivers/i2c/muxes/i2c-mux-mule.c
+++ b/drivers/i2c/muxes/i2c-mux-mule.c
@@ -66,8 +66,8 @@ static int mule_i2c_mux_probe(struct platform_device *pdev)
 	priv = i2c_mux_priv(muxc);
 
 	priv->regmap = dev_get_regmap(mux_dev->parent, NULL);
-	if (IS_ERR(priv->regmap))
-		return dev_err_probe(mux_dev, PTR_ERR(priv->regmap),
+	if (!priv->regmap)
+		return dev_err_probe(mux_dev, -ENODEV,
 				     "No parent i2c register map\n");
 
 	platform_set_drvdata(pdev, muxc);
-- 
2.33.0


