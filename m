Return-Path: <linux-i2c+bounces-11856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC034AFB0EC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 12:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5A23AC26E
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 10:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632702957C0;
	Mon,  7 Jul 2025 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="qa/jqMjN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647D12951D5;
	Mon,  7 Jul 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883311; cv=none; b=cYPJZqLbP/pwYdIT+6Z24W/by6fWL6mfkpjPx6HR9SSM/AD/zWqMi2l+wZ9+9gSzZoqXB9NhpUgbt1zLsUXtGy6UOledKcUQbWl2fpWkoFw0fvv0BGyyigv0+BwnyTugWtnaZAEvx0nCWzIBCgFNoIvlnOMd6plt8JpzdiL5JQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883311; c=relaxed/simple;
	bh=TY+GufCIhj+ESoRt9HbVyO0sazKQmatr0VcMVgxJc48=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEGIRx2C8/iYz0TZkO9JccHkoLbhbnulzyX/f5O9SInaFcaSx+F35Jwsf7+xGynfj5nGPIBhOe/p6VH2tj6k+JYOtRrWRVI1rNUyam+bGtu0JpDRudfSOFzD1Eka0ejODiA3s1aSFEq0XTWTXu3yByMsvsTWlQ6xYlZVnIZhJfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=qa/jqMjN; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676FZb1022788;
	Mon, 7 Jul 2025 12:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	M+uhJcJDTeJCAUeixIicqUqHNPuuMmXwRPR3UP1fAmM=; b=qa/jqMjNzLnoNdla
	J8gS5RL+QKKO2XkLCjN1Dd1OFZalOvLdthzFGzbzKNCrkE5b+Ck8ShWM9wT3Hcgk
	fyKnJggAL2QWHo/tQpb4DWqE+1O6KxhnJZJPllEqH/KtQ54t6G7qdb3HinT2xvYK
	7cm/3L2Dhe84flz9gvspRWEVXDcz5AJLAVa4it5nqaU1zsjuk9FoC+WN47Pzt8H/
	q76kIXGyHHPxiBYBSbCQvnl2aXetkDNUnMcp/K6iqGshBxLlfgAMIZxxEP1fWexI
	rTOlSIEGxIUVt1DhjqJLUUbVPbjejAuyPa+egSUHsCKJVyHQGleIjiG5qTqBXGr9
	4dKz0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfm84re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 12:14:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E636440056;
	Mon,  7 Jul 2025 12:13:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C7BEAC4AF2;
	Mon,  7 Jul 2025 12:12:18 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 12:12:17 +0200
Date: Mon, 7 Jul 2025 12:12:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v4 0/3] Fix STM32 I2C dma operations
Message-ID: <20250707101211.GA984919@gnbcxd0016.gnb.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01

Hi Clément,

On Fri, Jul 04, 2025 at 10:39:13AM +0200, Clément Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v4:
> - Patch[1]: Remove all `chan_dev` variable occurrencies
> - Patch[2]:
>     - Refine commit message
>     - Use the dma_callback to factorize the code
> - Patch[3]: Refine commit message
> - Link to v3: https://lore.kernel.org/r/20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com
> 
> Changes in v3:
> - Add Alain Volmat's "Acked-by" on patch 1 and 2
> - Link to v2: https://lore.kernel.org/r/20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com
> 
> Changes in v2:
> - Fix the dev used in dma_unmap also in the error path of
>   `stm32_i2c_prep_dma_xfer`
> - Add a dma_unmap_single also in the ITs error handler
> - Add Alain Volmat's "Acked-by" on patch 3
> - Link to v1: https://lore.kernel.org/r/20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com
> 
> ---
> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
> 
>  drivers/i2c/busses/i2c-stm32.c   |  8 +++---
>  drivers/i2c/busses/i2c-stm32f7.c | 56 +++++++++++++++++++++-------------------
>  2 files changed, 33 insertions(+), 31 deletions(-)
> ---

Thanks for this new version of the serie.
This all looks good to me. My Acked-by are already set since v3 so
nothing more from me.

Regards,
Alain

> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250527-i2c-upstream-e5b69501359a
> 
> Best regards,
> --  
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 

