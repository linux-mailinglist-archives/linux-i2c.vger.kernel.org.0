Return-Path: <linux-i2c+bounces-11635-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53546AEB027
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 09:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFA007A324F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jun 2025 07:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A5B21ABDC;
	Fri, 27 Jun 2025 07:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="JciHfeKa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A463C2F;
	Fri, 27 Jun 2025 07:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009622; cv=none; b=M2L96mG9IxbtDvYfv2tOKtki0gKab1wwb9UaYu2LkbBqXV5vlUHpJ5mP/Pg2SxdC82w2Z5asL0QvOC706hQWQHbF61KZTS6Wyut3/9zqlnkDxOstPHUxwGU2fY12gxnOOlE6Zp1j+cgz+03EErIW4LFZFCKSsB/qpNl2RaZ/f3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009622; c=relaxed/simple;
	bh=qar+YM6XTszYLM/wb/kz1CEveLAhfKbgBVNFhbZ4MkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kog0f4WAvI/JABhU4mhukS0iUwfq43I+VRJN7gH1YB2bSOHCaRFW9SSbJGwrrAspB5kLoNU4TJWl326OQZKOZDbsiE6NBCXur6LkcRE0OR5qaVryfizazxWdN36y88kI+Da/GhfF9r7h76Oi3uko5Xt4LbrSXkEdWLQIwaNQX7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=JciHfeKa; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R2c6Rv030383;
	Fri, 27 Jun 2025 09:33:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	1Q285Yr3y+87stzQw+zewu692BZK8q52Hv1ctiichRc=; b=JciHfeKa47Iu6sv9
	VamsVMjg7X+3xY77tw1LBPC1uO0q239nBfbj9K2yYucT7DBEvknjB4ki34TlgIQM
	kT9l3BL9rSYIVPSOYQuuwFHPM8NLr0Sul81CP9YJTAxGEogTs5EQpBj/SeNjaoxn
	0uikTuHhBtYBklAU2vdyVdbr+IO3IxqUdINDgEtk1pxPdad87hoI9LFPtfSjBfwE
	uF4Yt94SE6OrzVJCx4Cn7OhQ/rcndL1sD1V79C0aCep5vlzfCb6dLLYyAsxutFaP
	W6aiOrLrzFTkaXNSUxw0RaatwVKHUpU21YKkwrxYPXwC/bd5b73z7Eag1onrHItW
	+GOw8A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47dm33tthg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 09:33:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 282D540044;
	Fri, 27 Jun 2025 09:31:50 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9DDC1BCF079;
	Fri, 27 Jun 2025 09:30:47 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 27 Jun
 2025 09:30:46 +0200
Message-ID: <9bb4ab7d-afe2-4508-a18e-12cb1485a5a0@foss.st.com>
Date: Fri, 27 Jun 2025 09:30:46 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i2c: stm32: fix the device used for the DMA map
To: Alain Volmat <alain.volmat@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
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
References: <20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com>
 <20250616-i2c-upstream-v1-1-42d3d5374e65@foss.st.com>
 <20250626083744.GA348766@gnbcxd0016.gnb.st.com>
 <20250626084356.GB348766@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <20250626084356.GB348766@gnbcxd0016.gnb.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_02,2025-06-26_05,2025-03-28_01

On 6/26/25 10:43, Alain Volmat wrote:
> Hi Clément,
> 
> Oups, I was too fast.
> 
> there might be another place to correct in the driver, dma_unmap_single
> within the error handling of the function stm32_i2c_prep_dma_xfer.
> 
>     err:
>              dma_unmap_single(chan_dev, dma->dma_buf, dma->dma_len,
>                               dma->dma_data_dir);
> 
> Could you also correct this one as well ?
> 
> Alain

Hi Alain,

Oh yes you're right, I'll send a v2

Best regard,
Clément
> 
> 
> On Thu, Jun 26, 2025 at 10:37:51AM +0200, Alain Volmat wrote:
>> Hi Clément,
>>
>> On Mon, Jun 16, 2025 at 10:53:54AM +0200, Clément Le Goffic wrote:
>>> If the DMA mapping failed, it produced an error log with the wrong
>>> device name:
>>> "stm32-dma3 40400000.dma-controller: rejecting DMA map of vmalloc memory"
>>> Fix this issue by replacing the dev with the I2C dev.
>>
>> Indeed, nice catch ! Thanks a lot !
>>
>>>
>>> Fixes: bb8822cbbc53 ("i2c: i2c-stm32: Add generic DMA API")
>>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>>> ---
>>>   drivers/i2c/busses/i2c-stm32.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/busses/i2c-stm32.c b/drivers/i2c/busses/i2c-stm32.c
>>> index 157c64e27d0b..5e0b31aed774 100644
>>> --- a/drivers/i2c/busses/i2c-stm32.c
>>> +++ b/drivers/i2c/busses/i2c-stm32.c
>>> @@ -118,7 +118,7 @@ int stm32_i2c_prep_dma_xfer(struct device *dev, struct stm32_i2c_dma *dma,
>>>   	dma->dma_len = len;
>>>   	chan_dev = dma->chan_using->device->dev;
>>>   
>>> -	dma->dma_buf = dma_map_single(chan_dev, buf, dma->dma_len,
>>> +	dma->dma_buf = dma_map_single(dev, buf, dma->dma_len,
>>>   				      dma->dma_data_dir);
>>>   	if (dma_mapping_error(chan_dev, dma->dma_buf)) {
>>>   		dev_err(dev, "DMA mapping failed\n");
>>>
>>> -- 
>>> 2.43.0
>>>
>>
>> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
>>
>> Regards,
>> Alain


