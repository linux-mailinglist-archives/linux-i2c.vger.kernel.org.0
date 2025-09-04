Return-Path: <linux-i2c+bounces-12650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39DE0B4430F
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 18:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDBC35A6FF9
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 16:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0A162D6E63;
	Thu,  4 Sep 2025 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0mDsHyE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1884E200110
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 16:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757003964; cv=none; b=cVsvo6XU2em6+ZnBR7JNaG/vv8O1sgjn8FQwJDlZm8AmYmCOMkDwpwYMgE5dKN9aD1Cxo2fFcQgbnm50VSqJWt1KijYNwBZiiPHvjE6hxDbiwvSZ/WaKwXHr1ddpmIV4ChIuJp/u2IVxEGpyHxt4jO5QBlrY5riLPoqPEY6gWeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757003964; c=relaxed/simple;
	bh=GpD8BNFg396KGkNiIgm2sGFzaEIO7uHRIjt6IC/agYg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=d9KuE5KXTEkN4oMWd1ItONoZlrNR59CIsqw1qUERHisxaRpNzhp6/7r8N4fE+0bODZbknWytKVp/gDRG+go64T1OYOMGAUSFPqCjX+r11Tam1fv72Vpqi04855v+IRxoiM0qCPraB90c63D2zHQ1G0NTBpKnf9MY2/gBlordFtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0mDsHyE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7bN022973
	for <linux-i2c@vger.kernel.org>; Thu, 4 Sep 2025 16:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MNSbbZpCQsAdgAsVO32TmZ
	c29SrY2CxEjrNrN62kiYk=; b=S0mDsHyE5AMM8Qa8wWRHJL71l1yQ0FuWh/Zh1P
	8s/iCZpmz9HsbtSGpNX9huIp/G1s9uhoUH098Vq3QZaV6XzbaTdAhJYb/WKQdQP5
	RS4f+8PJNUxMUI6ZQjQ/Qr2GM7gzKedDUnkFL2hdBfuZpaihxMfGbvOlDTbKgAiA
	NxhrdADaH7/gMxoArh1I8/kM5UIwrrtWd/1xYQputVHiRIvwV5/XbWr7PUeti8P9
	dtTTtllC5b/Iv7t9UEtDpnswiik7JwwpacYAJ7qXKZXlcFe7F8yKw1v8trW97ccv
	RIRMp6mmVff1xzao7F6duS9cCAddoa8B8Zswu1XhLR41QyRA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0erarr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 16:39:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7724877cd7cso1386887b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 04 Sep 2025 09:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757003961; x=1757608761;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MNSbbZpCQsAdgAsVO32TmZc29SrY2CxEjrNrN62kiYk=;
        b=Z2Byr66csnkpR6DPiYzqfaQzoXTFNksJBKTbHgRGRL5ns3XvCW0f14s2DVXsGJEx5y
         oZYvFQC82r7pidAKSOP2tsG5SCYfA9Ntm6VmefUDXIHtvphkZSkXIQ1gbUNq2YEjvSzP
         cjkR5M+qi8Ld+S0SGosLbTASe86Lt2ijkb5JZF+2IbN6a8e4v1p46sXA8FTIOx/YR57c
         PaThpOaGBUHJeOvAalE7UpZRUWCaSRtqAMqW3rIRf9oBM3KKAsBRZ+pcNvVCAiu8R7Df
         fwXI4sBfmfsA3jUqNF/3WwOA2ADIgQqQ9TrK6RdfzA2b0a36j7DspQMM2G0GSWC8PI/m
         K41A==
X-Forwarded-Encrypted: i=1; AJvYcCWjrB7gJc1z3G1f5IN21slvPhIn8kFLkB3uPwZw7KP7BsPSCpX4KfpF+32FwIsMONE8m7tJBOePsCA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcSapwI4aj4JkOxYPWRrFNXJqhPzjidn2R3JgWvlYyaLHp5Nrt
	EVnspSC1n7K4TazA4vJ45yBOKrJeUbc3DBpHLn9LyzzGFV0kbzq+Bd8+xwWulG8g2sD7obdqDY/
	GL+L5zM8BtDaQjMzzzsNFeyTT3eCEl8mPdqpmg1wFGMWRtzmFC/2V6RY0bU+eAHH3vxODLtE=
