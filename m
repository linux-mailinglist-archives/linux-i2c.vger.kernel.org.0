Return-Path: <linux-i2c+bounces-10690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D3AA4A39
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 13:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A13034E79EB
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Apr 2025 11:36:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DECC23815D;
	Wed, 30 Apr 2025 11:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ieOpJtdV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD301DF25A;
	Wed, 30 Apr 2025 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012981; cv=none; b=GB8W+4nJnyCAjelco+ZqXpqUMVWoNs6WLH+E6pzbWr7ayQVx35YUQMOz+y4ZHWPoBstrj+yk8iHUKNmjlgkkjpTF+LciqbN8aoj/N6TTWPVU1P6pmHmoEq7Ao8zs45tr84JT1pjueRB2ClKjcsB3nBUBEP8GxLJOX3L7wcSiQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012981; c=relaxed/simple;
	bh=DVQVf8tGK954V/VM/YHVvqZHZv78CTJdMafVxqu9h1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EiYeO/jJrbLTWwgbwTapUu1DlEUsm9PyGzlTzo3H0zyz72qe2GfGCbiUNCOnVK3Mtf7vEJItx9V7a+ufUFL2sWNTTtLu+YbX719mwponoWtLCQZb+w6bbNZHuymJ0zL/krYsDrQ1YyanTIdyUpZ7eXc8n+YPnSS+mSrUpQVqAJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ieOpJtdV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U91j2i016541;
	Wed, 30 Apr 2025 11:36:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a50UEAwiOb8y9ESyJsNhO0gkMcWF26Xwavxt6R+RHGA=; b=ieOpJtdV5xrv7VE8
	DWl7jl6m5QnQFj/UmRw1cirqtowjzTBFG8vCzHqvx7pXhDRc3tC+QGA3FKp5kgX4
	9tOngySY0OGW8RoEtTu8Ckyh0Sl+IxE2KK7SrObZzhGXrG36JiqWMnssTa3GuO3w
	ivF9moq7/POqesvKsTr9AepVvk5ogiuH5CNmyoPcFg/7GufHuoUhYTI7L9coJhcQ
	vXPHv/L48uaQaJRtGrh2m6/o3pqsEgZssaRTklbKgyvvfeCRc+dif1tS2jgph+QP
	3UOqHwplj90bU7GQ8wWQXYYmEg0qMWyL0MA0t0X+aCugd73uRv6JxH7Sg0LN2w7R
	PonjJg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ubhysh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:36:15 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53UBaEgH023021
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 11:36:14 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 30 Apr
 2025 04:36:12 -0700
Message-ID: <3421bf4a-afa1-4b4c-8421-bad7187d3d8e@quicinc.com>
Date: Wed, 30 Apr 2025 17:06:09 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i2c: microchip-corei2c: add smbus support
To: Conor Dooley <conor@kernel.org>, <linux-i2c@vger.kernel.org>
CC: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250430-preview-dormitory-85191523283d@spud>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <20250430-preview-dormitory-85191523283d@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Vkv07b8MEri7t1SYChgmh7JplFEZxvh
X-Authority-Analysis: v=2.4 cv=bsxMBFai c=1 sm=1 tr=0 ts=68120b2f cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=XYAwZIGsAAAA:8 a=VwQbUJbxAAAA:8 a=RYsg2ln_6DacrSxsmtsA:9
 a=QEXdDO2ut3YA:10 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA4MiBTYWx0ZWRfX6xr545OjjidE Jy5UcusWl7h0vbWFEsGV71JomCmis714Kad9qzVnTBS6ejeG+CGqcxN76zDWHVnPZjXq1x8dapv QB9/mkxG0FmQdjHB3VMQoyTGPJIf0IGkuUWPUmRo2FOVGiDEUyJx5vWj34ytilrpIZL/84X9DEH
 CAczunl5q/5FKnbTIcGCzKdLrv0yUSthy8WdZhmH3vnYzQkmE1OCMwb7Sr9fJJ6SjXt/24ifq/q wRDqP/275B6oVT3r6hwk2R/f6zRt4M4A/2WYU7wOFQkL/bhSc0l4TQDoEkSUVEjR3NuCasDzgBf 2Dd5L+YQ1dL9YGmwKD1jm3rkfIjVPf7/uY43nVSGmdzmsO4uTfSqhLWDN4cXc9mi3dkC3ERMgtS
 rbqbHOFjauVEfUIB5K+1sJ8xEzqk07R8Hh3/ZU/O4tKbBEh/78AMOa4QsioVKifAvUOwgUuM
X-Proofpoint-ORIG-GUID: 5Vkv07b8MEri7t1SYChgmh7JplFEZxvh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1011 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxlogscore=985
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300082



On 4/30/2025 4:53 PM, Conor Dooley wrote:
> From: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
> 
> In this driver the supported SMBUS commands are smbus_quick,
> smbus_byte, smbus_byte_data, smbus_word_data and smbus_block_data.
> 
Write completely in imperative mood. something like :

Add support for SMBUS commands in driver

Add support for SMBUS commands: smbus_quick, smbus_byte, 
smbus_byte_data, smbus_word_data, and smbus_block_data.

Also mention below limitations here .
SMBUS block read is supported by the controller but has not been tested 
due to lack of hardware. However, SMBUS I2C block read has been tested.

> Signed-off-by: prashanth kumar burujukindi <prashanthkumar.burujukindi@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> smbus block read is not tested, due to lack of hardware, but is supported
> by the controller, although we have tested smbus i2c block read.
> 
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Andi Shyti <andi.shyti@kernel.org>
> CC: linux-i2c@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>   drivers/i2c/busses/i2c-microchip-corei2c.c | 102 +++++++++++++++++++++
>   1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/busses/i2c-microchip-corei2c.c

[...]

