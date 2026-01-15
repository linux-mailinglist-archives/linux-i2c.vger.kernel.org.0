Return-Path: <linux-i2c+bounces-15181-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA66D23E39
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 11:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C2C930B9985
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jan 2026 10:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5A736166C;
	Thu, 15 Jan 2026 10:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CJUfNhBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnVuBE+4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C72436164A
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768472021; cv=none; b=KWhP5tyrhfzcGCBMjYg2FzUWn1ZeNLfwbTkp9kKqoDA7yV7Qm+xSh65PGzNVvNw0fxNsuaqidGuEy0YL+l3eng9F6V5c+nQd+JFvE4g3K8o9zZ3XLtUYOkgyr1a4/N9dZ1/OB07FaGTYowSfuiUj7m5Qe07Xh3Mok4m3BoIKxPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768472021; c=relaxed/simple;
	bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UUz3QBll4Uykl3f1as3Dt9NjuwtBhBeQO2sXVt9EurFd6oJu1pQIVVf/K4SI8HlX3NHeQiOsQWWfUn7HDCKfXCJTfYtjMCyvYy/7DJ+P5Q7kiAFVj4PV1iiWxqdt2X4pNMYNjsdpb6U5quSv7WQ2McNf7hJAWxrvCHhNPUAyefk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CJUfNhBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnVuBE+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fxZx1171463
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=; b=CJUfNhBxOo3pTxZ4
	3RO9aPIy1FWoIA4JcU/SRpJHHUjytf6O7B4S4+yYEoy2dQZzhO90ZraiU6+8t1Mc
	udl/2arYKyWRAnKczl6u1c4p88hus91WNjoIsH3levkx5WlVB/5L5cGajkf7nWML
	sLqJEZANkA1qQacK/4gecfSV9VFCP2O6mRBiqgjAcP0obJTIAPCjqumX7s86wHAJ
	HGEjrz2ButmdihkBA+ugqPoiY+KSTvN6qRyfhJmFcrUTc15CmH2MZL4i0tUi9sC/
	rgC1U+a1JQIkp7Z5d1OUoHptzl8HAdh9c3IgcgWbnJifq/0DmxWq+mAB2mbinWUF
	e1oqtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ah5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 10:13:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52f89b415so206314885a.0
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jan 2026 02:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768472016; x=1769076816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=jnVuBE+45W8OTr7CR2K5wXPsdoJvPQEd0MeYbOvSy3BTWl7SgF72nsGdUpoov2KUCp
         OgLIWaA1MAtdg6Bic0Dad19CU4ycTa/KnNvcDou+yLZc+gN44TmV6wScfPPGE1tvslj4
         4ICz5jE8UZawjUzJdx67xKIcToKuIXChKyMVO2tTvm9wBoxNqtyJbII3nDNOg2Cx8Etz
         Os7gNppkPSUEaL/Lf38hCMLpHFx130jZWkUDvSxVQCIx6KchkU5/F20LAIC4/nCFKfjP
         U1zawHTpSkdNZonf+SsI3eGTQcFOrc198wCAeXXM3/wmEhof6SXoWtL4GkTv0fuJOWPx
         5gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768472016; x=1769076816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+J+wnhjyG1N51NHWly4N6P+NOWErvlBDtOdGlcbqgU=;
        b=pPz/+A2lS8Cx6J9ptcboSHnsuhGTR28lbeM7dvOii8ThTVYY2cCp3wm7e2LxP61jlQ
         6fd8aZcwLyQKQx4pOhFM2LgVAQTmqmSiUvGBdKatqIDAubArlysrIZ0Vuc3+QjsKdMHX
         gLvJGzDPltr1PC9RG/vu5h3y5CR5ZQ22ZoT1urvpwaubYoRENcTRyVRc5A1/4su+4JmF
         w6DzwdCnxCwngZysjw/mzjsqNKVi9K7EBDcFuFlhkb2+QOzQk+p86yXBKJ/os2T4UWAX
         +OovbYMCc/wSNlfhuXYxc7Llx35uXFf+8TVCgeWiDicYnTj04kSCswfV9rjwuqzlBiXn
         FF8g==
X-Gm-Message-State: AOJu0Yw8iJGrDS7RTH2xeMzC439CYyFlr7iIyf93Q+83E75k5S+9fITp
	kxnMUKAf21MKdpAwUkVO73oWtSEqKgAz0zhUeASUSciLiKcCc+pk6/P4a2+yJahR7EMavjxT6Fj
	hoyEXvn/hrOwMLn9lGpemSNUEqJn0n21hCDaY1uw4a8yXFbkLqOV3ewEoAaIY1bs=
