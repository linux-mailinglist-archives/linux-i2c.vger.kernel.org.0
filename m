Return-Path: <linux-i2c+bounces-11641-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85515AEB40C
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A05B165706
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC592989B1;
	Fri, 27 Jun 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="1QV1Q7/M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24A5294A06;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019337; cv=none; b=K2GSrSDDCfuHOes0NxcMMunCbvahxaxmojJfuJvbTbaOREWxBSZIGJqL1GATx/BD8zqfKhDBKqn4C+5B45mOL9HANbTtsNr4v3tWAGfklykFjTdM5GXslgYqhWkXLqP+PNchwnPdzrEgBdxqhc/BEMDDQvrpio5Z7BORAJfR4+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019337; c=relaxed/simple;
	bh=6bcsfkDld+5i8qdEkjN9TmIclqm030AIujgPI1zne5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rcBLdPoBsuvjYplhyHg1TATdO4uiVlFnnA268ZKKrCOq1N9uvSF4mgktuYJgE2DKcpa0zGgLcmDI8jvhx4Rr0IzW20O6DBZk/1yfUNi2vq/rNZhE6y7VpE+n8JEWm9vceYhIVzXVaUuqT0NqSRKUL23cM8g3DnDizqkXHxQZ9oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=1QV1Q7/M; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RA2wL1007309;
	Fri, 27 Jun 2025 12:15:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Q4s8pGA08nJ2ppMKYeSSJfjaUJqoOpavuQKbFXfOgfM=; b=1QV1Q7/Mfqca/ART
	QlwWh04EZZssmN5BsGA/NgUwiR2qnJl1ToxW5EUfQjqbyuOYHXPgZ0zjoFlBjSps
	izXY2MjSMJL8vd63v3HMNHHsIhD4qekaVRJn6cSI2SsIa8Udn/s9A2gJnQuIBSZi
	ggpRgV1rS1ouDm3EUoavv8Ui8DZrntJ9TKc2slgIKgYtUuNbkI+u5hmiD8DwpIpH
	zvUST++a/1Qu7qkbuUDCuFDrGHxWvUn41Fyeb9v6Va2pBeIqX/nuLcuPKDhCXEKP
	4DgC/Qa25oxcE75lyjZSz6eK3/IlthJcIqd5BQPEiNeiZzQfgZtZdLdabnCfBBZt
	sIPtMw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p3xqd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B398E40053;
	Fri, 27 Jun 2025 12:13:52 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 99C60B656AD;
	Fri, 27 Jun 2025 12:12:59 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:59 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 27 Jun 2025 12:12:58 +0200
Subject: [PATCH v2 3/3] i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250627-i2c-upstream-v2-3-8c14523481dc@foss.st.com>
References: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
In-Reply-To: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
To: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "M'boumba Cedric
 Madianga" <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-07fe9
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01

Use the i2c-core-base APIs to allocate a DMA safe buffer when needed.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Acked-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32f7.c | 36 +++++++++++++++++++++++++-----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 042386b4cabe..d06f0efdece3 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -742,9 +742,12 @@ static void stm32f7_i2c_dma_callback(void *arg)
 	struct stm32f7_i2c_dev *i2c_dev = (struct stm32f7_i2c_dev *)arg;
 	struct stm32_i2c_dma *dma = i2c_dev->dma;
 	struct device *dev = dma->chan_using->device->dev;
+	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 
 	stm32f7_i2c_disable_dma_req(i2c_dev);
 	dma_unmap_single(dev, dma->dma_buf, dma->dma_len, dma->dma_data_dir);
+	if (!f7_msg->smbus)
+		i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, true);
 	complete(&dma->dma_complete);
 }
 
@@ -880,6 +883,7 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 {
 	struct stm32f7_i2c_msg *f7_msg = &i2c_dev->f7_msg;
 	void __iomem *base = i2c_dev->base;
+	u8 *dma_buf;
 	u32 cr1, cr2;
 	int ret;
 
@@ -929,17 +933,23 @@ static void stm32f7_i2c_xfer_msg(struct stm32f7_i2c_dev *i2c_dev,
 
 	/* Configure DMA or enable RX/TX interrupt */
 	i2c_dev->use_dma = false;
-	if (i2c_dev->dma && f7_msg->count >= STM32F7_I2C_DMA_LEN_MIN
-	    && !i2c_dev->atomic) {
-		ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
-					      msg->flags & I2C_M_RD,
-					      f7_msg->count, f7_msg->buf,
-					      stm32f7_i2c_dma_callback,
-					      i2c_dev);
-		if (!ret)
-			i2c_dev->use_dma = true;
-		else
-			dev_warn(i2c_dev->dev, "can't use DMA\n");
+	if (i2c_dev->dma && !i2c_dev->atomic) {
+		dma_buf = i2c_get_dma_safe_msg_buf(msg, STM32F7_I2C_DMA_LEN_MIN);
+		if (dma_buf) {
+			f7_msg->buf = dma_buf;
+			ret = stm32_i2c_prep_dma_xfer(i2c_dev->dev, i2c_dev->dma,
+						      msg->flags & I2C_M_RD,
+						      f7_msg->count, f7_msg->buf,
+						      stm32f7_i2c_dma_callback,
+						      i2c_dev);
+			if (ret) {
+				dev_warn(i2c_dev->dev, "can't use DMA\n");
+				i2c_put_dma_safe_msg_buf(f7_msg->buf, msg, false);
+				f7_msg->buf = msg->buf;
+			} else {
+				i2c_dev->use_dma = true;
+			}
+		}
 	}
 
 	if (!i2c_dev->use_dma) {
@@ -1626,6 +1636,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 			dmaengine_terminate_async(dma->chan_using);
 			dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
 					 dma->dma_data_dir);
+			if (!f7_msg->smbus)
+				i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
 		}
 		f7_msg->result = -ENXIO;
 	}
@@ -1648,6 +1660,8 @@ static irqreturn_t stm32f7_i2c_isr_event_thread(int irq, void *data)
 				dmaengine_terminate_async(dma->chan_using);
 				dma_unmap_single(i2c_dev->dev, dma->dma_buf, dma->dma_len,
 						 dma->dma_data_dir);
+				if (!f7_msg->smbus)
+					i2c_put_dma_safe_msg_buf(f7_msg->buf, i2c_dev->msg, false);
 				f7_msg->result = -ETIMEDOUT;
 			}
 		}

-- 
2.43.0


