Return-Path: <linux-i2c+bounces-8539-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5612A9F3807
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:54:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07C2A1886831
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 17:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9E1A206F13;
	Mon, 16 Dec 2024 17:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="RfWMmxEC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4112E20627E;
	Mon, 16 Dec 2024 17:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734371645; cv=none; b=Zh13jR08wN+fKFkjMwZuogXV5MXB61qcUEo4lA8sUgOST/BK+r4jfQZEQQ3kzLqHziKK2HsNVFyI3k1tTu2KZMYrPgTM7YI45lEIwTdgIOncsTdAugJOjDNANB55DYQj1K7BEVtYtsdyg353R7PJ7qKaOjzMNjDdyp8usCaJ/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734371645; c=relaxed/simple;
	bh=hnKY5i2/zljIg4l97AhyOwu0FPsYJY76IY8x1olp0ms=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=mcTCcJb7nZB9EEHhv3Qp/gmkTSWh+bmnktfi0zga1nSDUgHzMb43eyaMjrwZYjATiNC6JX2eXlysl64xNv0KeSGbMT7/iaSm4c+KBLsK/WPG1z8T0gUK7IJGGryzRYnFkoqqLCI3zwdQ/vrmsNhr+igKDqNtTM4UEx7Iw3JMp2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=RfWMmxEC; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG85ZLx027025;
	Mon, 16 Dec 2024 17:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9U/ilX
	h/eRoLsnqCHshZWK39IQwc60QO0ixa1oM/5QI=; b=RfWMmxEC0RengRjOBhBROo
	OAORxdP+bf3+X01t/t/taikTSx7WvA8uuooEP4z9/UpofmssBY1dbhb9CAyWF28B
	zr3Mx6gfY7e1JI2F1lMjSlqrINo9FwTW3/F5LV2lR0D1iR4DRZxE3fTvDBgn+LYU
	1IFvbYw84juKAhuUj1xyNpfxs8Q/eauRlIn12MMMIkju+bNKiGDJfDMKeTwegcaH
	AXpe7VLXb3B0amsAaBtEUwJDvCiuMXdDD/jjxv1AqQVixl0PSZva+WDtjof3Mbdi
	Ay3TJvS8SgMsyF9PzN/ggm7oThp9Z0FUXBi1CSU66hHG6KYo2UEo0gZkB3UWYAfA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2astr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:53:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGHAPDH027554;
	Mon, 16 Dec 2024 17:53:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2astm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:53:29 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGHCfSo014344;
	Mon, 16 Dec 2024 17:53:28 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqxy62j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 17:53:28 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGHrSKK16450262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 17:53:28 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7CA2F58054;
	Mon, 16 Dec 2024 17:53:28 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5892C5805C;
	Mon, 16 Dec 2024 17:53:27 +0000 (GMT)
Received: from [9.24.12.86] (unknown [9.24.12.86])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 17:53:27 +0000 (GMT)
Message-ID: <b5f5635a-a807-42ea-a81f-22b80fe4eda0@linux.ibm.com>
Date: Mon, 16 Dec 2024 11:53:27 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
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
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
 <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
 <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
 <2713e85d-f88a-49d6-8221-151e8631758c@roeck-us.net>
Content-Language: en-US
From: Ninad Palsule <ninad@linux.ibm.com>
In-Reply-To: <2713e85d-f88a-49d6-8221-151e8631758c@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vyxuOXaWbKmODO8fmrlBccyobF9kgdWW
X-Proofpoint-GUID: zeKm9EyZZPe56r_CuCPOaDwnvBKsFpAv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=689 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160146

Hi Guenter,


On 12/13/24 11:08, Guenter Roeck wrote:
> On 12/13/24 08:12, Ninad Palsule wrote:
>> Hello Guenter,
>>
>> On 12/12/24 16:06, Guenter Roeck wrote:
>>> On 12/12/24 13:49, Ninad Palsule wrote:
>>>> Adding label files for fan and temperature sensors in the power 
>>>> supply.
>>>> The openbmc application dbus-sensor(psusensor) requires those files to
>>>> consfigure those sensors.
>>>> Note that prefix for temp label is temp[A..C] used instead of 
>>>> temp[1..3]
>>>> as dbus-sensor(psusensor) application calculate index based on last
>>>> digit in the name so we do not want to make index double digit after
>>>> appending page index.
>>>>
>>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>>
>>> We are not going to fix userspace problems in the kernel.
>>>
>>> Guenter
>>>
>>
>> Thanks for the quick review.
>>
>> Sorry I am not clear on this. I feel that it is better to support 
>> labels for temperature
>>
>> sensors and fans like other. Are you saying we should not support 
>> these labels or
>>
>> I need update in the patch to support them better?
>>
>
> There should be no such labels. Labels are supposed to have specific 
> meanings,
> such as "this is the CPU temperature sensor", not vague meanings such 
> as "tempA".
>
> Guenter

Thanks for the quick response. I will remove these changes for now and 
will talk to you later about

better option.

Thanks & Regards,

Ninad Palsule


