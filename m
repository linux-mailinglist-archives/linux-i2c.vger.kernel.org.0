Return-Path: <linux-i2c+bounces-12038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5158B11CD2
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 12:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D024B7AB058
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jul 2025 10:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C862E4271;
	Fri, 25 Jul 2025 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UFBbos72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2604914A4F9;
	Fri, 25 Jul 2025 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753440641; cv=none; b=nJO622a+Z2Cu0qwkCtEr2XxU2YZFNyGJwZbyNxyh010O65NZxaXa/0ipo0Aqo+t3X8XZmuOsB7aFbzc3mai3ODs8cXXN1D4Gx6+vWCcjfvLM7H2TGeh8KTdHGuXSx0UCiaViWrGw/+dQ/ta3Wikbe3Grmthx5fUdfvb0fQ8d1z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753440641; c=relaxed/simple;
	bh=KHd0GVyxgt29vK8MLf23RF3O3tfRk4C2VjJf/BKNwQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DoXSJ0NuM9OrE1DJZt6zXpoZxIzpTFz7pHyqlffo8363wvgafEUYoGZq2cGgqU+tF23oL+dmonZe90XDNqLDZLt3/RRl+cY2zuSSAqcrmkZSAMvtZBaUx/jlRKF3ZlpWHWG5I0LpAuglXGOuDkdL0T8tt2CAVcaZk16MZpfaPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UFBbos72; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9AOTN018948;
	Fri, 25 Jul 2025 10:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bh0hvMC1PjdJpImLiwjapwCuJypbziWRznl02GU6Ls=; b=UFBbos72VZCd7Rdr
	8TxZz9VkX3izCSl16/doF7Ve1n6NgEukoJShS5NxDiX4T/K0BEIAanHp4wixFMcJ
	YrYhLujDhRQw55WTiPLOR+68CQhb4SKmpPj0B7pf9w1wdwqAUQj1Ray+GrfY3kWS
	FSbuwWWJnw4lqS2Q/1+8w+Mqm6AJPA2N5ADDRBUzvF71n2J33A2lT4wIK01r8df8
	owdoua3+YCTx23/otjBL8PV+1yTvq42vWPwxVmvV39YSO6BIU0gTBKxzHqGdrj3a
	AEpUBc04tPp12vildKDGY2M+xV6NnO4NnB4jIlHPZHIMn02GKtrADSro9rcRhjra
	seYeuA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s1s5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 10:50:32 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56PAoVVF006564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jul 2025 10:50:31 GMT
Received: from [10.216.28.154] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 25 Jul
 2025 03:50:26 -0700
Message-ID: <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>
Date: Fri, 25 Jul 2025 16:20:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
To: Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
CC: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Viken Dadhaniya
	<quic_vdadhani@quicinc.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>,
        <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <quic_vtanuku@quicinc.com>
References: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
 <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
 <aICMDROkyjzBZFHo@vaman>
Content-Language: en-US
From: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
In-Reply-To: <aICMDROkyjzBZFHo@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P68p_Z1RsZcKhPtwQSyBMGeyR68FpidV
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68836178 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=La7-vtGrAMXfD6w410sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: P68p_Z1RsZcKhPtwQSyBMGeyR68FpidV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA5MSBTYWx0ZWRfX1z/I87JUNVzD
 5bwPy9cVP7Vgc1KxLEGFWi8y1zBiY12FviruEmjA9SvX5FqXPIZQbNGxr7zGW7RE0+2fYtiJpU1
 s2oQ19fuLNZ9GB/DBeAO9uduvck90Y/j42W89eU/465+CRc1+3ifhactqWo9EFgOFxZ9FCFeL+b
 XzgzRB3lJ1WMXU2yaEX+GCA7tGyV/fEw1LsJlvATUlsfL7b5AzdSfVUGlCKvkgP7C1Y1+MNi61I
 VRbv5c4ZLGCK5TeWOeUrjaUhIxjsP6SvZ5uRo890TECtRHH40E4sqqpAFel5FpN9VkGAO1WYKtF
 7ilsnUGu6XTdYRd5JEewcrxoLvbi+oc4Jcy65nvwGJhdfVHrT4z28W+/ePTLfALTQjPOmzV38sI
 b/WraTVyl05oDXU4RwpnM/7ECsKS3HQM+Dy4ZvlxJnUlNREB3ywzFkSeytD20lSp5Xrl21XD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250091



On 7/23/2025 12:45 PM, Vinod Koul wrote:
> On 22-07-25, 15:46, Dmitry Baryshkov wrote:
>> On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
>>> On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
>>>>> On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
> 
> [Folks, would be nice to trim replies]
> 
>>>>> Could you please confirm if can go with the similar approach of unmap the
>>>>> processed TREs based on a fixed threshold or constant value, instead of
>>>>> unmapping them all at once?
>>>>
>>>> I'd still say, that's a bad idea. Please stay within the boundaries of
>>>> the DMA API.
>>>>
>>> I agree with the approach you suggested—it's the GPI's responsibility to
>>> manage the available TREs.
>>>
>>> However, I'm curious whether can we set a dynamic watermark value perhaps
>>> half the available TREs) to trigger unmapping of processed TREs ? This would
>>> allow the software to prepare the next set of TREs while the hardware
>>> continues processing the remaining ones, enabling better parallelism and
>>> throughput.
>>
>> Let's land the simple implementation first, which can then be improved.
>> However I don't see any way to return 'above the watermark' from the DMA
>> controller. You might need to enhance the API.
> 
> Traditionally, we set the dma transfers for watermark level and we get a
> interrupt. So you might want to set the callback for watermark level
> and then do mapping/unmapping etc in the callback. This is typical model
> for dmaengines, we should follow that well
> 
> BR

Thanks Dmitry and Vinod, I will work on V7 patch for submitting the I2C 
messages until they fit and and unmap all processed messages together 
for now.

Regarding the watermark mechanism, looks GENI SE DMA supports watermark 
interrupts but it appears that GPI DMA doesn't have such provision of 
watermark.



