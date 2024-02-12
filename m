Return-Path: <linux-i2c+bounces-1689-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB888513E9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 13:58:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9A61F23980
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Feb 2024 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0CF39FFF;
	Mon, 12 Feb 2024 12:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W8TntPrm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48892744C;
	Mon, 12 Feb 2024 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707742730; cv=none; b=D4Vg5a0INebN9CWeL/AYPHyeqEm0iDVmCz6PjrDW3m4qr0EIT6WaqQJee6oMIVmvwjbHlCPAsl3SP0P7+riLbRWKnIhhtaycgBOz5VmR6g5r/3mQLAaXg1BsUyf9HVowUHnCVDuXCw9PFYPNLACfCkHyZlCi0A9HVXsj/FByV6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707742730; c=relaxed/simple;
	bh=pYNyqs5JhrijHH7GEN/GE3u0x3G5ej9RdQ/Q52ZR0Pc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JdP3Bu386i12mUq3+x2CxQ9PhbWmDR4dQuHGAiKqTvz+H8WGMcS5x5eSoxRAh7FWqz0ZZvKTGCsQJ9YPkCTbEMvAFO1KCfhyrkWVSpPc89Jd5/DRr58DHPzk2nJDNyj28gNgJReqWw+py0aZ4uroyqA3pg58aemxTXMLwqhVCBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W8TntPrm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41C8vstp019592;
	Mon, 12 Feb 2024 12:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ef9e66duhbr8Dq0ZRnZogO/A+q6AAbIQ7yNgU3prpF8=; b=W8
	TntPrm9R70QuIsDOuh8bPjmiaKbmWcPC0g97s/qyWrAH7lqk9NNEo90Jyw1NbMMN
	DOyoWzQK++fxmwFhB5qdwsi721QUERtuKjH43gkNrIBkd5ytlKlnBbS5yRof1Pu4
	rW7/MOYLNO37OkJTmes9qHWUBgBtrV1+rIo1qxqovWCfSe9Ui9MunqeWlOJ3iKU0
	3dmylLiEqTXyKaomgFRj/3ld2W7TEHtH0UA45p2pkZzpF6i8Xngx4rsEltIl8nuZ
	Zz5Tih7Ogr7La0fdtoUJvjj90/0+srOOnbSp8uIMVs3LbkDBjeNKxZd8hFmbq610
	1yJFlSI3yiSGKi8u3LIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w62m0kfx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:58:44 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41CCwhvH005523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Feb 2024 12:58:43 GMT
Received: from [10.216.19.112] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 12 Feb
 2024 04:58:39 -0800
Message-ID: <79ce408a-c281-4d22-bc52-1f4cad29d49d@quicinc.com>
Date: Mon, 12 Feb 2024 18:28:36 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V3] i2c: i2c-qcom-geni: Correct I2C TRE sequence
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <andersson@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vkoul@kernel.org>, <quic_bjorande@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <bryan.odonoghue@linaro.org>,
        <quic_msavaliy@quicinc.com>, <quic_vtanuku@quicinc.com>
References: <20240201101323.13676-1-quic_vdadhani@quicinc.com>
 <CAA8EJpqQtHDRK2pex+5F-fMRTosJuFCx59e89MWhnie1O3dHKA@mail.gmail.com>
 <60b5e755-352b-476d-8c6e-2170594ae80d@quicinc.com>
 <uswznu3h53gcefpdc4vxozz32ecdcjvzmr7admwc4h54o27bfy@qqoevrl3dcyt>
 <CAA8EJpqzdp4xYSp+JCExP+Oeu9KhLpsXNUbDxfZ0g+C07xR6dg@mail.gmail.com>
 <cvzyvgb6vahlmrhaijsuyaosdl2p4q5cxhipmu4tujnkpjlbpm@6yu3sbpqha4m>
 <aa7a28a7-59c6-4783-a6de-9a46721a8bf6@linaro.org>
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <aa7a28a7-59c6-4783-a6de-9a46721a8bf6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZVGGbQCIK91_ydmqhKHoF3H7Zas4QkQG
X-Proofpoint-GUID: ZVGGbQCIK91_ydmqhKHoF3H7Zas4QkQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-12_09,2024-02-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402120099



