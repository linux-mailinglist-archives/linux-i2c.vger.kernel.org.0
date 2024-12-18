Return-Path: <linux-i2c+bounces-8598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F074B9F65FC
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 13:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 416B116CE4E
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 12:34:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032881A23B6;
	Wed, 18 Dec 2024 12:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mSOvVslc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A8199FC5;
	Wed, 18 Dec 2024 12:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525267; cv=none; b=rkK2EStyM4Jw239EK/JGHkAtwduhts3e/8XosUwPS+clcXnu6BX8Jm9WFMZeNGpHYIDIusIYCmZcgJ9qmZq4P9e+0MRRS5Tyarotxz3Xi3doHqlMmvp7QmyCnHJLZwTSZHXn9gaYLqDbYgXIQtfySiZ44hSUkhvgAuJ5fueSTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525267; c=relaxed/simple;
	bh=QYc4xY8AeNSgge56dJ3MvqzLhT/3x0EYFavC+ntvJs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SB2KYOYMmaUp/wjs0U0KlPSgQc/5kHiGnc/im3LaSLxk5jEobgEZXnSxrXPZb4j1MwlxlKsBdBl5mYeQzpNKLi4B6Gm+M0/Bx9KDht3qIBYZ3G4BfrsANDLCumzt0C+wSzaScltWZbuPOlLFaXtlqsTapgF3ipib4n7hTs8lUGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mSOvVslc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI7V5iF025318;
	Wed, 18 Dec 2024 12:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0C94w/0C+OzA0oXh9i7IsC80vig3DOMsP0LguORAZO0=; b=mSOvVslcyvPQhTRD
	gigAf8Q4B6nwZf/50MXI+c5hf/9FiRxsEekzgMpnWnktYh4e3QPSfbyY5v9O2obK
	bjm0PuAdYsxsREvAIwlOwsC4ynrM5D12GxGlEpYeBQPoTiZQ2zPKHqxwzaJUhltF
	ElZuC8FaEan4N+VIxXiiJGLR8Q8rw7m+XlKoSZNh/DWmDODuPnsFOB0GwTDhF1kb
	tDsaLg5GZ1uEALRk4XlZWskr80PSt13WGPF+yQ66RDbXAfbv/4knblD/tJ5DVKLO
	fzDVFIo/GhvSdhs6VXA8YxjR3rBpGMKNpMGBA5Vkccg8K8eAJ4LCFU/CXr/b0d4k
	UzpZpg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kt2w8rm0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:34:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BICYEZQ011739
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:34:14 GMT
Received: from [10.216.12.179] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Dec
 2024 04:34:08 -0800
Message-ID: <5ef44277-6739-4e1e-af62-0f40ae081ec1@quicinc.com>
Date: Wed, 18 Dec 2024 18:04:04 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] dmaengine: gpi: Add Lock and Unlock TRE support to
 access I2C exclusively
To: Vinod Koul <vkoul@kernel.org>
CC: <konrad.dybcio@linaro.org>, <andersson@kernel.org>,
        <andi.shyti@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <conor+dt@kernel.org>,
        <agross@kernel.org>, <devicetree@vger.kernel.org>, <linux@treblig.org>,
        <dan.carpenter@linaro.org>, <Frank.Li@nxp.com>,
        <konradybcio@kernel.org>, <bryan.odonoghue@linaro.org>,
        <krzk+dt@kernel.org>, <robh@kernel.org>, <quic_vdadhani@quicinc.com>
References: <20241129144357.2008465-1-quic_msavaliy@quicinc.com>
 <20241129144357.2008465-3-quic_msavaliy@quicinc.com> <Z01YBLcxDXI2UwXR@vaman>
 <d49b16b2-95e5-42b4-9bc1-40cb0bfa15b1@quicinc.com> <Z1BJSbf+1G8ojTib@vaman>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z1BJSbf+1G8ojTib@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLj0LppQqDwBIQBoNr_scSKpO1tWPoNJ
X-Proofpoint-ORIG-GUID: fLj0LppQqDwBIQBoNr_scSKpO1tWPoNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 clxscore=1015
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180101

Hi Vinod, Thanks !  I just saw your comments now as somehow it was going 
in some other folder and didn't realize.

On 12/4/2024 5:51 PM, Vinod Koul wrote:
> On 02-12-24, 16:13, Mukesh Kumar Savaliya wrote:
>> Thanks for the review comments Vinod !
>>
>> On 12/2/2024 12:17 PM, Vinod Koul wrote:
>>> On 29-11-24, 20:13, Mukesh Kumar Savaliya wrote:
>>>> GSI DMA provides specific TREs(Transfer ring element) namely Lock and
>>>> Unlock TRE. It provides mutually exclusive access to I2C controller from
>>>> any of the processor(Apps,ADSP). Lock prevents other subsystems from
>>>> concurrently performing DMA transfers and avoids disturbance to data path.
>>>> Basically for shared I2C usecase, lock the SE(Serial Engine) for one of
>>>> the processor, complete the transfer, unlock the SE.
>>>>
>>>> Apply Lock TRE for the first transfer of shared SE and Apply Unlock
>>>> TRE for the last transfer.
>>>>
>>>> Also change MAX_TRE macro to 5 from 3 because of the two additional TREs.
>>>>
>>>
>>> ...
>>>
>>>> @@ -65,6 +65,9 @@ enum i2c_op {
>>>>     * @rx_len: receive length for buffer
>>>>     * @op: i2c cmd
>>>>     * @muli-msg: is part of multi i2c r-w msgs
>>>> + * @shared_se: bus is shared between subsystems
>>>> + * @bool first_msg: use it for tracking multimessage xfer
>>>> + * @bool last_msg: use it for tracking multimessage xfer
>>>>     */
>>>>    struct gpi_i2c_config {
>>>>    	u8 set_config;
>>>> @@ -78,6 +81,9 @@ struct gpi_i2c_config {
>>>>    	u32 rx_len;
>>>>    	enum i2c_op op;
>>>>    	bool multi_msg;
>>>> +	bool shared_se;
>>>
>>> Looking at this why do you need this field? It can be internal to your
>>> i2c driver... Why not just set an enum for lock and use the values as
>>> lock/unlock/dont care and make the interface simpler. I see no reason to
>>> use three variables to communicate the info which can be handled in
>>> simpler way..?
>>>
>> Below was earlier reply to [PATCH V3, 2/4], please let me know if you have
>> any additional comment and need further clarifications.
> 
> Looks like you misunderstood, the question is why do you need three
> variables to convey this info..? Use a single variable please
Yes, I think so. Please let me clarify.
First variable is a feature flag and it's required to be explicitly 
mentioned by client (i2c/spi/etc) to GSI driver.

Second and third, can be optimized to boolean so either first or last 
can be passed.

Please correct me or add simple change where you would like to make, i 
can add that.
> 
>> --
>>> Looking at the usage in following patches, why cant this be handled
>>> internally as part of prep call?
>>>
>> As per design, i2c driver iterates over each message and submits to GPI
>> where it creates TRE. Since it's per transfer, we need to create Lock and
>> Unlock TRE based on first or last message.
>> --
>>>> +	bool first_msg;
>>>> +	bool last_msg;
>>>
> 


