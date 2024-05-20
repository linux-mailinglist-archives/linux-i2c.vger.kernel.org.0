Return-Path: <linux-i2c+bounces-3599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C598C9F1F
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 16:56:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 043931C21E61
	for <lists+linux-i2c@lfdr.de>; Mon, 20 May 2024 14:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F066C136E00;
	Mon, 20 May 2024 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="K0J4/JRK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1E13699B;
	Mon, 20 May 2024 14:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716216982; cv=none; b=PPv52V7lbjxigqhnfNusdJh826I+yUYvHRKPA5Mzju3Q+O+9qpmTtyCeuzoms5miZlDKVTMxSCyNh0M7nU4EtTujlinfAsCBH4F7hnRuCNuv/x3yM1Q1OBGrHarE5KTetKS67r1Dms3QuSqQQg2H7N9xempSIf+MwluO8MZ1Wns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716216982; c=relaxed/simple;
	bh=r016ACG9rLPHqBFAH7IwIq8KsAEq11uLlcFIl+XU3CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUxmSDu5GJteUyJiTE5SsCpFrHtEIeZ6OCtguo7tWxzGYTnheJZiIErj8xAtdqIhIEhgqJERrm8RzRJZooTVEFxM+WdubdQJHLhuWO/muZ81Q7Q1GjQOazTXOmmZAQ+WWElKMEb47DlDFp1QzQwxCeASbmW8MeWBgZ3dDvor26M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=K0J4/JRK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44KEhEEL023548;
	Mon, 20 May 2024 14:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k8LthJaFono5kzefOLh4BpFlOGemu1pGW+k0msP+I4Y=;
 b=K0J4/JRKbpzYapY0L2S8Q9yiyrgoCqpkVHqfyhmcQKXctmLMR63b1B0F7SkrwRqWlKNo
 uZ61Wq2UWu5Hq91ibUc6D2rpnoyLyaBSWeCwAW6veNAcdkN2eyqcw4zr+2L4buJz2hzk
 5pWLpBNBLLnm/IUdx2iT3reaIz2ZkXIQlH07hDY+D6nPI6464xS08GbOfzgh4hnh7ha6
 8Oev4NMJQ9YUMtz3GNyH9jzTv4T/cLKDFpL4zlcSlnRKOY0Ad9IEIG29O6ZMQE8E79qN
 qvCyoFoJDUopIxTL5WfS/6jc3dGzJMQ1JMdQbI0FPUzQWGRwN3k0g3U7mh1qZjpWmJBO kg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y88h901ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 14:56:10 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44KCV6vX000878;
	Mon, 20 May 2024 14:56:10 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77200fs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 14:56:10 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44KEu7gw28115624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 May 2024 14:56:10 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C28858060;
	Mon, 20 May 2024 14:56:07 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DB4E5805C;
	Mon, 20 May 2024 14:56:07 +0000 (GMT)
Received: from [9.61.17.2] (unknown [9.61.17.2])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 May 2024 14:56:07 +0000 (GMT)
Message-ID: <f23e2669-c5b9-4257-ad75-f1431690a544@linux.ibm.com>
Date: Mon, 20 May 2024 09:56:07 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] dt-bindings: i2c: i2c-fsi: Convert to json-schema
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
        andi.shyti@kernel.org
References: <20240514205454.158157-1-eajames@linux.ibm.com>
 <79bed5c3-14be-4f15-a2f8-2e2342cb6b57@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <79bed5c3-14be-4f15-a2f8-2e2342cb6b57@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IBG5_ypo9PzQetmL-qX-ZWH2SCXS76R_
X-Proofpoint-ORIG-GUID: IBG5_ypo9PzQetmL-qX-ZWH2SCXS76R_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_05,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=816
 malwarescore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405200120


On 5/19/24 13:03, Krzysztof Kozlowski wrote:
> On 14/05/2024 22:54, Eddie James wrote:
>
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ibm,i2c-fsi
>> +
>> +  reg:
>> +    items:
>> +      - description: FSI slave address
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 0
>> +
>> +patternProperties:
>> +  "^i2c(@.*)?":
> Either you have or you have not unit addresses. Please fix the pattern.
> Why is this so flexible? Do you want to deprecate i2c-bus in favor of
> i2c? If so, then example should use new naming. I am fine with children
> as i2c-bus, assuming this is allowed by dtschema. Did you actually test it?


This is the exact pattern of the i2c-controller schema node name, which 
I thought would be good. I can make it more specific. But yes I tested 
it, i2c-bus works fine


Thanks, Eddie


>
> Best regards,
> Krzysztof
>

