Return-Path: <linux-i2c+bounces-8554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C77249F3D74
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 23:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDB7188F851
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 22:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569721D63DD;
	Mon, 16 Dec 2024 22:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Nyb8/uIg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996C21C3C04;
	Mon, 16 Dec 2024 22:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734388098; cv=none; b=rsCBaF1qDxAJf9unx08WECktGOkZIlrpiqEm4LpuGL3zSmSLrwro73DsoJ047tW6kJkYQh00Df1wRLw7dhj9pQD77j8yjwdXOX1Avc/ESZpofQEyDnGw77ZfcVYCvHR4JnV5cWQkl0PNJTndwuiTdJu8nrZPxX/HjkyhamuErI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734388098; c=relaxed/simple;
	bh=BchgCZSTz5otN9tUx9euPmpFn6JLf22aQRkS2L0H2x0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZoU36MWLEju/QHyOe+5TfZXcc4z2ZuenE32/053iDTaFo4MInytKdjeFtrHhvAnbyyPaO/1us8w7oDfnca8pv/4ZlpIUgVMCN6KMgHJK3B74mE2GEkTw3bdlcN9NrNvDilfrjflqeh1SYWg6mgWpLD5nC/scfWlqPBQSSCm2gsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Nyb8/uIg; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGEhWhn022843;
	Mon, 16 Dec 2024 22:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=XexS5E
	E03A2kFOO1RC4vOyWubIQY+mIHYfLpVdjzVl4=; b=Nyb8/uIg0lov8QWWAhi6ym
	fJhH8v7Tr+FdNv8NbmGcSlBnn0wkGgelfj0TeTmav5XbgPNaw0PfQDBEj1Uk64Eu
	TvbnaK+lzqiUtgAgvJ3w9kNhzhA+h3uMRWdQe23k4WjA5iOecK1QVgxCOvNGJIL8
	OMjIc03td2D6JzzyLXg/ilRiw05VL4i1mLTyi3QpyUFdq4SNzyo99cAVQ4CzIDYs
	5/dZgTPF2qQyc2vMDZre7UzzgOenAPNP0H2nhnEiG31kHwnXfUbMTehMBOHQcK9J
	9R80g6sBlbt9ZXzec8P3PW7mtLuBNaWghNPBNf0tmL5XgJEJdGppbJqeNcCTmOOA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgw1v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:27:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGMBIIP021984;
	Mon, 16 Dec 2024 22:27:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpgw1uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:27:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGLDT7L014340;
	Mon, 16 Dec 2024 22:27:39 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqy04sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 22:27:39 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGMRcYI18219554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 22:27:38 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A4A95805F;
	Mon, 16 Dec 2024 22:27:38 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD8BA58051;
	Mon, 16 Dec 2024 22:27:35 +0000 (GMT)
Received: from [9.61.165.36] (unknown [9.61.165.36])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 22:27:35 +0000 (GMT)
Message-ID: <d75e72a8-6bd5-4929-a8bb-e1b13fd7d3b8@linux.ibm.com>
Date: Mon, 16 Dec 2024 16:27:35 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Add support for Intel CRPS PSU
To: Guenter Roeck <linux@roeck-us.net>, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
        corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
        Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org,
        peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
        naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
        patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
        peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
References: <20241216175044.4144442-1-ninad@linux.ibm.com>
 <c64bb634-46d4-486a-8743-699775326058@roeck-us.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <c64bb634-46d4-486a-8743-699775326058@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GST_I0viN8YQt3jOs4JP1EhREbfu_C3_
X-Proofpoint-ORIG-GUID: Y5LYT8Ng54jd9v0EuHcH24-ljTCPN46c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160181

Hi Guenter,

Thanks for the review.

On 12/16/24 12:48, Guenter Roeck wrote:
> On 12/16/24 09:50, Ninad Palsule wrote:
>> Hello,
>>
>> Please review the patchset for Intel CRPS185 driver.
>> V2:
>> ---
>>    - Incorporated review comments by Guenter Roeck
>>    - Incorporated review comments by Krzysztof Kozlowski
>>
>
> That is not a useful change log. Please describe what you changed, not 
> who
> asked for it.
>
> Guenter
>
ok, I will improve it in version 3.

Regards,

Ninad

>> Ninad Palsule (4):
>>    hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
>>    hwmon: (pmbus/crps) Add Intel CRPS185 power supply
>>    dt-bindings: hwmon: intel,crps185: Add to trivial
>>    ARM: dts: aspeed: system1: Use crps PSU driver
>>
>>   .../devicetree/bindings/trivial-devices.yaml  |  2 +
>>   Documentation/hwmon/crps.rst                  | 97 +++++++++++++++++++
>>   Documentation/hwmon/index.rst                 |  1 +
>>   MAINTAINERS                                   |  7 ++
>>   .../dts/aspeed/aspeed-bmc-ibm-system1.dts     |  8 +-
>>   drivers/hwmon/pmbus/Kconfig                   |  9 ++
>>   drivers/hwmon/pmbus/Makefile                  |  1 +
>>   drivers/hwmon/pmbus/crps.c                    | 79 +++++++++++++++
>>   drivers/hwmon/pmbus/pmbus_core.c              | 13 ++-
>>   9 files changed, 211 insertions(+), 6 deletions(-)
>>   create mode 100644 Documentation/hwmon/crps.rst
>>   create mode 100644 drivers/hwmon/pmbus/crps.c
>>
>
>

