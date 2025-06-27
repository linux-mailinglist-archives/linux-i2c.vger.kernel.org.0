Return-Path: <linux-i2c+bounces-11638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 399BFAEB40A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 12:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48DDA168DCF
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 10:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8650298243;
	Fri, 27 Jun 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="TUnaDvBd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6291DF980;
	Fri, 27 Jun 2025 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019337; cv=none; b=s9gOhZfgXqg1p/50KUqc4EODFG67eEBozDeTCt/Fj/5M24CZLXaBKV7gtUMuLwt93YCvfnA+6ZxesyKF/fPcC31IvU0eUhfmsG+C43lfTdqISEyV38FPiI4Pb8aO7cYVniJ0TGe7hiHMmQC8TCx10o3aLzUbDd9eI08o8ruhttI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019337; c=relaxed/simple;
	bh=kWqlKO5PmJMlK30Hu/nszvcABWtwmUQaTNNfj6O7HXU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=BFiSl1UIxp9+pOcvEEcJhPUJQv9gFQhVwRX7JU2+PSPzs+DzME8fqQDV3bZDixPy4TijAa2M9JGeHvslFWU6+A2zF9AjkP01Qg01ADrIlnSmYvHwxy+ke+oFMuiu0Y0TPAV1yYjKgsIeapFu8Kc7A5dW05jbRbC6Gre/KyCoUik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=TUnaDvBd; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R8PVHO022240;
	Fri, 27 Jun 2025 12:15:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=mVBgEXGskFGd1kZHXy9461
	TXv3u/WKz4hFmABhGynE8=; b=TUnaDvBduVytL1jo7TCMT9l4v5t7cPtAhaslCI
	eeZG5KnvL8984S665vwrxF/h4FgS4nXZxGIK9p6whXltR+1tDJ7Jmcl1Ti59j4NK
	vGqwCJK64JivfCHSFmbBgzPdxilY07HaDRQrJjzs89Q4xJRp/LkSzeDZJrQYWRFJ
	IxP5ewno/C/wLfzG0JkMXJalE2neRoa6xAvnfm2rsa/aC3dGU+pMbEn7VhFsA3lj
	Uq+VN7TNk7brpGOrICzNwHFseHDg5eZmV8A+R7fFP1CWYExducr04tVQpbuLGIUx
	Fm6p7wNA9o0qdtgKICgU64mQYM6/fjktlUGIn0lB8Wcs8jHg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dj5p3xqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 12:15:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 00FB840045;
	Fri, 27 Jun 2025 12:13:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 75734B65697;
	Fri, 27 Jun 2025 12:12:57 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 12:12:57 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v2 0/3] Fix STM32 I2C dma operations
Date: Fri, 27 Jun 2025 12:12:55 +0200
Message-ID: <20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAKduXmgC/1XMQQ6CMBCF4auQWVvSFqYEV9zDsEAYZBZQ0qlEQ
 7i7FVcu/5e8bwehwCRwzXYItLGwX1LYSwb91C0PUjykBqstarSVYtur5yoxUDcrwrurUZsC6w7
 SZQ008uvkbm3qiSX68D71zXzXH+SM+4c2o7Qq7VAMWFQlOWxGL5JLzHs/Q3scxwcajC4EqgAAA
 A==
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
X-Mailer: b4 0.15-dev-07fe9
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_03,2025-06-26_05,2025-03-28_01

This patch series aims to fix some issues inside the driver's DMA
handling.
It also uses newer I2C DMA API.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v2:
- Fix the dev used in dma_unmap also in the error path of
  `stm32_i2c_prep_dma_xfer`
- Add a dma_unmap_single also in the ITs error handler
- Add Alain Volmat's "Acked-by" on patch 3
- Link to v1: https://lore.kernel.org/r/20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com

---
Clément Le Goffic (3):
      i2c: stm32: fix the device used for the DMA map
      i2c: stm32f7: unmap DMA mapped buffer
      i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs

 drivers/i2c/busses/i2c-stm32.c   |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c | 42 +++++++++++++++++++++++++++++-----------
 2 files changed, 33 insertions(+), 13 deletions(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


