Return-Path: <linux-i2c+bounces-8152-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 296999D5FD8
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 14:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDF00282F50
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9411CD1F;
	Fri, 22 Nov 2024 13:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ML4U6GSH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7281CA9C
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732282985; cv=none; b=Sp3l8rfBj1yHSiL06zni24CKsXnUKtiytLLEFDEF1MgoCBHxwOU8asBMlsbdcFrCDOYpagklXRgzAd8YLIroJjgcQFOxu/T/gFgXKef41rN/U0vj6L7HK17xfx4B7uiCJIg8A/ikb7GI/+qt0bDA6Bfi6YySv+A0l15o+ufaw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732282985; c=relaxed/simple;
	bh=mUBMZZqal/zQohdwT6EZNdZQME9eFfnneurHUwJz3TQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DsgOr/NAjTtd14rJXkJz7lYxdbELnx5QkHLpxo0MUZSnZnzMYYJysZUVAqDVYi9djC3dsTgekDIVn1gDuSJrwHBJTTRfxauYPssReQnH/A4nlvDObpghW+Kc1EhPbG2O2XKwasw5kzk3HQR9mqlTpT4ZdtZLiZKk45TtbJ56OCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ML4U6GSH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AMA6jGf027595
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:43:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I4jyN5sgIKsB6Ac+agW1/Q5Zjbq+xV9LLsj7FAcZutI=; b=ML4U6GSH7KJo9+Tw
	F9GXRdZUv/op0bnfOvkSwFo0X4ry/+IvNlonZWWRAIfd1Usjg5s5n1tpsjLfPm6/
	rTj7uZ8KOMfhmfzvTVfKz/pboODFFFpgtJGlmfiZ/IBg+cnimCw4nwu1T0FC/LN6
	I8EbmDDRUoCRdzmIe3LbsZDW3HmpqBDqv4mag3pMzxPS9pXgGwJ+pJ92U/J1guWS
	jHICk46wAJLHuCXZ6a2OLsrqTUxz7qdpxfaqEYOv0JhwtCwfgQxv63z2KnClapNH
	jFBziL0CC5QeSfGvbD6GT9t62JfoxEG5bsPpvfR4JhfZeecGNjHNuaXVfm612gGt
	Bzkccw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432d5b2346-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 13:43:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4608a761cb2so4789271cf.3
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 05:43:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732282981; x=1732887781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4jyN5sgIKsB6Ac+agW1/Q5Zjbq+xV9LLsj7FAcZutI=;
        b=lMOrpwh9iuQdG24g/nksgqJYYGQEeDO81LpzUmbJjuuz2B2U1HvJGRlgDnkg9tV/om
         FzyF1i8U94BRBOYXz7WzKKhovDfIUJYPGFB834wh0G2QLRSI2X5i/kETRU5wAhujdJyv
         T10Hod+pxATFisNInci6yDgtXZthQuHxi8kzgOq7bUy3Khqgd0ilTS/GoL1y2u8IBLnJ
         +4DbVib7shr8oeX2zfXrIyjehU8reQwnXcxCu4VzFvNbwKqxYolfcw/8WQlevLpXRTMt
         sJ8qD2aAVUU3WgrfoHWD0i50iyyU7P2ulJkN262oaZYPhdnY3bo4Flh3xGD4mVkcFyU7
         kW8w==
X-Forwarded-Encrypted: i=1; AJvYcCWnbPx3Ir4ErhsTM2EkF3KuXI3Xl6p9dxIUlz5kWmXmFx5cjKEWW0dJMgKe4+U6Co7KwSaBtohLGHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2CaUVmYygCXBa8LHVX9GCSGSx3UeOfYyiR3qRhcM1lFI2xbDe
	VX4U4in7McywsQkFMCnwhO6tTtvKqEujCNAJ6J1so048W6OfSMgbQueU0FVLgIXV3ILTgRQx7bq
	RWJ3fXK7bJwhU++NbEU5hANjdICIE7CUIXoYHcSHuRPtYaxD56jNHSLZMFHE=
X-Gm-Gg: ASbGncvPIwgi4GPqgSNSIY+D9T3ajHkf6oGKqjnZtjd/VuSljb8wnSQdN269NYWStUB
	bChKKv9zRfPGk7WmBmeXMD5uC13fIghpy/S5RsDW8WqNcy0MyCnuejMly9KX7KovhiMR7r9ekRV
	j8gX8qCg7ZCZAuEHcrnCGf+HkrT4dZlNjwE4Tu8jBvmYV3xnnw0MLPFk40NAEfVemeWSAuUv3en
	2VdRyT4OPWRVjmJsJvjy/5bsj7xkNoAUf7GoEfsPpegwqWHZYwr1Vym1+tV/B0pNZxPUISia76P
	KyGI3pjVWlc8rFC2QLqff8MdfTg8z3Y=
