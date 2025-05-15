Return-Path: <linux-i2c+bounces-10996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0F6AB8F66
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 20:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22286168BD2
	for <lists+linux-i2c@lfdr.de>; Thu, 15 May 2025 18:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 834252857DE;
	Thu, 15 May 2025 18:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZjgI61e5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA32690E0;
	Thu, 15 May 2025 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335237; cv=none; b=K/S/7imxWh1j6U9YayssdNfTcNf+/n9EEpG/6BFptVcQXrCJWqnIdKh/vNZB5YmrJi7bHRLKlqIBqlm3id0fPvjO3hx/Whj6JheaJnNFVYyhTlOxHRGaWzMtI/PLk+oUsJb9wqE+tvqVVcN40sSISZJfh4ztIxSboT0vzKhcHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335237; c=relaxed/simple;
	bh=t4ojkGfVhwVHH43H5b+OeBvk8PTzeb+S6OnVFeMPohs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y9sEQ+ail46aYeQMQgPWhLrixeGLi/NLxATLsmdaagm8X7BLRc4YnZw90Tajk5Q8LyDEHx3zR/dLl09uEHyLS5EHYc38gs3lhVr5HnoBpqSLamUI/+jCuK0csAPqNKMII4P2jlJj1wTqyK4qk8QTVdpK1+Rwq/rpfrxMyVW7Oo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZjgI61e5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFE5T009131;
	Thu, 15 May 2025 18:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xp9oibChdql+/xwAjjJoORUpqecaqXdTQ5e3XcbEzr4=; b=ZjgI61e51By8u5xk
	K/Rd6cMOMfqFpo+vwGrt5u4HRa4mEEUpJJ9crkNrabU3wf/MOUOgOru0XirfjEfa
	qu9paesSzIVw61fwmvE5FUzg8//1XwVaoMsNYkYBKPP0RY4xd7EDhTBfHrJ/6vO/
	Waf/X9Pgc69ZdvmQ8DuwJ6LApVrrq1tODx8exBgxlgyMxNaQRt1hbGUi6wqpDS2n
	DANnh+BMH3j5dIJ1Ng2xoWvlZLnIDjF96ewQzWRX5m2ifKN00FLlBljqnFJJmqM1
	+l9KwycSVwBCf9H3urPyR6x5gxga/HNX21NZdDabhaAsW2QLpfxRmteN8DFOmMjQ
	/bBxiQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex7au3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 18:53:52 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54FIrq42017518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 18:53:52 GMT
Received: from [10.216.63.6] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 May
 2025 11:53:49 -0700
Message-ID: <21ae6a2d-c8dd-4064-a851-6a10649ddf90@quicinc.com>
Date: Fri, 16 May 2025 00:23:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
To: Andi Shyti <andi.shyti@kernel.org>,
        Kathiravan Thirumoorthy
	<kathiravan.thirumoorthy@oss.qualcomm.com>
CC: Viken Dadhaniya <quic_vdadhani@quicinc.com>,
        Manikanta Mylavarapu
	<quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
 <y4t3xshxsbrx6xqkxroai3vixjacskco5baaoip2apzjkehjxx@ah6wxu2gy24g>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <y4t3xshxsbrx6xqkxroai3vixjacskco5baaoip2apzjkehjxx@ah6wxu2gy24g>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE4NyBTYWx0ZWRfX6SpepcnAFrd/
 jv+IzRKzstqw6PkbkEDtkUMb+s8JJLNSdgYx+PGn3970Wla0b0I8B06ngudqAUvgi/lxyxNOm0b
 EMov0lSc57itG48YQU/yBQhjjranebvkFvoHeeaf5oN/uXE7f5n5T1Kf6M3TPdZW7Rd6e6YgKrg
 pjXJwLdHFA+9OKbiY7VAkN2fvqQyKMq74tAop+pn2EEbpnJihVTpG32ggCQMV1BzV871AYRql6B
 mEC1sgiGnh/hwYz6LZmFGIh7QabYqmhZwWhCk5hgKTfv5u+tPwqmX5qcqc0mXquFOKGTNM1boRI
 AIxBoEfid1eirbgrKA6WM1fZVINSQs2kaPSJl7vMuh8piRubSDYRJGeUTT0FNHHM+dUv8aC8pGo
 73RKydEOdvoq11TPoOzrxkywr808J6pzUfVB+t6EbOnXouM0b7ULl9jvcN1N8nCplFpegfPN
X-Proofpoint-ORIG-GUID: _I0bN7ovhdIHJP90ZG01mPiVzAR0UKmj
X-Proofpoint-GUID: _I0bN7ovhdIHJP90ZG01mPiVzAR0UKmj
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68263840 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8
 a=EsNJcRE4yQKf4b2fgh4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_08,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=921 bulkscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150187

Thanks Andi !

On 5/14/2025 9:04 PM, Andi Shyti wrote:

[...]
>>   /* source_clock = 32 MHz */
>>   static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>> -	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
>> -	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
>> -	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
>> +	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
>> +	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
>> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
> 
> argh!
> 
> Can someone from Qualcomm look at this fix? Mukesh, Viken?
Yes, I am reviewing internally and verifying the same with latest 
Guidance and updates. Let me update on this once reviewed.
> 
> Thanks,
> Andi
> 
>>   	{}
>>   };
>>   
>>
>> ---
>> base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
>> change-id: 20250513-i2c-bus-freq-ac46343869a4
>>
>> Best regards,
>> -- 
>> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>>


