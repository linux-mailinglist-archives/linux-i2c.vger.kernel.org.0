Return-Path: <linux-i2c+bounces-10746-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE6AA8047
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 13:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F31A1BA15ED
	for <lists+linux-i2c@lfdr.de>; Sat,  3 May 2025 11:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB2DB1F1510;
	Sat,  3 May 2025 11:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WNj19pRW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ECB1DDC18;
	Sat,  3 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746270650; cv=none; b=Hyc5bIbTV+q+XmO216cdxsFj5bSYhn+JLrfwFmNVlQWtL6TrET6dviyeyCws58yQrH/0JGhHKoyBno9KhgKHd2Szd/psJ6dXttruNsy2TUxVcAUtAgoW0CgPBKhlWdLbsK+Z+4JzBwO1WS1lTNGyNq2SDcT+fhGb2zS5kyKeCGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746270650; c=relaxed/simple;
	bh=h9binRCV4NB8nah9n9aG8iePH1O0uere7IhiKUeGsIA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VbFgcKxbPIt0FRCTeQWpmxr5iYJ9rR7PCGJFifrb8ZjKI2unKpq2/pB/3XRQSgvJkbguj3AzV5XyQmq03mNYq/SiwFJMoHNag1Y3PvwPoEyplV0qbWYctPL8sx8p0Sw1DK9oAX2pAK1KLxmLzaIOnhx7tRIX5L3IgWN2usmR264=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WNj19pRW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5438KWWO006811;
	Sat, 3 May 2025 11:10:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sxfl6jicfUVNIjl0CO6KayVEBISbFBHBIgZ
	MpHuzdvc=; b=WNj19pRWLwnujAq/S6o8PWZ+wbGAfcb6m6itX/EwsmnoDejmxMR
	dhccyXjD74Uqol2d4Z+WNn9ZzCVQ+iyqNBvqI7V6D4H7G8B5hziIp8niGepA0Y3q
	z1S1X3rX53DAF5OAL2XR6RSCVSWmm2sL/sWJXkK36+lUiez/WkJEhFaJCi4NP0ex
	JO7UMxLGxpheqDdeGxqujpE698KYEd3mlKrZwqljBt9sCA6zgxBtq6P5Z5J+JRZ3
	8RWRm8MGlXELT1bPR7jL1l1I3EIxsGQz7fe9iXG6eb7aVpMgixcYn/V7G26QYqf1
	YhJXyIxKqlQoTLUkBGVZnXYwg6koBXCq58w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da55rjqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 543BAWhS023571;
	Sat, 3 May 2025 11:10:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7kjmru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:32 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 543BAWcv023565;
	Sat, 3 May 2025 11:10:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 543BAV1E023562
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 11:10:32 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 1E63D53B; Sat,  3 May 2025 16:40:31 +0530 (+0530)
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        broonie@kernel.or, andersson@kernel.org, konradybcio@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [PATCH v4 0/5] Add support to load QUP SE firmware from
Date: Sat,  3 May 2025 16:40:24 +0530
Message-Id: <20250503111029.3583807-1-quic_vdadhani@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA5OSBTYWx0ZWRfX9RvoG/GDbxmI
 ghpzk0uDt63GYnSUX2n6lmNp9bb4EoWRLFpjz63m2xXnjqaY+f11hDEPwefnDpFXt757nzvHAde
 VaTA/JkdfQ7MBrnQkO4HeXxO0/T0oye2yyt/wxRMHGJCWjzD+Stq/Y9SBA96TGta0qc1vfRIa95
 i6ca449O14CARlpY/L4YpWV9WZdT/w1WyTV0NMvvRspKLyxcGeunuDtLghAFTV6m66vRgoT5Hv8
 nDITHvPsPd5+z3cqgVn/dPvDm0CbyEvnINGDXgJMz3148b/v0iOImTEIaRHXEJ5CC5Ek7Wh1CR5
 35SRHcCdn+yUHz+aAV/ilPAY/oJWsqqyXpu5QwepTWuslLWEEQ68CBM8mXmwIZB0OmrTOUKrj0h
 ChjSKMWEiw3Ft8cNbvhdwYBb8fHA9jWmZ3W2YWoX/Rq9Oeg6un3J6mvoMXarYOgZ/t0Bi3P5
X-Authority-Analysis: v=2.4 cv=M9RNKzws c=1 sm=1 tr=0 ts=6815f9ac cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=XnsvMKsTPeFZVxA5G_AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: k9WKmxgHiSQ83SJGtlRsrFmBLoWsyCI3
X-Proofpoint-ORIG-GUID: k9WKmxgHiSQ83SJGtlRsrFmBLoWsyCI3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_05,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 mlxscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030099

