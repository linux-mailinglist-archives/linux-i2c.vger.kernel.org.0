Return-Path: <linux-i2c+bounces-8471-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD59EEEE3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 17:03:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94DFC189249E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 15:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FCC221DBA;
	Thu, 12 Dec 2024 15:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhBa2UBz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ADA21C166
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018999; cv=none; b=Iwm/CLfe/E/As2GluavVTQYKGK8n9XEigfHaL5c5L/j2SfzfAhYbtHrRYb5GMbwybfKoht4J+ehxNBC7mZNrlKrYaLNAkaM/59amhkPIK4ntFIYqNKO0joRRz0Rn6rQpiw5mHtFPUTvq5r52PtXO3IG1Q400k1FVlsYpec8rUO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018999; c=relaxed/simple;
	bh=3C4Yt5oeNRaxZqqS6cTEgAB9qT5fjNpBMGuaoHcL2gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tA0/4Zf1jJ+1mXzYCs7L3F1ddumLjmB1mJBJx3zfPAp/VoEwj+sltgb5QFiyWnmdAq5dTmkGk7KFoafRrHIPKEIXuxnx5QypRLqPz9spJQRW2z1Gyl9bEOkG7CMRHUu7v0uj4PMx3g4PMR/6Dezu6PDr2PuHMAcDMaY/4dalBms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhBa2UBz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC8K3Ou028100
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 15:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3nqq3ds2PAwM46hFlxa1nrVPoI1aem45H25wLz0YZc=; b=GhBa2UBzDWDC9qNH
	PyDoEL6SJBJmonT+danyYZyzmWIv2g9+Oo/nj1/YYmW+uI7BYqeFfTRuWP7DFLNu
	1EeUurdeptMgCP4rArd/ZC9NK1R3thQS2F7WMjA/H4bYAw2641wGvHo8cydmoozp
	nVd/x4kOVwncwO+7CMBvy01BGo41AegqEcvXR4eYTusFPCxILVOaHW1IkEVdsJOi
	lTyYV63/7AWiovZ1aKIuD5AxSIOwyYPklN24lKrjuBmx8ZG4j79g6vwbaXW1Imox
	jHv17FXzLoE+0bSt3YcyH9GiENQmlsZRsXdPWXsbXl/BSztn82I0IcZs+Nxm7h+2
	QrcEDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fd4xuges-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 15:56:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6e5c3a933so4436885a.3
        for <linux-i2c@vger.kernel.org>; Thu, 12 Dec 2024 07:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734018995; x=1734623795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n3nqq3ds2PAwM46hFlxa1nrVPoI1aem45H25wLz0YZc=;
        b=toSeNw0qtgsOI6J5/9Vgxkmx/4654iZqSoO6Z8Rlo9qlsAQP924DcyLPv0hvJeAiY+
         t79EVqcRiLef6WaV7hj/ajoXD4HR5MN5YYwnaAD9tOg6pL52wQatUILXQMUSy6zBxuZN
         rsqWFHVBR6Qwi9NWHe/BSuSi9yRS+hPze7pmCGVAPDT76lh93lYoDHFvEFsUr5dCDkXe
         4HWXDgIf6uQcaVrTMD1lCcu6GuX22aXDv8BVDc3pY0/9vo3kKVDAN8yLZ3k4JyZtX/xn
         +V8mEEOeJkVh118oUHxNEu0cGmodsbiMHuBgazzPztszHLEvZ3KTfmPBSlPOtjqqDnA6
         yOCg==
X-Forwarded-Encrypted: i=1; AJvYcCXSJ+m+VlnMlbl7AHD9AakLfJdACPv/MCQwAoNM8y5jDbT7JdzHSeVH67Lf7JGJKQ16Ok62oOCqp8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA4CHZ9jq594ZJ1g7L8NRLbv06wHaQ/fli9zUL6MX0yZKPpWS+
	mSAcWKDs0AqCEg6ipmVBHrjNJEoTg9hVF6KDmmnPQLBuWVq2O8C1RTy/lBnXowQk6S2KDU4b3LM
	HBxnrHP+PxrqO9ZP25YGlaUvDpoPbSRbklLMmX5+MPfq9nJhfvWSFV4wW3e0=
X-Gm-Gg: ASbGncuakVRbAej2He8fiSwD3QpzVXcIXxhVYXsI9VOiWsP/KFQttOSKPVfwGrqZrZK
	96ZfP2nwbGSjOHtyskfAAEbaII0UrwyuzNBB5SSHO54xtRIGPrg9/Wqsh9TtyCNtatzQi/udYkR
	C47pMjdr4h5rEDWv/8MvLSjTKDsX11nGTD5Nrbx5a8tIFx5yZ8OMTsi3Y8bZRJ6/zPNZKdFoHmB
	psamNJSv7jIplJxQmzRHrSgNgw+SrX0jD5Q4oPBRIQHoAFgm2USg+hUk3pIkWh56dAQssMH4aZF
	/VC67q7iD5tmDBTTjm2kQNlzN9IFvxrhqv8AdA==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5797581cf.0.1734018994477;
        Thu, 12 Dec 2024 07:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHrTTXRfbuepculS9NtXEOABh5da5aY3tMlxBBBwXa+/U6qTkKw/SXlHeil5FX0OuqtidmsCw==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5797071cf.0.1734018993424;
        Thu, 12 Dec 2024 07:56:33 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa683f9a8fbsm626885266b.37.2024.12.12.07.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:56:32 -0800 (PST)
