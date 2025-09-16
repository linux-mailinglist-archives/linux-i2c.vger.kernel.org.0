Return-Path: <linux-i2c+bounces-12983-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DC7B59B25
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 17:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1324A189EFA2
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Sep 2025 15:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F4D3469FE;
	Tue, 16 Sep 2025 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSZV7OB5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC653375CF
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 14:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034783; cv=none; b=iJNJMZQX5m8m3LEPllUFx5Rai3h0dMnNs7S3W7zoJfEUoUyvNcf5lIqgyUfdM9bwZqSTfDpObsHJ1TlNL1DR1gOLaTF6d0dINKy6mpN7OgPlxHfZls45jdD58Bh4W3r8dGK5OBB7UD2lmKYnCCYcES+8/0KM4/U5Ft6u3jBWq0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034783; c=relaxed/simple;
	bh=Giemnl7HyeXBcqutm/0IE+n+bQ2mv/vn7iAAVZojiMY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g2v0DuTMEW/EMXukHPYzCQPhrXiTCr9TdMuwS8EjwkK4E1DqcYDuEHTH85kTDANN/nFKGOjx44/2F/1K7Hl8SC4EV0tc9WhcgI0km2oPqp+GG6u1dxcra5qKitFBfTqsftEPhU7FvIpvrPOz3JzEtvLWuog+cP3CHeFGAetqfXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSZV7OB5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABtEk003560
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=m9egjm1L6IpxtJvjxoNy9w
	GaXeLVAUVKxeO7A1ddW8U=; b=GSZV7OB5Rt6kTNVdvo3VFclUmq0EnfawQX0qG6
	EFj0DELbquoEjyyxiH+Kx+gEITFJKF5V9JWmp78e347JabgREYz4lTr7egz3VXEu
	TNqMZB4JPbXM2KE00OvXCBcXUSatXrh+7hYEAy6qVzICF7YRsEW7uJoA8e83/3cY
	FbBRBao3+mNskFjNjytqWs2rP18wGZOcNgjLit6QPnrcuZiKWkIAbGaieyEJCIDj
	E0CRYCkKKV8CsKU+ANg8jD2WlZciR1pRhHUcLv+JbmVVVTgJdPS6vPxYMGkMWg1t
	/71V6S/snXJYx9b+k+aFPhZh+YvqH9Il0dv+DPMP+DX9lNtQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 494wyr9hqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 14:59:40 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b54b7cb9d30so4947602a12.0
        for <linux-i2c@vger.kernel.org>; Tue, 16 Sep 2025 07:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034779; x=1758639579;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m9egjm1L6IpxtJvjxoNy9wGaXeLVAUVKxeO7A1ddW8U=;
        b=qot7no05bLuKf7ME1mwZ5c/zejWfobLvtZKWEzfxTfMaJ5y6MRvXQ4kv0UR2Ms1kJ+
         0+RWjFSr7gPjSQdAPB/TnDJk1U4voqE9oZYQ3MyINpLwFx+Ci4xW42AzH36pilj239JY
         cCEDeLU4x/IjMJ3Dt8cffKlbpKMCbvGP24GDOyl76BGU/Fmvhk2iJV75MDQrMcYpoews
         PZRkBxIDJfxYHzVZSQ1pSeIH00QtP0EanabnFF8a5Zcen5/St7gOGEapEOYIhjt/o+Iy
         5040mJqaFZcWQm7xUdyDaCRf2TB1tM4iRC8VGHh0nuLxwKOaDuL/RCwx/Kh9ylY1xr9w
         s0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUZaeiHsw6xjv7O/OHt1US3lmw7s9tklWQ2nhRg/fyskHZYNdRzTZtlOMyDQ9sn0oL4CtcwyfzaX8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqMPxkpxQmUmXWMDSgxeaHhS0lEe54wr1rHK99Fq5da7KPN240
	351N39n5E6xGRtq82NBNLdVgEQnALElhk8yiTSCaB4xu/pkai0eg+IePc7NwFZrbDpwAZgsh0T7
	IjlGL35cu/aGFe/7c+ImImV4wKqjbqI+fEnXql1rAhdzhJmjpnLQiYy5sOfbMwiZFePVuG4E=
X-Gm-Gg: ASbGncsD5ICmrJHDIgaNMVEB25A27irkyMgO1h7MlERu7fn2uRk8PYhFrZGYAwSoX6a
	2za43cx9RIv9aNfCbOWjjNCAQ2yLptH0ER8AlEhPMcmeseZn/iouhWbeijzzPpMVz4mzzrprkZA
	/QxA+Ohb5a2rY5iySlfk/mLfK2D10KGHU6jzVN9ODddqDjyh6vK4CWU1jDufDDQth6YAppfLCVK
	x3QKuIvDaO4jacG8bqNAsS7lQp7rXx3hPgCedLRRMkVR/fzRmlHJlJSoCc0OZV4AEjzBvs5FUPE
	MV2mbnu5QpGquRtGa7iF5/GPXa6gfqgJ3sqTdQfxwdyYegcQKSyu3nR7K8oUJdI3lcTN
X-Received: by 2002:a17:903:1aed:b0:252:5220:46b4 with SMTP id d9443c01a7336-25d26764238mr200220055ad.37.1758034778781;
        Tue, 16 Sep 2025 07:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKqhlfDEt/H2lrXgiFg724HYcFzCFXQB1BZlQWmUIqLsHjlJBOq9bn26D27Hh9a+WRzHgdXw==
X-Received: by 2002:a17:903:1aed:b0:252:5220:46b4 with SMTP id d9443c01a7336-25d26764238mr200219495ad.37.1758034778186;
        Tue, 16 Sep 2025 07:59:38 -0700 (PDT)
