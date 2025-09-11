Return-Path: <linux-i2c+bounces-12844-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B526B5279C
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 06:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA127483BC3
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 04:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E4523BD02;
	Thu, 11 Sep 2025 04:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YlPg3OOg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69931CAA92
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565191; cv=none; b=S+lcqIsxQhZUX8WkD9LxEWfXFKtd/ySo7pMBnslApX8oeZPN0Lc+oZUWf/iKJ2PBitn+E6WxSzvBIdEfxEZ9ypUzpar9fJGWyykLnl72KD+qZFf2sEwvNxj6JvLV9fQo8sorexbYZkMuJlsA6MLH1jPpdAuRSXY2m+Ta6kqniWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565191; c=relaxed/simple;
	bh=O6eWIJr8+46650Np0lYhA73HNNggUR/2TCpyEJ4KVaQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kMGsnvGjAZ5RmQFtjrP4QWx/sciKPgKwxbBz4/synt07v6M2bh/kQ8sC4eKDu4w2qVZarRanKNNUEhbDNtHPksgWZ5pWXgU4Xe5P6jxf6jR7hN2Rgy7HBjjtIm7amtFRrMLs4+CKUjXThyYZUDuyYFjOKE6dqGaSZCmi9XZ1buo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YlPg3OOg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IV2V025658
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=d0CMaRDbC1gH0+RvxPdiQkc3aLz0hIoneHd
	tDR0m7Zc=; b=YlPg3OOg983APctQdmDqbBi+8mXTuSbz4gC1f2DBQ0w8gyTRndm
	gAc96ZMEuHP450MEKsHBI1I+6IrooTlyI84E8w0NgqhmRuegk9ssVRCPkfsdOgAz
	sHpPGg44pql2GxzhnO8Li0r6VG7hBn4Nr1jKUWuihAYzDmHXS4EOzp+5R4JDJFt4
	UIsjIDZuTMmvlfyFhccHM80u97sVbw9VK6Gtda32wjFafBL3IhYoPJ8J/8R47dkO
	xmBv32mU2PKZrsJArjQ2/KTlFq3SmScFAGjoiVHjwldFNOlvYMmXF2bX5wzCUAzn
	CvaUHTISPx37pR1hRYy5iEAAn0GG9I4eXzQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0x6gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 11 Sep 2025 04:33:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24afab6d4a7so6849825ad.1
        for <linux-i2c@vger.kernel.org>; Wed, 10 Sep 2025 21:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565186; x=1758169986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0CMaRDbC1gH0+RvxPdiQkc3aLz0hIoneHdtDR0m7Zc=;
        b=IIXenmN4qSyCebwkDwDMXzy0ndNOILjUL74Dqk8DB0KuhR82RvNU59GKXEANTnQIV6
         RftJhjqHXMwdxPfyqhYsASlEPwgHaGa6G1T2igUVsFU0006genJrtMA/Mrs1zxv3V6Cg
         rVGtNvMLlbbvwFH19yXugSRGvQ+BBGICZz8pYeIiKQHRTH0wroYTUZdL8uVFjxkszPUW
         BTc2NMa/+CbIJ2Y2zIXhbZaZ91cJPFIl5zLPOLDlPB9T3MnWCWpy1u6DBhvp8sbdnGuE
         DJEPlV89D1PAjmfcHBAZ+Ke5Y3xoSdo7kvHBqw7Mg0VB+BR35o8NDnw0SdLMoB1qqtYW
         YROA==
X-Forwarded-Encrypted: i=1; AJvYcCUyxTRA0c/4w9z77kjy5youwaIj61/d0y33TK5rNThGOEJCF7AMORndi+j7jFnl0j7BLb9viNl0o/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YygLzea253tF2pG8naMs30qMClSwhqDX7PyRVVojBixAE9yGDzG
	PjgPoGXQnveRKuq/2kBspSbLYOB5GLlGL1NVw/VL6M5M6LDShZzyqjw8eEX6OtrsOgk1aRDzWpz
	RfWxM2xEPpVKnAwOHuIhPdR6dw9pRw2sDEHlBkDVDBHvyg8sVKUhLD4tgIPWwN1s=
X-Gm-Gg: ASbGncvAU7VX4+Cg8Lg7aXvFA79ltAcapmyUlu0MYy5uBTiAWRwTWnLBB2RP+FrLDIS
	PjP9Eb4y3UGbRbIlf2UZga9fKJIm33lgHhv7KG4OU0S/6VYYYXT3p0i9zzRZMMjHoL7aPwhe05n
	KFTcdZqaJdZU+8XIBteuhh4LIzj/NNzoa/jx3QoaD4oyW8CwC5Elag4zzmoDrIdbLzD1EH5Bqq8
	ybhFITsEdme7qBohu6PS58UX9SNve4qG8JkcJAXHFeNdmdqJKEs1YFdptq230I2ZLxRepxGOt7V
	NSLYmt9I0TdH/77SnHMRvAqn/IlDt5oIe7o25/kGXf9fhZBwsjf5DQkEg2Ev5acl9z8bLFN7Nj3
	n
