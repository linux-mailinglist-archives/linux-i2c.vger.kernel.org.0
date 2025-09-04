Return-Path: <linux-i2c+bounces-12637-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F4FB43EFB
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E14A3A2791
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5779332A800;
	Thu,  4 Sep 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1YwK/tA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FAD320CA0;
	Thu,  4 Sep 2025 14:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996300; cv=none; b=rxQ5O93Vn3YxUcXDCtZuuvi3i2Yhukptd+ankDM+NiZ0TbwpJDQt26z9M0FcRFiIMbr8u+0Qyn8CMabOmI4UsoU2OXJQM9GDdLVCXOWnIqRN3QyKQjwlbLym9wSCcHzqDtNKytQ32Y2xui+HSY29pjtA9JbfPlOo0wP9mnVvQLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996300; c=relaxed/simple;
	bh=W3FRmWKbxHyNCOUd1Ra/+kxcH/HvrKsMg+junB/0Om4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIoQBF3JUoWw5gdRie/LYO2I0+oioa0b9ADPPkWBgwHVjlRG7FgsM9yEUbTdp6hwjwZZfWSdjVxqW/y8B2QCRNVUs9DP/pEqGqYKSjLlzyjZ7eWJz1xRz2tYwwcR+1vhUQfHdF13tK/3XD1mHCtk1CsD2DcKl6F+PGLhkU/akdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1YwK/tA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5B1C4CEF7;
	Thu,  4 Sep 2025 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996299;
	bh=W3FRmWKbxHyNCOUd1Ra/+kxcH/HvrKsMg+junB/0Om4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1YwK/tAI88YuMOWlAWjfNW8vHMWlsnrvxoo8jEIZldic1uaIbdadBfHEpsvyL1Hk
	 822H3UZbyZ5WBv+SDpZ6fEaP6XcJ3OCeZe61Eyp0RbMzH0bUgknTnoi5XSBpBVIuR3
	 nydwRmt63tLs1nFSeCRg3ytwmGBjTHgDTI7dXyvSN3U3Xix29yGXYaDO/Qk1hzCokU
	 f39INelvMuCL0RcOdz/OIDD94awvCkwqOdv11gNnCszLu+3B6UiLpqGN7qOBzvFqIm
	 tJRzJGIgygK4LMjjcUMKmFeThgY9GztHXfwRAJI+Cztl0rDSUnfHWtxtTTkjmd2d6p
	 9x4spEnOYPKPg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 04 Sep 2025 16:31:22 +0200
Subject: [PATCH 3/5] i2c: qcom-cci: Drop single-line wrappers
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-topic-cci_updates-v1-3-d38559692703@oss.qualcomm.com>
References: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
In-Reply-To: <20250904-topic-cci_updates-v1-0-d38559692703@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=1950;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=WftzdXiZKmnGP1b2v0Y7K87fxqhQ28Y81WkkVpsPg+Q=;
 b=fUGSJ3BylEq92lSIcEo1k0bSIPUy6oBmacbpkpw61NhbnUTv3X+oxbt8hmwWDgiHk7q0xKgqB
 jOC775FI8wBCQGAdCnpaBsmTSDKK2N2RqxiNsqbV4iQM3aB0/6VU6t7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The CCI clock en/disable functions simply call bulk_ops, remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a3afa11a71a10dbb720ee9acb566991fe55b98a0..74fedfdec3ae4e034ec4d946179e963c783b5923 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -466,21 +466,12 @@ static const struct i2c_algorithm cci_algo = {
 	.functionality = cci_func,
 };
 
-static int cci_enable_clocks(struct cci *cci)
-{
-	return clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
-}
-
-static void cci_disable_clocks(struct cci *cci)
-{
-	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
-}
-
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
 
-	cci_disable_clocks(cci);
+	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
+
 	return 0;
 }
 
@@ -489,11 +480,12 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	struct cci *cci = dev_get_drvdata(dev);
 	int ret;
 
-	ret = cci_enable_clocks(cci);
+	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
 	if (ret)
 		return ret;
 
 	cci_init(cci);
+
 	return 0;
 }
 
@@ -592,7 +584,7 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
-	ret = cci_enable_clocks(cci);
+	ret = clk_bulk_prepare_enable(cci->nclocks, cci->clocks);
 	if (ret < 0)
 		return ret;
 
@@ -651,7 +643,7 @@ static int cci_probe(struct platform_device *pdev)
 error:
 	disable_irq(cci->irq);
 disable_clocks:
-	cci_disable_clocks(cci);
+	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
 
 	return ret;
 }

-- 
2.51.0


