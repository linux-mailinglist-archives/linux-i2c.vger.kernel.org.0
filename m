Return-Path: <linux-i2c+bounces-14365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E8DC9ABBC
	for <lists+linux-i2c@lfdr.de>; Tue, 02 Dec 2025 09:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D562E346458
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Dec 2025 08:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BCC30217C;
	Tue,  2 Dec 2025 08:44:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A031301718;
	Tue,  2 Dec 2025 08:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764665053; cv=none; b=QQYivPtQYY0ITuhmS5k0K6oORIOfpzD2AnGP6G8OYGzE2mBXSvIJM1/SUlxWa/9hXVUCbZpMPXaC1eBHYBS78R7PUzW85GtlYfiJtlDnecGhoIsPvPPE6ha3jsIeVqqz/+gkYXmlmmoK+x9TOIAdgNmhkuj7BCB81dZjTO5yc58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764665053; c=relaxed/simple;
	bh=FrHRmSfejgz2W6PZJ1H9ZcQY+wJjJIm2SX5CgJ1q7H4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iaXcnSmHGRvGoRIIg7zreG2ySwysy4mXHXDJ6xAyz0OSTIMigtGWe+cSdgjzLf5XATaMZqEs+k6HSs8XBvmFjN893r7LSTDPVoxJirETwBJpk4y3/6g7auExdEZCNUMvT4t9DGDM1HN84wscw9W5nKUZ5JgEq895LkGPvwhRGV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip4t1764664984t2821ea97
X-QQ-Originating-IP: bA8avrg2BgTlf96PWGFoDh0XtgrsD04r7MYpHfpqoDg=
Received: from [IPV6:240f:10b:7440:1:a68f:7233 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 02 Dec 2025 16:43:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11120342221054237314
EX-QQ-RecipientCnt: 16
Message-ID: <41ADE80702019100+4cf0f6ba-c861-483a-8a89-1e47dd6f3137@radxa.com>
Date: Tue, 2 Dec 2025 17:43:00 +0900
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: eeprom: at24: Add compatible for Belling
 BL24C16F
To: Krzysztof Kozlowski <krzk@kernel.org>, heiko@sntech.de
Cc: brgl@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dsimic@manjaro.org, didi.debian@cknow.org,
 wens@kernel.org, nicolas.frattaroli@collabora.com,
 detlev.casanova@collabora.com, stephen@radxa.com,
 sebastian.reichel@collabora.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20251202045655.154543-1-naoki@radxa.com>
 <20251202045655.154543-3-naoki@radxa.com>
 <cbf9b0db-d1e4-4934-9961-0deb5e4fd001@kernel.org>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <cbf9b0db-d1e4-4934-9961-0deb5e4fd001@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OAj1qrjhA85A4Jdb7PajpTR0lKKHw4sJOb6fcvZSBCNITiGcXez1ASyp
	JE3IvjI6oig6g7Jk55xh1SEBM0/fMNtMJWJ/aZzTPOXcS+uY+VUcTh8Ya/jtyLf7PmyrvKm
	NOBjQnujRx2+8Pw6sSAjn5MWTXca0XuZDojReYcb0DJ5k7Q0aEBvs9lVJsescV3AS02b+t5
	kD6pKGDiGYTJzibDvVleCOXe5lh3TX88/dENYFgux0cvUQSftYuArQUN3uGmvC+bJ/oeoea
	0tFp+cOjJ21WB5vC8ciYoB0u2MiOkekufQRIHqe8zGzrWmzU81kTAzoBShaOomu/xsqALP0
	VKYvn5fblUBtCA1cH4hQK9aQ2oGq5BoHxwptGrgBKgZoRjhkpUURtdYS6s4oi09z+IJEXur
	/ZXuGferUw6onvmn3awXREeVoj1CGPA7nkjy4K5Ss9knOULd9L6p7UGeLv4vIS/RDv/jQTe
	hWDjGUHm2slxmxOchX7+OFHw2HM84/m2UrDyPb3lvJFWbgI83i4tCg/p2m1l2v2t4c7Jgv/
	Ixc20M32aCClj9EVeFHyPvZlyutVxoSMVImHt4VNG4VuFfLQongmeSfQ5Bd4/YNJpsknJsl
	tOI++fxc0WBjwEw/p31kLZeJP1it44ahiXZQ/V5YMnAaR0SM0C1XjrIkVmh8j3NUxHG50bd
	gKabZnwYT3tuiywlCR4i/PNptOBdEVnxMi5j7RtIdVBvL/wUxkiGpZq121wtEd1YFQxfKoJ
	RWG/1Hj9phBJzNVRrJydtdYqtgHojxfy3dwsxP94dE7We6p4+RmNq4P0jLJUVggz/6Q6jWC
	v5Tnw4up/NeMo+0FpWw9wJOj2k1cgS4DvdOB0dyYDVe+BxD+b6whPTja1EFeumd5Z7SwN+N
	n6xhhhuD5/SJe7mdH4n7Tt6pigAREvvBwFpdQ6UTlbCWfovCCS0BA8r6ctlCVnHsYWnzXBB
	874sxwitHzwK2EGbqvLUXPUUu7rYr9KIhjHA6f7KoQRpL5g==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

Hi Krzysztof,

On 12/2/25 16:44, Krzysztof Kozlowski wrote:
> On 02/12/2025 05:56, FUKAUMI Naoki wrote:
>> Add the compatible for Belling BL24C16F 16Kb EEPROM.
>>
>> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> ---
> 
> That's just one patch. No need for two one liners, just unneeded effort
> in acking.

I apologize for the inconvenience. I will combine the two patches and 
resend them as one.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> Best regards,
> Krzysztof
> 