X-Received: by 2002:a17:903:46cb:b0:24d:f9f:de8f with SMTP id d9443c01a7336-2516fbdcc8amr266964245ad.17.1757565186133;
        Wed, 10 Sep 2025 21:33:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa/7Qd8m4VQSi9D/4a5Bf46TIWZywfkvsusP0Hkifjzk/FqUnVhUo3mumJRpk5C2HzKnOlFQ==
X-Received: by 2002:a17:903:46cb:b0:24d:f9f:de8f with SMTP id d9443c01a7336-2516fbdcc8amr266963805ad.17.1757565185564;
        Wed, 10 Sep 2025 21:33:05 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84a46csm4323975ad.91.2025.09.10.21.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 21:33:05 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
To: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, broonie@kernel.org,
        johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Add support to load QUP SE firmware from
Date: Thu, 11 Sep 2025 10:02:50 +0530
Message-Id: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KTUgUGZuREdd9HREu5ALWI7NA_wrFuaz
X-Proofpoint-GUID: KTUgUGZuREdd9HREu5ALWI7NA_wrFuaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXwI8nEL1fombM
 b74GxR/am0udlkG00R2z/2hXo81AsIZJvD/3gqGAtxzA181U/Mg/ZYiIaau4HJYBTX5Fzb0nEgM
 Omxlh6JPJGkXi10Ef04trOrn1RC4pes412fl4XJiRXgsbFvgdcuY4YKWJq8yJjImybzaW4fi5ox
 xqX9XGW1hwNV0jd29nVT2ZhB6LA7g0KJVxrD0/ZqSG9O0Xg4/lNwWGKZ4zNoGvwK4E8/wH7hL+W
 56XCkLSKI3ztqJ4ClXNgs3tAvF/NlEyrRzCjw1VMScoxiNcXbIiWnLygPZu1RReNp45eISuHkXt
 HDU23D4ZAT0MQOOkq7MwXx+N20bW++3ZWI52fTvcZyZ7xXJDAagW+K1+6NVIIyJdT5MUZFxSsYb
 7zewTwbt
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c25103 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=HXvFq9hwUs1lQpdr-HAA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

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
v6 -> v7:

- Resolve kernel test robot warnings.
- Defer the probe if the firmware from the filesystem is not available during early boot time. 

v6 Link: https://lore.kernel.org/all/20250822072651.510027-1-viken.dadhaniya@oss.qualcomm.com/

v5 -> v6:

- Added extra patch for cleanup in qcom-geni-se.c file.
- Moved contents of qup-fw-load.h into qcom-geni-se.c.
- Specified endianness for all members of the se_fw_hdr structure.
- Changed the return type and arguments of the geni_read_elf function.
- Renamed geni_read_elf to geni_find_protocol_fw for clarity.
- Added error logging for corrupt firmware.
- Passed SE mode and protocol type explicitly to all relevant functions.
- Replaced writel_relaxed with writel for stricter memory ordering.
- Renamed variable reg_val to reg for consistency.
- Moved firmware length validation logic into geni_find_protocol_fw.
- Updated function documentation for clarity and accuracy.
- Removed redundant firmware length check.
- Inlined the qup_fw_load function and removed its definition.
- Removed the MAX_PROTOCOL macro.
- Dropped mode and protocol fields from the geni_se structure.
- Moved unrelated firmware loading code into a separate patch.
- Added Acked-by tag.

v5 Link: https://lore.kernel.org/linux-i2c/20250624095102.1587580-1-viken.dadhaniya@oss.qualcomm.com/

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

Viken Dadhaniya (6):
  dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties
    for I2C, SPI, and SERIAL bus
  soc: qcom: geni-se: Cleanup register defines and update copyright
  soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux
    subsystem
  i2c: qcom-geni: Load i2c qup Firmware from linux side
  spi: geni-qcom: Load spi qup Firmware from linux side
  serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |   1 +
 .../serial/qcom,serial-geni-qcom.yaml         |   1 +
 .../soc/qcom/qcom,se-common-props.yaml        |  26 +
 .../bindings/spi/qcom,spi-geni-qcom.yaml      |   1 +
 drivers/i2c/busses/i2c-qcom-geni.c            |   8 +-
 drivers/soc/qcom/qcom-geni-se.c               | 506 +++++++++++++++++-
 drivers/spi/spi-geni-qcom.c                   |   6 +
 drivers/tty/serial/qcom_geni_serial.c         |   8 +-
 include/linux/soc/qcom/geni-se.h              |   4 +
 9 files changed, 540 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml

-- 
2.34.1


