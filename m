Return-Path: <linux-i2c+bounces-14350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF993C987C5
	for <lists+linux-i2c@lfdr.de>; Mon, 01 Dec 2025 18:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C7F3A4094
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Dec 2025 17:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDD4F337112;
	Mon,  1 Dec 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XZi7lk5c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R9qFWm5m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B93435975
	for <linux-i2c@vger.kernel.org>; Mon,  1 Dec 2025 17:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764609538; cv=none; b=WHFk0oQW6JLiClYTsbZyuCqap0UbxR7Y3OEArdm6eXkkOzVwVvPxdbrG1aThYuGzmb+UYUFUKeLTuvCBllyVVu2c8bNb9EyqttOJUAcnliAo5Ink6b7i91elbAoXlefkUSG3bp/6LqV8UfnkQlBbB6tbsXHYdKY7yCYB/2TzLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764609538; c=relaxed/simple;
	bh=jQu/0pfExuAoWyGvuNX/rwr2ryXUJjoXP+qbIAGb9PQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F5hkAHJ9ILXx92gTNoxowTfIenAXZZnDHC4l4y+RQizA1J+OTg1MgYLcqC3G6zc+ozuOu/+xd+TwVQgWmgxOm2ihyQqJRrF0Agy4d3qPGsYpnVl1G6kxhTK0nqcrcBGCoCD/XOJUvtnpJxPuFOtfGDRjD5Nawo6X3t+EERj7U7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XZi7lk5c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R9qFWm5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1DYqjr3690420
	for <linux-i2c@vger.kernel.org>; Mon, 1 Dec 2025 17:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=; b=XZi7lk5cbkLhJYrR
	kxy3Z7Edkxo1yd2StWZo6JMkbcyI6Cy7t1MmqbJC/PlsPLSdOvzlLcCl0Rh8YL2o
	8v24etn35hWQLRR9SRJo3DtZI6Kywio+J25GaIPhizY2lqxzE+fmWS9UBLkvjXYu
	APkbS0oAQ3/c1wX/LBTvPt5y1+cTj/gWcsSewUUIBd/IxUrAUPYqBMsg2RDd4XrJ
	MkEcOZVfEU0XDGlG7FqLeIproatHYNdK+CBJDRLwjS6Iisu/WhcyUaHaWVXTAdNw
	X2gb2K9+UCoNOHEACnMMNitlGOc7tYMiSI5labisuuESlZGK7AQ7JG6JNzAnD56W
	0E/R+Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as6141w6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 17:18:56 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9371fb8589fso37140241.3
        for <linux-i2c@vger.kernel.org>; Mon, 01 Dec 2025 09:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764609535; x=1765214335; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=;
        b=R9qFWm5mxlSX7eOvmfAKsCiEpKS0hQIvq4Z5x07IQCiI00NNfogUhO+Nt+qg3i6kLy
         fwwg8vWJByVKG3DAIlZLCoDHIEawzW5i0YoNhYc9lf+pQXA0oECnM3XhhoKSaDMd93Ly
         KTYBWZCAU0/sm3XoSZ4eeB7xrk+F5v6e4mEeBX60LWJhKQIIo9GN73Q/yi+vDFQuaCDm
         nkNqpFNT03T7XlyGI7FuG+bcHHIvh96ihq5zuGbwRculBAlQih6qJprWlNbjYD3LamK3
         EL94Z64AKNy6Oanvv17IO3AnuOLkxiY1Tp+5TUXn2LqMmRRv/1CoSZ8+4/xyuMwGJijk
         3ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764609535; x=1765214335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBbaBOGe5klrtjBehaYCRT7sgkHLPQutgJ4o9PQvSYU=;
        b=DPPRGMFw2z+HEAeci2DG30GGVJGhfE/3WaQn2l36ZQPZREkKUX/TMHEw9/oecj3qCC
         yJzVSYXnKJb3MvaZfSd0uFsiHZSy7OeMzUnjRKcSDFahzvFRe1u5gKJ7zonvrk0JtxyK
         iakYbQYahl1OpZ77iHVDA7KaqyTbCOzpc5+H20qbxqi+qMzrkNOUXigOJRH6qjGCFJ2x
         y6qZFgGlNes3/fuGqLUbsRbutI4Oe9W1gYmV5yoCGKDWEQHGQOQrqXZZ1FBCdSCKpB7W
         Nh9mHsr0Te1ENezNtFr0YPJhoyO3qDfBhCbaYwJfzFGLu2NSiegO5bEq5X2YwjF1wUSo
         Vs0w==
X-Gm-Message-State: AOJu0YwlaQGyoonXquZ4k4BZH9ymxsfUzcDKhx94kKVsYZXtW1mW5Xls
	nXe1j1Xq5MvJa5LLRnD+/hAQJER0xt8oxKKq/EiyuswRxVV46VnR27E6z5NuIEU71swoSM3qPZO
	IOmmbim0vPNhXNQwlYATkh+LWHf29iFb3864tOM6HQWqoMZ9BNO4aW8Np5AIeoIg=
