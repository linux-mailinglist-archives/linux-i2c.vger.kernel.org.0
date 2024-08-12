Return-Path: <linux-i2c+bounces-5317-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 090EB94F810
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 22:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 398F91C222AB
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 20:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443A719307D;
	Mon, 12 Aug 2024 20:18:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 9.mo575.mail-out.ovh.net (9.mo575.mail-out.ovh.net [46.105.78.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D092915C143
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 20:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.78.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723493926; cv=none; b=Xt+3ti6MYwnGzNQ3aJu6/y8F8k6K+FydYeSMfVYypqNM7WbxhWSpBifD3FWAl2TK0LYa79kBYrSaCsIYeScRR1dpAmwJZ/mFdteCls0RuAP/ZcgHhNnGDdTqLmiCoAxqBpKyFLjwjfgE5OS+lXbZzMHbCuXOITf15nSnUIiUBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723493926; c=relaxed/simple;
	bh=OwaYBx/xSKuijtieDU7h0nqtEahyb7C8n+PL7wBUgJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VDYHcvYL2aIoHxsmSi/xV/bpQnORwHER7+Y0r+x5DsBPJhgQHztVMFHev2o6vNjVoUt0Ftvo5Y8Er6YfqkBndEsOWxfHhBeST7jtC7An/naQDn1m9MMd9QLe0OB2iosn+Z1+sHV3zPaLkfsbxBxjot9XM7sJ7hH4FzqduVsN+M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.78.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director1.ghost.mail-out.ovh.net (unknown [10.108.2.211])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4WjPz44J09z1K6t
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 19:41:36 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-plhlz (unknown [10.110.118.244])
	by director1.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 283651FE44;
	Mon, 12 Aug 2024 19:41:34 +0000 (UTC)
Received: from etezian.org ([37.59.142.101])
	by ghost-submission-6684bf9d7b-plhlz with ESMTPSA
	id ymM3Km5lumZkMCAAii7AHw
	(envelope-from <andi@etezian.org>); Mon, 12 Aug 2024 19:41:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-101G00454ab9ec0-df5c-45fa-b21e-fd2114598578,
                    664DA16141902EE5CF70331F943976485F5C157F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:188.155.229.193
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	stable@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 1/2] i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
Date: Mon, 12 Aug 2024 21:40:28 +0200
Message-ID: <20240812194029.2222697-2-andi.shyti@kernel.org>
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
X-Ovh-Tracer-Id: 7309342197315013237
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddruddttddgudegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpefgudevjeetgeetlefhteeuteehgeefhefhkedtvdelheethfehveekudelueeuveenucfkphepuddvjedrtddrtddruddpudekkedrudehhedrvddvledrudelfedpfeejrdehledrudegvddruddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht

Add the missing geni_icc_disable() call before returning in the
geni_i2c_runtime_resume() function.

Commit 9ba48db9f77c ("i2c: qcom-geni: Add missing
geni_icc_disable in geni_i2c_runtime_resume") by Gaosheng missed
disabling the interconnect in one case.

Fixes: bf225ed357c6 ("i2c: i2c-qcom-geni: Add interconnect support")
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: <stable@vger.kernel.org> # v5.9+
---
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

 drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 365e37bba0f33..06e836e3e8773 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -986,8 +986,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 		return ret;
 
 	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
+	if (ret) {
+		geni_icc_disable(&gi2c->se);
 		return ret;
+	}
 
 	ret = geni_se_resources_on(&gi2c->se);
 	if (ret) {
-- 
2.45.2