X-Gm-Gg: AY/fxX6j78HlJ4VYOr+apOLx0mwMDJA5oTWg3HHJMo36mq1BahrsicsorZGKmiPWkl5
	p2c0+hbgbEbhVta2v8dz5HxKNmXkI97Qe8VaYmfmMUgZsEFjrSHIe+6gjzTcfB7Ibe3vNRN2aOe
	cz1+DSZuFOc0EPVmvlObN1V0F9THGkLkVQVkJZs23IZlgWfb6gZX6Zmtt7RoIPDCmZA2mZj1G1k
	qFRWwdzLCo50bnqEgL7A5a2BHlIN/nilSbmqIwIW/HOFWtn/B7RlHm68A7NMA19MO0/W+lACW0x
	eyAsTGc1uWGhiF6hP8SjNeSVxymumWQlgzNeKaRBkQUjm5RGnxClLOq1tsWpNgE3VD+cpxsT05N
	WI2j38jHEA6l01DO8QNEwrLX2rFOPnuD/RRakDIa4dj3wkRMgwqu2HxSCEfjTjw1WMZjEBWB9Lp
	6V
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819223885a.21.1768472016063;
        Thu, 15 Jan 2026 02:13:36 -0800 (PST)
X-Received: by 2002:a05:620a:2552:b0:8b2:e922:5297 with SMTP id af79cd13be357-8c52fb1ccdemr819219585a.21.1768472015581;
        Thu, 15 Jan 2026 02:13:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890772340b9sm199959576d6.26.2026.01.15.02.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 02:13:34 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 18:12:40 +0800
Subject: [PATCH v3 4/5] arm64: dts: qcom: talos: Add camera MCLK pinctrl
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-sm6150_evk-v3-4-81526dd15543@oss.qualcomm.com>
References: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
In-Reply-To: <20260115-sm6150_evk-v3-0-81526dd15543@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768471975; l=1538;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=EUwITNGph9Sz556YywpxKThBBpgFxFypVVqI/HuOP1I=;
 b=0q1i37h0jVD3ntw9Vu3U70sABycxfu87F4li7lGcRJwkx/MEcqkj7wdamB2OCdQqakoNOQgsG
 V8ZIfTI3VktCPlJ3kOvcr4OtTPhZwG8rakNTebLe6U4d+JV39oMNoNU
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MyBTYWx0ZWRfXwmeYgawlaZE9
 D26GXBkqtmsfNimms5sDOT+n8s5FMj+G8Kexuf+Y5m/IpjEFVDDdFnm0dQe9Ndrhps+93QJvnNX
 70BEwD8SKDtAJ85Apcpyuge/v4HFJEGmWl8U+BUaxO6RE8DDVQjA2dgVyU0xS9YD5dw5PH4nop2
 t5SlxFMUFfL7BLA7OO3DTGknvbciqxscck6tvKVQPHf5/GFbb6zsIUDPv8KrlJVUqnnP0eM+3Hb
 2bA/jjln62vfFIki8vZgpU+cZMWG0HZR8qlcTHbW0KAOk7KIrS/5q3HWbFI0onPFRx48dqllHI0
 RmuFjKxTxhIIRefjzHYBSv7j2UmSGESpY9XW/oFMb4RT3aZ0YDN7FxGdXAPQCg8fH3WXkiPQv5J
 0MMb74enJ0o5LNax1Qt+QPQV0IEeswgHUuNrJ3x3H+YDWllSMaNpsPBhLQi5WHlmpXJdIl1ErtM
 M8+V8ce8U8peYH3+keQ==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968bdd3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=tfCBMw9KTM5U2-pTabYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 2g2xj8yegLnRPs3xZ63kUwMEiiPNE46d
X-Proofpoint-ORIG-GUID: 2g2xj8yegLnRPs3xZ63kUwMEiiPNE46d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150073

Define pinctrl definitions to enable camera master clocks on Talos.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 162bbe353b62342478885f22972a816f1b60d820..f77c7faa97561a0a95974de1a39cc4ba0e43f663 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1554,6 +1554,34 @@ tlmm: pinctrl@3100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio28";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio29";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio30";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam3_default: cam3-default-state {
+				pins = "gpio31";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1


