Return-Path: <linux-i2c+bounces-6100-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 756D996AE59
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 04:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C941F259BD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 02:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2AE4762D7;
	Wed,  4 Sep 2024 02:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUKAVVl+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA60C73478;
	Wed,  4 Sep 2024 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725415507; cv=none; b=CjQWv1OdUUVwVWgZf2fFYNX+Ppj9MAx6Rll0hXjBnECOG9dHRtvbFid528YEIguiHTwYm4/ibJVW/Tvjdu9iw5vJamTJBF3luSQwMAU9Z9X9Hi20JNet7CIbliCLvIOORi1Z76vizaUonqD2ACPGdFou8bOGXbTmFtLIcDrFFe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725415507; c=relaxed/simple;
	bh=vt2+NU0PGGgvQLCCBp6ebl69Ro+tvsA3sk6BQ2B9JgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQQGSshXImpwVaaZInAH0bEFkVYdTpux18qCzSCVLnXuEN0vmUEhGZD965Fmni1SzxjhiJgQImr1snkR5xKagfmcb4m7YmIoS+v/zeydK7tJOQA+BMDjlhLfxt6ItQIa0R1GtNqnwC6A7dOt3zRAEH2oTM7oJHw/+VZRC4EGMzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUKAVVl+; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-498eb76145bso2444105137.1;
        Tue, 03 Sep 2024 19:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725415504; x=1726020304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vnMs3zXlBnZ2vA/datU1VmC6mKeFmctQ1oOOReSN1A=;
        b=WUKAVVl+m5LTAFCjekG35mVFUiUJfL8dPA4pSJBOl9vSyqA/S5+XwS+tjt2nm5iher
         Ul+ZRHlICMJwAKgfdxLfhXpTojwwCjIOawdLnelZXmsIu+596NzFbhw+trAIN4qTjP9X
         rnUwK/lCMoMrG7Tvja41V99WqummuvIyFP0PlA/is+5M5pW731Q1kSkA7w203xKsdFsC
         7l85s7/U1o6PSZ3YH9mP9s2oBJNBwV8qacnsBk7N6keNFe53iunaNLEaAWeY1ctKC+Pr
         blxO+GcLPy9bCZMFNPIonJ/Cg7VNB4dS0vYr3a/eLdmkj48BbjJY6BHf+a0RhXI0p9qJ
         2gPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725415504; x=1726020304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vnMs3zXlBnZ2vA/datU1VmC6mKeFmctQ1oOOReSN1A=;
        b=irWYVoLS96NBXHemQ1U7PQ5PZCL1eMckm/T6ps5XgudE0YBuTFaIkB04tJ+NuNmwuk
         lB1DF7+dq5iMlB0d12hGzUFeMxQKMjAk/Wvr1CsCGWbzQeXuCQddtqBfci6TwGvWfbfr
         okqy/lgKkwDtnE81vwR6fjKCePAfIV5+2XjGFOuYZGpemckTG6Pwi17r+mucUdTfiDd5
         8qcGmb2Y9tDIKNvLf6KFRO1zh0dPxOjr6BmTAHcH/tiMNF8AwvDaGMsvk0tmKNNim2es
         A+/4hRMrFVdvkgLn7ZYsp6+1HbM7WlHh67/5FKj16XgI+Rc22hJZ6vGJYVsihnrVoQVD
         noZA==
X-Forwarded-Encrypted: i=1; AJvYcCVetZehHSZ9jOH8ZtCyO7Vnn4e8LlAqRZRbGSSbB+Wuajisk8+IERbheplUYfHpMQSOpermUBMUQ3EJRNd2Gw==@vger.kernel.org, AJvYcCWLAYOvskR41AdSbnZ+W15vjZHXU3GZHkjKcDPRmaT4uQR9J+eiVdM71+ofmoLnIMGbwUABUmCAug0T@vger.kernel.org, AJvYcCWYPScxswhdJYAnoLFTm6H8/j2RYIwlaMr661jyr2ICev6nWu2vjez/zcpZGNqEAwiKFYGXLWjEF+by@vger.kernel.org, AJvYcCXYjVmMmC+unN9MiMbyw6WFqTB3pv3OO11TFJ5rcUz48nhW1euvESkfyXTvoGwJoLAwYs1ELMX0UmJ9@vger.kernel.org, AJvYcCXxiZqHenOUFUMYLsOO8xVjQa9nse6hV2XDfif3ng0HM61sUrTyVlUWbbBf9bjmVWrlyUD9Oezo5GIwAjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2LQrw1B5XNpF5mkL5meWFiwIvBvjVRcLvHUKfqGFVdH4DBYpn
	eRWPCZwe2hU7sJa2cL8zU6YGSjgCTZ7SIl2ihvIeudqbjJGCTcvD71d4WtTq
X-Google-Smtp-Source: AGHT+IEUv7N0HMJTGd3B6E9mm/mkMuN5ztA3TMg1qt8ABIhEPRr2K1KWeHwxz0N+kAIxQpckpfdFQA==
X-Received: by 2002:a05:6102:b09:b0:493:e60c:e6d2 with SMTP id ada2fe7eead31-49a7992c5a3mr14011868137.12.1725415504397;
        Tue, 03 Sep 2024 19:05:04 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200::24da])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a806bf6d64sm583444585a.17.2024.09.03.19.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 19:05:04 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 5/7] media: qcom: camss: add support for SDM670 camss
Date: Tue,  3 Sep 2024 22:04:54 -0400
Message-ID: <20240904020448.52035-14-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240904020448.52035-9-mailingradian@gmail.com>
References: <20240904020448.52035-9-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem for the SDM670 the same as on SDM845 except with
3 CSIPHY ports instead of 4. Add support for the SDM670 camera
subsystem.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 191 ++++++++++++++++++++++
 1 file changed, 191 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..b2f22bfd8692 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -584,6 +584,185 @@ static const struct camss_subdev_resources vfe_res_660[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_670[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = { "soc_ahb", "cpas_ahb",
+				"csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 240000000, 269333333 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_670[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "cpas_ahb", "soc_ahb", "vfe0",
+				"vfe0_cphy_rx", "csi0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "cpas_ahb", "soc_ahb", "vfe1",
+				"vfe1_cphy_rx", "csi1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "cpas_ahb", "soc_ahb", "vfe_lite",
+				"vfe_lite_cphy_rx", "csi2" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 384000000 },
+				{ 19200000, 75000000, 384000000, 538666667 } },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_670[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe0", "vfe0_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe1", "vfe1_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE-lite */
+	{
+		.regulators = {},
+		.clock = { "camnoc_axi", "cpas_ahb", "soc_ahb",
+				"vfe_lite" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 100000000, 320000000, 404000000, 480000000, 600000000 } },
+		.reg = { "vfe_lite" },
+		.interrupt = { "vfe_lite" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_845[] = {
 	/* CSIPHY0 */
 	{
@@ -2403,6 +2582,17 @@ static const struct camss_resources sdm660_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sdm670_resources = {
+	.version = CAMSS_845,
+	.csiphy_res = csiphy_res_670,
+	.csid_res = csid_res_670,
+	.vfe_res = vfe_res_670,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_670),
+	.csid_num = ARRAY_SIZE(csid_res_670),
+	.vfe_num = ARRAY_SIZE(vfe_res_670),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.csiphy_res = csiphy_res_845,
@@ -2447,6 +2637,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
+	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
-- 
2.46.0


