Return-Path: <linux-i2c+bounces-12639-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FEEB43EF1
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11982172C8C
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 14:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CF9335BDC;
	Thu,  4 Sep 2025 14:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxeJqDF4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16BC32142F;
	Thu,  4 Sep 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996304; cv=none; b=YgPA74AHXgMOnvOy3WERYzD1sv8ISLyprkragW761SvIS89jYiDd1egWIC+Wcy59wRAJSkIemS7NGdv5MAVpsmZwzN6Ns2df9Gaq/0dFjQEXM0n0+HKAelNGH5FaoeRm1QOWmMKuN5Kvv3WxIKa4Iv2FhPnHHm4ZxcxCLGcby48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996304; c=relaxed/simple;
	bh=vMwA0SB53TkFbWIrdRMPy5fzrwWXCHQQ/8K295B3rig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKG+UA77p9TPV3AkS3xGpKksCmPCByDRbPXjMc2IyoWwZEUGnNSpmD4/Ti712aYzKWl/aX32+3q8gH+DxGZS6naBvvZT7sTRffPI+gdHiLf18payrXBngCypdYqfIyPNWVhrZQG/ak6WsfEd7O75LLGk/CIUfau5IadI7rxEmtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxeJqDF4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84828C4CEF1;
	Thu,  4 Sep 2025 14:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996304;
	bh=vMwA0SB53TkFbWIrdRMPy5fzrwWXCHQQ/8K295B3rig=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QxeJqDF4c0vCQ+fU3l2j22mAgJ4wAMtH+g9/kRGR75p/hds+30SbjkFNkVPKNBlL2
	 CjQ3lGzdNharVE9D+dtKtAoAvQXbPadsimdfvurHOgvfsnIbvQGH73mXDbm+Y1Y+Vp
	 shRk399GXQZkhGMqoEl28tkQiOCoqiJLl7vHqwuewHQ1cU8QeASCjVk3zsE+PaZwJS
	 xaoVblJ9yQ6TMM/NusCGeYUSP6ZVMlszxDcL7pnKuerPqPSQnJmHSLsVoab6BXmCWV
	 wkl5bbxLOpa2l1loYmJJTDDKmuaqiJ/xlt14bQegAXPG8fNsjQ6bpfbfFCOJhRdBCv
	 wc3wiLf3rVIZg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 04 Sep 2025 16:31:23 +0200
Subject: [PATCH 4/5] i2c: qcom-cci: Add OPP table support and enforce
 FAST_PLUS requirements
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-topic-cci_updates-v1-4-d38559692703@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756996284; l=2740;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=esmE6Br08dCVGEBntkla7rJKl1xlxC8bF8RScCLVl3E=;
 b=NbX70ApqPifadDof2Jp1gvqdkTWncOItW7toAG2hQbHvqi4f/NnnUNBH1CfL6Tihr4l2XiUCL
 PkBaTu+OrALCUX0JGookjl55lemoW3a1d98EFxKgACQ+tx0e540c5Uh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The CCI clock has voltage requirements, which need to be described
through an OPP table.

The 1 MHz FAST_PLUS mode requires the CCI core clock runs at 37,5 MHz
(which is a value common across all SoCs), since it's not possible to
reach the required timings with the default 19.2 MHz rate.

Address both issues by introducing an OPP table and using it to vote
for the faster rate.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 74fedfdec3ae4e034ec4d946179e963c783b5923..d6192e2a5e3bc4d908cba594d1910a41f3a41e9c 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 
 #define CCI_HW_VERSION				0x0
@@ -121,6 +122,7 @@ struct cci_data {
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
 	struct hw_params params[3];
+	bool fast_mode_plus_supported;
 };
 
 struct cci {
@@ -466,9 +468,22 @@ static const struct i2c_algorithm cci_algo = {
 	.functionality = cci_func,
 };
 
+static unsigned long cci_desired_clk_rate(struct cci *cci)
+{
+	if (cci->data->fast_mode_plus_supported)
+		return 37500000ULL;
+
+	return 19200000ULL;
+}
+
 static int __maybe_unused cci_suspend_runtime(struct device *dev)
 {
 	struct cci *cci = dev_get_drvdata(dev);
+	int ret;
+
+	ret = dev_pm_opp_set_rate(dev, 0);
+	if (ret)
+		return ret;
 
 	clk_bulk_disable_unprepare(cci->nclocks, cci->clocks);
 
@@ -484,6 +499,10 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = dev_pm_opp_set_rate(dev, cci_desired_clk_rate(cci));
+	if (ret)
+		return ret;
+
 	cci_init(cci);
 
 	return 0;
@@ -588,6 +607,19 @@ static int cci_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = devm_pm_opp_set_clkname(dev, "cci");
+	if (ret)
+		return ret;
+
+	/* OPP table is optional */
+	ret = devm_pm_opp_of_add_table(dev);
+	if (ret && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+
+	ret = dev_pm_opp_set_rate(dev, cci_desired_clk_rate(cci));
+	if (ret)
+		return ret;
+
 	/* Interrupt */
 
 	ret = platform_get_irq(pdev, 0);
@@ -775,6 +807,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 3,
 		.tsp = 3
 	},
+	.fast_mode_plus_supported = true,
 };
 
 static const struct of_device_id cci_dt_match[] = {

-- 
2.51.0


