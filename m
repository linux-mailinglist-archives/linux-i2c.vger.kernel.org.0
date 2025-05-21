Return-Path: <linux-i2c+bounces-11089-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14806ABEBF5
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 08:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBAEC8A3D08
	for <lists+linux-i2c@lfdr.de>; Wed, 21 May 2025 06:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BD0233151;
	Wed, 21 May 2025 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6XxwpcT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A321B1AB;
	Wed, 21 May 2025 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747808725; cv=none; b=k81bWOyNJyFTGLZPDLws+lqwnXFeqYpNYkVIOa8adlhrPWiL8gdlWAfLB8gQ0N+s5NDSG4/buyMsEyuHCdOqA0dzJTSC0rpfQgN6Zdul6bVBjUro+g5UoeusiquyCucmDdQ8Tg9UTFxCFF7r/EluH8XwclWlyVAwz6D4n77Un70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747808725; c=relaxed/simple;
	bh=NXk3nNAqnzH6xE2evCCkrDFeK7ubHXk+2PBc3+S55SM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Rv9eGyPAKqoeCMCYkQZ/kCCjzXhV0jjlTuc0boBT7WTG2FPoy9jlrVpPnLz9BpUcuc7RyJg7wGV9P1ucCK6it4hRpdp6yLf0+w/1ZNJQ86RxGpNWDtgSIXc4z07viB3B5aM/e6u+Wdzjj47iiFQMAk0i6SP6/Atr5aFp7cYoius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6XxwpcT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L0HAB6022994;
	Wed, 21 May 2025 06:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BeL4MPcoIqgJ+bEqzMeWlJ0lhTQyOyPY3oZxR9KXEpM=; b=F6XxwpcTm+TpzWQA
	7rg3HvusJRKm9vjnJ2/b99XNY72JC13ZBj1ET0DoeVQuHzaUje1o7xBLFD/4T6+a
	YWTrg86M2bZsPNT2OtIn6fYrIl16ZplZlb/MnhL2z4ArVIKjQzbSe++lTF1CDLpy
	k8kuP4MnZHe8dDmzcxLFDlL4a2xehIzM/vM9ZMj9UGdGfLoitegILfEc1TUzHkkq
	RIs4XsVtZ3ZQ1KMOzjcoSDhR4VbzYIM+NLKw9+zz5jhXjUif8ADIHBSlk6Xb/i/g
	zxVFumpUHDg7SZP+AB94BdIA/C2BitPyZefX26PszuV315srn+GIatQ6qbHejV4y
	433plg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh59rdx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 06:25:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54L6PK1c004250
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 06:25:20 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 20 May
 2025 23:25:17 -0700
Message-ID: <3f024bd8-3388-4984-a962-531e3fe88c6a@quicinc.com>
Date: Wed, 21 May 2025 11:55:14 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
To: Andi Shyti <andi.shyti@kernel.org>
CC: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        "Viken
 Dadhaniya" <quic_vdadhani@quicinc.com>,
        Manikanta Mylavarapu
	<quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
 <y4t3xshxsbrx6xqkxroai3vixjacskco5baaoip2apzjkehjxx@ah6wxu2gy24g>
 <21ae6a2d-c8dd-4064-a851-6a10649ddf90@quicinc.com>
 <sdhflgjsnvn7l2pix7e5k5yijycy53tmpg4w7722icp6na5rcx@kec7ra7tc4xc>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <sdhflgjsnvn7l2pix7e5k5yijycy53tmpg4w7722icp6na5rcx@kec7ra7tc4xc>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA2MSBTYWx0ZWRfX2hnrCzua7/rY
 IR/MM0Jz0ucWfl5Aj12DL7xMnXLUVz4GA7ip8kHznszGo3/lA9TqABQNuyApAUAa9wR0QXDyGld
 siqIPW2eQq0bUL/J18TN4Y1bYn5nJFHlX49aKfcaO5UDYE8Ei1VeU7krp9ox8sWGVEOgAQZSFaG
 cdW2oXSG/FOhzgeRQrVn5lvROviLiiBEBajwjm24Cur1h4SwzezYnlrmJRlbsuIEj3azjHYv7Vl
 1CS+fMe+0I/W4mt8Pl7Y8A/BnhNNRx86FcHeCgoJbYwEpWhNuEru5bmMqQnypj1uuuIYcG1QBZi
 QhTRMKcBgWBTQSnhGtgrNehV1Vf5K9cuXwhtGtIWp7Y1ucEAALlwWu5bRidPEIWoceqnchhhSJ7
 mfkNGzIjFzgLaQcgcrvc93iBndHndZL0Xyk6eFwTkdUPpGg7YRkVs2BDrizkneDdbj/+lbjN
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682d71d1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8
 a=GBcxRvPvy9L4qtXiP0QA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ui0KJypQk25su_hCSp89mJgWXth6NoSu
X-Proofpoint-ORIG-GUID: ui0KJypQk25su_hCSp89mJgWXth6NoSu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210061

Looks good to me, Thanks Kathiravan, Andi !

On 5/16/2025 2:16 PM, Andi Shyti wrote:
> Hi Mukesh,
> 
> On Fri, May 16, 2025 at 12:23:46AM +0530, Mukesh Kumar Savaliya wrote:
>>>>    /* source_clock = 32 MHz */
>>>>    static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
>>>> -	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
>>>> -	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
>>>> -	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
>>>> +	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
>>>> +	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
>>>> +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
>>>
>>> argh!
>>>
>>> Can someone from Qualcomm look at this fix? Mukesh, Viken?
>> Yes, I am reviewing internally and verifying the same with latest Guidance
>> and updates. Let me update on this once reviewed.
> 
> thanks a lot! It's very much appreciated!
> 
Reviewed-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> Andi


