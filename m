Return-Path: <linux-i2c+bounces-5868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94C963297
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 22:45:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38231C22082
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Aug 2024 20:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE741B5827;
	Wed, 28 Aug 2024 20:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ggcAgUyh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48FF1B14F8;
	Wed, 28 Aug 2024 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877520; cv=none; b=fSDIomkhacWk7zs2fcL9POj5odY77puE5Uf+ckzcX4JWyon/oXkGwbyhDnqA4vv0culnvcutGxo/87lP4v/C3bLkgMVcPqLescyEniAwloFmzEXTuhiRQBmGhGF49Rp/aouOiVP1Wb7TtIg1btuwNkpcOEW8zoYUK84mMi/muaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877520; c=relaxed/simple;
	bh=/yymFjL50o5Zg1/Oz9wfTE6QtWKCFxKe43Nmczc8wKM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mP6rQKJ9zHJLxUFzmHJSBMKvOOBFLoHoLZY+zZkhkDDRmvJAT14u9cZ0hm1OmwkBZuTRk4QO1IpTd20lfKzJM4bx52ELo8zt1IjsocZqbZRNXRhQw238yK8qo1hzRgYfCzyZl+OSjNWneyF+eYYlgBtkJhG56s/Lv1M1SzygbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ggcAgUyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM9JE020195;
	Wed, 28 Aug 2024 20:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xeeUQWrnLTgtne5Sska/XG
	p/Bbu7fevfNvIu/F++8w4=; b=ggcAgUyh89PGlTg/iPE2d5FrXnPPmfCLIZt2eb
	Ue6/e7daRGKpQGfZZgrQ1y773hB+/Y9F6qDtjeHDghEntmeeehP9B6pTTTRx/UlQ
	a1ufZwa7UklwndWGufCXmhRlsGqwgrXPIBDThJnn7y1mmL26ZPgjsRWDydOXtKhG
	5QAN0fb0pHM6XnNLHuVcZ/J8LFcY6q4xB4sieVe3w8jG85Eonv1pILampVRmSniW
	3anepte9Uko0j2eL5K3+vUBiRNaB5gSXi/6sEmni6STjykNHmCmRlJVM33I5Q0Qn
	CwZUeHCPypvX6dvhMSy81icNa2Uz8p6C6b3oRei29FSx3EBA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419q2xu0pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:38:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SKbwM9014092
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 20:37:58 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 13:37:54 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <joro@8bytes.org>,
        <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <wim@linux-watchdog.org>, <linux@roeck-us.net>
CC: <robin.murphy@arm.com>, <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <vkoul@kernel.org>, <quic_gurus@quicinc.com>,
        <agross@kernel.org>, <bartosz.golaszewski@linaro.org>,
        <quic_rjendra@quicinc.com>, <robimarko@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, <quic_tsoni@quicinc.com>,
        <quic_shazhuss@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH 00/22] arm64: qcom: Introduce SA8255p Ride platform
Date: Wed, 28 Aug 2024 13:36:59 -0700
Message-ID: <20240828203721.2751904-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: BP50-BomuXv-vA3xS-Kwd9hXtYqUKPSr
X-Proofpoint-GUID: BP50-BomuXv-vA3xS-Kwd9hXtYqUKPSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_08,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280149

This series enables the support for SA8255p Qualcomm SoC and Ride
platform. This platform uses SCMI power, reset, performance, sensor
protocols for resources(e.g. clocks, regulator, interconnect, phy etc.)
management. SA8255p is a virtual platforms that uses Qualcomm smc/hvc
transport driver.

Multiple virtual SCMI instances are being used to achieve the parallelism.
SCMI platform stack runs in SMP enabled VM hence allows platform to service
multiple resource requests in parallel. Each device is assigned its own
dedicated SCMI channel and Tx/Rx doorbells.

Resource operations are grouped together to achieve better abstraction
and to reduce the number of requests being sent to SCMI platform(server)
thus improving boot time KPIs. This design approach was presented during
LinaroConnect 2024 conference[1].

