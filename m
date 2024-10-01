Return-Path: <linux-i2c+bounces-7154-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A658D98C232
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 18:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68404280C7D
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Oct 2024 16:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9481CB317;
	Tue,  1 Oct 2024 16:04:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from 19.mo583.mail-out.ovh.net (19.mo583.mail-out.ovh.net [46.105.35.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E988F1CB314
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.35.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798654; cv=none; b=B3VO2eZeNsZ7b1XoIukoQSAypDvytmnJCvU0ZCBDzB8zZsheER+czlIhUvfhrAzR9uXo9d/kgkdAJmF+7YfpJSX+sk+GZ8L/iHI2KA9qDL2u+upzxTqjNk3Tt99rREO2cdxEHjFKvdhK9S8uY5zmD2je1O0LHscd11Wst34evBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798654; c=relaxed/simple;
	bh=5Ps6qaP3zQmDsMHKHbPv5tOEQw72uaJPiHCSZ93/QEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZY2DUjYqAXnpvJDzudF4un5MdDjfCoZS5v8z0nL1TCz1hhBwaqgyJeAbTQVnxP6vazHAvfEYoXYh0gDHWC4rQThkMdVt7zdutoUEL5+YkSQHL/wP5XPjmrZtnsb/boQHoczS6LyIlTwcP07MaADroYwgjDqkz6A+9pilw7e1EHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=etezian.org; arc=none smtp.client-ip=46.105.35.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etezian.org
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.140.34])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4XHzVj2TLxz1Ppr
	for <linux-i2c@vger.kernel.org>; Tue,  1 Oct 2024 13:36:29 +0000 (UTC)
Received: from ghost-submission-55b549bf7b-kpzdn (unknown [10.110.164.11])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 1B7CF1FE5F;
	Tue,  1 Oct 2024 13:36:27 +0000 (UTC)
Received: from etezian.org ([37.59.142.110])
	by ghost-submission-55b549bf7b-kpzdn with ESMTPSA
	id ZIraKdv6+2YL7gAAvqo9vA
	(envelope-from <andi@etezian.org>); Tue, 01 Oct 2024 13:36:27 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00467e7d24f-62e5-415c-8458-368343432183,
                    19B342EA1BF14464D5388E9C092C63149640B63F) smtp.auth=andi@etezian.org
X-OVh-ClientIp:188.155.229.193
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: qcom-geni: Keep comment why interrupts start disabled
Date: Tue,  1 Oct 2024 15:36:20 +0200
Message-ID: <20241001133620.2651795-1-andi.shyti@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18076604480472025671
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeftddrvddujedgieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughirdhshhihthhisehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheptdevueeiheeftedujefhheelieejvdevteelfefhheeutdelkedtveejudejgfdvnecukfhppeduvdejrddtrddtrddupddukeekrdduheehrddvvdelrdduleefpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhivdgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehkeefpdhmohguvgepshhmthhpohhuth

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

The to-be-fixed commit rightfully reduced a race window, but also
removed a comment which is still helpful after the fix. Bring the
comment back.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
---
Hi,

I'm resending this patch from Wolfram so that we don't lose it. All the changes
in this v2 have been agreed during code review.

Here's the difference:
v1 -> v2:
 - Reword the comment.
 - Remove the Fixes tag.
 - Add Bjorn's r-b.

 drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 212336f724a69..b48f25c58baa9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -818,6 +818,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	init_completion(&gi2c->done);
 	spin_lock_init(&gi2c->lock);
 	platform_set_drvdata(pdev, gi2c);
+
+	/* Keep interrupts disabled initially to allow for low-power modes */
 	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
 			       dev_name(dev), gi2c);
 	if (ret) {
-- 
2.45.2


