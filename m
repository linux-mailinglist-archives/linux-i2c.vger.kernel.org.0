Return-Path: <linux-i2c+bounces-14908-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F9CF798C
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 10:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 199F930B06D3
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 09:40:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37285322A1C;
	Tue,  6 Jan 2026 09:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eqSlT6PV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ai5wk3pV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E10321F48
	for <linux-i2c@vger.kernel.org>; Tue,  6 Jan 2026 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692423; cv=none; b=lP4gzYJcPO0/rzs+kvaHO3NI7QqEaFOiGaKRoFtNYf0fKnivg+uhQn8ugCjdkHU5e/EOrkpyHrHv6uMTI9QnRH56di1lWx61FADEvFfPuo9MHLVg5TWQYCHpgtU04X1Tc1o7UN9xt9xLyzOXnbVZY3jfU4L2JOB0KeX8cpX90+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692423; c=relaxed/simple;
	bh=ZAVAsjW4UmOeQ/5umcVRpfmT1dJPXRUxpnxO1mVpNqQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rgM2J84X4c14gFSZ+omU6tZEHhpMaxE8yWEHUklhYBOpmrfEfj3NPRKsnOsr83SGDiQVAlNkP69HDl3UxNBFmR0e0HLdXjheB1vv/JKRAgKUEYUCX0Ueht/Jy0IAh9pg+EWnsv8V21MS8e6fdPQJKyDrpC6kuDjG2Og1uOUxrT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eqSlT6PV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ai5wk3pV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6066t4ot3295007
	for <linux-i2c@vger.kernel.org>; Tue, 6 Jan 2026 09:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LKmbSOml0pOKaR1oikau74
	bRsswwgJgYRuuOEyfoYNU=; b=eqSlT6PVldJ4kSOZQ6At0D4J5fdTbdqS8fpVlj
	mXGp6Pbuzo6ABpPBFDnfjKkVOce6u3RpNRS6Hx64RPFqiWwIvvppeEszFlNjG/dq
	woH8qFFctoxvWqfXvbDqiyiEQdlXBktdj9jcWxUz8BJNJAMAHZALTj734rb5JQgl
	C5eoyJ3n8RkGLaZWlSFY6Np32qTfoa4l9pRfM5XpVPVxPntZKsAZ53/i6WSXdeMl
	Iq/Iu2eSOqIlfjUQu5hYtEi5E0W9ZJN1EbuaXC38/Iz8rD1u5zj4S2kZZzSJfUHA
	qItIyLO1/w30AFozqKd7mqAk9IchR5+kak0gJYcw7GAgmn5Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgwj00gjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 09:40:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b17194d321so109032685a.0
        for <linux-i2c@vger.kernel.org>; Tue, 06 Jan 2026 01:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692417; x=1768297217; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LKmbSOml0pOKaR1oikau74bRsswwgJgYRuuOEyfoYNU=;
        b=ai5wk3pVL2Bp3Bjaof8rSz8TeEBow10tjxFhlN/DtDCzevldRu9flNYNyLxzv9gcMR
         Kmdr7Qw3y+ZyrzM/BHgNM4AZuJDyHFtZ30vPWFzHGAN97TJ5l2sNgLo/6RO8SQpFcp4T
         IPkMr31cS0GquHmA839nu9vXkpBbVbAZMa9dLy1uQGGDfduSoHTx4+MgeZTgPRMjgZQl
         P6r7Mx84foOl6odyxZ9twbGOFhERhKrLVWsCF4hhxdoeKOT+jCweOOM0BSm1c/jdxrdg
         fBfP4LuNQdey6LC6lXPKmGAeZAoLFMJSnCk1ARrG950mJ8+w7nPQCEmpZl85qvXr1Co0
         de4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692417; x=1768297217;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKmbSOml0pOKaR1oikau74bRsswwgJgYRuuOEyfoYNU=;
        b=n0TJzMTRIJc92byEC1vbbGhcQHTFH8uBBAASZbddXJuiYWcbwW8NlkemHqFeNKbuk+
         J65c4xDa9F9CQANcaP5VEtD/Eu1hZw8m9Uk6LDOcxTlap9QnmMmYKkD4D4KnMqBhZ0gU
         T14zzyfnPlfZJb/z2iiWhFvJWBbArsDeofssffDRqZuUiGtVlM/OOX5W0038AVyXkH1t
         H36OKyvaYIZg6p7tdzVRfKZw7mijIr7/+QY+WJsT7yQ/xJwRfYbd5k7eg1OdD7nkG8cM
         iO0P9D//r/ksRaPCuc/n63g8fkuG7qhpofcFurOPhnAjX+R6xHV6+7aoiJC0YT1y0/wR
         +6+w==
X-Gm-Message-State: AOJu0YzvwjleNek4N4uYwUJiC47chyBUOEm+OSn1N4SHET3dYH13pn/w
	uOJseghfeEnWFk6oTaVGDAFfeLZu+VWdsUkuUMIokEIGwbComWULoIszh+71n9uSZUju42gZeOl
	hJRh3WAlEhXQVNm7/xOEwY1plZWSMd0xUiSNdrsdr4F+AMSC4uEoA3rq23LVIJf0=