Message-ID: <8ad1db59-9326-461a-ba8e-52891922eb3b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:56:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: neil.armstrong@linaro.org, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Viken Dadhaniya
 <quic_vdadhani@quicinc.com>, andi.shyti@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.or,
        andersson@kernel.org, konradybcio@kernel.org, johan+linaro@kernel.org,
        dianders@chromium.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org
Cc: =quic_msavaliy@quicinc.com, quic_anupkulk@quicinc.com
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <9d5e5b8b-aeaf-4ec8-b34a-8edeaec20037@oss.qualcomm.com>
 <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HabGAc_7yEexzuSv8KOjR7Fy5pZFQ4fG
X-Proofpoint-GUID: HabGAc_7yEexzuSv8KOjR7Fy5pZFQ4fG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120115

On 9.12.2024 3:45 PM, neil.armstrong@linaro.org wrote:
> On 05/12/2024 16:59, Konrad Dybcio wrote:
>> On 4.12.2024 4:03 PM, Viken Dadhaniya wrote:
>>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>>> hardware has traditionally been managed by TrustZone (TZ). This setup
>>> handled Serial Engines(SE) assignments and access control permissions,
>>> ensuring a high level of security but limiting flexibility and
>>> accessibility.
>>>   This limitation poses a significant challenge for developers who need more
>>> flexibility to enable any protocol on any of the SEs within the QUP
>>> hardware.
>>>   To address this, we are introducing a change that opens the firmware
>>> loading mechanism to the Linux environment. This enhancement increases
>>> flexibility and allows for more streamlined and efficient management. We
>>> can now handle SE assignments and access control permissions directly
>>> within Linux, eliminating the dependency on TZ.
>>>   We propose an alternative method for firmware loading and SE
>>> ownership/transfer mode configuration based on device tree configuration.
>>> This method does not rely on other execution environments, making it
>>> accessible to all developers.
>>>   For SEs used prior to the kernel, their firmware will be loaded by the
>>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>>> Additionally, the GSI firmware, which is common to all SEs per QUPV3 core,
>>> will not be loaded by Linux driver but TZ only. At the kernel level, only
>>> the SE protocol driver should load the respective protocol firmware.
>>
>> I think this is a great opportunity to rethink the SE node in general.
>>
>> Currently, for each supported protocol, we create a new node that
>> differs in (possibly) interconnects and pinctrl states. These are really
>> defined per-SE however and we can programmatically determine which ones
>> are relevant.
>>
>> With the growing number of protocols supported, we would have to add
>> 20+ nodes in some cases for each one of them. I think a good one would
>> look like:
>>
>> geni_se10: serial-engine@abcdef {
>>     compatible = "qcom,geni-se";
>>
>>     reg
>>     clocks
>>     power-domains
>>     interconnects
>>     ...
>>
>>     status
>>
>>     geni_se10_i2c: i2c {
>>         // i2c-controller.yaml
>>     };
>>
>>     geni_se10_spi: spi {
>>         // spi-controller.yaml
>>     };
>>
>>     ...
>> }
>>
>> Or maybe even get rid of the subnodes and restrict that to a single
>> se-protocol = <SE_PROTOCOL_xyz> property, if the bindings folks agree.
>>
>> We could extend the DMA APIs to dynamically determine the protocol
>> ID and get rid of hardcoding it.
>>
>> And then we could spawn an instance of the spi, i2c, etc. driver from
>> the GENI SE driver.
> 
> How/where would you add the peripheral subnodes ? A Serial Engine can only be a
> single type on a board, but I agree we could have a "generic" serial engine node
> that would be differenciated in the board DT with the protocol, and use the bindings
> yaml checked to properly check the subnodes/properties depending on the protocol
> property.
> 
> But we would still need all the serial nodes in the SoC DT.

Correct, but NUM_PROTOCOLS times less. NUM_PROTOCOLS is 3 upstream as
of right now, but it's much higher in general (which will trickle
upstream one day or another).

> 
> This may make the software support harder, meaning we would either need to
> have the same compatible probed in sequence from the i2c/spi/uart driver until
> one matches the protocol, or have the qup driver spawn an auxiliary device.

No, just read back the protocol id from hardware (if the SE is running), or
from some DT property (if we need to load the FW ourselves).

Then, based on that, we can call

platform_device_register_data(dev, "geni_i2c", ...) 

(or similar)

> Honestly, not sure it would be much simpler...

Not sure if I'm happy to maintain NUM_QUPs * NUM_SEs * NUM_PROTOCOLS DT nodes,
per each platform separately..

Konrad