Received: from hu-wasimn-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2651d2df15esm74232615ad.45.2025.09.16.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:59:37 -0700 (PDT)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH v6 00/10] arm64: dts: qcom: lemans-evk: Extend board
 support for additional peripherals
Date: Tue, 16 Sep 2025 20:29:22 +0530
Message-Id: <20250916-lemans-evk-bu-v6-0-62e6a9018df4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEp7yWgC/3XQTWrDMBAF4KsEraMwkixFzqr3KFnoZ9yIxHZiJ
 aIl+O4dh0KNW28G3sD7YObJMg4JMztsnmzAknLqOwpmu2Hh5LoP5ClSZhKkBisqfsHWdZljOXP
 /4BhA6IAVWEBGneuATfp8ee9HyqeU7/3w9eKLmLY/kjQLqQgOnBhhEKIKqN/6nHe3h7uEvm13N
 NgEFvmL1KCWiCTEN05Z4RvrnVxB1BxZ3lQUIdZ754JopEa7glRzxC6RihAdlKiDqY3bxxVEzxD
 x5yd6QlTcRwnGmPo/ZBzHbwD4VFPFAQAA
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758034770; l=5129;
 i=wasim.nazir@oss.qualcomm.com; s=20250807; h=from:subject:message-id;
 bh=Giemnl7HyeXBcqutm/0IE+n+bQ2mv/vn7iAAVZojiMY=;
 b=VoNULtSkpzS7QhmtP3ta3ryhpMN/sHQfMiyNVvdKZ3YV1knLspX6ETiYsuAaz2xl+Kz0AQ/Pe
 HCinzZ/SEn6Bgw2CGfzygNe8bHZlNjODCEJz1a3woGLKfLS5/syAtp3
X-Developer-Key: i=wasim.nazir@oss.qualcomm.com; a=ed25519;
 pk=4ymqwKogZUOQnbcvSUHyO19kcEVTLEk3Qc4u795hiZM=
X-Proofpoint-ORIG-GUID: QpkSNNatDZPaEzX70SUr_CIafEN_MMMf
X-Authority-Analysis: v=2.4 cv=SouQ6OO0 c=1 sm=1 tr=0 ts=68c97b5c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=BsnYa19qhuCdz4ISQwsA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAwMCBTYWx0ZWRfX93w04bL1yXuh
 D80nzf6nRDl9EZUNd0rS5+W8tykWJ+SNKNkZXmm6Z5qRLTKg5VOgE6X+D4Vne/Lu9TsRir+5JOJ
 1H22vfXjIHrocqOK9yMoL83wGVky3ImKd8naAMuSHKcnvRy9Z1TtxtR28QjENXku9QM4Lvj4RbN
 qBk/xv25Tdd9kzNPLLc7/tQNPJfd/WPZckVSCbX4thmQvXNdolsdgzUPeVu5ALvWzKZwsR6ukYx
 S9MTcprIEyTJcefa3RJGrlGXZ4g0I0b8piu2HNMXioeWOH/P9oxXXgq8dLSPh+o8gCQqg6k+MRY
 +AK6a+/XUKvjLLZMJJ2D+gCy4T3yiDTmBrRc8j2c33tv4SHIY1En5XDxrcax0gkXdDAAGHW16ka
 o5eir0Bi
X-Proofpoint-GUID: QpkSNNatDZPaEzX70SUr_CIafEN_MMMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130000

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

Dependency:
  - The ethernet PHY QCA8081 depends on CONFIG_QCA808X_PHY, without
    which ethernet will not work.

---
Changes in v6:
- Update commit message of patch 02/10 (v5) to reflect QUP interfaces and
  its ports - Dmitry.
- Link to v5: https://lore.kernel.org/r/20250916-lemans-evk-bu-v5-0-53d7d206669d@oss.qualcomm.com

Changes in v5:
- Dropping these changes from the series, as they are already part of
  linux-next:
  - Audio change [1]
  - MMC dt-bindings change 01/14 (v4)
  - EEPROM dt-bindings change 05/14 (v4)
- Change bias to 'pull-up' for PCIe 'perst-pins' - Konrad.
- Link to v4: [2]

[1] https://lore.kernel.org/linux-arm-msm/20250822131902.1848802-1-mohammad.rafi.shaik@oss.qualcomm.com/
[2] https://lore.kernel.org/r/20250908-lemans-evk-bu-v4-0-5c319c696a7d@oss.qualcomm.com

Changes in v4:
- Move 'bus-width' property of SDHC to Board DT and also keep the width
  to 4 bits - Dmitry/Konrad.
- Update commit text of eeprom bindings to describe the reason for the
  change 05/14 (v3) - Dmitry.
- Bring all tags from v3.
- Link to v3: https://lore.kernel.org/r/20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com

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
- Add 'Reviewed-by' tag from Konrad [3] on Audio patch 13/13 (v2),
  although the commit text is changed now.
- Link to v2: [4]

[3] https://lore.kernel.org/linux-arm-msm/b4b6678b-46dd-4f57-9c26-ff0e4108bf79@oss.qualcomm.com/
[4] https://lore.kernel.org/r/20250903-lemans-evk-bu-v2-0-bfa381bf8ba2@oss.qualcomm.com

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

Mohd Ayaan Anwar (1):
      arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface

Monish Chunara (3):
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

Wasim Nazir (1):
      arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems

 arch/arm64/boot/dts/qcom/lemans-evk.dts | 365 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  92 ++++++++
 2 files changed, 457 insertions(+)
---
base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
change-id: 20250814-lemans-evk-bu-ec015ce4080e

Best regards,
--  
Wasim Nazir <wasim.nazir@oss.qualcomm.com>