On 2/9/2024 8:11 PM, Konrad Dybcio wrote:
> On 8.02.2024 12:59, Andi Shyti wrote:
>> Hi Dmitry,
>>
>> On Thu, Feb 08, 2024 at 01:04:14PM +0200, Dmitry Baryshkov wrote:
>>> On Thu, 8 Feb 2024 at 12:02, Andi Shyti <andi.shyti@kernel.org> wrote:
>>>>
>>>> Hi Viken, Dmitry,
>>>>
>>>> On Fri, Feb 02, 2024 at 04:13:06PM +0530, Viken Dadhaniya wrote:
>>>>>
>>>>> On 2/1/2024 5:24 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 1 Feb 2024 at 12:13, Viken Dadhaniya <quic_vdadhani@quicinc.com> wrote:
>>>>>>>
>>>>>>> For i2c read operation in GSI mode, we are getting timeout
>>>>>>> due to malformed TRE basically incorrect TRE sequence
>>>>>>> in gpi(drivers/dma/qcom/gpi.c) driver.
>>>>>>>
>>>>>>> TRE stands for Transfer Ring Element - which is basically an element with
>>>>>>> size of 4 words. It contains all information like slave address,
>>>>>>> clk divider, dma address value data size etc).
>>>>>>>
>>>>>>> Mainly we have 3 TREs(Config, GO and DMA tre).
>>>>>>> - CONFIG TRE : consists of internal register configuration which is
>>>>>>>                  required before start of the transfer.
>>>>>>> - DMA TRE :    contains DDR/Memory address, called as DMA descriptor.
>>>>>>> - GO TRE :     contains Transfer directions, slave ID, Delay flags, Length
>>>>>>>                  of the transfer.
>>>>>>>
>>>>>>> Driver calls GPI driver API to config each TRE depending on the protocol.
>>>>>>> If we see GPI driver, for RX operation we are configuring DMA tre and
>>>>>>> for TX operation we are configuring GO tre.
>>>>>>>
>>>>>>> For read operation tre sequence will be as below which is not aligned
>>>>>>> to hardware programming guide.
>>>>>>>
>>>>>>> - CONFIG tre
>>>>>>> - DMA tre
>>>>>>> - GO tre
>>>>>>>
>>>>>>> As per Qualcomm's internal Hardware Programming Guide, we should configure
>>>>>>> TREs in below sequence for any RX only transfer.
>>>>>>>
>>>>>>> - CONFIG tre
>>>>>>> - GO tre
>>>>>>> - DMA tre
>>>>>>>
>>>>>>> In summary, for RX only transfers, we are reordering DMA and GO TREs.
>>>>>>> Tested covering i2c read/write transfer on QCM6490 RB3 board.
>>>>>>
>>>>>> This hasn't improved. You must describe what is the connection between
>>>>>> TRE types and the geni_i2c_gpi calls.
>>>>>> It is not obvious until somebody looks into the GPI DMA driver.
>>>>>>
>>>>>> Another point, for some reason you are still using just the patch
>>>>>> version in email subject. Please fix your setup so that the email
>>>>>> subject also includes the `[PATCH` part in the subject, which is there
>>>>>> by default.
>>>>>> Hint: git format-patch -1 -v4 will do that for you without a need to
>>>>>> correct anything afterwards.
>>>>>>
>>>>>
>>>>> At high level, let me explain the I2C to GPI driver flow in general.
>>>>>
>>>>> I2C driver calls GPI driver exposed functions which will prepare all the
>>>>> TREs as per programming guide and
>>>>> queues to the GPI DMA engine for execution. Upon completion of the Transfer,
>>>>> GPI DMA engine will generate an
>>>>> interrupt which will be handled inside the GPIO driver. Then GPI driver will
>>>>> call DMA framework registered callback by i2c.
>>>>> Upon receiving this callback, i2c driver marks the transfer completion.
>>>>
>>>> Any news about this? Dmitry do you still have concerns? We can
>>>> add this last description in the commit log, as well, if needed.
>>>
>>> I was looking for pretty simple addition to the commit message, that
>>> links existing commit message to the actual source code change: that
>>> geni_i2c_gpi(I2C_WRITE) results in the GO TRE and
>>> geni_i2c_gpi(I2C_READ) generates DMA TRE. But I haven't seen anything
>>> sensible up to now. So far we have a nice description of required
>>> programming sequence in terms of CONFIG, GO, DMA TREs and then source
>>> code change that seems completely unrelated to the commit message,
>>> unless one actually goes deep into the corresponding GPI DMA driver.
>>
>> Agree. I can't take this patch until the commit message has a
>> proper description and until Dmitry doesn't have any concerns
>> pending.
> 
> And please, please, include the word PATCH in the square brackets in
> the subject, it's landing in the wrong email folders for a number of
> folks..

Included "PATCH" string in subject in V4.

> 
> Konrad

