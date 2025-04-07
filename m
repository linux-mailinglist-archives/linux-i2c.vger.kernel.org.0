Return-Path: <linux-i2c+bounces-10126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEDDA7D4D7
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 09:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D875F188F7E4
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 07:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623972253E1;
	Mon,  7 Apr 2025 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LiYC8j7v"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F08279F2;
	Mon,  7 Apr 2025 06:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009170; cv=none; b=EmpV64jasBFSUVhrJrYITSuMisz6Bk/oyOSyOElYVxWxbSN60sXHikf6DQVLq0bwfyASCrNY4Kb1qnMV1zJ74wkwL/8xlBSmUO6a39V7ssQ10i5EDp/TDh8FM++nUkfpDcbhwm2pO/h4JTuTXBdSftn3vXblEjEudzOOrWqTREI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009170; c=relaxed/simple;
	bh=+Pcj/QHoeezI8O2sFeZwUsZoXKkCQ+WBiXMYxsuwpGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ORty5TFcQbZVztczDXYL3tEMM72yLFYJ2vKGt6SOQHdMexsdD8h529tSyFqPHKqhSgIuBGKMjKw3300CAdHT4SA2HtUSnkW+/U1KVlVOeo7VNTPCFcqKWMqo+ufGP7D3ilbUU7yb5iMJGLbtUArsFsqTbhRPqzozhAuaszbtVEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LiYC8j7v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537695MG031302;
	Mon, 7 Apr 2025 06:58:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fllJ4DSPW2eHfNTsCAlDhAS+GcHDw8tJKYP25hUFxYI=; b=LiYC8j7vNHi9guI2
	giBubtA5+CaZ7/Nmc2bRuisAI1ZmJrXvmCMZ+Fkg4kZFC1w/lbOD6qykhzwOUE7l
	vtPKDO2dYbzLFwou4YC9qtN+nQrWO4utMxDK7cbciA7TehZO2yng86ZfZJHz2NR/
	LsVN2h970nu7BVDcbU1rz/CvkBAIXg6cH5dI10fMMGGV1KQFEwMY9Wo6cKm/3zXc
	ywR1cUpkss8t7j0KRPRweqf+lIOOUQmSTFUkkQKDvz5Sw5NNyeWul+D8vmmcUPQS
	xXOzVeCOov/cMZIbPJmfTPskZWEiiBl13N1YEBcTDLI4MTTVG58hXpY15sE6Qx5y
	7gTFMA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkb6an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 06:58:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5376wseB009671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 06:58:54 GMT
Received: from [10.217.219.207] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Apr 2025
 23:58:49 -0700
Message-ID: <441ccdc7-bc0e-41ad-9878-d922ec1bfaa1@quicinc.com>
Date: Mon, 7 Apr 2025 12:28:46 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Update driver xdpe152c4.c
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <Shirley.Lin@infineon.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <jdelvare@suse.com>, <linux@roeck-us.net>,
        <corbet@lwn.net>, <patrick.rudolph@9elements.com>,
        <bhelgaas@google.com>, <ninad@linux.ibm.com>, <festevam@denx.de>,
        <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <Mills.Liu@infineon.com>,
        <Ashish.Yadav@infineon.com>, <Ian.Fang@infineon.com>
References: <3f7d0644a1f844b8b3ee9b3139b85339@infineon.com>
 <eeef6c60-8de2-4a4d-8bc5-2c321d759672@quicinc.com> <Z_Ns419SpW_z2Xnr@shikoro>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <Z_Ns419SpW_z2Xnr@shikoro>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fas_lFKX4QvVnBHGAEQPdVDnDW9MA0dI
X-Proofpoint-ORIG-GUID: fas_lFKX4QvVnBHGAEQPdVDnDW9MA0dI
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f377af cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=4DNFMcR_fBog36qUqesA:9 a=QEXdDO2ut3YA:10
 a=cXjm9OtRhicA:10 a=Xo8hRRjfBGoA:10 a=D0TqAXdIGyEA:10 a=aisST3GM9SsA:10 a=CwQxHXgAaE4A:10 a=rccF8FsX4-AA:10 a=xa8LZTUigIcA:10 a=_YXZIJ6AcREA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=603 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070048



On 4/7/2025 11:42 AM, Wolfram Sang wrote:
> 
>> https://www.kernel.org/doc/html/v4.10/process/submitting-drivers.html
>> https://www.kernel.org/doc/html/v4.10/process/howto.html
> 
> Basically correct, but v4.10 is quite old. May I recommend the latest
> documentation?
> 
Thanks for sharing the latest.
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> https://www.kernel.org/doc/html/latest/process/howto.html
> 


