Return-Path: <linux-i2c+bounces-8162-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC89D68FA
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 13:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E964DB218C0
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 12:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4099189916;
	Sat, 23 Nov 2024 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Vlsq0FoQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD3B14F9E9;
	Sat, 23 Nov 2024 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732364002; cv=none; b=IpbPzi7Swp1ejsVjg6706QXLl7PEYwLlHwq/NNiqwvZZdIS0Cu9utFH7ZhHRhupcHsMnwH2+0wH/JWsH1y3B+a6Jx5EQq+ESjc1CNJMD7OMwipXJZqB5ev6/hxxskux03RVkQS1yXgosh2X+8EVw3fXSpsY3FaUJEo5B2h2G8k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732364002; c=relaxed/simple;
	bh=1dM5uHcLVJ4kOXWd0J8Gu9w8OhsgSUXOM8wfFq038M0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ttAlfaD/m7T+5oC3l2JN+1AFFahUSqFJ5ydwMq4r9wEEIl0H7c3kIzrg8j8VeAzFSVRywkVA+6enbyk4f9Cf+zXWMcFpbZg2yOTGPkUjjRD9EYCZ10M4XT7QDYkB0B3bPk+HPCdZJEJ4g3txBWYP/wSMmZa1ASi8590oH/6nyFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Vlsq0FoQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AN9X4nM021444;
	Sat, 23 Nov 2024 12:13:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5alXzzFD3JlV4R06VDMhg9cSTZcm4OkikXmaWosx7E=; b=Vlsq0FoQMDhgx3bn
	EBo/tbTrznsQAgv0Hfn4yNa47egmItRmfpzcP9/N+GleCDL6mPknliGs8FHstv+d
	rPDNk7FaTMhicJ1Rb1qwC69GVdn8M5RzNzQnVtjWYsK7mwWGNjz9v+eLmQ/wDC2n
	sfk1Y3bCvCLUYuX1scotowT1/PW/f2smC6ZVya/c63O/MQ4FMTF0XW5jX1yBSNmS
	Z8Ffoi5PNoP8b7siJk1Pz8pxGRQeheHmUgexcp+SzxDq4oxBqA58LdRu1T2aTZxU
	AjdJLrK3ajszDAJw9qLKDeODaYZ29xVtbifjqdoYWn9wf6lexGx4hATA2X+/TVgH
	CXx84A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337e6rps7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 12:13:16 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ANCDFoE024074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Nov 2024 12:13:15 GMT
Received: from [10.216.31.245] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 23 Nov
 2024 04:13:12 -0800
Message-ID: <f96fbfc5-ed5a-4def-a7e0-df4098dea4b3@quicinc.com>
Date: Sat, 23 Nov 2024 17:43:09 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early resume
 stage
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
CC: <andi.shyti@kernel.org>, <quic_bjorande@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <konrad.dybcio@linaro.org>,
        <quic_vdadhani@quicinc.com>, <vkoul@kernel.org>
References: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>
 <ZwlnWIWkS1pwQ/xK@hu-bjorande-lv.qualcomm.com>
 <3797c11f-b263-4f5d-9307-963fd6662b26@quicinc.com>
 <CADLxj5RD5syLXdVnfsMpEso9VOhWiwdP8_iV12R=mvhKwUY_bA@mail.gmail.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <CADLxj5RD5syLXdVnfsMpEso9VOhWiwdP8_iV12R=mvhKwUY_bA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cabVDFBPFFZzUr2N_0-bjYKUK5IR4W66
X-Proofpoint-ORIG-GUID: cabVDFBPFFZzUr2N_0-bjYKUK5IR4W66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411230104

Thanks Bjorn.

On 11/19/2024 8:29 PM, Bjorn Andersson wrote:
> On Tue, Nov 19, 2024 at 8:29 AM Mukesh Kumar Savaliya
> <quic_msavaliy@quicinc.com> wrote:
>> On 10/11/2024 11:28 PM, Bjorn Andersson wrote:
>>> On Fri, Oct 11, 2024 at 05:47:57PM +0530, Mukesh Kumar Savaliya wrote:
> [..]
>>>> pm_runtime_get_sync() function fails during PM early resume and returning
>>>> -EACCES because runtime PM for the device is disabled at the early stage
>>>> causing i2c transfer to fail. Make changes to serve transfer with forced
>>>> resume.
>>>>
>>>> Few i2c clients like PCI OR touch may request i2c transfers during early
>>>> resume stage. In order to serve transfer request do :
>>>>
>>>
>>> This problem description is too generic. I am not aware of any use case
>>> upstream where PCI or touch might need to perform i2c transfers during
>>> early resume; your commit message should educate me.
>>>
>> yes, it's generic as of now since we have an internal usecase with PCI
>> is yet to be enabled in upstream. Not tied up with any usecase in
>> upstream, i just heard recently.
>>
>> Provided the scenario is generic and possible by any client, can this
>> code change be reviewed or shall be kept on halt till PCI usecase gets
>> enabled ?
>>
> 
> If this is a valid scenario in the upstream kernel, yes. If it solves
> a problem only manifesting itself based on a downstream design then
> you need to exactly describe that scenario so that reviewers can
> decide if this is a problem with the upstream kernel or your
> downstream design.
> 
The exact scenario from PCIe switch is as below.  Hope it describes the 
usecase at high level to understand PCIe client -> PCIe Driver -> I2C 
driver.

PCIe switch needs certain configurations through i2c after powering on 
the switch, as part of suspend we are using suspend_noirq() to turn off 
the switch because some PCIe clients do some transfers till 
suspend_noirq() phase. And as part of resume_noirq(), we will enable the 
power to the switch and configures the switch again through i2c.


> Regards,
> Bjonr
> 