X-Gm-Gg: AY/fxX4O5qnGa53pBaElUjAwSPFOkVZuH8ehlHtiUFmxxX6qkXVIS01ZIgbGZl8IMBV
	ur/Ghsi1JKKkzmtcUQLZ0OFr5xFvXBZryEyna5e+9k2Ib++/waMZF+mcdZwdx+ZKCWEymFaczGk
	kzvRwDfihQdBLWj/GB2lAE2HE14S3H8/sutbdprltTXZwxgdaEVyqbqAdnimzTDdf7xMWI8kNU1
	PevNAFEWlbFiFQwuQaoo1pBaQ3GlprfzOOTI5Iv6zSsnP6w4oafIVT6+T0rV55mZRGpa33oEK1k
	EZrwsxJ7lEsSBd6Ae4CfUvRQVoFoTxvTh1tb0YPmOzhqltuib+u1/eA7r+BZ0ixOSbhejXan84E
	roD50OUcMWaCGkxPHVlMX440/Skw+n8cf7z+gHjUN1n7URjSDgASjZUU1xpmxKjVia9zWVMnaSY
	X5
X-Received: by 2002:a05:620a:191d:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8c37eb6392emr265041485a.3.1767692417210;
        Tue, 06 Jan 2026 01:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFIo2k5jld9xQpS8SEC+jzw5CNL0areOi1qiADsjxSfI/XHpAAK7Y628jXQDaEinxdy5G7Pg==
X-Received: by 2002:a05:620a:191d:b0:8c0:af6c:fdfa with SMTP id af79cd13be357-8c37eb6392emr265039185a.3.1767692416717;
        Tue, 06 Jan 2026 01:40:16 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:16 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add CCI and imx577 sensor support for Talos evk
Date: Tue, 06 Jan 2026 17:39:52 +0800
Message-Id: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGjYXGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eJcM0NTg/jUsmxdi9Sk1BTLVMs046RkJaCGgqLUtMwKsGHRsbW
 1AP63s9xcAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=ZAVAsjW4UmOeQ/5umcVRpfmT1dJPXRUxpnxO1mVpNqQ=;
 b=nRnHN1u2QHuSXcp9me4p6/b2YOVlHIXt6yEtgQn3gDr4HGk8AS+p9Do2+Ltw6mGbQDzPXuCDv
 I/vdOyVh9/WBsJeIH8NeLmtv2GUaFhrmJu1oBUE7F/5tSk4hEJT5siz
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MSBTYWx0ZWRfX3tt2iPf4XNim
 juBLKL9n2djw96AXr8JPPef/X/4sbOCzXFetBz9jctBeUP2CfAqUNyGdeqhA1R+UUQ4k5D/x3g0
 VvEGRJgan+xGUiitmUMhJJkeyKFqe/04AlXM9Eld5G3R0mlJ2X9MKswMp4z9VObC2QiS311qSeN
 X7BJ6aiOAQ3fv+p1Bn9+E2Wtc7t4CGwtGYmlQBZloWBeEfrgzvOOLU5kJE4C0TM1FUYgM6rI+Yj
 rJNNCqKu4NmU9YbnlLCoaZsyrVvnBR/0w+OVoayFGRxUxI+knWwi8U7Z9efkKsw3KtyytTmc6oz
 I6X2CHGoifpnGO6uEAYi3DGMYzLPQQuWYuoOiX7uouBNseVD3SKTrsYGrHJ36eeFdkdjdU7cpRI
 i/ev07EZAikcpOqhVKrdSBuY59SZWNgiZYwLFvu0kq+K4ZpI0v34LtyPAe/CNYvC8HriT/kI1kk
 +BYWgrQObatixq0NYAg==
X-Authority-Analysis: v=2.4 cv=bdBmkePB c=1 sm=1 tr=0 ts=695cd882 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=m-n3JlnGHUGlcO4ZAO4A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ZJZfbJmKwAJW7O-HMBUJMuhasfOEl15K
X-Proofpoint-GUID: ZJZfbJmKwAJW7O-HMBUJMuhasfOEl15K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060081

Talos EVK is  based on the Qualcomm SM6150 SoC.
It lacks a camera sensor in its default configuration.
This series adds CCI support and enables the IMX577 sensor via CSIPHY1
through device tree overlay.

We have tested IMX577 Sensor on CCI1 with following commands:
- media-ctl -d /dev/media0 --reset
- media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
- media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
- media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0 --capture=5

This patch series depends on patch series:
https://lore.kernel.org/all/20260106-sm6150-camss-v3-0-d1d5c4d02b0b@oss.qualcomm.com/
https://lore.kernel.org/all/20251230130227.3503590-1-tessolveupstream@gmail.com/

Changes in v2:
- Modify the CCI dts style and commit msg. - Konrad
- Split mclk change as a separate patch. - Vladimir
- Remove clock-lanes. - Vladimir
- Add mclk3(GPIO31). - Vladimir
- Link to v1:
  https://lore.kernel.org/all/20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com/

---
Wenmeng Liu (4):
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos: Add camera MCLK pinctrl
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |  18 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso     |  63 +++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 100 +++++++++++++++++++++
 4 files changed, 183 insertions(+)
---
base-commit: ca0a5887956ccdd8b535b9819fee0bc62f0bba5b
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


