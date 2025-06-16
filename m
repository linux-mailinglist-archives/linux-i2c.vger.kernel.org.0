Return-Path: <linux-i2c+bounces-11483-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE443ADAB47
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01FB4188B09D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C3C273809;
	Mon, 16 Jun 2025 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JqGXJXDp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69F82737EA;
	Mon, 16 Jun 2025 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064278; cv=none; b=AQvOUaAz1n9hk8Hb/4QYuvxB6Ox16Dq4aOk/V+D5qhFsCBcwuBow7hVM1eoB8lKEnfYhGQieCa5HsjIHnUITK4VFrbjdtTEhGmM/TbDkg0wBw2YVIBbsw4gkNNF/8TffkKHV8yNMUw2sFrGE2jkdWHgjhG237/ZZAN3aF2q3Gpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064278; c=relaxed/simple;
	bh=QHPhf51rlg3p+1iduys7C5HxwyR91W08dTQkEuaw2pQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=soMxtfOuqAjZWiR4M4z58qQhhRb6M0aEaEcKvL37yBSqevKVBpGQfSwU5FVBhDlshtrUxCiY30qFlK04AMu8CI3XiywWor9Hvqxh3kTG4sLHoIyglzKTftcqvHc2gIDF4ou8uGIjKTlXB5gfQ9XZzQogn3/5bUSmUBW+q8hydf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JqGXJXDp; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8j90R007215;
	Mon, 16 Jun 2025 10:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	3WfFafoOzhwEP01k+lNZuQ235Lfi7VkaaDEXOrgCKhQ=; b=JqGXJXDpKHkbljGY
	WbS3vBo6YHZ9tEh7LnWT8B3i0RNkZsbPjq0iB55CgkclAE/qR4TJ+wfJmPw5Sfs0
	Ui3xcREFWJJEhR/pp91VcAwDRgW71z2ryKyLiEFigTk+vYX/zhiZzVxeXL9Z1laI
	emJtfQ8BwIg3jmFqnJnV0RjHN6c1eRs0cN7iw4AySvXwYG9tSQtjvEF+OQpNWE/8
	01HrOn5XxVijBaGV9xG3iD2nUR4GzDNRrUykORQQ2NjQJmu1R3oudcDgGYKDZ7z4
	T+Tl8h679DFn5PEFS+hRCxw80OUQUok71tMmnkqTyO+khcUjeOUuVEvDJKOfaYPm
	XjfiBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 479m1nv5fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:57:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id AA21840058;
	Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CD8E5D40BD;
	Mon, 16 Jun 2025 10:54:43 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:42 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 16 Jun 2025 10:53:54 +0200
Subject: [PATCH 1/3] i2c: stm32: fix the device used for the DMA map
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
In-Reply-To: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
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
X-Mailer: b4 0.15-dev-c25d1
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_03,2025-06-13_01,2025-03-28_01

If the DMA mapping failed, it produced an error log with the wrong
device name:
"stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
Fix this issue by replacing the dev with the I2C dev.

Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 drivers/i2c/busses/i2c-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
index 157c64e27d0b..5e0b31aed774 100644
--- a/drivers/i2c/busses/i2c-stm32.c
+++ b/drivers/i2c/busses/i2c-stm32.c
@@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
 	dma->dma_len = len;
 	chan_dev = dma->chan_using->device->dev;
 
-	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
+	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
 				      dma->dma_data_dir);
 	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
 		dev_err(dev, "DMA mapping failed\n");

-- 
2.43.0


