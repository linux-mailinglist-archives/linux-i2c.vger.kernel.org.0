Return-Path: <linux-i2c+bounces-11825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5C6AF8C85
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 10:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236B680416B
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 08:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310C22BEFFC;
	Fri,  4 Jul 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="QmrquhH1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D8D2BEC23;
	Fri,  4 Jul 2025 08:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618525; cv=none; b=IqSyQg32iZ0Pux1WxXZwyYkt9hM5d1Z6ozxR/nsxO+Y1dLUOqKjwMU98O+wkAA9+ixP9Hyzq9q3geEUqpfH8Pl0PvsIQUXUk7FFfLmjPBFCLH8VLDDvEVRSK+kiy4DQ+/mSla9oxTJz845CVQOuumxoufiBRtVi2SCJtr4A+LKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618525; c=relaxed/simple;
	bh=4qUbDwkN9/q0s1oaxoJhdRztUt05RT4Ty+UDzVW0BfE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=QqqjL8MCvtL87EUIUy6lwoXQ2mHY5HycDEjZCfIqA3LR8W0Gs9qDRZYLnpRov3hAThI8qrLVEsypLb3iOlPfrNP5+IhX0N3SU2X4mKhs6Dd+bxVEjTr3zZEqO00sfwbgZx3H5hH6721OlgyzXdQB/DFJwZkXmMyIfbjwKksWehA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=QmrquhH1; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647ZtTI015069;
	Fri, 4 Jul 2025 10:41:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=SG1Uf3WWZKbhZvXehI/zWs
	a4U/GR4wtbqsoht1Gvc/s=; b=QmrquhH140RmkusdKGMoRkObmTKMLtwuLmEXU5
	wmSkUun+22sj1wVLDVEVRsnGu4tBT+iYggKLdQrW3tT3iB55Cndsx+sCwcbkLHSw
	qY/e4APbVTFRDu2IfqWzeL/Qk7Fz8guiua0XZUmiTySeKBPhTq0CTQOsyZ3+KqQU
	aHQomihSjdRo/ZmnxcxGvuxiXDOnmLRn5J06upV1tWs8JjSagMR4GIqmLs+hhKEO
	mJfUOjGFuzyRPluIjYqMaiw3Wi/sirTIirPmVe7jALRVTVSwgYr9bc4wNsrUQu4+
	5rpV+3eFvlRBQZuFsWd7EsnrGg2xbjoZVshkJtF76eLiEElg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6kx8p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Jul 2025 10:41:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 98DAB4004D;
	Fri,  4 Jul 2025 10:40:31 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8586A48213E;
	Fri,  4 Jul 2025 10:39:36 +0200 (CEST)
Received: from localhost (10.48.86.185) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 10:39:36 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Subject: [PATCH v4 0/3] Fix STM32 I2C dma operations
Date: Fri, 4 Jul 2025 10:39:13 +0200
Message-ID: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADGTZ2gC/2XOTQ6DIBCG4as0rIuBGUDtqvdoukCklYU/AUvaG
 O9etBu1y2+S581MJFjvbCCX00S8jS64vktDnE/ENLp7WurqtAkwkExCTh0Y+hrC6K1uqZWVKiX
 jKEtNEhm8fbj3mrvd025cGHv/WeuRL9dfSHG1D0VOGRVQYy0xF1bJ66MPIQtjZvqWLKkIG378I
 0LiheFCAoqC1+af44YjO3BMPNeAugKlCtR7Ps/zF4+/vAAoAQAA
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
X-Mailer: b4 0.15-dev-7616d
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01

This patch series aims to fix some issues inside the driver's DMA
handling.
It also uses newer I2C DMA API.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
Changes in v4:
- Patch[1]: Remove all `chan_dev` variable occurrencies
- Patch[2]:
    - Refine commit message
    - Use the dma_callback to factorize the code
- Patch[3]: Refine commit message
- Link to v3: https://lore.kernel.org/r/20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com

Changes in v3:
- Add Alain Volmat's "Acked-by" on patch 1 and 2
- Link to v2: https://lore.kernel.org/r/20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com

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

 drivers/i2c/busses/i2c-stm32.c   |  8 +++---
 drivers/i2c/busses/i2c-stm32f7.c | 56 +++++++++++++++++++++-------------------
 2 files changed, 33 insertions(+), 31 deletions(-)
---
base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
change-id: 20250527-i2c-upstream-e5b69501359a

Best regards,
--  
Clément Le Goffic <clement.legoffic@foss.st.com>


