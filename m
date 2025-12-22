Return-Path: <linux-i2c+bounces-14665-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E274CD5223
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 09:46:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22D36300E449
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Dec 2025 08:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A8530F542;
	Mon, 22 Dec 2025 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WzDR2hUR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VirQHyN6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44E2DF706
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393071; cv=none; b=ORfUq4gYN6Rih9KXcyUxV38ZnObAzRWw05X3tijxt1ui3LlwkQ0BSF2l6vAb5mOWWMb0bXTbZMbm/8m8mIt9fRKweVcFxMdq7+Bd12sCLgmmR5jIIoG7+UgbzXBWC92eFMtWaRciAHkQNS/A0t+9VDrZX3+tN76api7FW0RYaMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393071; c=relaxed/simple;
	bh=+65XFLjmzkBfsSXsN4uZBfj8j9rlxmw6Qkdl91guMDs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MRImXn4MpJxS5W94jO5JvPHKz+bmry9218wxnGGp4TKaOT6awTibgX5bfkCv9jMn3AzOOLkDGO1rWBTvtiqv/7TJMLKDoO0q+cb2MVElF2Jb6bTaxfxFviZSN26ontly/2VdGf310YMeKQDX7GxmPWzB7ySek89/vaqKSI+eBRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WzDR2hUR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VirQHyN6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8G78R3788963
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FUKnIotoxp2c8hNstV45OI
	ejvixZ1FAP2laOOHlZegU=; b=WzDR2hUR3vs3NN7gaOK1e+N2RoSK+yG/kHG/zT
	l7cRKxrmwLPVeeDZsmunh32GrEpwVGCaUd7/ikbuZoxTNLykjbDlk1t8whIVodQJ
	xJU4zS+wQMjw4xTENalxGi7XcVmcCa34LYPfbtuJz4VEzin2IpPwiRJa74YLSxAY
	/VIPlQ6rFu8gEyulDw+GO8EZA/RMEXISUySfu8LZOXwz09oYi/7AzTl87LLojTUR
	rhdWrQlR4pLf/S/WvMQZsv/M90I9Vhws4lG12qm2+k7Mle6f8qWgIDN11dNUeKEH
	U/Wjw4Ulyl8ZHgCDvu0N7lj0a/elzf/sVOwoAGrxtkkxZRDg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mry4ah4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 08:44:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so868672785a.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Dec 2025 00:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393064; x=1766997864; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FUKnIotoxp2c8hNstV45OIejvixZ1FAP2laOOHlZegU=;
        b=VirQHyN6amjvQVU3bEPFZ0ozjMB34RERZbhvc1IzG6lrIYhlJfHyxe+Tq5+lezuoOC
         XAGLjt30l1TFfgvlgftgQ7yCuZy+n3UYvetUmIWMNzmkLHwOqK1+MEwS4ZIWFfrLK+qg
         VctEEi9N/ZotL/D9uYZfx2hFQdKaNzaUUo+QqhITd3zlDH2FTS/XpqGqQjJE++8piiQz
         mhUCDrYdEPJFJa+7ljYPg7phtkTXEa4k/GRTVYwvb5zhyim0vnd2fXpjdz5CnqsqCyhG
         r4ezfELd5whNzVFHnQk3U1RJfhkNOYnOlDfkqwuJwkzMo0y4/O6xRe+mAzw6kp/WoGNO
         blZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393064; x=1766997864;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FUKnIotoxp2c8hNstV45OIejvixZ1FAP2laOOHlZegU=;
        b=MJYr/8r53c/DEs67Di/11/nQO5PG1QRk+TpQVxMBLrYnklAsaH44jmHgLWR6ISO3+t
         xXtivtnaRfSdEzRKsr80/R8vTpOEJIgBjg9/U+dA5gp5bG5pjYFEk8XzT7zgsKNlo6YX
         vvF1mKgl/pGh0I0Y7Vn1tMbcQEpv80jieDCPon9XoHTLO75wJ5f9J2rskoox5gJJcJ/t
         4XEHKsJMdYfG38nL0yOsr+rpFoPvke3z+KTQkAHsAV4cfCBtKLrHSEup0gDhTgLAL4Ea
         Un3yTE79qoJfWOJugBuPetCuMN4hUh3oAcqzuxvESpsAVMgCtiOeR4LfO1KpDdrrEknQ
         xmIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJjqfbxA7esRBzbFIoTDGxHHlrZkyb/V0pTp4Y0/A5fHLvA6jza5IqAuybaM295McrQUnFtUmgDyU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuUQnYEkHUxrSaSe0W0rTjU77uCJDCDsBDukKxviZYtqsBj1Jn
	p3WIQKuVJjtjlnG2Kr64XkOK5LEcEd9CCf7YbAW3WQ+sZNCUyEUdK3CXZ3fHSUB0YfYLxIsBCWf
	pQ/3LTK7HDh8FeP+hyJT7BbbAa8C07gVBkFWcotadIG6Oyr+s4U/cHAVKg6+ZFxKYL0fhwn4=
