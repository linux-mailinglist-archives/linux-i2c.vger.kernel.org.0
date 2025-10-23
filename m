Return-Path: <linux-i2c+bounces-13733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF91C001AA
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 11:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18FFE4F9832
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Oct 2025 09:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B30A2FD68F;
	Thu, 23 Oct 2025 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1EL2lBW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989A92FD690
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210394; cv=none; b=MMT7+l50QbXslClP91eFgvt4G5ScG/RlCPFcBuuL+/DfLmsjenV6l52mUpVdQCpJ4+BQqWL09MNGniQxQPar0l8QkewcZxSTAuJ5GNM4XZognnRCvC+ahILxyTm8yDe3KQAPln2/2HrmOZHdp/7uW+8ilytDujbrQtHg3QhfwHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210394; c=relaxed/simple;
	bh=xwACydKQvgDKuB0v3VRVNVKaf/7fL95Co83H8L4/8V8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WjkLpnkx24vKb7pfBJzXejVwdYKfTew8D/qgWtEVQ0M4qu1bcoOApPrPqlbejb7tVHh9iqLw6s1C3zean1LnddwQN2KFjP3/h9jI2diQf09COOJioKG50kQ7+2tP8pMYttWDOkJXjMMzq5oq7hAiGy5pbr2jwdsekYK8TdgkByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1EL2lBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7nSFj019109
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Tbyvd4eRGssa6Ha0ecVbsY
	tSBYVsX1t2xVyxXt94ET0=; b=B1EL2lBWBnN34927WafsHwonB2UGuLi6pZlOPk
	OmgCYq64xuesQ06vVKEV8RP0vsd4sSzRxd0gTT0R4Eyudf45C5sy4YP3gkPSY9UT
	fJaLnL7Fs1C3+YIISCWROoisShsWMo2XmUJJUkX5ygH2TxPpi+nWhgLteODJW8bA
	K2O+tvRHwr4ZT7BTjsSISqqhRpo61PrimoiemBqMBq7IOfjlYfiM8JsOqeFwyAug
	+jgfJgEAut9gOLibsCJoPHo5a3VSq2dnDQH5Wv9boiBgPfTg6RUURWkWfmthRRrW
	CpTCeRSotwd8MUIMId8ojRylX4dMNYWYhFA8tPbMy1+3PClQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhqgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 09:06:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2697410e7f9so15579815ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 23 Oct 2025 02:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761210391; x=1761815191;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tbyvd4eRGssa6Ha0ecVbsYtSBYVsX1t2xVyxXt94ET0=;
        b=Ktaxoqweolm2xrXcToBdO7XbVIDIWNBeQJ/c7ZdUhv7WZ04VwmFYmfevytoHGg1rE0
         1bZWyaF59jjx5zoxMcZwX1EQvbQzNprRnbrQmjGmEms4e8b0mmpPzoqvB9bZFTFFnUtu
         nfjbD9+7Mz2ikQp2cXJA2VDx2hCFM7koZt0+dtSog/3pHnNea6kpHmfFROxBlxj61gMS
         +fqXlA0OwDHVybvrmThZd5sCm0pZ5ZK9xqDqMMHFhNYb6w4zxq8//7cTawBElphpiCmM
         Te09danj71wTYa/HZVqN2N3UJT8O+zNDNuLBoe7ULVroo0lZUbAn9mnZISpHhb6CHOwf
         /xug==
X-Gm-Message-State: AOJu0YxbNqeTW+QWvtntU42IeWNK8DZDc9d8E11tPCci2nkWN56fk8nM
	gEk6kUdDl82Wl6eeLAibJvzIHZnX09YK+JVphM9qcupQ7dLL+SarXugJhNcdZAoPK4HbG3p0FTN
	bDJ6OzG98e1SE8Dq/CgvCwiE5zUV5Gxqq7+bHTRqacarZusmw7pW3gv/lEXmD0I4=
X-Gm-Gg: ASbGnctPV73sLSgKuc6H9hx/1iqjN9VqVgYZT9nnFS4b3fFztZ6ySw24bdaE4Yk/VRz
	EcbNN8ZsUH6yPa7qWh0Lytnmgj75AXN67SXBKydkgAZfpNjdzq1iEe2Q/4LJ1WTUQVuvMGEDG/o
	ZkYOHtTuC/08Qzsoua29fWlBfpHWgEI/oMmdIOI6iVkWSEZXlO30AH5P+/fTPohmdFd8xiMIiYh
	KGqrEm6TfH0HuJsn5MefNIYJC/NjsTPQOZiCazNpk3RLoyeAZcGPMTZflj5lA3eSWAqLN+p9ymg
	5Rb7e1YtblizmF7Pbz2jvRI22VyNUO0dLjIZB4jyf1zuhbo5Nk/naGHi/CG3O4zHGtUROpPLPcM
	KwNdwZXIIVm8lOFjfrXCLKxDN5ZY6Q/1Wi8BW81JSqylVj0PcwxM/QQ==
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr274605355ad.45.1761210390980;
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXtnMJKSahTr3YrUSbYlgQcd+PhongCRbCPX3M+/vpJqbpLoH+wusz0Lz81kTeDHbmGQz8pA==
X-Received: by 2002:a17:902:ec87:b0:269:82a5:fa19 with SMTP id d9443c01a7336-290cb07cbbbmr274605095ad.45.1761210390516;
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfc1c8asm16698685ad.71.2025.10.23.02.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 02:06:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 02:06:26 -0700
Subject: [PATCH] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-make-csiphy-status-macro-cross-platform-v1-1-5746446dfdc6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABHw+WgC/x2NQQrCQAxFr1KyNjAzpaBeRVyEaWqDtjMkoyild
 29w8RbvLf7fwFiFDa7dBsofMSmrSzx1kGdaH4wyukMKaYghRVzoyZhN6vxDa9Te5ilrQccM64v
 aVHTBob+EMcd0Jmbwtao8yff/dLvv+wHpHkPYeQAAAA==
