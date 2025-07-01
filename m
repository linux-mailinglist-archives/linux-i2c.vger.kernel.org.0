Return-Path: <linux-i2c+bounces-11733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8A6AEF93C
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C0FC7B1658
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 657D2273D93;
	Tue,  1 Jul 2025 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mQo39pa/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AA125B301
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 12:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374361; cv=none; b=neWQs+YRUk0yWrYj6A8BuWZOzM9ha/16qUX+C1zF/VW1ghecUyukiKl9tGa3hG8cBlrkEZFaWjfOMJbmrKi8QB45t32jGeL9WQrsMRCaoUKlHW9I5HIPs/gYQvIM7GJtHmo1qwUiY/OxPxgXxaBof7UnXb+Z2hfnvwN9hIPky6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374361; c=relaxed/simple;
	bh=s6Km9kqmH3MHprC9cKJQioWs2nxJ+6oprPbTLVcSgX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uHOthDzhc9Oh3Z8oYNQ7kwqmslC7FTzRP3HXVGuRSnGa2iVr0zTkXwMx1Rb2GRR/cizRz5BJsWTJ3gMJmARCbmtEy4r51LdIkLjG4h+p9nxiyFnKH+btKC3c0hFmetg8V1XWyOcHJs5Vg3J+PMntmYrW35UwD7Q76zji/xiCHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mQo39pa/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561A32PO025164
	for <linux-i2c@vger.kernel.org>; Tue, 1 Jul 2025 12:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1cPDedYpfvPf50klVd2ABP2QmrtcRgKhFzFC6BNJEE=; b=mQo39pa/TId2IopA
	/ihw15S24Zv6MgtdIVTD4bFPyOQgyHt0ycTmPcyhtkEWFTir1eh4tgUnp19+W9mt
	tTgXMCRICO/yVkwxQz7lJFX5EhjfgUeUEG1k/8tx0p2xbHQeB1nFrrPjnkqeOj91
	+MBPrB+9frrqDu+5nufol6ft7Kru3GgZBh7m0weXNcpm5+MDfoBoU+8V3VNdH16G
	aPQpVrBDeLwkz3qVIl14gxqYaalfJ5YLJEZRInqA+Az+buNpsThHwK2AGUip/Ada
	qSiCloT3fYGNflm9YqxHbynMUm3gs/CiuDfq8Qx4nNViLxPQXrPOjseJtpDvCYiZ
	iIO65g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64p622-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 12:52:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6fb030f541bso16659326d6.1
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 05:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374357; x=1751979157;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1cPDedYpfvPf50klVd2ABP2QmrtcRgKhFzFC6BNJEE=;
        b=cjnj9a+M3DzAjHj/0KskShzRGW3K0MDJY0UA+Z9+svoJLwEMvYQCH5mKMnxg2Vhcal
         m5RrbXTeZbFaWAR3Yo7uMT91yjcPKoMw+8u51TIj/j0MkjPcTCAc8VebgYfoQxerbAf6
         xdznBY0QvjcrI459BOuIGQe3ikNc5gyuhdLIfmED3scFExmsMXLyHvaJ4HAxdFgqqMEz
         ga7OWoTq7noyCIn4hjXCUfHCMY+x+fF+AIhmcmOB509wWEE3GK0Y766A5mGV5RibIHvL
         VLFi5nnHHTAvQG1LBRQmLjF6J2iOqJOi4apT6HIri7v+BOhaW0KMOuuRd5elMr+DeZja
         bGHg==
X-Forwarded-Encrypted: i=1; AJvYcCUST7nrt8kjXDzY/Fvrys4anmg2+H1zv4DrB0sHslWWrZA0zR4fWqFVN3QIK8gsOEVteFkwlJRro2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+iD8ZhWTCX1bai6lzWW0iS2kOGg/swMv4bs+459ddELFeXls7
	0uQpcE+Juq7/uw4mPYN2v1a2HszTzvVs9dKQuBvEUm4ifix1KoiOlZviNs1KJivXdkGX6Tk6m60
	p8NcIP10U139bExux3F8g9Uxx7+zZLVaVa06yXzjkDBlDSRHx4EWWWmruz4MNZczBY9fdNVk=
X-Gm-Gg: ASbGnctlcknshsMfgjY4dvPR9fPuMUVg1D7rgGggeKFq/ohsBOheWwfffU5HwVd/25G
	c+MkBGcz/e2zYihc1SzzJYTTfaA/rpzF9iQ5f0jqZ0dDbAwZVbZ0bqcXWB0abCFOl5bS1QrC5HJ
	NM4tmocv8/gcnZhQywp59QWS5oOC2Q0lNT9Pe960XAM5Kka7UOc4u420jG/uwsLIlhWpQGnWKRw
	K3jw5D/n80JZt0xa2ISzhNuomBJvibOSow9NJRY9r/DyJW11D/mBhsi9IjzNEe9SrSFo5sZt7QF
	sXQtcwkc2D9eLrH42C77azTqoWvbjPj4GlSJUqd8TFogrwQ8nfo/UZN5UlEkOohP/U+/dQHSqzu
	Z0/BV79wF
