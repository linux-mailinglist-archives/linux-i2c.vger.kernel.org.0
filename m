Return-Path: <linux-i2c+bounces-4486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FE991C5DA
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE07B1F21248
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76741D0541;
	Fri, 28 Jun 2024 18:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GcpQ5x6d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8231CCCB6;
	Fri, 28 Jun 2024 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599618; cv=none; b=ape8CruabhayZ9cIRvOBkDnuK90eR+x0WPTB+UE5BbDT+2VDshfQOlvd2gc4H4tJdit5IgW2UWMBftfVoaXwmFG8wKanFwR5tBHn1gRXZnM0M1MSIy2EEGjWA0NESSBXYo1PjCbio6VXFm9RGh9wM3dq+LfnoM/3mDCME9JHu5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599618; c=relaxed/simple;
	bh=LD3BA0ga2QPjnAHSBILCHhcBem+GeSRBL3vDSLYHwpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UKfu0TqC1JpMNGp2vuC34uiJ9eCkWZ2tJQG6CQDK11HXDjAV/+/WJ16yJzFrfDfD7Wnmxvvqilmznys5QfxdHewC94QCHumUsieyiK1n0LuqfxgyMeqavpZR7vEu+YNr/cJmYIMLkuLaIc3EdqaqfCqKN+ihP4dX+uWhwIezB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GcpQ5x6d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SD3EOT031405;
	Fri, 28 Jun 2024 18:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ph8vl62nAfQEwBcvW1j4A54CEUtJidXfNfLmIsXydZU=; b=GcpQ5x6dXZP0cKeR
	UmVSjNrox5c7F20IpD8v+V78I6GniMI+hAVu9CTxTY1AtHc+14QkTpuavIoje/lc
	rJD4Wa2/21uWq1cv6DyCe8cU3gJpvJ25RsBDVnbfCU/H9bSJQSaTwENQDlbD4Bz0
	ywzgwVHxZkyf+lMuuI/OjW3kGuSamB+0mSNqeVey+prpQrKCwd3Ee1dGhvXElutH
	zywv3hboeDncjDylIoFy5KmaS2Hw9CzgMojHSGyPLM3pXGNj4WYjOTivzlS1BkKA
	0xt7t4zO6tRrNCyE8Ygxrmo9u/3BXhLpiC0OEqynp9AXniswWdl+nt3Yt68Q0ZrQ
	Jlb+JQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401pm5ajqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SIXUPL019524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 18:33:30 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 28 Jun 2024 11:33:24 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
Date: Sat, 29 Jun 2024 00:02:40 +0530
Subject: [PATCH 6/6] media: qcom: camss: support for camss driver for
 sc7280
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240629-camss_first_post_linux_next-v1-6-bc798edabc3a@quicinc.com>
References: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
In-Reply-To: <20240629-camss_first_post_linux_next-v1-0-bc798edabc3a@quicinc.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed
	<akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Loic
 Poulain" <loic.poulain@linaro.org>,
        Andi Shyti <andi.shyti@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Vikram Sharma <quic_vikramsa@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Trishansh Bhardwaj
	<quic_tbhardwa@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719599567; l=15463;
 i=quic_vikramsa@quicinc.com; s=20240628; h=from:subject:message-id;
 bh=WWSzn7kQwaw4Vq/+yyLH32fQovF5f8e9Is6rdSr3CgU=;
 b=zvo8mk6vzs6OgLZYQhUx+iGANtphi9FdybQHH28Tgsq1Np2dKYb7ETYVmDzxtArBTGrM/RFoM
 tF7IdZ7lLnIBTgqJipn1ut2l1BcEB95EX2qtmOPXa8UYlQXnNiGEiiq
X-Developer-Key: i=quic_vikramsa@quicinc.com; a=ed25519;
 pk=vQBkwZr1Hv+VXogAyTAu7AEx8/6bvkOmgrzYFbNGCDI=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LHi2qpRUA4erHEKF8yEJ-3MeFulWwD1y
X-Proofpoint-ORIG-GUID: LHi2qpRUA4erHEKF8yEJ-3MeFulWwD1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_14,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280138

From: Suresh Vankadara <quic_svankada@quicinc.com>

This change adds support for camss driver for sc7280 soc.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c     |  16 +-
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   2 +
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 340 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   2 +
 5 files changed, 359 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..2c622233da6f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -28,6 +28,7 @@
 /* offset of CSID registers in VFE region for VFE 480 */
 #define VFE_480_CSID_OFFSET 0x1200
 #define VFE_480_LITE_CSID_OFFSET 0x200
+#define VFE_165_CSID_OFFSET 0x4000
 
 #define MSM_CSID_NAME "msm_csid"
 
@@ -1028,8 +1029,8 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->res->hw_ops->subdev_init(csid);
 
 	/* Memory */