X-Change-ID: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfX3fXeofXaKjf/
 t4jB0gxtMDDpreFYGlpqKogmgs/uhQTHF4136i3PuTIWI59cjyQQCLgxd16METPwN/0c2iS7bnf
 fl4EGKdlG8uWMTbo3TEhEp/JjDt1PW1lYtq+oFViLecUL7MpfAV5IC4MB/dHD33DCsACuipL/Qo
 dyTgGm4wvz55UhMDAzdmNDT+nkPoggToKcSLnz+yX9eWjyqJ0KWPqGaz1b1begEtEuiOi+HA/FK
 ODInpZjZMQUrbrCiPMOXAHe+nm4OzI3xwdDgl7oxjXzkh88gNstixcO+DgaFV/Fq+5uvNGcBqC1
 Y5166odCGXjFEimVZ3qiNV9SL4ITz4HvHYQBKsyMnhDdkO9O/Xab+m7k88eG1RwyscJX2nU1B2K
 2Oy8uDDBJcOzKVS3GacxMWKj5x5+Tw==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68f9f017 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=edmtyYkapI0WV9tsjtgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Ip6mCKEixG4anc-2urk8JY0vjGasNDmi
X-Proofpoint-ORIG-GUID: Ip6mCKEixG4anc-2urk8JY0vjGasNDmi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

The current value of '0xb0' that represents the offset to the status
registers within the common registers of the CSIPHY has been changed on
the newer SOCs and it requires generalizing the macro using a new
variable 'common_status_offset'. This variable is initialized in the
csiphy_init() function.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
This change introduces common_status_offset to replace the hardcoded
offset in CSIPHY_3PH_CMN_CSI_COMMON_STATUSn.
---
 .../media/platform/qcom/camss/camss-csiphy-3ph-1-0.c  | 19 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.h      |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a229ba04b158..9b6a0535cdf8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -46,7 +46,8 @@
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE	BIT(7)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B	BIT(0)
 #define CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_SHOW_REV_ID	BIT(1)
-#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, n)	((offset) + 0xb0 + 0x4 * (n))
+#define CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(offset, common_status_offset, n) \
+	((offset) + (common_status_offset) + 0x4 * (n))
 
 #define CSIPHY_DEFAULT_PARAMS		0
 #define CSIPHY_LANE_ENABLE		1
@@ -714,13 +715,17 @@ static void csiphy_hw_version_read(struct csiphy_device *csiphy,
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
 
 	hw_version = readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 12));
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 12));
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 13)) << 8;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 13)) << 8;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 14)) << 16;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 14)) << 16;
 	hw_version |= readl_relaxed(csiphy->base +
-				   CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, 15)) << 24;
+		CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+						  regs->common_status_offset, 15)) << 24;
 
 	dev_dbg(dev, "CSIPHY 3PH HW Version = 0x%08x\n", hw_version);
 }
@@ -749,7 +754,8 @@ static irqreturn_t csiphy_isr(int irq, void *dev)
 	for (i = 0; i < 11; i++) {
 		int c = i + 22;
 		u8 val = readl_relaxed(csiphy->base +
-				       CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset, i));
+			CSIPHY_3PH_CMN_CSI_COMMON_STATUSn(regs->offset,
+							  regs->common_status_offset, i));
 
 		writel_relaxed(val, csiphy->base +
 			       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, c));
@@ -989,6 +995,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 
 	csiphy->regs = regs;
 	regs->offset = 0x800;
+	regs->common_status_offset = 0xb0;
 
 	switch (csiphy->camss->res->version) {
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c44..2d5054819df7 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -90,6 +90,7 @@ struct csiphy_device_regs {
 	const struct csiphy_lane_regs *lane_regs;
 	int lane_array_size;
 	u32 offset;
+	u32 common_status_offset;
 };
 
 struct csiphy_device {

---
base-commit: 076fb8624c282c10aa8add9a4ae2d9354d2594cb
change-id: 20251021-make-csiphy-status-macro-cross-platform-5390dc128aee

Best regards,
-- 
Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>