X-Gm-Gg: ASbGncv83nhZs5lHD8zQryaHhhsnCpbyzJ+1+CL6fHOcsdQTkfUXPj5bIL8ID2qxnNX
	0IocADQdGlKZ6Xa21oTzAy4VkozAo0kRa16+LpqObOfm4m575f/G/YQG9rKBzPORywAkRqqDNu+
	aa+wJIk3josK6QzuzpAY9ytYeh7daAhCrZ8il164+t1PE8SCtM2QO2SmjBJ1454xxFngjj7mlyo
	wCowyyxSSqxH8VNJ6CgB/BrwgH6py5NI9VQN9wyUcpSut+XKneR25UhYzbcBqMYMmwR7oP3QTS8
	xQPc1b867A4r5ug2tnnegRmclCHuqlr3kLUYRMgBgP0Wrg0z8dLNrPwyL4cEOgzTlELO
X-Received: by 2002:a05:6a20:4303:b0:24e:84c9:e98f with SMTP id adf61e73a8af0-24e84c9ebf4mr415396637.59.1757003961128;
        Thu, 04 Sep 2025 09:39:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENfHKOfMUlhg5WU9p/8Sk77cSDyMNV/t6TSuChQ6ApcsAK5PWqLjiRWeH9hsnd1eiAaGZG1w==
X-Received: by 2002:a05:6a20:4303:b0:24e:84c9:e98f with SMTP id adf61e73a8af0-24e84c9ebf4mr415330637.59.1757003960584;
        Thu, 04 Sep 2025 09:39:20 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006e2c6sm17346371a12.2.2025.09.04.09.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:39:19 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v3 00/14] arm64: dts: qcom: lemans-evk: Extend board
 support for additional peripherals
Date: Thu, 04 Sep 2025 22:08:56 +0530
Message-Id: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDAuWgC/23M0QqCMBTG8VeRXTc521RWV71HdLHNY47U2ZajE
 N+9KUEg3Rz4H/h+MwnoLQZyymbiMdpg3ZBCHDJiWjXckNo6NeHAS5CsoB32aggU453qiaIBVho
 sQAKStBk9Nva1eZdr6taGp/PvjY9s/X4lXu2kyCjQxLAKoRYGy7MLIX9MqjOu7/N0yApG/kOOI
 PYIT4hulJBMN1Ir/gdZluUD9J8OkvYAAAA=
X-Change-ID: 20250814-lemans-evk-bu-ec015ce4080e
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757003953; l=4648;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=GpD8BNFg396KGkNiIgm2sGFzaEIO7uHRIjt6IC/agYg=;
 b=2CMcvZ4DfkFj/djWAIguElhQ7xU1SjResWfi0MSzltJRxTory6Sq+cgPwGMH4eiSSWEzFAaWJ
 BF63OoT1E09BGtdC9EOIJ4+vllZmGPr/UcswbqnaemOFuOVRX0XZzJu
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-GUID: iU6x6bevZ-JG43pg8zWKRd3ZS5rx24CR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX2Y1UcFCm+qYm
 HzfJrOXrA3tYNThlIGCaP85VrC6VL36rfFMTeO3QjyQ86OkPTqtS+Tgni7DJW1HzmMRprKuuHMv
 HitValpT8OGm8lY808eLVzT0fFdsUHE7yXCAEFC3jB5ffy2koHC0oqWZn/mVCpCxtWvBHhIpTjw
 rvUdgGtsApZCamZXQxLmIz3qKuoYlHJ+1rd/RfkRpANUP+KsM68NUdxWoVIGc75eUotQB2eB3WH
 2k3HrM7NL1JtFFeua+ABkTBLF/0aPUIyM0KvD4haVRD6scMgXTjex+tYxl77Z7Xw0uks2eULANU
 tKJQLAm2PmmljS1sELp90/axtppTQYar5h0oRskVg3bmO8RqNyJElS5Cog9ckkhPaciKwCJA6Sg
 71lx1DkW
X-Proofpoint-ORIG-GUID: iU6x6bevZ-JG43pg8zWKRd3ZS5rx24CR
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b9c0ba cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UzDb-niT3-dnCAiDllkA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1011 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004

This series extend support for additional peripherals on the Qualcomm
Lemans EVK board to enhance overall hardware functionality.