X-Received: by 2002:a05:620a:4593:b0:79f:70f:ee0b with SMTP id af79cd13be357-7b5144c18admr171826885a.6.1732282981182;
        Fri, 22 Nov 2024 05:43:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6qWdpFprMy+djvMsdCITWGkdx6i8r/hwcoEINJOKRyzD0W2OkpAMxFf70grZjlw3X3/R3nQ==
X-Received: by 2002:a05:620a:4593:b0:79f:70f:ee0b with SMTP id af79cd13be357-7b5144c18admr171823385a.6.1732282980786;
        Fri, 22 Nov 2024 05:43:00 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d01d41af2esm939297a12.84.2024.11.22.05.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 05:42:59 -0800 (PST)
Message-ID: <8508988c-a74b-4f65-8060-30a0cb5afa64@oss.qualcomm.com>
Date: Fri, 22 Nov 2024 14:42:56 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] i2c: i2c-qcom-geni: Enable i2c controller sharing
 between two subsystems
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        konrad.dybcio@linaro.org, andersson@kernel.org, andi.shyti@kernel.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        conor+dt@kernel.org, agross@kernel.org, devicetree@vger.kernel.org,
        vkoul@kernel.org, linux@treblig.org, dan.carpenter@linaro.org,
        Frank.Li@nxp.com, konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: quic_vdadhani@quicinc.com
References: <20241113161413.3821858-1-quic_msavaliy@quicinc.com>
 <20241113161413.3821858-5-quic_msavaliy@quicinc.com>
 <37762281-4903-4b2d-8f44-3cc4d988558d@oss.qualcomm.com>
 <cbbb78c9-54ec-453a-92ec-6b174bd3d9cb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cbbb78c9-54ec-453a-92ec-6b174bd3d9cb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ec5fCI-Fr3iyy8n41lVcdzT0xw5lW1Nw
X-Proofpoint-ORIG-GUID: Ec5fCI-Fr3iyy8n41lVcdzT0xw5lW1Nw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220115

On 18.11.2024 6:45 AM, Mukesh Kumar Savaliya wrote:
> Thanks for the review konrad !
> 
> On 11/16/2024 12:58 AM, Konrad Dybcio wrote:
>> On 13.11.2024 5:14 PM, Mukesh Kumar Savaliya wrote:
>>> Add support to share I2C controller in multiprocessor system in a mutually
>>> exclusive way. Use "qcom,shared-se" flag in a particular i2c instance node
>>> if the usecase requires i2c controller to be shared.
>>
>> Can we read back some value from the registers to know whether such sharing
>> takes place?
> Actually, HW register doesn't provide such mechanism, it's add on feature if SE is programmed for GSI mode.

So it's more of an unwritten contract between subsystems.. okay

>>
>>> Sharing of I2C SE(Serial engine) is possible only for GSI mode as client
>>> from each processor can queue transfers over its own GPII Channel. For
>>> non GSI mode, we should force disable this feature even if set by user
>>> from DT by mistake.
>>
>> The DT is to be taken authoritatively
>>
> To clarify - Does it mean i should not have SW disable this feature OR override  ? And let it continue in non GSI mode even it's not going to work ?

If a configuration is invalid, you should return -EINVAL from probe,
with an appropriate error message.

>>>
>>> I2C driver just need to mark first_msg and last_msg flag to help indicate
>>> GPI driver to take lock and unlock TRE there by protecting from concurrent
>>> access from other EE or Subsystem.
>>>
>>> gpi_create_i2c_tre() function at gpi.c will take care of adding Lock and
>>> Unlock TRE for the respective transfer operations.
>>>
>>> Since the GPIOs are also shared between two SS, do not unconfigure them
>>> during runtime suspend. This will allow other SS to continue to transfer
>>> the data without any disturbance over the IO lines.
>>>
>>> For example, Assume an I2C EEPROM device connected with an I2C controller.
>>> Each client from ADSP and APPS processor can perform i2c transactions
>>> without any disturbance from each other.
>>>
>>> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
>>> ---
>>
>> [...]
>>
>>>       } else {
>>>           gi2c->gpi_mode = false;
>>> +
>>> +        /* Force disable shared SE case for non GSI mode */
>>> +        gi2c->se.shared_geni_se = false;
>>
>> Doing this silently sounds rather odd..
> we can have Some SW logging added ?

Normally such overrides mandate a warning/notice, but as I said above,
we should disallow such combinations altogether for sanity

Konrad

