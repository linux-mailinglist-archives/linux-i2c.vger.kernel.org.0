Return-Path: <linux-i2c+bounces-6088-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8C996ABD6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 00:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1BB1C20959
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 22:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862C61DA61C;
	Tue,  3 Sep 2024 22:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JcmyexsI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D441DA30F;
	Tue,  3 Sep 2024 22:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725401318; cv=none; b=ScMzUW803REi2y4bFL2Gyo3pXf5GMjhf/0EqiLyZeDhKXTplHu6COCAgfFOeqJI6kmATFQCdQ+UYO91RHrYM3HDMKHx64L9UZM4OP3D0KkU2HwW6Oyo3Kn6mYAd2rjKO4kl+W/o3hjxOZtSnNcjYfzH3P3kiwg4sfsyZMwDM6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725401318; c=relaxed/simple;
	bh=vyrhUKou0XD4nZWQsn66DthQrAeicawTIpdpcWCMhr4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtIBHug9YEg1FqDaiN4/L6HmlaTyY3JlGcXNr/puSc9M5gRPWc8MCO3RT0yRhTTKZhZBh5qBpxMTqbQwyq5uKFWl0L+sg0HjcYrU7m35LqQ4nC2xAcVOCnmNQjeMTN+7+K7thQV3x/jaIXzT0qdRo7smtbDg77HM/SKUGooVZU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JcmyexsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 483LhYK1004948;
	Tue, 3 Sep 2024 22:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VJ5ksTVw82HBrOjZW1RnoU3D+LfVJFMZlBTSgU8rxyA=; b=JcmyexsIdEgimOW+
	ENNWT0ZlPkhARdzfxHLV9UWXNFbAcnunV3oR5pcI4mnE8Srq9PumvHAUNBjLIFbt
	95ecofD5nXhPSgUeSB/2dupYz2RPhLChitp94y0FSv4OZOygdyb8JN9qMITXbVrp
	BLORZp4Iqhm31g3zuPKvXGjBgqdG/Q/q73r/RHv3tq5ahOU2ihQ8BK2Y8REIFOv7
	aBWNpXMOao1qzC4slqTVYAS5HRhKkOAJGwdeVH9bfr/y4A7oxNDWp1SuNBUK5sQ6
	+NYtrs2D6NfjGeKYZBnT24L0OfBkWmyFkdS4Q3nB6hPePFJyYuZW/FKxn1STbPGZ
	KYFm7Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41drqe3444-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Sep 2024 22:03:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 483M2x0u002338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Sep 2024 22:02:59 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Sep 2024 15:02:55 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <quic_nkela@quicinc.com>
CC: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <herbert@gondor.apana.org.au>,
        <davem@davemloft.net>, <sudeep.holla@arm.com>, <andi.shyti@kernel.org>,
        <tglx@linutronix.de>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jassisinghbrar@gmail.com>, <lee@kernel.org>,
        <linus.walleij@linaro.org>, <amitk@kernel.org>,
        <thara.gopinath@gmail.com>, <broonie@kernel.org>,
        <cristian.marussi@arm.com>, <rui.zhang@intel.com>,
        <lukasz.luba@arm.com>, <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
        <iommu@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>
Subject: [PATCH v2 00/21] arm64: qcom: Introduce SA8255p Ride platform
Date: Tue, 3 Sep 2024 15:02:19 -0700
Message-ID: <20240903220240.2594102-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828203721.2751904-1-quic_nkela@quicinc.com>
References: <20240828203721.2751904-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rr1wmp4df3_Phh0IuAStRJcDv9BszwT_
X-Proofpoint-ORIG-GUID: rr1wmp4df3_Phh0IuAStRJcDv9BszwT_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-03_10,2024-09-03_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2409030177

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


This series is based on next-20240903.

[1]: https://resources.linaro.org/en/resource/wfnfEwBhRjLV1PEAJoDDte

---
Changes in v2:
  - Patch 1/21 - 11/21
    - Added Reviewed-by tag

  - Patch 12/21
    - Already applied in the maintainers tree

  - Patch 13/21
    - Modified subject line
    - Fixed schema to include fallback

  - Patch 14/21
    - Added constraints

  - Patch 15/21
    - Modified schema to remove useless text
   
  - Patch 16/21
    - Modified schema formatting
    - Amended schema definition as advised

  - Patch 17/21
    - Moved allOf block after required
    - Fixed formatting
    - Modified schema to remove useless text

  - Patch 18/21
    - Fixed clock property changes

  - Patch 19/21
    - Fixed scmi nodename pattern

  - Patch 20/21
    - Modified subject line and description
    - Added EPPI macro

  - Patch 21/21
    - Removed scmichannels label and alias
    - Modified scmi node name to conform to schema
    - Moved status property to be the last one in scmi instances
    - Changed to lower case for cpu labels
    - Added fallback compatible for tlmm node

Nikunj Kela (21):
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
  dt-bindings: arm-smmu: document the support on SA8255p
  dt-bindings: mfd: qcom,tcsr: document support for SA8255p
  dt-bindings: thermal: tsens: document support on SA8255p
  dt-bindings: pinctrl: Add SA8255p TLMM
  dt-bindings: cpufreq: qcom-hw: document support for SA8255p
  dt-bindings: i2c: document support for SA8255p
  dt-bindings: spi: document support for SA8255p
  dt-bindings: serial: document support for SA8255p
  dt-bindings: qcom: geni-se: document support for SA8255P
  dt-bindings: firmware: arm,scmi: allow multiple virtual instances
  dt-bindings: arm: GIC: add ESPI and EPPI specifiers
  arm64: dts: qcom: Add reduced functional DT for SA8255p Ride platform

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml     |   16 +
 .../devicetree/bindings/crypto/qcom,prng.yaml |    1 +
 .../bindings/firmware/arm,scmi.yaml           |    2 +-
 .../bindings/firmware/qcom,scm.yaml           |    2 +
 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |   33 +-
 .../interrupt-controller/qcom,pdc.yaml        |    1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml   |    3 +
 .../bindings/mailbox/qcom-ipcc.yaml           |    1 +
 .../devicetree/bindings/mfd/qcom,tcsr.yaml    |    1 +
 .../bindings/pinctrl/qcom,sa8775p-tlmm.yaml   |    8 +-
 .../serial/qcom,serial-geni-qcom.yaml         |   53 +-
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |    1 +
 .../bindings/soc/qcom/qcom,geni-se.yaml       |   45 +-
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |   60 +-
 .../bindings/thermal/qcom-tsens.yaml          |    1 +
 .../bindings/watchdog/qcom-wdt.yaml           |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi   |   80 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts     |  148 +
 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi    | 2312 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8255p.dtsi         | 2405 +++++++++++++++++
 drivers/soc/qcom/socinfo.c                    |    1 +
 include/dt-bindings/arm/qcom,ids.h            |    1 +
 .../interrupt-controller/arm-gic.h            |    2 +
 25 files changed, 5169 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-scmi.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p.dtsi


base-commit: 6804f0edbe7747774e6ae60f20cec4ee3ad7c187
-- 
2.34.1


