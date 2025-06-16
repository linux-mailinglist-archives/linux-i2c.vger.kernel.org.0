Return-Path: <linux-i2c+bounces-11482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC710ADAB43
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 10:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31FB7188AE50
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 08:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCB2272E6D;
	Mon, 16 Jun 2025 08:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RMUr56cG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD4626D4E7;
	Mon, 16 Jun 2025 08:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064276; cv=none; b=b5afen2SB0OpIBuq1AzVsclWu9nNykbgNbNQCiD+op5HH3d1gVF8PsTLTaQJNnexRcGUUKOPCPx0D2mLkqkjkmJyUHqpktyylMyAz4x7QgDMRb9jL7F1i8ZfkYEDO4HA3qHM4C7cD+/f/kKUd0grCtfucDfVz1IHAqUNUIq+9MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064276; c=relaxed/simple;
	bh=5s8sDohCKEkle5cF00Pjoe6FoxImIgxI9Ykte4n/HfQ=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=pAzQM90dhP+KFY1u5V7RAuZ9ou61pjL/ICj9kTVVMiRaIsmK5+D4Xv8Gwwqbx3CnI5tCM0IzjVWLil0SMveXkZq2sWyUaAap7qw8pVAsMIiG+QWJz/wlL9UgGoxPnlYoCJk68NFbS9/rqvdwZzzcIbX/HnEpqL+PK0Rn7nWQ5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=RMUr56cG; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8nbMS018924;
	Mon, 16 Jun 2025 10:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hZLfO/aZyhMByPrSvo6tyt
	gTdrnVnO5xyKlmjUCAvKw=; b=RMUr56cGnt2/RKuJ4spaAqR0emvF93V4UccXgy
	LMZbSVE+1tjfHj1tM/nNO0xtDGv8ZNjsp5EWl/h7LRsAaEU+dQU7iGVWopOKSTTx
	SmMxOcsDq5+kooCeQHsQGojp3Ea2kzjQKhVnA+5rvfQ+j9qocvU2AcXgW5uJLqQJ
	ftcScyP45zUgIiwv3ZyFa+YreFS93Rbd8Af6sguAbUFc0A4765p1UKOM/z6KwyKq
	WUkjBpIvNRIpAjIrGZRlzYY4ilz+qNGXPX6OFYBBlKD3RNn+s3rM5g2GKUn1srO6
	C7DbbaN/1GPmPG33jvn4XYGy6AyXTbqXovPbFKJ4tgWp3G/Q==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4790e1yqwy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jun 2025 10:57:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 01A4740074;
	Mon, 16 Jun 2025 10:56:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 29F025D40BC;
	Mon, 16 Jun 2025 10:54:42 +0200 (CEST)
Received: from localhost (10.252.14.42) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 10:54:41 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH 0/3] Fix STM32 I2C dma operations
Date: Mon, 16 Jun 2025 10:53:53 +0200
Message-ID: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKLbT2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUyNz3UyjZN3SguKSotTEXN1U0yQzS1MDQ2NTy0QloJaCotS0zAqwcdG
 xtbUABnEo6l4AAAA=
X-Change-ID: 20250527-i2c-upstream-e5b69501359a
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

This patch series aims to fix some issues inside the driver's DMA
handling.
It also uses newer I2C DMA API.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Clément Le Goffic (3):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

 drivers/i2c/busses/i2c-stm32.c   |  2 +-
 drivers/i2c/busses/i2c-stm32f7.c | 40 +++++++++++++++++++++++++++++-----------
 2 files changed, 30 insertions(+), 12 deletions(-)
---
base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
-- 
Clément Le Goffic <clement.legoffic@foss.st.com>