-
-	if (camss->res->version == CAMSS_8250) {
+	switch (camss->res->version) {
+	case CAMSS_8250:
 		/* for titan 480, CSID registers are inside the VFE region,
 		 * between the VFE "top" and "bus" registers. this requires
 		 * VFE to be initialized before CSID
@@ -1040,10 +1041,19 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 		else
 			csid->base = csid->res->parent_dev_ops->get_base_address(camss, id)
 				 + VFE_480_CSID_OFFSET;
-	} else {
+		break;
+	case CAMSS_7280:
+		/* for titan 165, CSID registers are inside the VFE region,
+		 * between the VFE "top" and "bus" registers. this requires
+		 * VFE to be initialized before CSID
+		 */
+		csid->base = camss->vfe[id].base + VFE_165_CSID_OFFSET;
+		break;
+	default:
 		csid->base = devm_platform_ioremap_resource_byname(pdev, res->reg[0]);
 		if (IS_ERR(csid->base))
 			return PTR_ERR(csid->base);
+		break;
 	}
 
 	/* Interrupt */
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index df7e93a5a4f6..c7e507420732 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -510,6 +510,7 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 		array_size = ARRAY_SIZE(lane_regs_sdm845[0]);
 		break;
 	case CAMSS_8250:
+	case CAMSS_7280:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
 		break;
@@ -560,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_7280:
 		ret = true;
 		break;
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 83c5a36d071f..757e872b8eb8 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -338,6 +338,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_7280:
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -1695,6 +1696,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_7280:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 1f1f44f6fbb2..2b840e2aeb51 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1480,6 +1480,281 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_7280[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = { "csiphy0", "csiphy0_timer", "csiphy0_timer_src"},
+		.clock_rate = { { 300000000 },
+				{ 300000000 },
+				{ 300000000 }},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = { "csiphy1", "csiphy1_timer", "csiphy1_timer_src"},
+		.clock_rate = { { 300000000 },
+				{ 300000000 },
+				{ 300000000 }},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = { "csiphy2", "csiphy2_timer", "csiphy2_timer_src"},
+		.clock_rate = { { 300000000 },
+				{ 300000000 },
+				{ 300000000 }},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = { "csiphy3", "csiphy3_timer", "csiphy3_timer_src"},
+		.clock_rate = { { 300000000 },
+				{ 300000000 },
+				{ 300000000 }},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {},
+		.clock = { "csiphy4", "csiphy4_timer", "csiphy4_timer_src"},
+		.clock_rate = { { 300000000 },
+				{ 300000000 },
+				{ 300000000 }},
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_7280[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_axi", "csiphy_rx_src"},
+		.clock_rate = { { 300000000, 0, 380000000, 150000000, 380000000},
+				{ 400000000, 0, 510000000, 140000000, 510000000},
+				{ 400000000, 0, 637000000, 320000000, 637000000},
+				{ 400000000, 0, 760000000, 400000000, 760000000} },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_axi", "csiphy_rx_src"},
+		.clock_rate = { { 300000000, 0, 380000000, 300000000, 380000000},
+				{ 400000000, 0, 510000000, 400000000, 510000000},
+				{ 400000000, 0, 637000000, 400000000, 637000000},
+				{ 400000000, 0, 760000000, 400000000, 760000000} },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe2_csid", "vfe2_cphy_rx", "vfe2", "vfe2_axi", "csiphy_rx_src"},
+		.clock_rate = { { 300000000, 0, 380000000, 300000000, 380000000},
+				{ 400000000, 0, 510000000, 400000000, 510000000},
+				{ 400000000, 0, 637000000, 400000000, 637000000},
+				{ 400000000, 0, 760000000, 400000000, 760000000} },
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe0_lite_csid", "vfe0_lite_cphy_rx", "vfe0_lite", "csiphy_rx_src"},
+		.clock_rate = { { 300000000, 0, 320000000, 300000000},
+				{ 400000000, 0, 400000000, 400000000},
+				{ 400000000, 0, 480000000, 400000000},
+				{ 400000000, 0, 600000000, 400000000} },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "vfe1_lite_csid", "vfe1_lite_cphy_rx", "vfe1_lite", "csiphy_rx_src"},
+		.clock_rate = { { 300000000, 0, 320000000, 300000000},
+				{ 400000000, 0, 400000000, 400000000},
+				{ 400000000, 0, 480000000, 400000000},
+				{ 400000000, 0, 600000000, 400000000} },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_7280[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0", "vfe0_axi", "cam_hf_axi",
+			"slow_ahb_src", "cpas_ahb", "camnoc_axi"},
+		.clock_rate = {
+				{ 380000000, 0, 0, 80000000, 0, 150000000},
+				{ 380000000, 0, 0, 80000000, 0, 150000000},
+				{ 510000000, 0, 0, 80000000, 0, 240000000},
+				{ 637000000, 0, 0, 80000000, 0, 320000000},
+				{ 760000000, 0, 0, 80000000, 0, 400000000},
+				{ 760000000, 0, 0, 80000000, 0, 480000000} },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1", "vfe1_axi", "cam_hf_axi",
+			"slow_ahb_src", "cpas_ahb", "camnoc_axi"},
+		.clock_rate = {
+				{ 380000000, 0, 0, 80000000, 0, 150000000},
+				{ 380000000, 0, 0, 80000000, 0, 150000000 },
+				{ 510000000, 0, 0, 80000000, 0, 240000000 },
+				{ 637000000, 0, 0, 80000000, 0, 320000000 },
+				{ 760000000, 0, 0, 80000000, 0, 400000000 },
+				{ 760000000, 0, 0, 80000000, 0, 480000000 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+		.clock = { "vfe2", "vfe2_axi", "cam_hf_axi",
+			"slow_ahb_src", "cpas_ahb", "camnoc_axi"},
+		.clock_rate = {
+				{ 380000000, 0, 0, 80000000, 0, 150000000},
+				{ 380000000, 0, 0, 80000000, 0, 150000000, },
+				{ 510000000, 0, 0, 80000000, 0, 240000000, },
+				{ 637000000, 0, 0, 80000000, 0, 320000000, },
+				{ 760000000, 0, 0, 80000000, 0, 400000000, },
+				{ 760000000, 0, 0, 80000000, 0, 480000000, } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.clock = { "vfe_lite0", "cam_hf_axi", "slow_ahb_src", "cpas_ahb", "camnoc_axi"},
+		.clock_rate = {
+				{ 320000000, 0, 80000000, 0, 150000000 },
+				{ 320000000, 0, 80000000, 0, 150000000 },
+				{ 400000000, 0, 80000000, 0, 240000000 },
+				{ 480000000, 0, 80000000, 0, 320000000 },
+				{ 600000000, 0, 80000000, 0, 400000000 },
+				{ 600000000, 0, 80000000, 0, 480000000 } },
+		.regulators = {},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.clock = { "vfe_lite1", "cam_hf_axi", "slow_ahb_src", "cpas_ahb", "camnoc_axi"},
+		.clock_rate = {
+				{ 320000000, 0, 80000000, 0, 150000000 },
+				{ 320000000, 0, 80000000, 0, 150000000 },
+				{ 400000000, 0, 80000000, 0, 240000000 },
+				{ 480000000, 0, 80000000, 0, 320000000 },
+				{ 600000000, 0, 80000000, 0, 400000000 },
+				{ 600000000, 0, 80000000, 0, 480000000 } },
+		.regulators = {},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sc7280[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "cam_hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -1824,6 +2099,57 @@ static int camss_init_subdevices(struct camss *camss)
 	return 0;
 }
 
+/*
+ * camss_link_entities_v2 - Register subdev nodes and create links
+ * @camss: CAMSS device
+ *
+ * Return 0 on success or a negative error code on failure
+ */
+static int camss_link_entities_v2(struct camss *camss)
+{
+	int i, j;
+	int ret;
+
+	for (i = 0; i < camss->res->csiphy_num; i++) {
+		for (j = 0; j < camss->res->csid_num; j++) {
+			ret = media_create_pad_link(&camss->csiphy[i].subdev.entity,
+						    MSM_CSIPHY_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					camss->csiphy[i].subdev.entity.name,
+					camss->csid[j].subdev.entity.name,
+					ret);
+				return ret;
+			}
+		}
+	}
+
+	for (i = 0; i < camss->res->csid_num; i++)
+		for (j = 0; j < camss->vfe[i].res->line_num; j++) {
+			struct v4l2_subdev *csid = &camss->csid[i].subdev;
+			struct v4l2_subdev *vfe = &camss->vfe[i].line[j].subdev;
+
+			ret = media_create_pad_link(&csid->entity,
+						    MSM_CSID_PAD_FIRST_SRC + j,
+						    &vfe->entity,
+						    MSM_VFE_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to link %s->%s entities: %d\n",
+					csid->entity.name,
+					vfe->entity.name,
+					ret);
+				return ret;
+			}
+		}
+	return 0;
+}
+
 /*
  * camss_link_entities - Register subdev nodes and create links
  * @camss: CAMSS device
@@ -2440,12 +2766,26 @@ static const struct camss_resources sc8280xp_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sc7280_resources = {
+	.version = CAMSS_7280,
+	.csiphy_res = csiphy_res_7280,
+	.csid_res = csid_res_7280,
+	.vfe_res = vfe_res_7280,
+	.icc_res = icc_res_sc7280,
+	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
+	.csid_num = ARRAY_SIZE(csid_res_7280),
+	.vfe_num = 3,
+	.link_entities = camss_link_entities_v2
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
+	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 73c47c07fc30..29dbf93ce9c5 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -79,11 +79,13 @@ enum camss_version {
 	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,
+	CAMSS_7280,
 };
 
 enum icc_count {
 	ICC_DEFAULT_COUNT = 0,
 	ICC_SM8250_COUNT = 4,
+	ICC_SM7280_COUNT = 4,
 };
 
 struct camss_resources {

-- 
2.25.1


