Return-Path: <linux-i2c+bounces-13158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9FDB9F04D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 13:54:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 967A54E3107
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 11:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFA42FBE1A;
	Thu, 25 Sep 2025 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrgsvBkZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1F42FD1B8
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 11:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758801269; cv=none; b=R3s5JykHpidcDCw0fPIVln3xbnrt6jU/FZJTMDNJJdbi+RMNZq74ex9YGcseIKRdECwh1gAigyecf8OgaPUJhyl/mc9PeRRkavGVo58appg7KLUbMNF4k31W+ITrE6OJJYaICI8eJu3mkEa2+BqO1uNKPstZ/ougRkazSs+Duqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758801269; c=relaxed/simple;
	bh=9jsK4VDmm7LJ+YLkeBDIcPI7vSmCmKyAZvCHjfEz/yY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ndy363QnHAiDjnLRcjFf3lQkm0Pt5vQJ6wS3sY4QtarccfE6oVXjt8nddpkCGzjeARmR+Zw78iQa3giNDpqNZS/pB7zyqOkF+KxNY6P5EE9xpCgmCbgdWsEOxUsbzXvVmkU6BJ/mYWvn5nrOZVPCKiaaoE68zlQsTI5AC8DZ5t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrgsvBkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P9D108023762
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 11:54:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IcQRAOQdZqK
	M5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=; b=QrgsvBkZkXweqgEzKz8xzjo9lgS
	I4Cghic1LlrUsLqMIP8m7p7zPQ3MgN9s/WliDzuNgDOEZ0pj3ViDdMBXWMQK3dwL
	FnVBHQ6qBhtw6K5ygFitmI0ljz72D1FGORKkrTLXRQsct7Nj11u8Ki/Y95SD6Xnt
	1tAuSqs9DqteamJvRCwJnzX1H0LVFGeJ85CGlKfiAPKrdsLTXl0V7kWPKfnKHP+v
	DP2BIR76fE1UUGpnFXhlYtdc6m1tsXXFbOkwd2fofWXsUXvf5e2yrWqFPK4b8W17
	zXnvnOcS9lqOM+G0pcBtMSoINzruztAWlcyIbAyChKAlvR/98V5pBtAV4xA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0f020-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 11:54:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso12468565ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 04:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758801265; x=1759406065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcQRAOQdZqKM5AAtXRvgWEwEH/H9DHPEDvxp2DSgWr0=;
        b=WhY8Q2WXM/bP0pX39LwfE5cHkhmryWCdU1G43fR7sS5VWp8VTqfQ2pQaaJ/K75ABHr
         RIRYlJWD+E3PiY4Z+Ng+1Fo7Ib+UxiaLv+opGRDWEtI5uDnH0nDNRmz2VSBMrUVGG1Wq
         /cnkU2GDFEyc7bbj5f3XabD9zpsqQayQOhi5yF1BYrcpGLVpTTvndUshSE/X5idzjKCt
         0l7BxORcUsJVNghEY0X8hyh4iLLZvr3ezD5t8BrUSikI5EnZRA3u/jranWH1AGDQ0zrj
         5kkzJGwM+pECvSBklQqaZV96LVbWpd8HdUZt/VCzsyyXuzKwHTdPb0pf5MUp6JvtBvns
         XrOg==
X-Forwarded-Encrypted: i=1; AJvYcCURakojEdvjfbybB4GEaHPY0sbtNmW3OqMUlRI+aBI8xX7E/2fSbcRNXIJUk2VYWFXlTyyAFMsC0jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLcL0a8w5isMhmcA5aXDX6uKraW3CD3Dy4+tUsd/tPItjjZdcJ
	6zFSS7CEYK9Cn+vB33Cik7o402oG3iQEhgD4DxSDxh5uBQgXiXzGhRkGkuxicaMk02h9c4yr/3o
	QQQM8Ls7ayH2f+vVI70lhPHgo33TXddtHlDbx0cTWdo7i/UgV5YAm7SJaBhRoluQ=
X-Gm-Gg: ASbGncv1nvPTb0Ch41Iuojjt2MlKwQdmpN6dIfmdPN/gIKKR+oCIZscXU4zfClLyzEw
	NHUbRMMY3DMqIcUpp5IZtALyf6CPilFt1RCJKz9h3gnrcUJVxWdIrHn9EHNDnshw6BDCeoQ0HoI
	QdHV01dxWo9HThue3jWVCcLCkTsEnoHTVFeFBl5PlyMm+L35IP8RpmP1BTbycDqdeDWmzHVr0ME
	vnNj9Pv2nMhQfTrwUzT68kJZhLLwkBy90MvuQA5EkRtvrzyReWMCROX9Ony3qJPt7UrPzC9IcIR
	Txg08m82TLeIiWWDio1vgj9hwb2rS9aC0Tod+b6f4gLnw2i7s1fogLRToXnazAeJvMAR3RaOOHE
	=
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id d9443c01a7336-27ed4a76e00mr32337945ad.37.1758801265285;
        Thu, 25 Sep 2025 04:54:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9ckvMkGt+IFhS7y1WdXrjnERoOor8+C8TXNTMEGz1eO6XtWc6VahcrWBEIiWDA6gEc4+jIw==