In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
hardware has traditionally been managed by TrustZone (TZ). This setup
handled Serial Engines(SE) assignments and access control permissions,
ensuring a high level of security but limiting flexibility and
accessibility.
 
This limitation poses a significant challenge for developers who need more
flexibility to enable any protocol on any of the SEs within the QUP
hardware.
 
To address this, we are introducing a change that opens the firmware
loading mechanism to the Linux environment. This enhancement increases
flexibility and allows for more streamlined and efficient management. We
can now handle SE assignments and access control permissions directly
within Linux, eliminating the dependency on TZ.
 
We propose an alternative method for firmware loading and SE
ownership/transfer mode configuration based on device tree configuration.
This method does not rely on other execution environments, making it
accessible to all developers.
 
For SEs used prior to the kernel, their firmware will be loaded by the
respective image drivers (e.g., Debug UART, Secure or trusted SE).
Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
will not be loaded by Linux driver but TZ only. At the kernel level, only
the SE protocol driver should load the respective protocol firmware.
---
v3 -> v4: 

- Drop patch 1 of the v3 series as it has been reviewed and merged.
- Update the qcom,gsi-dma-allowed property name to qcom,enable-gsi-dma.
- Remove the full stop from the title.
- Add a reference to the common schema YAML in the I2C, SPI, and SERIAL
  YAML files in a single patch and drop the individual patches for protocol YAML.
- Update the commit message.
- Resolve kernel test robot warnings.
- Add a multiline comment in the Copyright section.
- Remove valid_seg_size and geni_config_common_control functions and add the code inline.
- Rename read_elf function to geni_read_elf.
- Add a firmware size check.
- Assign *pelfseg after finding a match.
- Break one large condition check into multiple checks to improve code readability.
- Remove return type documentation for void functions.
- Update error messages to be more descriptive.
- Correct indentation.
- Rename geni_flash_fw_revision function to geni_write_fw_revision.
- Remove __func__ from all print statements.
- Move resource_on to the appropriate section after parsing the firmware file.
- Update variable names and function arguments as suggested.
- Use FIELD_GET, FIELD_PREP, and GENMASK.
- Use memcpy_toio() instead of memcpy.
- Remove duplicate registers and bitmask macros.
- Remove rsc struct and add required variables in geni_se struct.
- Add a patch dependency note.

v3 Link: https://lore.kernel.org/linux-arm-msm/20250303124349.3474185-1-quic_vdadhani@quicinc.com/ 

v2 -> v3:

- Add a new YAML file for QUP peripheral-specific properties for I2C, SPI, and SERIAL buses.
- Drop the 'qcom,xfer-mode' property and add the 'qcom,gsi-dma-allowed' property in protocol-specific YAML.
- Add a reference for the QUP peripheral shared YAML to protocol-specific YAML.
- Enhance error handling and remove redundant if conditions in the qcom-geni-se.c driver.
- Remove the ternary operator in the qup_fw_load function.
- Update function descriptions and use imperative mood in qcom-geni-se.c
- Load firmware during probe only if the protocol is invalid.

v2 Link: https://lore.kernel.org/linux-kernel/20250124105309.295769-1-quic_vdadhani@quicinc.com/ 
 
v1 -> v2:

- Drop the qcom,load-firmware property.
- Remove the fixed firmware path.
- Add the 'firmware-name' property in the QUP common driver.
- Add logic to read the firmware path from the device tree.
- Resolve kernel test robot warnings.
- Update the 'qcom,xfer-mode' property description.

v1 Link: https://lore.kernel.org/linux-kernel/20241204150326.1470749-1-quic_vdadhani@quicinc.com/ 
---
Viken Dadhaniya (5):
  dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties
    for I2C, SPI, and SERIAL bus
  soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux
    subsystem
  i2c: qcom-geni: Load i2c qup Firmware from linux side
  spi: geni-qcom: Load spi qup Firmware from linux side
  serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |   1 +
 .../serial/qcom,serial-geni-qcom.yaml         |   1 +
 .../soc/qcom/qcom,se-common-props.yaml        |  26 ++
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |   1 +
 drivers/i2c/busses/i2c-qcom-geni.c            |   8 +-
 drivers/soc/qcom/qcom-geni-se.c               | 404 +++++++++++++++++-
 drivers/spi/spi-geni-qcom.c                   |   6 +
 drivers/tty/serial/qcom_geni_serial.c         |   8 +-
 include/linux/soc/qcom/geni-se.h              |  31 +-
 include/linux/soc/qcom/qup-fw-load.h          |  89 ++++
 10 files changed, 551 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
 create mode 100644 include/linux/soc/qcom/qup-fw-load.h

-- 
2.34.1


