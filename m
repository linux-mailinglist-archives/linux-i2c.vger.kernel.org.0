Return-Path: <linux-i2c+bounces-11798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360EAF6B68
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 09:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD0E07AA612
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 07:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AE1299A80;
	Thu,  3 Jul 2025 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Uj1QAxdP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBC6298CDA;
	Thu,  3 Jul 2025 07:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527407; cv=none; b=nARzPsmZcx3YmXC1CbWJpy5c440/xD9AOqo6rbVZ2KRoCvHkF69ICR+5/V9xFP6GrpZyNpjCrfUlEFcYPh40DlE5F87vsKsXPvFccK4RcAtq1is357LlbkEU3B555Jgk+LpuhjhKOgsASf9R4JuJztSzKBJCAFT1rwIPFXiBE4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527407; c=relaxed/simple;
	bh=zfp7MeUjLThzEqmoKcHvTQjkE2fAaEDgONJduzQdNnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BHcXEhIMjAP5uxU3JTq76ynTbJbhmFJweAQdaNDd56QIpO/vORosmxygm1em/VIPMZTc7HZ4Pbj3oN3EvNwHUHmMjv+el2sDh1sqBQZXkDPHybEALCntphcupEKFwqczg1VJuJNoT83+442lxVYU3MPIAQTbdSsGrRy5bLWkcIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Uj1QAxdP; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5636iKQV002403;
	Thu, 3 Jul 2025 09:23:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	npzxxQg3AAleq0Lybv60/mXXydV8H5IHVXqUHauWTxs=; b=Uj1QAxdPfx6LqXSh
	1+ryb8pe7ooyPtWVa7Z+iCLzfHWV92go8qbzCrCafplRgwUiZqCVBFK4pH5+Ifvt
	u+62KttT2B0xFNxEoDnMRW5bhqezQaYJLLxHsBP9XCO+2GH4wThfQuNe5TWfGuf2
	zI0aC3ls5dNIr+S9RCNLGu4S8EJSiuP1rz4LmSSyApYqyewv66QrhQTRPzFbUeU7
	I4s96SUsp8XocexpRUPm2ur2TZ2AKAS6gthIggspdBJPwPIlRFLbPJjv8ZgAvzXl
	zb0NCzKvoUKnbVibDymFj+qbXxUNatvAV1wU5wzXOeH5un+Fyi5bH2Q0/8dCS5DY
	Lm0dJA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47j7r6e53n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 09:23:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 3CFA24002D;
	Thu,  3 Jul 2025 09:21:43 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id ABD54AF01A6;
	Thu,  3 Jul 2025 09:20:27 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Jul
 2025 09:20:26 +0200
Message-ID: <44f4f1a4-0225-4fda-b17b-f3159e00851d@foss.st.com>
Date: Thu, 3 Jul 2025 09:20:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] i2c: stm32: fix the device used for the DMA map
To: Andi Shyti <andi.shyti@kernel.org>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat
	<alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
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
References: <20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com>
 <20250630-i2c-upstream-v3-1-7a23ab26683a@foss.st.com>
 <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <n4mx3xukr5zffajpwomuwp27fywmogm6nmv7hgkcwpghjaorwv@2mqmgg3u5far>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_02,2025-07-02_04,2025-03-28_01

Hi Andy,

On 7/2/25 18:57, Andi Shyti wrote:
> Hi Clement,
> 
> ...
> 
>> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>>   	dma->dma_len = len;
>>   	chan_dev = dma->chan_using->device->dev;
>>   
>> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
>> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>>   				      dma->dma_data_dir);
>>   	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
> 			      ^^^^^^^^
> 
> this one should be "dev" too, which renders the chan_dev variable
> unused.

Oh yes will send a v4

Best regards,
Clément


