Return-Path: <linux-i2c+bounces-13161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF10DB9F102
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 14:01:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 484707B67D4
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 11:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7FE2FE072;
	Thu, 25 Sep 2025 12:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9KKXRdI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE726F2B6
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801660; cv=none; b=LOBNaZvhvmNXzXPmfFByR7IEF45QrDhlvxK1ysqdELzQHliHGeIHmcjzJ78RmSokdhRrBZ5Q+c7mhpscdddgPpqBV3j4NurBhlDMSK+ucY65OzAaVcKRHtTBnDA22Q2+MHU/a3L0jSRfuQcY+V3FrlOcdWwVXI1OeMbnFZHnrV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801660; c=relaxed/simple;
	bh=SyjT/o2z0dyOG2o4BytzIRC4dNs1eO2vwpK24YRaEkY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P9ivzbg+ARtAx01fyQ90xQX1N0rdKBLAN3oTLm9/HmnzhqXltPMZtr0FWrX94wAnhakvm331KW23zruPvaIpe6vsRd+WPBKiQhD40H/cztNN3a7XiwbdPXv6hBVlsmNF6E5tRcllzsdd3XMwMlobJp3TbFA15Bfy2nxvGMIh9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9KKXRdI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9D10o023762
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 12:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnY
	dDBg+Vjw=; b=i9KKXRdI58COK8vJctc3V1u2NMDiPYXT/9aK84O7uzmmbrZW7+u
	I0HdUNw274w8+Hae2C+FWKbMlHMhFf7hrXRxNu7mzdcbUQtq7tmoxrDPcqe5iig0
	azgg2YxMyUDw3+7vrl/k0tcQac2fmgT+H0zrxKw45GAM/FKStn+CFBx2zItqmsNS
	37bbWBK0YzqCNkPXDm1CJoDT12pJOlrc6nZoA1fazHzv9wmcAlmPYkWbEA7sz9sv
	ujslBadeGgcRq9OorZZUDgVBskSJHL2YQohthCtEwEFrocnU4Ubm/EO5i7cuhHC2
	XkthclIt4srpiby65SNo7RjZwqBi5xRDg6A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0f0qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 12:00:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-27356178876so7132635ad.1
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 05:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801655; x=1759406455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ibi4SnoGMV8sI9OUOF4j1A9snxHLAbs/hnYdDBg+Vjw=;
        b=J+E3XkZ0zKMQxtUyQo7mcuBVxdgb8DJzk9qNUY486BCa8yD8QMtGnKWKH6tQ7v2ZEe
         Nw+gq1THVEUgNgmPy3Hz4fgiUD9iqQDwCcO8RlWfjTwq44P3X2ekjmjI9i/DnDd0b5h8
         0FpYQwj2mKeg/QmvjcT8dPwaB36wXjN4TgJ4ehIPTuVNZKWjYRPiydq6/zTDAVq6jFJI
         IGrn0D0dZGhxJ6KVe+y9SxRHMz852iF4KppSwJNhmtX9qMfwBGDCpDioBLAaXDdR276i
         hutrzeWMSaR3CFMdmzxH4IV83kc7/tqnW/+Fz3xe6DNczQwQ5ZtBnlSpxogyQc1emOwI
         k4eA==
X-Forwarded-Encrypted: i=1; AJvYcCUMFTITNGaAP4pZrDYzl3Idy9uienJ5I0f1H33IugHuN4XhRqnakPs/ifHB3KoBMQnSm78hFSIZzUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpwW1uQLSBMS65qyJonjHvMfqXsEILlFHcmohkC0EI1ny2HGNi
	Q7yAUwUr3liB4ZxSXfhWNeeSEvz2QuEzqTJOQs0Bv240QadvKfH6Z/h3UrcZdJ9z7q77j0iWwzj
	NuJTSx6D9M6u6wa6bpdQeRMLVG14MW0ISlC69ZdVXCKLONjZnx6Z3iRNPQii5RO4=
X-Gm-Gg: ASbGncsWLCq2E/MmdcP1/+KW6INW0iK31DFUzK8FgYhV6ElzyFXvw+EfVKLV4xGDHSB
	btIkeR8edwBoL5hT4Mx0psEnigI/2lQmZzhsyREbk/Dvmz1+kdemzwJaLdc0qfOBhxHZPtnY0Tr
	mGa2G772wbJHIN122OTYlGhlq/mUdQzJWB3nTLl/q94A32vWc/obT9Dde+LQyDKyBL/JwaaQVul
	niEZOmrWkXjrVawt6n4cwWnSOe5O/U5/BkKKLPzYzLT+aoIS/j7TFR3krX5Oxt3L9hJwGF8qXLL
	LC34BGn0xPLghD/3xUvYIx505ODNi/3SAd2uMLpDN3pA+DER31ye0ra4cGAgeFj79kyMGLCylpk
	=
X-Received: by 2002:a17:902:ecc3:b0:269:4759:904b with SMTP id d9443c01a7336-27ed4ade041mr36648035ad.58.1758801655209;
        Thu, 25 Sep 2025 05:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnXD2mZAewf9zy3BLbepfrjU+YGJ4Cp4RyCyDnMr5leVblOCnWiw4Ra971I5AdyuLPIQ+vrw==
