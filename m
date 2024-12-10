Return-Path: <linux-i2c+bounces-8392-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB39EA7B4
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 06:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17E92282A2F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Dec 2024 05:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0349F22616A;
	Tue, 10 Dec 2024 05:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F7wJbo2b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBEC23312A;
	Tue, 10 Dec 2024 05:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733808174; cv=none; b=CJ/wn0/KlnLw2RztblNmmYtD4zN4udEe4124G69N/7qunE61TPMxDtItUgW+3JkIHOS+p7I7g8YYLRUNJTkKCsWSZStJVR9ZGm4zrFprPO/VVaMTBOok1ChHFeVWYOld/6QAivU8gDJN+trzKDWYT/oMT5SQR4Cmxa1PyPTNPN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733808174; c=relaxed/simple;
	bh=zJUBuHFfZ5MhenPpO2nkxGxrUh/tpO38Y2cdDaU6zmI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NkjB0TngA/+pK3yRSSTkeV8xs97eHp46rsshGu2IIkhcBNQMrN0i5q93euJ/u7q0rKT432mPcUr0iWfsZs0GpSyMiExvXCfZk+GZoQeWPQ4lXRlXnwv7aPEaJtvQw0JVpmxumX8mfiTzq2I3QR/Z2e9JaAbYMSaXAH6DIybxsKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F7wJbo2b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BA3ovFe014620;
	Tue, 10 Dec 2024 05:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dP14CTz/69rtTmc+A6xvwGc7j5vxWtLdUQfQ2Wk3Q5Q=; b=F7wJbo2bkHjctD+O
	0Qsc9Xjq9KTkf4BGpWK1KckjHs06Scj7egkW29tZJjIXPt8sDEfEez1D6Lpt6fdn
	oD/qUxvZPapGc0+xVGuTpDR2JRXRD4AvOzEEGCftrJz31nAkVdfh4anj1XQhHaNr
	+odhibYqaetX/uUVtaqtSc+yoa6+rHUQ3aWE+CV9BAh49dEHVRis4wQC/i3nU1VK
	AAd6U6OeLyIS+6vScgP0QW8ILrar/DF2wZ4ALTMniLFKBMjuwQSPuhKqt+p9wK1v
	AuMS0Ser1gODngAvrAkj1RdVPdI//9MIwwb6+YDqPvDBVtAM1ImCdF+CSwHypAzB
	br5RpA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ee3n85sd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:22:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA5MkUw021716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 05:22:46 GMT
Received: from [10.216.2.81] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 21:22:40 -0800
Message-ID: <95a64663-2e48-400d-b4e9-a99e18e62825@quicinc.com>
Date: Tue, 10 Dec 2024 10:52:37 +0530
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/7] Add support to load QUP SE firmware from
To: <neil.armstrong@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        <andi.shyti@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <gregkh@linuxfoundation.org>,
        <jirislaby@kernel.org>, <broonie@kernel.or>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <johan+linaro@kernel.org>,
        <dianders@chromium.org>, <agross@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>
CC: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        <quic_anupkulk@quicinc.com>
References: <20241204150326.1470749-1-quic_vdadhani@quicinc.com>
 <9d5e5b8b-aeaf-4ec8-b34a-8edeaec20037@oss.qualcomm.com>
 <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Language: en-US
From: Viken Dadhaniya <quic_vdadhani@quicinc.com>
In-Reply-To: <42b1c187-e924-4690-8338-4c694f3e16d9@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: t4JlOE0tJ5BqbHKQrbJxi6tQ0uA6ctZ3
X-Proofpoint-ORIG-GUID: t4JlOE0tJ5BqbHKQrbJxi6tQ0uA6ctZ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412100038



On 12/9/2024 8:15 PM, neil.armstrong@linaro.org wrote:
> On 05/12/2024 16:59, Konrad Dybcio wrote:
>> On 4.12.2024 4:03 PM, Viken Dadhaniya wrote:
>>> In Qualcomm SoCs, firmware loading for Serial Engines (SE) in the QUP
>>> hardware has traditionally been managed by TrustZone (TZ). This setup
>>> handled Serial Engines(SE) assignments and access control permissions,
>>> ensuring a high level of security but limiting flexibility and
>>> accessibility.
>>> This limitation poses a significant challenge for developers who need 
>>> more
>>> flexibility to enable any protocol on any of the SEs within the QUP
>>> hardware.
>>> To address this, we are introducing a change that opens the firmware
>>> loading mechanism to the Linux environment. This enhancement increases
>>> flexibility and allows for more streamlined and efficient management. We
>>> can now handle SE assignments and access control permissions directly
>>> within Linux, eliminating the dependency on TZ.
>>> We propose an alternative method for firmware loading and SE
>>> ownership/transfer mode configuration based on device tree 
>>> configuration.
>>> This method does not rely on other execution environments, making it
>>> accessible to all developers.
>>> For SEs used prior to the kernel, their firmware will be loaded by the
>>> respective image drivers (e.g., Debug UART, Secure or trusted SE).
>>> Additionally, the GSI firmware, which is common to all SEs per QUPV3 
>>> core,
>>> will not be loaded by Linux driver but TZ only. At the kernel level, 
>>> only
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
> How/where would you add the peripheral subnodes ? A Serial Engine can 
> only be a
> single type on a board, but I agree we could have a "generic" serial 
> engine node
> that would be differenciated in the board DT with the protocol, and use 
> the bindings
> yaml checked to properly check the subnodes/properties depending on the 
> protocol
> property.
> 
> But we would still need all the serial nodes in the SoC DT.
> 
> This may make the software support harder, meaning we would either need to
> have the same compatible probed in sequence from the i2c/spi/uart driver 
> until
> one matches the protocol, or have the qup driver spawn an auxiliary device.
> 
> Honestly, not sure it would be much simpler...
> 

Agree Neil, it has it's own challenges in terms actual code changes per 
driver and common driver redesign when we move the SE nodes and make it 
common. We may come up with some solution to make one SE DTSI node for 
all protocols having different (pinctrl configuration, DMA 
configuration) but it's also going to add some level of code 
complexities and yaml changes.
Can we exclude this design change for this firmware loading and later 
align to this new design change ?

> Neil
> 
>>
>> Konrad
>>
> 

