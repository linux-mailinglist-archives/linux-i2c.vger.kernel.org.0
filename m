Return-Path: <linux-i2c+bounces-5559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7614B957734
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 00:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D2442845EE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 22:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF0D1DF662;
	Mon, 19 Aug 2024 22:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUwOaNIx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362231DD387;
	Mon, 19 Aug 2024 22:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724105464; cv=none; b=GxNG8hjW2CAfTRyWEj3JEqPH7OAHcUizNLD0nZ9LoeYFkUUKmEnqEJHlAEhUlHCg289JjTwYaQa3ib0I9Ztubi7hTVYtj+ilSceEMUYskfyBTAFAtKuHKKAmyYJIGy96rQNGPcEPXGb6s3DG5KcKftJRpEFemEuhVQ1GNGHxbSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724105464; c=relaxed/simple;
	bh=ccVRTp9faW5ehWXaB1MrOcXTVhYSMLDHziH1AzUbaL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+ciPTJHrmGdcaBmJ5saiUeg2q/bT/Hnj6Bt9kktZCvW+z8zudSwyhPQ++8XFQrhxKMKrVMWGSyeO68bSk5jLwnnCmAZeNnz6tcr9QIK3EO/N/ACi27REsk0Xbjz50Zc464ZwNxW54qyqyxcwgQngAStDDz1xOQBZC2sXwOHx1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUwOaNIx; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7a1d6f47112so342599885a.0;
        Mon, 19 Aug 2024 15:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724105462; x=1724710262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNW9DSfCSMP8a3LqbeOZlzWArdw20gE/NppzZBlisAo=;
        b=SUwOaNIxR7wimV2r2zlxy4kKeanpXVT2/SBD6LpT8QQ8AkQb6Pasu6INpyZx4Ov9P9
         mxKhInFwmFRkvrI9lzV/Ja03ezxIrC+Dv/4n2bU5Xx0vwxPhvwEVPY4CeLuPFY2lFG7s
         R8q3OWD1CKU42VJ+UqODr+UaAQvM5rpAqdapb07pSpGgmQhugG9/SL3dQ3cysFT8ztr6
         2PGaEBKd97tNMoRoPPyuUpNk4hydwD//Z6dDxcWAgiVhnwnsMhFI9BPiSvr/5iJX6cyv
         x2vGyI01YoAosI7qAzH9GoHzEYkRLv7C/62PkGWvt5vGSLyRDRUHOdSTsZ8Jxh27tprl
         R+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724105462; x=1724710262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HNW9DSfCSMP8a3LqbeOZlzWArdw20gE/NppzZBlisAo=;
        b=Hb0CTrSX2LSsFuE4y+jEKhHREeXAkGw1wrlNd4vrlkYsOzcaMuK6fZzRSa43xl2jEB
         knUfxjGCnW3EO0AK3F/Z0qa+MQkkHJkIwkpFYIXWxxA1mQkftpZeryweLhbYzKtLzaT0
         /0TXD6d8xPDe4t77YzS1j0SU05iHFrlMTlIQB/85DCYHBFjoUCCPYPz4/orXhOCfleoR
         Jor8H6g/1AaPOpw1Kk0Fo9DLZJS6a2aWkNUTa4EUn4v1mGV67q8txYdInF165nxVNl8p
         vdlc945bdxI/rgmpXxhGLLX3C2SOFZ5+aHN5s+VaIt2tkKh0kPbNrt9av09I78LXn271
         /4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUR5QyWfr0jG1ChPrBh6dJxXTg4NQsMUo7+yayRr0PLEzy3Jy7FCESCpaMbmL++HpJ2dlRDsMKtMj4l@vger.kernel.org, AJvYcCWDV35ySfrTlMwQewS0pjXzWVawVPrlFTFzMYBeOz5uvpi0+a2vmEPklAJ1yo6mJiBZIQeE1GVksifsQF68IQ==@vger.kernel.org, AJvYcCWQchS69iCVDg4t790NDAOgo7xnFynYNl0YgW3QTSn2mi/HJuRKX6ox5F3zOQU4y7xJmyBQioCgKKDJ@vger.kernel.org, AJvYcCWsCSxwXF3dGaIJjx1haoai4A9oBe0Y+faphO0JqIvDjg4/ALYbjhBWXPJQbA/+qLOZu/TVpGgI0Qa2kq0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsHDaWsw+uFre6uuhrLvlKcKrxJ6eVidk5i+Pn7ghpcii1ZrFv
	QJlydEt878mCZWUx5Kb41unm/HYFNBsZu5N6d6Nbo8REyjwz9r9/
X-Google-Smtp-Source: AGHT+IHFgl+/2k89LhwoMl2cfPNC1FECus0IK9htPWljfu1Lh/lBw129llkBBkro37OO0D+JQSzrSA==
X-Received: by 2002:a05:620a:2a16:b0:79f:148:d834 with SMTP id af79cd13be357-7a5069d1820mr1636612885a.59.1724105461930;
        Mon, 19 Aug 2024 15:11:01 -0700 (PDT)
Received: from localhost ([2607:fea8:52a3:d200:324c:b818:b179:79b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4ff025280sm474454985a.24.2024.08.19.15.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 15:11:01 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Acayan <mailingradian@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 3/5] media: qcom: camss: add support for SDM670 camss
Date: Mon, 19 Aug 2024 18:10:55 -0400
Message-ID: <20240819221051.31489-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819221051.31489-7-mailingradian@gmail.com>
References: <20240819221051.31489-7-mailingradian@gmail.com>
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