X-Received: by 2002:a17:902:ecc3:b0:269:4759:904b with SMTP id d9443c01a7336-27ed4ade041mr36646315ad.58.1758801653319;
        Thu, 25 Sep 2025 05:00:53 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69a9668sm22266585ad.112.2025.09.25.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 05:00:53 -0700 (PDT)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: [PATCH v8 0/2] i2c: i2c-qcom-geni: Add Block event interrupt support
Date: Thu, 25 Sep 2025 17:30:33 +0530
Message-Id: <20250925120035.2844283-1-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52ef8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=AcHsLZsjNhMhd8_3HEgA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: en0zNnaebll1DK58FmEFz_GKhT0auRTP
X-Proofpoint-ORIG-GUID: en0zNnaebll1DK58FmEFz_GKhT0auRTP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXw/zXhQvCzgxc
 4JSTZphQ6A4tHqoyco9tiUGIhDAlIx/KOZBAr56hAVEJJJzV9QjjkVaARZWufySZqIkSuL0Mvzz
 U21I4XUJBS+f1kuO+dQIXydTINu6hKM1sry045eCAEOraL26e4g0E+nk/hO19K44WQqoP/PeONS
 +VQmRbjq8GPHCHISkc+077vvySwsQnoXgfB45yx3Z36YYcUqUhGhqQB432jMKBUSv4Fhb+Lg5DW
 rKZxaz7dMpj3saT2wqpJe4lSM07MpgUozMPglb1ZMFmHoCwCajGFnGI4FDHjxRsp0DHAeqsxtxg
 /T/YG6Mj/CwyHZ/p3c9uumvDvrOpaYpy28d62SolcsZoJ6qzUl7sf/NAf+kyz0o1Icnsf2xRSeg
 tbbR4BRU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

The I2C driver gets an interrupt upon transfer completion.
When handling multiple messages in a single transfer, this
results in N interrupts for N messages, leading to significant
software interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI)
mechanism. Enabling BEI instructs the hardware to prevent interrupt
generation and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

BEI optimizations are currently implemented for I2C write transfers only,
as there is no use case for multiple I2C read messages in a single transfer
at this time.

v7 -> v8:
   - Removed duplicate sentence in patch1 commit description
   - Updated with proper types when calling geni_i2c_gpi_unmap() inside
     geni_i2c_gpi_multi_desc_unmap().

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - dma_buf and dma_addr for multi descriptor support is changed from
     static allocation to dynmic allocation.
   - In i2c_gpi_cb_result function, for multi descriptor case, instead of invoking
     complete for everry 8 messages completions, changed the logic to Invoke 'complete'
     for every I2C callback (for submitted I2C messages).
   - For I2C multi descriptor case, updated 'gi2c_gpi_xfer->dma_buf' and
     'gi2c_gpi_xfer->dma_addr' for unmappping in geni_i2c_gpi_multi_desc_unmap.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function and
     so avoided using external variables for DMA_PREP_INTERRUPT status.
   - Updated documentation removed for "struct geni_i2c_dev" as per the review comments.

v5 -> v6:
   - Instead of using bei_flag, moved the logic to use with DMA
     supported flags like DMA_PREP_INTERRUPT.
   - Additional parameter comments removed from geni_i2c_gpi_multi_desc_unmap
     function documentation.

v4 -> v5:
   -  BEI flag naming changed from flags to bei_flag.
   -  QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
      file, and Block event support is checked with bei_flag.
   -  Documentation added for "struct geni_i2c_dev".

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support is
    moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.
  - geni_i2c_gpi_multi_desc_xfer structure is added as a member of
    struct geni_i2c_dev.
  - Removed the changes of making I2C driver is dependent on GPI driver.

v2 -> v3:
  - Updated commit description
  - In I2C GENI driver, for i2c_gpi_cb_result moved the logic of
    "!is_tx_multi_xfer" to else part.
  - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
  - Changes of I2C GENI driver to depend on the GPI driver moved
    to patch3.
  - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
  - Added description for newly added changes in "qcom-gpi-dma.h" file.

v1 -> v2:
  - DT changes are reverted for adding dma channel size as a new arg of
    dma-cells property.
  - DT binding change reveted for dma channel size as a new arg of
    dma-cells property.
  - In GPI driver, reverted the changes to parse the channel TRE size
    from device tree.
  - Made the changes in QCOM I2C geni driver to support the BEI
    functionality with the existing TRE size of 64.
  - Made changes in QCOM I2C geni driver as per the review comments.
  - Fixed Kernel test robot reported compiltion issues.

Jyothi Kumar Seerapu (2):
  dmaengine: qcom: gpi: Add GPI Block event interrupt support
  i2c: i2c-qcom-geni: Add Block event interrupt support

 drivers/dma/qcom/gpi.c             |  11 +-
 drivers/i2c/busses/i2c-qcom-geni.c | 248 ++++++++++++++++++++++++++---
 2 files changed, 233 insertions(+), 26 deletions(-)

-- 
2.34.1