X-Gm-Gg: ASbGnct8xed//z/v4chXeDi9J0rVW3BcnHTVtZ+1+/gSXe48tAFWgLNEcJXUJJmzntc
	VuhQGXHCSSLDcV2AzKw6z6/T4yWpWtIXLGEJZ2kUFFe0G7ckZtslrpssdCqAXEx2NTCkMUfBnd0
	v+3ffYQbHSNIARIw8cZCJ5ZvzDbxcmnkFmh9TD0Mw3UUQB1U07JTj0skYkoTOG+rkPJn054e39J
	6z0BtCQndYKUcbWTHqiHeEHT15MXZO91Dv4mLaB+dAEpRnLRckO0X3QnFTT9dzUd1e4vMmfVSCu
	CM0F8QsLLrtY2ZaffbQx1JIs49G4NwXQvYnK5VpAjqTjLXGgHCjJS0VecPNnq5uGE3/j2BYGTsT
	mO+RlI0e4kdadMvjYNxOqDlcWFMPAMtZC0u9lE/cFNuYIz13OXd4Nd3zwCuL+48A8Seg=
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr7235626e0c.0.1764609535123;
        Mon, 01 Dec 2025 09:18:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYCJada/0RSlX4x+VUaXaxIlUA7b0rcGI56yLg/SM6B1iQRkieH8uQ3kyk9rp6imMAf4/iSQ==
X-Received: by 2002:a05:6122:8b8b:b0:55b:ac1:d05f with SMTP id 71dfb90a1353d-55b9a9359a9mr7235602e0c.0.1764609534618;
        Mon, 01 Dec 2025 09:18:54 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510508e1sm13023041a12.27.2025.12.01.09.18.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 09:18:54 -0800 (PST)
Message-ID: <577ece85-adf1-41c9-b7a4-ca65e27e6c75@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 18:18:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] media: camss: csiphy: Make CSIPHY status macro
 cross-platform
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20251130-make-csiphy-status-macro-cross-platform-v1-1-334664c6cf70@oss.qualcomm.com>
 <ae056a82-e5d4-4a73-b478-37533ce2e0ed@oss.qualcomm.com>
 <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b9150026-cd87-4bed-8ba1-800e92203a30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J/KnLQnS c=1 sm=1 tr=0 ts=692dce00 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OxG7tpPIUWXr36wslIUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: zwKLJ-YZFiE7GNMDKeZ7n67lXnPaurD_
X-Proofpoint-ORIG-GUID: zwKLJ-YZFiE7GNMDKeZ7n67lXnPaurD_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDE0MSBTYWx0ZWRfX0oKC4NUjVF+2
 pn1/I7B+AXZq+cIDfwWRu6+ezNecgebDt3NbLdR8/FEGM3aq20RtZNpmngovBL7A7AKzPEfDLWF
 Qh1CexBX5uR5pLsVUKT4EsL4erbgTnqi67rova6xJwgbH3IS2Zn+vIyJw+mr/jEBv447N8CvRB8
 Pq8vQSRZ4CWxIGS0qLpbONBQD2eQ9gic4P/+3OXylGgks76vLzHS62pDPQwkF90JOVng6GxdNb0
 FARbAqjBZtRsnmpcXiKKLrqEQ2kwW3pa1TnTRDXEm5ZKjQNQAHuMxbzUIb/1IUs4toxa60V2YoG
 f7R0h4zTswiQS5sZ7o2SEqK1lspQQiLA9atUTwQ922VJcJtmSN+Z6uekD2KPwD8xFyHc1tMiFzV
 RyG+5U2/xsfILvoDYNYivBmaOFRDGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010141

On 12/1/25 3:48 PM, Vijay Kumar Tumati wrote:
> 
> On 12/1/2025 4:20 AM, Konrad Dybcio wrote:
>> On 12/1/25 7:25 AM, Hangxiang Ma wrote:
>>> The current value of '0xb0' that represents the offset to the status
>>> registers within the common registers of the CSIPHY has been changed on
>>> the newer SOCs and it requires generalizing the macro using a new
>>> variable 'common_status_offset'. This variable is initialized in the
>>> csiphy_init() function.
>> "offset" + "common_status_offset" is confusing
>>
>> Let's maybe add some platform data where we store the actual offset of
>> the registers in question and pass a csiphy ptr as an argument
>>
>> Konrad
> Hi Konrad, may be I didn't follow correctly. This is consistent with the way we maintain the other SOC specific reg offsets / data in the CSIPHY driver, in csiphy_device_regs, isn't it? I seem to think it's clearer this way for the reader to see all the offsets at one place. No? Thanks.

I thought this driver was a little more complex.. anyway, big
changes that will make this prettier are coming so this works too in
the meantime

Konrad

