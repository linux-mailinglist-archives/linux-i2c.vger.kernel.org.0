Return-Path: <linux-i2c+bounces-12209-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F081B1FADF
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 17:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82901189B66B
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 15:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B96A726E702;
	Sun, 10 Aug 2025 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="S7HoNoeZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E5185E4A;
	Sun, 10 Aug 2025 15:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754840814; cv=none; b=o2IesEMnxGe3/XhFt07Q9F7z9MuKdLV267mhmqTrg2IYxb+L2X0Q4fuPiWedECMD3+eP0asSq3oAV0RkQ93VWZ3X/KlB06S/dl6GHqruIirSxxIFSGXXIp7G/EbD9u8HJiN0SYBDHcnL4ZYLrik40Ysd5rCoUAogAoZ9cGM1AWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754840814; c=relaxed/simple;
	bh=WUXID789f+/DwmhvFyePFKMT5KQ3vs8ufXTkrr/XCd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRbnnAnkamzRz6ENlKotTJpaM+K6fpji8Ke4scRpo96nj25ChA4unUxh3/9I04lok00jmUskMRC3qraHRr/Jhpl6ByFuTcVk/6qnVhfxc8eYC6RRMUTbdpzLXh8648P1jLQeK4/FP3yi6vPCVF2p6b8XMtSYR/FoaisRz82KxJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=S7HoNoeZ; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1754840306; bh=WUXID789f+/DwmhvFyePFKMT5KQ3vs8ufXTkrr/XCd0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=S7HoNoeZEnnfc/6NlWhVnZS9hIoq2TWPsggmVlb1hLo23LdteWEdiV8uNUhw9ZlJE
	 GHpDAS0Fr/RygjPFpKSpM5UjwJ8+MGg1SP4TRbij/mE7y2OVIpbNxI4I2xcuxHGkEt
	 /GIzzAhc59eKudONB+tInKW/ILNsF/WRcaz8W7lE=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 10 Aug 2025 17:37:53 +0200
Subject: [PATCH 2/7] i2c: qcom-cci: Add msm8953 compatible
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-msm8953-cci-v1-2-e83f104cabfc@lucaweiss.eu>
References: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
In-Reply-To: <20250810-msm8953-cci-v1-0-e83f104cabfc@lucaweiss.eu>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=WUXID789f+/DwmhvFyePFKMT5KQ3vs8ufXTkrr/XCd0=;
 b=kA0DAAoBcthDuJ1N11YByyZiAGiYvOuhwgGaOEXFQ0iF06MuuYr8ddYT+D/9AbgzNrK4Miq46
 YkCMwQAAQoAHRYhBDm60i8ILNqRuhWP+nLYQ7idTddWBQJomLzrAAoJEHLYQ7idTddWsMEP/R1I
 jhULmgIYOK4frW3VMq4fUT3eNE+MO0qROh/eCOEfll8Qsvo4Wyk8XUXB7E9p8iBQd8zZgGWuNCn
 U2jOss3ev946S+vW07btP7dEOW6GbvBwwzaF7qMfkmAAIFx1gqHgGduT/SCltcxtuuW8bGGs0be
 RbB7D3m8pn1bXqLwNuZ5yGI93F7nZ+iaQ0HGQc/s49fqBgVhfTy6nzE+/+L9ILngbAj5+U+N8/G
 myZbHMICDi1m8yVQtbnghtBiWLw7/wpQyOwuCq3AaDsdJHOzLIvu3lOPa0JdD1tWs6ST41atapk
 IcX20RORcw/RuqmA1PTV4R5+qs3CujnDTG9e7H59/yFzWEii9CaKurw97kh1/drwNLlhlOhdayn
 jE2sQs7MsbqOdQNsf0G+A/oJdfrPwf1PSCkZqN8u/KMkflJ3QehikjoDApc3dRGgwkULoKh+Olv
 vPpRctJGW2LgSX38fshJhziSyIi6713EM5KVXiYRSpD6AZJ3gMBC4TlMM3ABOv69NfinVYNnQJ9
 ytRGpcbjuAoAEVIMyvK9W1WPrl/eAg7n2bGlxbU5rWD3JJ4bEIo7KuvA9Ek/uJizcO29UcdmicM
 fdyCGQcvmHC0Lp3GJkzRt8xa4isld4qy16S1SZTMLUt629VM9RYsetISFqV8VPC1FoZOXYDvQCI
 CtHHg
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

Add a config for the v1.2.5 CCI found on msm8953 which has different
values in .params compared to others already supported in the driver.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 46 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a3afa11a71a10dbb720ee9acb566991fe55b98a0..2e3ceafec6cc755ea6083f2e6b85240d1a6d9187 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -785,8 +785,54 @@ static const struct cci_data cci_v2_data = {
 	},
 };
 
+static const struct cci_data cci_msm8953_data = {
+	.num_masters = 2,
+	.queue_size = { 64, 16 },
+	.quirks = {
+		.max_write_len = 11,
+		.max_read_len = 12,
+	},
+	.params[I2C_MODE_STANDARD] = {
+		.thigh = 78,
+		.tlow = 114,
+		.tsu_sto = 28,
+		.tsu_sta = 28,
+		.thd_dat = 10,
+		.thd_sta = 77,
+		.tbuf = 118,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 1
+	},
+	.params[I2C_MODE_FAST] = {
+		.thigh = 20,
+		.tlow = 28,
+		.tsu_sto = 21,
+		.tsu_sta = 21,
+		.thd_dat = 13,
+		.thd_sta = 18,
+		.tbuf = 32,
+		.scl_stretch_en = 0,
+		.trdhld = 6,
+		.tsp = 3
+	},
+	.params[I2C_MODE_FAST_PLUS] = {
+		.thigh = 16,
+		.tlow = 22,
+		.tsu_sto = 17,
+		.tsu_sta = 18,
+		.thd_dat = 16,
+		.thd_sta = 15,
+		.tbuf = 19,
+		.scl_stretch_en = 1,
+		.trdhld = 3,
+		.tsp = 3
+	},
+};
+
 static const struct of_device_id cci_dt_match[] = {
 	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
+	{ .compatible = "qcom,msm8953-cci", .data = &cci_msm8953_data},
 	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
 	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
 

-- 
2.50.1


