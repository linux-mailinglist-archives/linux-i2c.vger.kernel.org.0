Return-Path: <linux-i2c+bounces-1688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870F8513DF
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 13:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2FA62814E5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 12:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD1439FFE;
	Mon, 12 Feb 2024 12:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f+/ZWflg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4822B39FF4;
	Mon, 12 Feb 2024 12:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742598; cv=none; b=fe+eYoLLNzOzNVhXRMDetPLRsQKEBvfBLe9SoI0S0mfQjr+Q+PyyxsXeZ1SSiiQ3aZQAnldYKz95I1JMNMv4eq5mROfNdEaA52Oe/s3Zv2SZB2d32rECrSwJFmr4Bv6awd+CZSyA6ldJyHG7Gb8VoeuHnEwI+cvMb+tlysXCdpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742598; c=relaxed/simple;
	bh=9p5E96zf5IR+0tpk72pr6AkBD4FoN61FioMC3pGittw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xwo1Nvb4frMEVctBZNZyT7DKOM2QsmepZOMACDm51FbHsKuH3BMeFeVTjrlXYitMyj+XUAZmJPVpTBXjnfWnE4yBO/m1caWyIuN9PuGG+NewUGGwBznjpqPbcNiZQ2ZIYgoI5Q6GOO0hXt2PlGnEa8j+1xyoLUqH5/uxfALjNt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f+/ZWflg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41CCdT4o031368;
	Mon, 12 Feb 2024 12:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=/7OODqCnZf/xQWRMSTAdEF5idcQs0rPJNK7ydBjqvdQ=; b=f+
	/ZWflgoaXZtPG/5JiO4Phn6mIEXfOr94cnhe1Z2F1FnSE4bAdda/JQ1l7AMxcGZ5
	YtjuEozewaL190n7USSuS49IIwpowxQOXyTP8nBIhl3i6SlJ6p4IQnduLm5Gjcss
	GylqSAyVz4LyeSkfTajZ1/NAzy95JSRY7TmmI5vQgsr2vvtidmgHyGyF1rQY+xtF
	QEzHEhJb8PMk42lMEHeB2UB8NNSbgCTiSyWvwRqjTVxI4zWA5bDqzfqkM21GW1BM
	fAPwb8TG0F8xZZ9HJ7JceAKghBS2IqBfAVXf/xeGZS6HFXs74Y++kNmPgEy+K7/o
	Vgdis0Elb0C3iSxb8amA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62q2ucuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:56:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CCuVEb007036
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:56:31 GMT
Received: from [10.216.19.112] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 04:56:27 -0800
Message-ID: <9a546e00-bd22-4f1b-8eb1-b305b65560da@quicinc.com>
Date: Mon, 12 Feb 2024 18:26:23 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andi Shyti
	<andi.shyti@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vkoul@kernel.org>,
        <quic_bjorande@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <bryan.odonoghue@linaro.org>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
 <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com>
 <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
 <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AoP-En1krewEBs5jrETAw-VyHEbboCvT
X-Proofpoint-GUID: AoP-En1krewEBs5jrETAw-VyHEbboCvT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120098



On 2/8/2024 4:34 PM, Dmitry Baryshkov wrote:
> On Thu, 8 Feb 2024 at 12:02, Andi Shyti <andi.shyti@kernel.org> wrote:
>>
>> Hi Viken, Dmitry,
>>
>> On Fri, Feb 02, 2024 at 04:13:06PM +0530, Viken Dadhaniya wrote:
>>>
>>> On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
>>>> On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>>>>
>>>>> For i2c read operation in GSI mode, we are getting timeout
>>>>> due to malformed TRE basically incorrect TRE sequence
>>>>> in gpi(drivers/dma/qcom/gpi.c) driver.
>>>>>
>>>>> TRE stands for Transfer Ring Element - which is basically an element with
>>>>> size of 4 words. It contains all information like slave address,
>>>>> clk divider, dma address value data size etc).
>>>>>
>>>>> Mainly we have 3 TREs(Config, GO and DMA tre).
>>>>> - CONFIG TRE : consists of internal register configuration which is
>>>>>                  required before start of the transfer.
>>>>> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
>>>>> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>>>>>                  of the transfer.
>>>>>
>>>>> Driver calls GPI driver API to config each TRE depending on the protocol.
>>>>> If we see GPI driver, for RX operation we are configuring DMA tre and
>>>>> for TX operation we are configuring GO tre.
>>>>>
>>>>> For read operation tre sequence will be as below which is not aligned
>>>>> to hardware programming guide.
>>>>>
>>>>> - CONFIG tre
>>>>> - DMA tre
>>>>> - GO tre
>>>>>
>>>>> As per Qualcomm's internal Hardware Programming Guide, we should configure
>>>>> TREs in below sequence for any RX only transfer.
>>>>>
>>>>> - CONFIG tre
>>>>> - GO tre
>>>>> - DMA tre
>>>>>
>>>>> In summary, for RX only transfers, we are reordering DMA and GO TREs.
>>>>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
>>>>
>>>> This hasn't improved. You must describe what is the connection between
>>>> TRE types and the geni_i2c_gpi calls.
>>>> It is not obvious until somebody looks into the GPI DMA driver.
>>>>
>>>> Another point, for some reason you are still using just the patch
>>>> version in email subject. Please fix your setup so that the email
>>>> subject also includes the `[PATCH` part in the subject, which is there
>>>> by default.
>>>> Hint: git format-patch -1 -v4 will do that for you without a need to
>>>> correct anything afterwards.
>>>>
>>>
>>> At high level, let me explain the I2C to GPI driver flow in general.
>>>
>>> I2C driver calls GPI driver exposed functions which will prepare all the
>>> TREs as per programming guide and
>>> queues to the GPI DMA engine for execution. Upon completion of the Transfer,
>>> GPI DMA engine will generate an
>>> interrupt which will be handled inside the GPIO driver. Then GPI driver will
>>> call DMA framework registered callback by i2c.
>>> Upon receiving this callback, i2c driver marks the transfer completion.
>>
>> Any news about this? Dmitry do you still have concerns? We can
>> add this last description in the commit log, as well, if needed.
> 
> I was looking for pretty simple addition to the commit message, that
> links existing commit message to the actual source code change: that
> geni_i2c_gpi(I2C_WRITE) results in the GO TRE and
> geni_i2c_gpi(I2C_READ) generates DMA TRE. But I haven't seen anything
> sensible up to now. So far we have a nice description of required
> programming sequence in terms of CONFIG, GO, DMA TREs and then source
> code change that seems completely unrelated to the commit message,
> unless one actually goes deep into the corresponding GPI DMA driver.
> 

Updated commit log in V4