It includes:
  - New peripherals like:
    - I2C based devices like GPIO I/O expander and EEPROM.
    - GPI (Generic Peripheral Interface) DMA controllers and QUPv3 controllers
      for peripheral communication.
    - PCIe HW with required regulators and PHYs.
    - Remoteproc subsystems for supported DSPs.
    - Iris video codec.
    - First USB controller in device mode.
    - SD card support on SDHC v5.
    - Qca8081 2.5G Ethernet PHY.
  - Audio change [1] to support capture and playback on I2S.

Dependency:
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.

[1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/

---
Changes in v3:
- Re-order QUP patch 05/13 (v2) to not break i2c node enablement in patch
  03/13 (v2) - Dmitry.
- Update commit text for QUP patch to highlight which all clients each
  QUP is accessing.
- Add dedicated compatible for Giantec EEPROM, because usage of generic
  compatible "atmel,24c256" alone is not advised.
- Update commit text for EEPROM patch 04/13 (v2) to emphasize on EEPROM
  enablement - Konrad.
- Put 'reg' property after 'compatible' in Expander - Konrad.
- Put 'pinctrl-names' after 'pinctrl-n' in PCIe - Konrad.
- SDHC:
    - Update interconnect nodes with ICC_TAG macro - Konrad.
    - Put new lines for each entry in interrupt-names, clock-names,
      interconnect-names - Konrad.
    - Put bias properties below drive-strength for consistency in
      sdc-default-state - Konrad.
    - Move 'bus-width' property to SOC DT - Konrad.
    - Move 'no-mmc' and 'no-sdio' properties to board DT - Dmitry/Konrad.
- Add 'Reviewed-by' tag from Konrad [2] on Audio patch 13/13 (v2),
  although the commit text is changed now.
- Link to v2: [3]

[2] https://lore.kernel.org/linux-arm-msm/b4b6678b-46dd-4f57-9c26-ff0e4108bf79@oss.qualcomm.com/
[3] https://lore.kernel.org/r/20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com

Changes in v2:
- Split the patch 3/5 in v1 into separate patch per author - Bjorn.
- Use generic node names for expander - Krzysztof.
- Change video firmware to 16MB comapatible - Dmitry.
- SDHC:
    - Arrange SDHCI-compatible alphanumerically - Dmitry.
    - Move OPP table and power-domains to lemans.dtsi as these are
      part of SoC.
    - Move bus-width to board file - Dmitry.
    - Change 'states' property to array in vreg_sdc and also re-arrange
      the other properties.
- Remove the redundant snps,ps-speed property from the ethernet node as
  the MAC is actually relying on PCS auto-negotiation to set its speed
  (via ethqos_configure_sgmii called as part of mac_link_up).
- Refine commit text for audio patch - Bjorn.
- Link to v1: https://lore.kernel.org/r/20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com

---
Krishna Kurapati (1):
      arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode

Mohammad Rafi Shaik (2):
      arm64: dts: qcom: lemans: Add gpr node
      arm64: dts: qcom: lemans-evk: Add sound card

Mohd Ayaan Anwar (1):
      arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface

Monish Chunara (4):
      dt-bindings: mmc: sdhci-msm: Document the Lemans compatible
      arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
      arm64: dts: qcom: lemans-evk: Add EEPROM and nvmem layout
      arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card

Nirmesh Kumar Singh (1):
      arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander

Sushrut Shree Trivedi (1):
      arm64: dts: qcom: lemans-evk: Enable PCIe support

Vikash Garodia (1):
      arm64: dts: qcom: lemans-evk: Enable Iris video codec support

Viken Dadhaniya (1):
      arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers

Wasim Nazir (2):
      dt-bindings: eeprom: at24: Add compatible for Giantec GT24C256C
      arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems

 Documentation/devicetree/bindings/eeprom/at24.yaml |   1 +
 .../devicetree/bindings/mmc/sdhci-msm.yaml         |   1 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            | 416 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 147 ++++++++
 4 files changed, 565 insertions(+)
---
base-commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
change-id: 20250814-lemans-evk-bu-ec015ce4080e

Best regards,
--  
Wasim Nazir <wasim.nazir@oss.qualcomm.com>