X-Received: by 2002:a05:620a:1a0a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d467737358mr162009785a.10.1751374357177;
        Tue, 01 Jul 2025 05:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1Wskn5IkTC5clDFY3RNbkUQKyYUech94l/I/soWezJlddzlgn13MTDenGfT9lXqHy6X8jOg==
X-Received: by 2002:a05:620a:1a0a:b0:7c0:b3cd:9be0 with SMTP id af79cd13be357-7d467737358mr162008385a.10.1751374356706;
        Tue, 01 Jul 2025 05:52:36 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ff8b3sm7562620a12.67.2025.07.01.05.52.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:52:36 -0700 (PDT)
Message-ID: <64441b8a-2769-479f-8894-05c4580c96a2@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 14:52:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qup: jump out of the loop in case of timeout
To: Yang Xiwen <forbidden405@outlook.com>, Andi Shyti
 <andi.shyti@kernel.org>,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250616-qca-i2c-v1-1-2a8d37ee0a30@outlook.com>
 <SEYPR02MB55575E3DE3A107D36F5393AD9644A@SEYPR02MB5557.apcprd02.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SEYPR02MB55575E3DE3A107D36F5393AD9644A@SEYPR02MB5557.apcprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6863da16 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8
 a=r0m3sDERyDekZ1TgD0UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA4MSBTYWx0ZWRfX340WQRTkvP/t
 Qa+XAjUzCQtqc/hcxE9EDikcFWRWS1VBCrXG/cy0vQu3GD3k96unIzSQtiL4uwbbGpBwVlBS2I9
 l8mN1JmWRIp05LsuIeYc9fockhOw0RyJu2wszHZkZNRHVWVzm1xE+tlM7C7h8XO0XMVxZ1gKdjl
 +TXsgTYbHZNKWM1doQ9c8TPU8iNaB972jDxn+JZrai9Vw5FIvTusplZV2qdXOwH63zWWp53L/WO
 6QeqJFUOTiSwZE2INT61u943elH4btTDJQlC3axWRUMKmX6Of819kCY0jIJ0iKv7O3UJ96ShttC
 a5Y4xSm5y8ltGcrTHJWjKO41++rsnPWbozUQMVd/WILJ0d2C3N4qPDinfgCKfTUGfF17aupDXoy
 HQUofLStlD+avHC6C+cXQnuogzQE0p9lUuvkS3W9uuJXJt7rPmdHD2+MCQ/TXfn8bo2bEjgc
X-Proofpoint-GUID: ybYmi3FmqzGzgSc4cNsGdTSeFz3nuWnY
X-Proofpoint-ORIG-GUID: ybYmi3FmqzGzgSc4cNsGdTSeFz3nuWnY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010081



On 28-Jun-25 17:58, Yang Xiwen wrote:
> On 6/16/2025 12:01 AM, Yang Xiwen via B4 Relay wrote:
>> From: Yang Xiwen <forbidden405@outlook.com>
>>
>> Original logic only sets the return value but doesn't jump out of the
>> loop if the bus is kept active by a client. This is not expected. A
>> malicious or buggy i2c client can hang the kernel in this case and
>> should be avoided. This is observed during a long time test with a
>> PCA953x GPIO extender.
>>
>> Fix it by changing the logic to not only sets the return value, but also
>> jumps out of the loop and return to the caller with -ETIMEDOUT.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Yang Xiwen <forbidden405@outlook.com>
>> ---
>>   drivers/i2c/busses/i2c-qup.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
>> index 3a36d682ed57..5b053e51f4c9 100644
>> --- a/drivers/i2c/busses/i2c-qup.c
>> +++ b/drivers/i2c/busses/i2c-qup.c
>> @@ -452,8 +452,10 @@ static int qup_i2c_bus_active(struct qup_i2c_dev *qup, int len)
>>           if (!(status & I2C_STATUS_BUS_ACTIVE))
>>               break;
>>   -        if (time_after(jiffies, timeout))
>> +        if (time_after(jiffies, timeout)) {
>>               ret = -ETIMEDOUT;
>> +            break;
>> +        }
>>             usleep_range(len, len * 2);
>>       }
>>
>> ---
>> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
>> change-id: 20250615-qca-i2c-d41bb61aa59e
>>
>> Best regards,
> 
> Ping for review. The original logic error is very clear. This patch is also very small and can be reviewed in a short time.
> 
> If it insists on waiting for the bit to clear, it should not return -ETIMEDOUT then.

'return -ETIMEDOUT' makes sense here, AFAICT

Konrad

