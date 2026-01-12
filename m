Return-Path: <linux-i2c+bounces-15030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C47D1049D
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 02:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 88E943012641
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jan 2026 01:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7E022FE0A;
	Mon, 12 Jan 2026 01:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ZoBjGaIJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3421A724C
	for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 01:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768182817; cv=none; b=twWzhbm9byr2lGLDCjmT4zL0+LXnUwkteXSZDso7JuSeY5wL/zYUZ6XZ7xmDYe7A7V7Ywlq8dSNm4YALHRbQKPqGATcBMqlC7vjwGO6SM7T6pGFXHOhVe9N1qQRfkzFrAKgFVlAVevoNaW8WpnjaAlReUtUDZ2ZV3gVkYbZdIJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768182817; c=relaxed/simple;
	bh=R+GMRo3QUZPJ9JA2NR/BUVoI1i0BCUZeh7qUo9qKP5Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WEH8TwqCsrEDj7ffA9WBQIrGkA5BIJhjxm+5pfcsc5bl5sqLwONPztikA1MWBCLY+HeVl9CKVGGYT+Vb9GVpXsAOHqSCBt76aT/36MDhFC649+SK/Onw0jpeYewTEKRbWpMyvdFNdmbOo4s8wsWUureM3totQI1fVHJ88rke4fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ZoBjGaIJ; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1768182728;
	bh=2V0YGG8KS5edIV8RrxQAVz+N/+s7k9aPRaIemnpjyes=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=ZoBjGaIJlwVYNZVS5E72MHODV60jF+C5fUweMJs0SuXpoagXD/mw3UZJB2rYC5RhU
	 DJcsd9R6N02Khe0cv9fnsn44flyvJhK0ib/4/a+5tVt7FNteVRMZY4BtVlG5tx/k2s
	 9LMraGQ/1aTgQb5TNqYpFfSkSAW8bCm2AQ/oR90c=
X-QQ-mid: zesmtpgz6t1768182720t29d70f31
X-QQ-Originating-IP: NgU/OvI8KlXz8Hx7N7o9ZcfY708cpKw5XNTQ/HHR3QU=
Received: from = ( [183.48.247.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 12 Jan 2026 09:51:58 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5413789781877142214
EX-QQ-RecipientCnt: 13
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Jan 2026 09:51:58 +0800
Message-Id: <DFM8GN2AWH1A.1FWVNVF5FLDSH@linux.spacemit.com>
Cc: "Lee Jones" <lee@kernel.org>, "Yixun Lan" <dlan@gentoo.org>, "Alex
 Elder" <elder@riscstar.com>, "Andi Shyti" <andi.shyti@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-i2c@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 1/3] regulator: spacemit: MFD_SPACEMIT_P1 as
 dependencies
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260108-p1-kconfig-fix-v5-0-6fe19f460269@linux.spacemit.com>
 <20260108-p1-kconfig-fix-v5-1-6fe19f460269@linux.spacemit.com>
 <20260109224147267169ba@mail.local>
In-Reply-To: <20260109224147267169ba@mail.local>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MYi332yUMvzJVTjIZZ6KBo1XNwwLoJ/FzOEarEZg0sPadd7m+1+9d5AD
	XoRNSaUzYFK9+eWt0hrrucOUdiHcJ/4YKl/pqQ0EOLUXeibCaeFBRPZS9hJ2EfDVusspiiL
	g7y4wPXRiGoO1WbTfcfys8FPD3BnRzbOQhbto8cnnI5CbAYl0RjS9yGEgu1aMvdrs6cm98/
	oui71iMGtgn+0BUVRWBKDzhWHuMth8J7XgwK6DP5Kc20NM2aDvYrJQ/yVXO3vz769pMBQ2J
	4bPExZps/uvl2++xNLEELA85FQrDeSRLLVcLBYzbh4D1yvS87vV+ssUPZPKnyxjoUsX9H46
	vrpGGw40zYRuiykFxg0WGAmWLUgF+mFSUcsjwlWhu7i25TKEFmMQYiHcR94gjwVBMQBr7WT
	czCLMywxNtoXRGtSAonIRN8iYM50ZjDj5FKgidsRHuO57BPrdOHJJzTdkOCevcQ7gvg/Wl2
	Jk/lpV5iSeRdlL06iB383CXW7bMyf6aUx8pY3p5hmkYIBNG4kC9Swa2w/ADRADQRFVS5oj/
	PDe7PtQwUOoB/h1ay8lKbiPES0co9uprfF2Z4aya6STCyrppUc7zmJHtv47zsPDpJHeHGop
	H9i3sJk020k9Do26RYpeCszXwWd8gDIg0zxeQAdi+3HMQkrzdf0502FhPSewT55Ba0ss1HR
	rQ+ri+/w2qdPP/mIX9efj8HwyIek5zpPpfcjrH3vZF+JzKtnNC2lf8ZPBSLVcB7Fm3YuoSA
	7LDHHNODz7zJugC0bYxJQSBZzc+SZgJpWAeu0LHfbNUiYsosnRQEyXWv0rcL9XVPuKPxpg0
	OKVOFQQXrZB8jzp14su2nuASHVSV6v83I3KkU7P+C3Tyd6z++6wcFXpTpwFlKb/Y3hr/FzI
	YtbuGAmJwK4Jalyip0jMpbyuC5IJ0uaOCsj6Nnir/GcNm/wq1MplO7r3xhOmukx0n/USv4+
	LSbeq4lFv8I4wolzpT6iHrb+dmddnS7iM4y3MbXgYzaDDEYiHm6yJS7LwXvq8/bL3abIqu4
	UPJqdGIbCBiLWoxmBHqM1W5ba6Dc7viOKXz3LussXdV+c2CG58avjRxJmHYWEdZk63RapnU
	kPuZab0l0eR5Ok0TW5ZrWg=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Sat Jan 10, 2026 at 6:41 AM CST, Alexandre Belloni wrote:
> On 08/01/2026 16:38:54+0800, Troy Mitchell wrote:
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index d2335276cce5ffbd500bbaf251d1761a9116aee9..b51888a9a78f399a6af3294f=
c19f60792576332c 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1496,9 +1496,8 @@ config REGULATOR_SLG51000
>>  config REGULATOR_SPACEMIT_P1
>>  	tristate "SpacemiT P1 regulators"
>>  	depends on ARCH_SPACEMIT || COMPILE_TEST
>> -	depends on I2C
>> -	select MFD_SPACEMIT_P1
>> -	default ARCH_SPACEMIT
>> +	depends on MFD_SPACEMIT_P1
>> +	default m if MFD_SPACEMIT_P1
>
> default MFD_SPACEMIT_P1 is certainly enough here.
Yes, Thanks!
I'll use it in the next version.

                    - Troy


