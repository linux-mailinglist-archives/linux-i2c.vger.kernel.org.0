Return-Path: <linux-i2c+bounces-11560-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FC3AE6152
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 11:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F30616BBE7
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jun 2025 09:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D030727E7EC;
	Tue, 24 Jun 2025 09:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P+RoxOQA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACFB25CC50;
	Tue, 24 Jun 2025 09:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758676; cv=none; b=cdmBpvPVJqm1Zwf8MTSTyLrjUeOPQbLqqaLrP3mLqRwx+KvHTE0wJYkhemFCPFTzN5Wov6vw07+BN7JE/fKbF+Ok5XLBKUlyKVgjiVblfb3CMxOfKbQbz+hj6rBnZL0Yi8JbLzusa4+b7T6GoP5+3ozjjg7hDnpRn9872LJD2qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758676; c=relaxed/simple;
	bh=JYmiyGEacQq75Q27iwEKQgp/kF0padbvVGq+8y+OVa0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PC5UeC2n+kxRKYCCeOMJ2C623OzvJdL0X88o5YcaS+KN11cCIMsabsWt+LCx0QWbxOBhOh/vaBMpXtN8DjCwsX8MAjxGbeu33YlAmUujmFVOxygoRosRZ4XLNG3UgKm5v5KGdXba8VoCBiAUjXW1YurE8rZ88zjFGXIMMT3tsN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P+RoxOQA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8xQaw022985;
	Tue, 24 Jun 2025 09:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=CxVzBY/H1+RhoLMscX59zfnY1PMC/8fIUY+
	OGESrTJw=; b=P+RoxOQAp8qhWqZndvy7rh2Q71FI4OoGbXXaDKKDBJc+vv3MklT
	VgSRh54O8ixq1vN43+bpExg1mnVTa5hIisK4+yxqt7c22Yy8oWPvZjMEOgk4Rsh4
	L4KNAevHvHHxvPkn5JblDjjHJVNwyRpWDjgvOdW0wEODqlhWTiGLAa9WWkAQ0hLx
	Z2H224x3Cvx1c9iS8srcM3CtZ124hJhyqr+lP8baAoJUdOao18/eiB7uz85Rw5le
	slB7MTN0q8SaVugRVYqgYNCtylDhvnML6ZO+kyvIYagsB2IYzSQFiNHvpSsh0EKy
	r/cRmXskLVoCYro9k7UJrXmmrOGS8G4TxoA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgbme5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:09 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55O9p6uj024161;
	Tue, 24 Jun 2025 09:51:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47dntktds5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55O9p6m0024153;
	Tue, 24 Jun 2025 09:51:06 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com ([10.213.97.252])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 55O9p5ff024146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 09:51:06 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4047106)
	id 30F2656E; Tue, 24 Jun 2025 15:21:05 +0530 (+0530)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add support to load QUP SE firmware from
Date: Tue, 24 Jun 2025 15:20:57 +0530
Message-Id: <20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: F_FlamUoFfvpgJgurMu0z-lMQaPI-l39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4MyBTYWx0ZWRfXwST6OOVC5jYz
 HrygCDUlLWdMBSu4M1yc1ZcIrmRpfCuKFHlVxrB0Rxv+4A9tfnqQ6ADSYxM6XVBNsJayXg7QFZn
 ncm+/TkI9YfCEwwxAqYLV1ler4YOekrl5BLeWng7Z9nBDKZGP7gqV3NOvIv1MRN41Odgovq5C8h
 RnFInt69CX2201smfzkkCwdkT+WR+ssq2XnYuc1LrRLTlE19EQsoB+bXJ81MKnzEm513DWZoLaF
 4TUzZzQ0Dtr01qflDulW5uBxNyLg4c0wzXvP0VAQ6CnnPIltik7tAAVhzM77axVQYrKCUz3jQVD
 9J6DTrzjioJxbnDU74/lrkT5sr2tiy4wdpK2yWWpvgaetHBAmmvafBHILKuOcEFKdeKOS2tIBFC
 z/t4ElFgMm5iV0e8yS7qnS2kVKn2VSaCWYAjYyGOUSO2j1JmQ1wI8xr9cjXQ85gsxxY/ippA
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a750e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=03-ClwGjdYBXaTv5q9oA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: F_FlamUoFfvpgJgurMu0z-lMQaPI-l39
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240083

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
v4 -> v5:

- Added Reviewd-by tag.
- Resolved kernel test robot error by including the missing bitfield header file.
- Updated the SE firmware ELF structure name for consistency.
- Specified _leb4 format for the magic number definition.
- Updated the email domain from 'quic' to 'oss'.

v4 Link: https://lore.kernel.org/all/20250503111029.3583807-1-quic_vdadhani@quicinc.com/ 

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
 include/linux/soc/qcom/geni-se.h              |  32 +-
 include/linux/soc/qcom/qup-fw-load.h          |  93 ++++
 10 files changed, 556 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml
 create mode 100644 include/linux/soc/qcom/qup-fw-load.h

-- 
2.34.1


