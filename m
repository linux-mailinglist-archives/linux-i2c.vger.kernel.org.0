Return-Path: <linux-i2c+bounces-3215-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ABD8B3832
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 15:19:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2361C21FD3
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Apr 2024 13:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF9E146D6A;
	Fri, 26 Apr 2024 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RQdBV/do"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E8614534D;
	Fri, 26 Apr 2024 13:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137536; cv=none; b=PpRQBreMLYm53Cpvn8GZNShcWLFKiFsWyyPZ2m8o8ssUycfE8mOIitiEeiV6sPWgobKNy6pj5ZOywNiysPHROXJ/tP0+mDEKB0h6OhyKyFu9ymIpb/GLiqYXHLAsxC2rQBcD1K4e1kKpx6Yb1pD1UegFMWgxY77Qm2gmsOH0dZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137536; c=relaxed/simple;
	bh=yWE+ttufnExZvjogvzn8tpejiQGA2e3xg4IUK5utLwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZL6LpjLh+RjLoN3xVgDssOoU5CaK8RNy/jhGWpCVuvXuSMT0ms44j9H1vB6Kyuw1fxhPQ65Iv8u5ZlN8iTcSeTuaCGppjmTjwn5A+BxWQ/m3iJs5zwxFskCPNdEp3jgmzPyiE7fhAW3WO91L5yS+OR9XzkcSYWOlFfPSAjeIJKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RQdBV/do; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43QD2P2f001930;
	Fri, 26 Apr 2024 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uKWwDy3euRIoufHbpxxpLBVh4pEua2CnzSZQLEb4Da0=;
 b=RQdBV/doof/uoJZGXgvJ9ODmZQXusXNHDgnw63OH2x/B9hznPk3wPWrlIjCdSihYS1Jp
 13acRWgFXY3/6+yiTYrWy/1zfT8KoH9TnsJKegRoRUomPNjdoy3ujkrlOKgKk/vMIMGh
 rG0ilbPNwRtQDOm+Z+bj8HPili0M51rf0Q9LMQu8sz5narRKPwnwf37C9lmAOvGpOBlC
 lxgIKm80X7rpTeFw54JEWSzT6a6rtOv0uCx5Vf1Xn46vQ2LgGye57GuRWhY2eh1xDv3w
 yVykzraxQ3wSgB13unGDiBRw4AnnnljCCffZBULY98ww66TRGcys0HGx2UbZcvrMVGuq Lg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xrct281df-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:18:30 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43QBGxtR028315;
	Fri, 26 Apr 2024 13:18:29 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xmtr2ydrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Apr 2024 13:18:29 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43QDIRgJ39912114
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 26 Apr 2024 13:18:29 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8F935806B;
	Fri, 26 Apr 2024 13:18:26 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5C885805E;
	Fri, 26 Apr 2024 13:18:26 +0000 (GMT)
Received: from [9.61.156.17] (unknown [9.61.156.17])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 26 Apr 2024 13:18:26 +0000 (GMT)
Message-ID: <a608377b-3e51-4b59-bdab-8c4e9938f086@linux.ibm.com>
Date: Fri, 26 Apr 2024 08:18:26 -0500
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] ARM: dts: aspeed: Add IBM P11 FSI devices
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-aspeed@lists.ozlabs.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org, lakshmiy@us.ibm.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au,
        andrew@codeconstruct.com.au
References: <20240425213701.655540-1-eajames@linux.ibm.com>
 <20240425213701.655540-13-eajames@linux.ibm.com>
 <dc106aa2-8f69-4f71-ad9f-6dfb97c63a50@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <dc106aa2-8f69-4f71-ad9f-6dfb97c63a50@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nzBF7T9WLVCzq23lSs6Hjb_rIEPJFTGY
X-Proofpoint-GUID: nzBF7T9WLVCzq23lSs6Hjb_rIEPJFTGY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-26_12,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 adultscore=0 impostorscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404260088


On 4/26/24 01:31, Krzysztof Kozlowski wrote:
> On 25/04/2024 23:36, Eddie James wrote:
>> Add the P11 FSI device tree for use in upcoming BMC systems.
>> Unlike P10, there is no system with only two processors, so
>> only the quad processor FSI layout is necessary.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   .../arm/boot/dts/aspeed/ibm-power11-quad.dtsi | 1696 +++++++++++++++++
>>   1 file changed, 1696 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
>>
>> diff --git a/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
>> new file mode 100644
>> index 000000000000..c3a0ecf12aa0
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/aspeed/ibm-power11-quad.dtsi
>> @@ -0,0 +1,1696 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +// Copyright 2024 IBM Corp.
>> +
>> +&fsim0 {
> This does not make sense. You do not include any file here, so what do
> you want to override?
>
> How can you even test this file?


This is an include file, to be included in the new device tree files in 
the next two patches. It will be tested as part of those. Andrew 
requested I split this up, and I have to add this one first, even though 
nothing is referencing it yet. The same model is used for the P10 FSI 
devices.


>
>> +	status = "okay";
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <0>;
>> +
>> +	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
>> +
>
>> +
>> +&cfam3_i2c16 {
>> +	fsi-i2cr@20 {
>> +		compatible = "ibm,i2cr-fsi-master";
>> +		reg = <0x20>;
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cfam@0,0 {
>> +			reg = <0 0>;
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +			chip-id = <0>;
>> +
>> +			scom416: scom@1000 {
>> +				compatible = "ibm,i2cr-scom";
>> +				reg = <0x1000 0x400>;
>> +			};
>> +
>> +			sbefifo416: sbefifo@2400 {
>> +				compatible = "ibm,odyssey-sbefifo";
>> +				reg = <0x2400 0x400>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&cfam3_i2c17 {
> This looks randomly ordered.


Not sure what you mean. Everything is sequentially ordered?


>
>
>> +&fsi_occ1 {
>> +	reg = <2>;
>> +};
>> +
>> +&fsi_occ2 {
>> +	reg = <3>;
>> +};
>> +
>> +&fsi_occ3 {
>> +	reg = <4>;
>> +};
>> +
>> +/ {
> Nope. Root node never goes to end of file. Look at all modern DTS.


Ack.


>
>> +	aliases {
>> +		i2c100 = &cfam0_i2c0;
>> +		i2c101 = &cfam0_i2c1;
>> +		i2c110 = &cfam0_i2c10;
>> +		i2c111 = &cfam0_i2c11;
>> +		i2c112 = &cfam0_i2c12;
>> +		i2c113 = &cfam0_i2c13;
>> +		i2c114 = &cfam0_i2c14;
>> +		i2c115 = &cfam0_i2c15;
>> +		i2c202 = &cfam1_i2c2;
>> +		i2c203 = &cfam1_i2c3;
>> +		i2c210 = &cfam1_i2c10;
>
>
> Best regards,
> Krzysztof
>

