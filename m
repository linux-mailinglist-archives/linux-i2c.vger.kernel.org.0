Return-Path: <linux-i2c+bounces-10123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF519A7D337
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 07:00:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A29227A30E8
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 04:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75466221F1D;
	Mon,  7 Apr 2025 04:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iw/IL21T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D76923C9;
	Mon,  7 Apr 2025 04:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001996; cv=none; b=F3h1BOGSDCraWK96lMHscLtji5PSG65PQg4oBWFd9iOUgjReOntkzcV8y85pCpmWRl9hCMxnRxOwsN4t+2lxHxI4cu27hS8G6Qo2A2ypOwbpHe9HmWi3e9u53AoY3TA/7XtrmNEHun8XRaIJrdczZwhCBiqFF8Nag+kVPMlXtZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001996; c=relaxed/simple;
	bh=i5Az6s4Uz4Os3x1Z4HzhsdquTwzcqJRCywqd8ZT3CNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Yt8ofcAQ4f/eDo1zmvP9AKx88yzLxZWY0gCElfo/dXk4HQVhV7E9hErOE9c5esMzj870tvKEMTnf1ytxItXoelOUUaJbZrZNTNKDfJreXff/2o/4G4AcMUVeQul/74UN3ZMiTzNOtzFjiiQUHt7d82cb3dOsYhJB0qKh7rd2nVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iw/IL21T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536N3ult005318;
	Mon, 7 Apr 2025 04:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztQ5YSj80wUwaLRAIitp2dOkqdq8fO/OXPcocD9Xslo=; b=Iw/IL21TxN3D+Hz5
	19urqSx+Qq+GP+B0RGM7zxSUNIujcSSSCvtDaPb7F2ZwnA1ZLC/vrprI4WjCr5tt
	vWImAAUopA45xFcEYsdSIE9VNoizqIcRgLpIxx31qhE6VCylbA/vRxrORHleT/n4
	UXJo4UOxb48bY6jIvcKyWCqZKZWW5A1GcdqyuXnIEVEtBwFW4id66hJHgOHrlb1b
	A9x9gmBeW6n6xZlRnkNXvb6QPl0R5TY8DvAFrfzU6DJSBvyxjsYhfk7O6D3h5bJx
	RzedeoLt4z41Lr+kgMvfD+nuZbFTKb5C/eaieppNjXhq0NpdLvZmHdbhME2i3gGm
	ZBReIA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd2jyvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 04:59:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5374xPaH032423
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 04:59:25 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Apr 2025
 21:59:20 -0700
Message-ID: <eeef6c60-8de2-4a4d-8bc5-2c321d759672@quicinc.com>
Date: Mon, 7 Apr 2025 10:29:17 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update driver xdpe152c4.c
To: <Shirley.Lin@infineon.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jdelvare@suse.com>, <linux@roeck-us.net>,
        <corbet@lwn.net>, <patrick.rudolph@9elements.com>,
        <bhelgaas@google.com>, <ninad@linux.ibm.com>, <festevam@denx.de>,
        <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
CC: <Mills.Liu@infineon.com>, <Ashish.Yadav@infineon.com>,
        <Ian.Fang@infineon.com>
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n-lFTR5fMXP9Vu9JfrJZOrl24y7hDTqs
X-Proofpoint-GUID: n-lFTR5fMXP9Vu9JfrJZOrl24y7hDTqs
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f35bae cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=bUQKSiCPAAAA:8
 a=3j4BkbkPAAAA:8 a=6FPNYluCAAAA:8 a=jU4qhlNgAAAA:8 a=XCMJsyS4DNymqqp2DlcA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=cXjm9OtRhicA:10 a=Xo8hRRjfBGoA:10 a=CwQxHXgAaE4A:10 a=rccF8FsX4-AA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=z2U-W3hJrleVIN9YIjzO:22
 a=-fHZXUhsFbuwFN3fwQAr:22 a=0TkXfT2pXjVnQC2iIllu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=910 clxscore=1011 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070033



On 4/7/2025 9:22 AM, Shirley.Lin@infineon.com wrote:
> Dear Linux Kernel administrators, Good Day.
> 
> We have urgent requirement to update driver link, https://github.com/ 
> torvalds/linux/blob/master/drivers/hwmon/pmbus/xdpe152c4.c <https:// 
> github.com/torvalds/linux/blob/master/drivers/hwmon/pmbus/xdpe152c4.c#L72>
> 
> Please help to reviewthe attached Linux Kernel patch for xdpe152xx driver.
> 
This is not the way to upstream from your side and get it reviewed by 
others.

please follow standard upstream process. Review others drivers the way 
it's uploaded first time and then raise new patch.

https://www.kernel.org/doc/html/v4.10/process/submitting-drivers.html
https://www.kernel.org/doc/html/v4.10/process/howto.html
> PEC Retry Functionality added for both read_word_data() 
> & read_byte_data() cases of PMBUS.
> 
> Updated by : Yadav Ashish (PSS PCS RD FW HD) Ashish.Yadav@infineon.com 
> <mailto:Ashish.Yadav@infineon.com>
> 
> Kindly leave your comment or give us approval for upstream.
> 
> Thanks a lot.
> 
> Best Regards,
> 
> *Shirley Lin*
> 
> *Infineon Technologies Taiwan Co. Ltd.*
> 
> Field Application Engineer
> 
> IFTW PSS SMD GC TM DCO
> 
> Office: +886 2 2652 6866
> 
> Mobile: +886 9 7822 9671
> 
> Shirley.Lin@infineon.com <mailto:Shirley.Lin@infineon.com>
> 
> 17F, No. 335, Ruiguang Road
> 
> Neihu District, Taipei 114063
> 
> Taiwan
> 
> www.infineon.com <http://www.infineon.com/> Discoveries <http:// 
> www.infineon.com/discoveries> Facebook <http://www.facebook.com/ 
> infineon> X <https://x.com/Infineon> LinkedIn <http://www.linkedin.com/ 
> company/infineon-technologies>
> 