X-Received: by 2002:a17:903:3884:b0:274:3e52:4d2d with SMTP id d9443c01a7336-27ed4a76e00mr32337705ad.37.1758801264692;
        Thu, 25 Sep 2025 04:54:24 -0700 (PDT)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69bb502sm22087935ad.118.2025.09.25.04.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 04:54:24 -0700 (PDT)
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
Subject: [PATCH v7 RESEND 1/2] dmaengine: qcom: gpi: Add GPI Block event interrupt support
Date: Thu, 25 Sep 2025 17:24:11 +0530
Message-Id: <20250925115412.2843659-2-jyothi.seerapu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
References: <20250925115412.2843659-1-jyothi.seerapu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d52d72 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=hwQltXbWhlPaccoBuB4A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: fjOn7Sy3NolfZJ1AH1WEkyGTVSI6rVs6
X-Proofpoint-ORIG-GUID: fjOn7Sy3NolfZJ1AH1WEkyGTVSI6rVs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX+0mE+TUOUCta
 FYas014NUyyzVCjHX/EfTwetxuSK/rdbiwcv0Az1mnZrepPk5LS1+Ey5ZLEUdIX3SuyS5BiBY2w
 6HXSCAjOPrF6+zKZUHY9fuCxx0PdXEyF9KTV3uEUyRmmSBzYN8Bph/dMNZTZ+11GkOsgdNikYM/
 tdx8HTyUOmqSwq4xCg38yQfX35RnTmxvmBoLEZ9bg90c2QejY3C2Tz+4t5RCi6tWMGeaFos8xa+
 zOre6Qj0tod887LVAYwn0mnLsJbT5GJzU8TXpZh/ZHcOhyoPU4oQeoovAjEtgfSHTT8yLE3IjKP
 OegwgyY5RtiigR57inUn2wXAE3HRYK5h4NYa9K0tZwSwa9pKE8zPfrD4SPX6F/kRKVKvz5+zGcV
 25AdTGjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>

GSI hardware generates an interrupt for each transfer completion.
For multiple messages within a single transfer, this results in
N interrupts for N messages, leading to significant software
interrupt latency.

To mitigate this latency, utilize Block Event Interrupt (BEI) mechanism.
Enabling BEI instructs the GSI hardware to prevent interrupt generation
and BEI is disabled when an interrupt is necessary.

Large I2C transfer can be divided into chunks of messages internally.
Interrupts are not expected for the messages for which BEI bit set,
only the last message triggers an interrupt, indicating the completion of
N messages. This BEI mechanism enhances overall transfer efficiency.

Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
---

v7 -> v8:
   - Removed duplicate sentence in commit description

v6 -> v7:
   - The design has been modified to configure BEI for interrupt
     generation either:
     After the last I2C message, if sufficient TREs are available, or
     After a specific I2C message, when no further TREs are available.
   - In the GPI driver, passed the flags argumnetr to the gpi_create_i2c_tre function
     and so avoided using external variables for DMA_PREP_INTERRUPT status.

v5 ->v6:
  - For updating the block event interrupt bit, instead of relying on
    bei_flag, decision check is moved with DMA_PREP_INTERRUPT flag.

v4 -> v5:
  - BEI flag naming changed from flags to bei_flag.
  - QCOM_GPI_BLOCK_EVENT_IRQ macro is removed from qcom-gpi-dma.h
    file, and Block event interrupt support is checked with bei_flag.

v3 -> v4:
  - API's added for Block event interrupt with multi descriptor support for
    I2C is moved from qcom-gpi-dma.h file to I2C geni qcom driver file.
  - gpi_multi_xfer_timeout_handler function is moved from GPI driver to
    I2C driver.

v2-> v3:
   - Renamed gpi_multi_desc_process to gpi_multi_xfer_timeout_handler
   - MIN_NUM_OF_MSGS_MULTI_DESC changed from 4 to 2
   - Added documentation for newly added changes in "qcom-gpi-dma.h" file
   - Updated commit description.

v1 -> v2:
   - Changed dma_addr type from array of pointers to array.
   - To support BEI functionality with the TRE size of 64 defined in GPI driver,
     updated QCOM_GPI_MAX_NUM_MSGS to 16 and NUM_MSGS_PER_IRQ to 4.

 drivers/dma/qcom/gpi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
index 8e87738086b2..66bfea1f156d 100644
--- a/drivers/dma/qcom/gpi.c
+++ b/drivers/dma/qcom/gpi.c
@@ -1619,7 +1619,8 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
 }
 
 static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
-			      struct scatterlist *sgl, enum dma_transfer_direction direction)
+			      struct scatterlist *sgl, enum dma_transfer_direction direction,
+			      unsigned long flags)
 {
 	struct gpi_i2c_config *i2c = chan->config;
 	struct device *dev = chan->gpii->gpi_dev->dev;
@@ -1684,6 +1685,9 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
 
 		tre->dword[3] = u32_encode_bits(TRE_TYPE_DMA, TRE_FLAGS_TYPE);
 		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOT);
+
+		if (!(flags & DMA_PREP_INTERRUPT))
+			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_BEI);
 	}
 
 	for (i = 0; i < tre_idx; i++)
@@ -1827,6 +1831,9 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 		return NULL;
 	}
 
+	if (!(flags & DMA_PREP_INTERRUPT) && (nr - nr_tre < 2))
+		return NULL;
+
 	gpi_desc = kzalloc(sizeof(*gpi_desc), GFP_NOWAIT);
 	if (!gpi_desc)
 		return NULL;
@@ -1835,7 +1842,7 @@ gpi_prep_slave_sg(struct dma_chan *chan, struct scatterlist *sgl,
 	if (gchan->protocol == QCOM_GPI_SPI) {
 		i = gpi_create_spi_tre(gchan, gpi_desc, sgl, direction);
 	} else if (gchan->protocol == QCOM_GPI_I2C) {
-		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction);
+		i = gpi_create_i2c_tre(gchan, gpi_desc, sgl, direction, flags);
 	} else {
 		dev_err(dev, "invalid peripheral: %d\n", gchan->protocol);
 		kfree(gpi_desc);
-- 
2.34.1


