Return-Path: <linux-i2c+bounces-5328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 151D694F963
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 00:11:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 474CB1C210B8
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 22:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E038194A57;
	Mon, 12 Aug 2024 22:11:07 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net [178.32.96.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90441607B9
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 22:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.32.96.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723500667; cv=none; b=DaiqWzoqiDb8GnMtcxoeJbZdUS37mqUiHTADcwVDIH+po0njzxy02ZN5kK3uHlmO+dHE+YytGa9jNcmAg70V/xRz5HXUP3e5iRwXUNfn3dLxxGlp8DKTrL0ZCzS/e6bQX1p5yS11lgMJ13Ca8wKE65DE+nddUt3zXvV1/vKXPMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723500667; c=relaxed/simple;
	bh=Vny6rVwCTckTsxlHsRJUyiuClvSveUMZim97hZB4hHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NT/KZ8DECxpxQxBJZDCRHE/W2ZB3ho9bbumtkFVR9DscCtSJ1tUOwNA2FhaLHhJr3SzN9bTH6Gu/G89neJUae5cTSh8DsfmzP+Ha6WJ0FUfO+z0oqDDLP66GA0Dmb0kFv36se0+zUCEeTWfl/jC/lgfeAEIMyUL0jB0yZA7WnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=178.32.96.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.25.63])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4WjPz53wN1z1K92
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 19:41:37 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-bv82q (unknown [10.110.168.204])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 208E91FE44;
	Mon, 12 Aug 2024 19:41:37 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-bv82q with ESMTPSA
	id PQHzBXFlumYxwwUAnZV3Uw
	(envelope-from <andi@etezian.org>); Mon, 12 Aug 2024 19:41:37 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S0013ee0e8b8-6fb8-4627-9d96-24fc406607d9,
                    664DA16141902EE5CF70331F943976485F5C157F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:188.155.229.193
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 2/2] i2c: qcom-geni: Use goto for clearer exit path
Date: Mon, 12 Aug 2024 21:40:29 +0200
Message-ID: <20240812194029.2222697-3-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812194029.2222697-1-andi.shyti@kernel.org>
References: <20240812194029.2222697-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7309623672837769845
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddruddttddgudeflecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudekkedrudehhedrvddvledrudelfedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht

Refactor the code by using goto statements to reduce duplication
and make the exit path clearer.

Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

 drivers/i2c/busses/i2c-qcom-geni.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 06e836e3e8773..ebb5900fd3227 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -986,21 +986,24 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret) {
-		geni_icc_disable(&gi2c->se);
-		return ret;
-	}
+	if (ret)
+		goto out_icc_disable;
 
 	ret = geni_se_resources_on(&gi2c->se);
-	if (ret) {
-		clk_disable_unprepare(gi2c->core_clk);
-		geni_icc_disable(&gi2c->se);
-		return ret;
-	}
+	if (ret)
+		goto out_clk_disable;
 
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
+
 	return 0;
+
+out_clk_disable:
+	clk_disable_unprepare(gi2c->core_clk);
+out_icc_disable:
+	geni_icc_disable(&gi2c->se);
+
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_suspend_noirq(struct device *dev)
-- 
2.45.2


