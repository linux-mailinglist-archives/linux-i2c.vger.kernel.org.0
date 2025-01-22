Return-Path: <linux-i2c+bounces-9151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5264DA19818
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 18:53:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7F0C7A41CA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Jan 2025 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54E8215169;
	Wed, 22 Jan 2025 17:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hDpEz7MQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED47B212D65;
	Wed, 22 Jan 2025 17:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737568399; cv=none; b=ZpdU0AAiD+0rSJ3XaFGbZ16a7MRq3dsg/ZHj2BwkkoOFdzrXrn0w9oajTBaL9i/mSa02S7LKOQnUkwZUJuiMl95T/46595VuVz1VWFzIHv2Nqu9wczNu9j5pJru3/nLT/Te3cBRdWKqqjhw+1mv85jkmCsqRqH2/SFbn8Bt+3Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737568399; c=relaxed/simple;
	bh=Z+5gZtne44q0YMTpC2u70HuVtYm8sZKPXO3aVOZnLKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iecWMMuQhb9z2OvjKE1/3olI+uPRQecKI7/g5lR2VV3qrdqWekBE+UOaF3zzhC0AKcIUb1avsRtdKCN/hjRMO2D2F6BdXPJssRUOYX5vaH6SBcg9oAAAMlKBrU4ureCgw/tOauJeOKREhink7nXbLPShFlTwOxT19f6y2BMvdys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hDpEz7MQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MABm5W024635;
	Wed, 22 Jan 2025 17:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LmLs7WybEVpW/PC2uDnZrzP0C9ObxBpW7g22hCyhug8=; b=hDpEz7MQlsdqqgiD
	4WA1XqUmL1tAU3QFx3ASblkp/z+eP0fGOHVRFBxdaDcynwdTUDI/Z+kxvTZycUT/
	In2LXIXqqVuTvLylStUopFhR1nu49iO3MxmQbNNSN5a6cvI0ONUc9oPP29mj6wUR
	x29gVEdqAE/fCzJPhaXFdRizQ3Ve+6rw59i0dHsyvYAZCXHrEzcZ3/0yxKlpR56h
	hPJlIcPtEHiy0g2KwZcpCTwbJFHHcQHoEbQd92Pjf+50JUkn8qq0Wt7J3WFPWffI
	AZ0tdt9lMYTxaMuxwp5NvUcQiZe8Qg2zsjVxs/kjzSn5Pb8zouKMVZMJ3W1k0X9T
	+3aVww==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44axq6h3sc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 17:53:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50MHr8De000636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 17:53:08 GMT
Received: from [10.216.26.78] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 22 Jan
 2025 09:53:00 -0800
Message-ID: <04bee338-2828-44e2-9ee8-8a94b4433ca9@quicinc.com>
Date: Wed, 22 Jan 2025 23:22:57 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: Caleb Connolly <caleb.connolly@linaro.org>,
        Viken Dadhaniya
	<quic_vdadhani@quicinc.com>, <andi.shyti@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <jirislaby@kernel.org>,
        <broonie@kernel.or>, <andersson@kernel.org>, <konradybcio@kernel.org>,
        <johan+linaro@kernel.org>, <dianders@chromium.org>,
        <agross@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-serial@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
CC: <quic_anupkulk@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <66fb0c6d-472c-4131-bd25-83266cf497e4@linaro.org>
 <17138798-b72b-4e78-8fad-419e1a63fa5b@quicinc.com>
 <56ef1276-9d58-4a94-ae89-5faf5870c10c@linaro.org>
Content-Language: en-US
From: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
In-Reply-To: <56ef1276-9d58-4a94-ae89-5faf5870c10c@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ra9ZqRO8hX-60US13JsBtFzDJEaPRYtW
X-Proofpoint-ORIG-GUID: ra9ZqRO8hX-60US13JsBtFzDJEaPRYtW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_08,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220131

Hi Caleb, we shall update for latest ask and will check how to enable 
validation on required board.

