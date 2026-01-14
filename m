Return-Path: <linux-i2c+bounces-15142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CC1D1CE74
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 08:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29DA73017C71
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 07:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C548F379973;
	Wed, 14 Jan 2026 07:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FaQLCIja"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BAC37B3E4
	for <linux-i2c@vger.kernel.org>; Wed, 14 Jan 2026 07:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768376539; cv=none; b=tt3nm0Z1/2PQVoTbvCsNTJwzXUmAdCLXQHg2kovnVg/fT38Q5JYIGGCFOIqavX8nlHaxSF/mi9j5Uzf76LRzD/apN5vqdlEDoyFihOZBJ5yMFKJ4t643BQZgc34kFZxdwN8HGFTMNom7loD8+mOEs8qFdZDtqefymRAqNLAredM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768376539; c=relaxed/simple;
	bh=6kFdfpIlv+NjbpVMkAAzrX4Pd5Bm8hvjOOYjFPgOi9g=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=MHmNUyTQ4+ehPgfl5ehXnImIpvzs2WwtL/tuLW6qOqJOh4Xn0jTsJ4xp+R7yhIOP/xTds9gMldu/IME2xnT08UXq/Brdgep7/56D5NHkN4+ziJPlHGXOu/zlRa7DgObEDf8jzqMr6O9ZRBTFFWOq3pTmvBmDkWapHkn0BBrN+EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FaQLCIja; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768376437;
	bh=Y3hzIqe64eTNPZAr7HNM5Jzs/tphW9qIwXZhK18bDVM=;
	h=Mime-Version:Date:Message-Id:To:Subject:From;
	b=FaQLCIja0GDbUuIoZRS8YGTtPKNKvpxQawxnrUpxfSTFcYIymfyz1A7YyGkn+v3zM
	 XYzL4ijzMz8xaGMFjmaKfVFQnPTKzf4l2GLA/Q1g/PzhRjrqEyycK8iINXcwAPM6Zl
	 DbysDgD3Hx/3nxVArZiG2Fqh8ATReeI1rjE3mPCU=
X-QQ-mid: esmtpsz16t1768376428t13e77d3b
X-QQ-Originating-IP: 7aawJ3yx9b6VmjulJJNVsFBb2N3t4qxK6xGf9s1FjQk=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 14 Jan 2026 15:40:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16254600035269256280
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 15:40:26 +0800
Message-Id: <DFO54J7CRS8U.1D9XZAJHF57HM@linux.spacemit.com>
To: "Lee Jones" <lee@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: "Yixun Lan" <dlan@gentoo.org>, "Alex Elder" <elder@riscstar.com>, "Andi
 Shyti" <andi.shyti@kernel.org>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-i2c@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 2/3] mfd: simple-mfd-i2c: add default value
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-2-6fe19f460269@linux.spacemit.com>
 <20260113124241.GB2842980@google.com>
In-Reply-To: <20260113124241.GB2842980@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQvpx3reNVf3WhyFtnskoYMLYvgG5oU62ujRS8JtwR9vHStSzynh41GG
	OXMxYql2bohvBa6JWd06cX4JKPrE6fPg9EbZ0g21wCh2zVKOHaR36UYqhRhYsSiw82gjcSI
	6dYEYn04C24cLRCd/pCnxabSN1IxDxPE9y8aq3Iuf7IrWNkH2sktsi1rQuUXIzb+U1G9874
	9+3iSk0OFK3O3+X360goBWmhA7bz/rpag8wFTZDsqxfXal8W26vSb0GAoYhmINxFC+pfrhq
	6iP9bA29sYXmqt9ZVuu1Y4eaGw9NPAMLPqJw8mdIRtVGiA7h7R+acUoFy0kjhj+I1Z0zM6T
	1c44ggGLPCcpbIgc+nlGIC0KAOOxmNQAlTbACKx0apXgRzqEhHMV7sjU3C82cmqAeJEDTJI
	2RiXgE9P+pw+SLATpDrsrCS2FmBuEpxcb2kbXkREvbvNYe9qU/dQDOPu4uovdmsL0iHkh7L
	cmDWd1XxdwUwyo3rcxgRnQktvDwStwtcFVF4DEyWNjzWZf1f6WemlRLBri8V1+tg2VYpHes
	cfttwAXToZuuYfD6GX1pDnzQFuE5ZorcHpymtUl7TT2DOk4DuWVQBnv4I3uf5Cti611jsD6
	hbnwGxKTqsvF4TZXd6mcHsTCNSBDmLl2pj+ZsKsv76xNrMRcbnstWDVIMZfYdPOQpa62JXB
	kW98a9Xt3UhxUuEL31gPwZEpus8/h7GJy2TYPiWmKde7rHRZDWVN5dUWJIsYAWz+7d7znbH
	pPG+PKMDzvvHvAAsXxpadL5lKIq1nHwEbtrVVhCISeVJO2NcOkMv2bKnnHaXL4ZQ+RUwBjl
	RGBTsk3A8PeE9OqXtbKgBSkgLW10Cc4by4cjEmJV46JvK8AktB/FMt3LEqf+cV5CTP0pKAW
	8rwSeEddoq2CH1TnumFFmMW8jhkpMfGJtFbH7i24uX2WcLWolfpM4wDf1o0zPTWy4FDIyjw
	A+gojymMAUzXGVSTZzZ53U0IeAgu+egoeU3GEJiyRK3eIRIzX/neY1jzVwtIWY6JRTlm4wo
	Oew21UJ1zIhHFVmxuU/dZEMjzah/uLZfiXIpk9MF8tZHKK+AFcj9kLdxwwckivTjfBz/kGM
	RUVOlfIo01A
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Tue Jan 13, 2026 at 8:42 PM CST, Lee Jones wrote:
> On Thu, 08 Jan 2026, Troy Mitchell wrote:
>
>> The default value of the P1 sub-device depends on the value
>> of P1, so P1 should have a default value here.
>>=20
>> Acked-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>> ---
>> Change log in v5:
>> - nothing
>> - Link to v4: https://lore.kernel.org/all/20251225-p1-kconfig-fix-v4-2-4=
4b6728117c1@linux.spacemit.com/
>>=20
>> Change log in v4:
>> - default m if ARCH_SPACEMIT instead of default ARCH_SPACEMIT
>> - Link to v3: https://lore.kernel.org/all/20251118-p1-kconfig-fix-v3-4-8=
839c5ac5db3@linux.spacemit.com/
>> ---
>>  drivers/mfd/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>=20
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index aace5766b38aa5e46e32a8a7b42eea238159fbcf..c757bc365029dc794c658fc5=
b10084a0f29ac9b6 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1276,6 +1276,7 @@ config MFD_SPACEMIT_P1
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>>  	depends on I2C
>>  	select MFD_SIMPLE_MFD_I2C
>> +	default m if ARCH_SPACEMIT
>>  	help
>>  	  This option supports the I2C-based SpacemiT P1 PMIC, which
>>  	  contains regulators, a power switch, GPIOs, an RTC, and more.
>
> I already applied v4.
Apologies, I missed this.
I will remove the patch in the next version. Thank you for your work.

                    - Troy


