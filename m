Return-Path: <linux-i2c+bounces-5327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C88D294F8AE
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 23:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72DB01F213BC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 21:00:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B79194AE6;
	Mon, 12 Aug 2024 21:00:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 2.mo584.mail-out.ovh.net (2.mo584.mail-out.ovh.net [46.105.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C42F18CC0A
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.72.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723496402; cv=none; b=mn+jjNYTtx8s7XApq38MQy3OwGpWwXO/wQLNjuMQXnwKM0SXi0EVceTgzGeVFJrY0BOOco/QEn6+rymo4DUf+VSFjt2xUol4WtO9tertwhCoxII8Nkd5/npI0c8Y3NO/ePHDHFDs9wnJ6Sx+FMSbDj2qmzwXc1hEUSdjcLdIESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723496402; c=relaxed/simple;
	bh=PXH7w7oIo+7qDP4e1IIFbtttlz47fnV3pq9TAC8mdzg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jR6ljsZY1e/JM1Lw0HgYcUV84GN0X7WSwGNl8s/J480v03pSokbMnnbXT6O3Bs/TKNJZiSe1Jg7pB7ySNKdh2c7tc1WMP9yBVGIdw9aUGTzWOctUBIhEjE6QDbuuZI6dXIFj9DQT9ilzYauDjihEOaCfR/m1phTx1zf8SXRD9K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director2.ghost.mail-out.ovh.net (unknown [10.109.140.194])
	by mo584.mail-out.ovh.net (Postfix) with ESMTP id 4WjPz21ZZFz1ClL
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 19:41:34 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-7dk29 (unknown [10.110.164.171])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id AE2161FD58;
	Mon, 12 Aug 2024 19:41:33 +0000 (UTC)
Received: from etezian.org ([37.59.142.107])
	by ghost-submission-6684bf9d7b-7dk29 with ESMTPSA
	id QzurJ21lumbbIwAAkD473A
	(envelope-from <andi@etezian.org>); Mon, 12 Aug 2024 19:41:33 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-107S001f1538416-2e9f-46cc-9bb0-80c32d36f6d4,
                    664DA16141902EE5CF70331F943976485F5C157F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:188.155.229.193
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH 0/2] Add missing icc_disable in exit path
Date: Mon, 12 Aug 2024 21:40:27 +0200
Message-ID: <20240812194029.2222697-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 7308779246907820661
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddruddttddgudegtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhguihcuufhhhihtihcuoegrnhguihdrshhhhihtiheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpedtveeuieehfeetudejhfehleeijedvveetleefhfehuedtleektdevjedujefgvdenucfkphepuddvjedrtddrtddruddpudekkedrudehhedrvddvledrudelfedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomheprghnughisegvthgviihirghnrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqihdvtgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht

Hi,

Last week I committed the following patches from Gaosheng:

9ba48db9f77ce i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
b93d16bee5573 i2c: qcom-geni: Add missing clk_disable_unprepare in geni_i2c_runtime_resume

that wanted to add some cleanups in the geni_i2c_runtime_resume()
exit path. However, one case was overlooked. While addressing
this, I also replaced multiple return statements with a single
goto exit to improve code clarity and consistency.

I decided to keep the patches separate because the first patch
applies cleanly to the stable branch, whereas merging them into a
single patch would have created complications for backporting.

Thanks,
Andi

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Andi Shyti (2):
  i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
  i2c: qcom-geni: Use goto for clearer exit path

 drivers/i2c/busses/i2c-qcom-geni.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
2.45.2