X-Gm-Gg: AY/fxX5ezFBKtj5x+q4hs5TV37JgznGQBiE0rntJxqdZE/0H6pkbkKkCDrAqcyzLkCH
	Izt5nOWTLy3Nf0VGLpQVhr/LIuDA+oIKunDxORvfEDrpJA2poxoq8Js+cQ1GRHXcHdB5qOFTg6k
	mxDUtEcS03UH6I9m0RL74OLpc3HExHoTBXF6vYAjEytV9geYiHi9uwcAvhKeO6G9BffdqJQzrod
	/2GRakSadgTXulaOunUCn39wr3iy9qEeSU4gZaoYGO5SpkZ0B/XwcsLIXnnmWWSkR+GqH5sS4wo
	CbZBaiTYs8VvSPXPvLTgPG7zmx3tuDgOSXl04RUvXRjTWeqM5cx+C2rFuAawsP0v/Y8ORMx6lXC
	Ns2Q0N+1f4qLe0l3SVN0NUwImSNuoy1aUCcadcJMLNvx51QCAQRbtzYp3wsTgTEs/+QscJqY8n7
	T7
X-Received: by 2002:a05:620a:2699:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8c08fa9f0f3mr1560389585a.43.1766393063972;
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFW1SRKpIvC/1h/9jR0hbT6ol8vDr8W2OUoCBZbvQryIDaTonOx9XFKfEWt3VF2eh7VFgh7Lg==
X-Received: by 2002:a05:620a:2699:b0:8b2:e561:78c9 with SMTP id af79cd13be357-8c08fa9f0f3mr1560387085a.43.1766393063471;
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975ec0f0sm782975385a.50.2025.12.22.00.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:44:23 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/3] Add CCI and imx577 sensor support for Talos evk
Date: Mon, 22 Dec 2025 16:44:13 +0800
Message-Id: <20251222-sm6150_evk-v1-0-4d260a31c00d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN4ESWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eJcM0NTg/jUsmxdi9Sk1BTLVMs046RkJaCGgqLUtMwKsGHRsbW
 1AJgf9XNcAAAA
X-Change-ID: 20251222-sm6150_evk-8ebed9e9f3bc
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766393057; l=1724;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=+65XFLjmzkBfsSXsN4uZBfj8j9rlxmw6Qkdl91guMDs=;
 b=C6TNkm8SuVEhjmlqbdKYWWJosiC8UXwKP2nZJNyOCqJzSsCZw7bFA/lEluUNhPHpJge+YWHL3
 bBT11TKsJyzA8wpCOeYYxIiIB7opwhGjpIPexaYUGTUqJt7Gq8cnGJ+
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=cbbfb3DM c=1 sm=1 tr=0 ts=694904e8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=1eq2e09OEcjZih1k5uoA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OCBTYWx0ZWRfX2LMNH+Eebddm
 Ygb8M7leqkXyIC37LDxL9ZLaTTBX+hNO83RKl6g6G9tiu52EOfeslZgjWYyex74GWYKbYVlSWu7
 RR1aRrq3WI9MGG1M+tjptUhVKhzkrw2tqvjd2kM3Jxcn5cHaJbBVrDelP6RuFTAS/3WZPG+AcjX
 XTdhXc9kpyCWV8qicr3HXjsmdBgTBoHIkqJdoD2ZewoAdpJQy33A76qe+3E47VrsyFEuK1NhBpK
 nmzizwoIv4cSz5RzPVNwzHeTFwfBOHZb5tmM6z0TJwtdbisUNKnd5Mw88b/VDNf6o4lfBIMRazV
 uIcUu3/KNmpS7Jn8KKfKrO8dyxiZTPmoZs7+aCvquUSZJ+nNoQdVCQ2L0vCdibFQRjbkg2ZfT1B
 byq0ARHtZ8J45yGmjWwvdkdB9C149XMZxXGh3Y3YZ5ZyZ8/eKUCm9xmS6bEGnPBCGqEPA0+aKSR
 63x+G1Qb8soGRwLdl5Q==
X-Proofpoint-GUID: W7jKF5qoAeM9vIQYhni8DbQq_5PrVXNd
X-Proofpoint-ORIG-GUID: W7jKF5qoAeM9vIQYhni8DbQq_5PrVXNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 phishscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220078

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
https://lore.kernel.org/all/20251222-sm6150-camss-v2-0-df8469a8343a@oss.qualcomm.com/
https://lore.kernel.org/all/20251201172222.3764933-1-tessolveupstream@gmail.com/

---
Wenmeng Liu (3):
      dt-bindings: i2c: qcom-cci: Document sm6150 compatible
      arm64: dts: qcom: talos: Add CCI definitions
      arm64: dts: qcom: talos-evk-camera: Add DT overlay

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      | 18 ++++
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso     | 64 ++++++++++++++
 arch/arm64/boot/dts/qcom/talos.dtsi                | 97 ++++++++++++++++++++++
 4 files changed, 181 insertions(+)
---
base-commit: 1d9566d56c3b6d42b8d3684e940561ef783fe6a1
change-id: 20251222-sm6150_evk-8ebed9e9f3bc

Best regards,
-- 
Wenmeng <wenmeng.liu@oss.qualcomm.com>