Architecture:
------------
                                                          +--------------------+
                                                          |   Shared Memory    |
                                                          |                    |
                                                          | +----------------+ |                +----------------------------------+
     +----------------------------+                     +-+->  ufs-shmem     <-+---+            |            Linux VM              |
     |        Firmware VM         |                     | | +----------------+ |   |            |   +----------+   +----------+    |
     |                            |                     | |                    |   |            |   |   UFS    |   |   PCIe   |    |
     | +---------+ f +----------+ |                     | |                    |   |            |   |  Driver  |   |  Driver  |    |
     | |Drivers  <---+  SCMI    | |        e            | |         |          |   |            |   +--+----^--+   +----------+    |
     | | (clks,  | g | Server   +-+---------------------+ |                    |   |            |      |    |                      |
     | |  vreg,  +--->          | |        h              |         |          |  b|k           |     a|   l|                      |
     | |  gpio,  |   +--^-----+-+ |                       |                    |   |            |      |    |                      |
     | |  phy,   |      |     |   |                       |         |          |   |            |  +---v----+----+  +----------+   |
     | |  etc.)  |      |     |   |                       |                    |   +------------+--+  UFS SCMI   |  | PCIe SCMI|   |
     | +---------+      |     |   |                       |                    |                |  |  INSTANCE   |  | INSTANCE |   |
     |                  |     |   |                       |  +---------------+ |                |  +-^-----+-----+  +----------+   |
     |                  |     |   |                       |  |  pcie-shmem   | |                |    |     |                       |
     +------------------+-----+---+                       |  +---------------+ |                +----+-----+-----------------------+
                        |     |                           |                    |                     |     |
                        |     |                           +--------------------+                     |     |
                       d|IRQ i|HVC                                                                  j|IRQ c|HVC
                        |     |                                                                      |     |
                        |     |                                                                      |     |
+-----------------------+-----v----------------------------------------------------------------------+-----v------------------------------+
|                                                                                                                                         |
|                                                                                                                                         |
|                                                                                                                                         |
|                                                               HYPERVISOR                                                                |
|                                                                                                                                         |
|                                                                                                                                         |
+-----------------------------------------------------------------------------------------------------------------------------------------+

        +--------+   +--------+                                                                         +----------+  +-----------+
        | CLOCK  |   |  PHY   |                                                                         |   UFS    |  |   PCIe    |
        +--------+   +--------+                                                                         +----------+  +-----------+


This series is based on next-20240828.

[1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte

Nikunj Kela (22):
  dt-bindings: arm: qcom: add the SoC ID for SA8255P
  soc: qcom: socinfo: add support for SA8255P
  dt-bindings: arm: qcom: add SA8255p Ride board
  dt-bindings: firmware: qcom,scm: document support for SA8255p
  dt-bindings: mailbox: qcom-ipcc: document the support for SA8255p
  dt-bindings: watchdog: qcom-wdt: document support on SA8255p
  dt-bindings: crypto: qcom,prng: document support for SA8255p
  dt-bindings: interrupt-controller: qcom-pdc: document support for
    SA8255p
  dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p
  dt-bindings: pinctrl: document support for SA8255p
  pinctrl: qcom: sa8775p: Add support for SA8255p SoC
  dt-bindings: cpufreq: qcom-hw: document support for SA8255p
  dt-bindings: thermal: tsens: document support on SA8255p
  dt-bindings: arm-smmu: document the support on SA8255p
  dt-bindings: mfd: qcom,tcsr: document support for SA8255p
  dt-bindings: qcom: geni-se: document support for SA8255P
  dt-bindings: serial: document support for SA8255p
  dt-bindings: spi: document support for SA8255p
  dt-bindings: i2c: document support for SA8255p
  dt-bindings: firmware: arm,scmi: allow multiple virtual instances
  ARM: dt: GIC: add extended SPI specifier
  arm64: dts: qcom: Add reduced functional DT for SA8255p Ride platform

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |    1 +
 .../devicetree/bindings/crypto/qcom,prng.yaml |    1 +
 .../bindings/firmware/arm,scmi.yaml           |    2 +-
 .../bindings/firmware/qcom,scm.yaml           |    2 +
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |   56 +-
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |    3 +
 .../bindings/mailbox/qcom-ipcc.yaml           |    1 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml    |    1 +
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   |    4 +-
 .../serial/qcom,serial-geni-qcom.yaml         |   58 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |    1 +
 .../bindings/soc/qcom/qcom,geni-se.yaml       |   47 +-
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |   64 +-
 .../bindings/thermal/qcom-tsens.yaml          |    1 +
 .../bindings/watchdog/qcom-wdt.yaml           |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi   |   80 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts     |  149 +
 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi    | 2312 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi         | 2405 +++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-sa8775p.c        |    1 +
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 .../interrupt-controller/arm-gic.h            |    1 +
 26 files changed, 5157 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi


base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
-- 
2.34.1