On 1/22/2025 8:53 PM, Caleb Connolly wrote:
> Hi Mukesh,
> 
> On 10/01/2025 07:56, Mukesh Kumar Savaliya wrote:
>> Thanks Caleb for your testing and sharing results. Since Viken is on
>> leave, i am following on this.
>>
>> On 1/7/2025 4:55 PM, Caleb Connolly wrote:
>>> Hi Viken,
>>>
>>> On 04/12/2024 16:03, Viken Dadhaniya wrote:
>>>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>>>> hardware has traditionally been managed by TrustZone (TZ). This setup
>>>> handled Serial Engines(SE) assignments and access control permissions,
>>>> ensuring a high level of security but limiting flexibility and
>>>> accessibility.
>>>>    This limitation poses a significant challenge for developers who
>>>> need more
>>>> flexibility to enable any protocol on any of the SEs within the QUP
>>>> hardware.
>>>>    To address this, we are introducing a change that opens the firmware
>>>> loading mechanism to the Linux environment. This enhancement increases
>>>> flexibility and allows for more streamlined and efficient management. We
>>>> can now handle SE assignments and access control permissions directly
>>>> within Linux, eliminating the dependency on TZ.
>>>>    We propose an alternative method for firmware loading and SE
>>>> ownership/transfer mode configuration based on device tree
>>>> configuration.
>>>> This method does not rely on other execution environments, making it
>>>> accessible to all developers.
>>>>    For SEs used prior to the kernel, their firmware will be loaded by the
>>>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>>>> Additionally, the GSI firmware, which is common to all SEs per QUPV3
>>>> core,
>>>> will not be loaded by Linux driver but TZ only. At the kernel level,
>>>> only
>>>> the SE protocol driver should load the respective protocol firmware.
>>>
>>> I gave this series a spin on the RB3 Gen 2 with U-Boot.
>>>
>> Is it possible to try on RB8 board ? Because that's where this support
>> is enabled. It also needs respective TZ configuration to allow FW
>> loading from Linux.
> 
> I don't have access to RB8, so no... This support will also be useful on
> RB3 Gen 2 for U-Boot support, can the next tz release for this platform
> include the necessary changes?
Let us evaluate and review TZ configs and changes. This was meant for 
only development boards. I will check internally and review for RB3 Gen2 
and update.
>>
>>
>>> After fixing the compilation errors, it seems like there is a consistent
>>> hard crash (the board freezes and resets) at some point during i2c
>>> controller init with this series.
>>>
>> Can you please share exact repro steps ? We can try locally and check
>> what's wrong and also review in future how we make it working for U-boot
>> combination.
> 
> If it's true that tz changes are needed that would certainly explain the
> crash.
> 
yes
> Unfortunately it isn't currently possible to boot QC Linux via U-Boot
> since the ESP uses a 512 byte sector size on 4k block size UFS which is
> not supported.
> 
> If you build an image with a correct ESP (mkfs.vfat -S 4096) then you
> can boot U-Boot from upstream by following the RB3 Gen 2 documentation
> 
We need to check this and update back.
> https://docs.u-boot.org/en/latest/board/qualcomm/rb3gen2.html
> 
> You'll also need to apply this patch to fix a boot regression
> https://lore.kernel.org/u-boot/20250122-qcom-parse-memory-updates-v2-0-98dfcac821d7@samcday.com/
> 
> On the Linux/DTS side, apply this series, add the appropriate properties
> to enable fw loading as-per the dt-bindings added by this series and
> place the qupv3fw.elf file.
> 
Sure, got it.
> Kind regards,
>>> I noticed a similar issue with this same logic implemented in U-Boot.
>>>
>>> Could you clarify which xfer mode is appropriate for the i2c controllers
>>> on the RB3 Gen 2 and maybe give this a try yourself, or let me know what
>>> other info you'd need to debug this.
>>>
>> Yes, please share the procedure , we will try internally.
>> is there any DTSI change done as part of your testing ?
>>> Thanks and kind regards,
>>>>
>>>> Viken Dadhaniya (7):
>>>>     dt-bindings: i2c: qcom,i2c-geni: Document DT properties for QUP
>>>>       firmware loading
>>>>     spi: dt-bindings: Document DT properties for QUP firmware loading
>>>>     dt-bindings: serial: Document DT properties for QUP firmware loading
>>>>     soc: qcom: geni-se:: Add support to load QUP SE Firmware via Linux
>>>>       subsystem
>>>>     i2c: qcom-geni: Load i2c qup Firmware from linux side
>>>>     spi: geni-qcom: Load spi qup Firmware from linux side
>>>>     serial: qcom-geni: Load UART qup Firmware from linux side
>>>>
>>>>    .../bindings/i2c/qcom,i2c-geni-qcom.yaml      |  11 +
>>>>    .../serial/qcom,serial-geni-qcom.yaml         |  12 +
>>>>    .../bindings/spi/qcom,spi-geni-qcom.yaml      |  11 +
>>>>    drivers/i2c/busses/i2c-qcom-geni.c            |  11 +-
>>>>    drivers/soc/qcom/qcom-geni-se.c               | 445 ++++++++++++++++++
>>>>    drivers/spi/spi-geni-qcom.c                   |   7 +-
>>>>    drivers/tty/serial/qcom_geni_serial.c         |   7 +-
>>>>    include/linux/soc/qcom/geni-se.h              |  17 +
>>>>    include/linux/soc/qcom/qup-fw-load.h          | 179 +++++++
>>>>    9 files changed, 692 insertions(+), 8 deletions(-)
>>>>    create mode 100644 include/linux/soc/qcom/qup-fw-load.h
>>>>
>>>
>>
> 


