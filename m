Return-Path: <linux-i2c+bounces-3670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC3B8CE10C
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 08:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CAEB1C20F5B
	for <lists+linux-i2c@lfdr.de>; Fri, 24 May 2024 06:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140A984D23;
	Fri, 24 May 2024 06:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="sOpAnTvY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254CA2207A;
	Fri, 24 May 2024 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716532736; cv=none; b=OJDHpQXv+jb3xK3mwo9H7Ldjihh4H1rcj6uEn9VEwleHUYiDZPnXIrZ077Gr7sAFJI/WIedxrpQOk44sIRTy7iHmNXH+9OLPCmu3ElEoE8/BBM/XWKFIR74NJ1UelMON5XYE0Np3Xp9UJybqyViWpK1xxrjTTHYXPFAjBBWTQmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716532736; c=relaxed/simple;
	bh=/zgxCyuQmfba06hzzw8jaE81x2r+bW7Tb1LVqVcwEgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vw9SJh1FprXghkPK41yOrSaAICquU2hSsy/xj5ETXYg0AVBtmTCAlQMvxwJGIAKgoLOeijOX3kNTAIwEAG/X76mgtun+Gf/4EjQKGzqaR5o/acxkVnYi5x4KCMMYTJ7HpMXTKlG5l1Arju8PoeDd9ivNl/Aaes/O7UvRUcP9atY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=sOpAnTvY; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1716532702; x=1717137502; i=markus.elfring@web.de;
	bh=Umioa2mJKM7ga4XuEYMOnM1K4xmUwt4dK5hfLV9jtS8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sOpAnTvYvGjPTY8/5f/WIwlpSkgsAsOjUR3CloKRJQ4PoF3WFicyV7+gQsZWei/T
	 tpbqfNZrvMg+7CiGDrUUphgSuiV3Rf0Nu4RNaxTXMXVQzMp1K87p1oJlfobkGAFqj
	 QWHAoNHhsvsOnMt1EktHXGCeaxJuzXKT9A2YzgNMtbvKow+CyjbxF8VpRKBRuT03j
	 a/i94/92lZ2EcKxDtTq9wil6NtsghS9nW4jsqZBzC2KK5j4pch70K1ucPeF27B7Gm
	 TStm14AT7sXVYWIHfvmJF+DDni6ThkVX5UyMMtdc3TyDHrf8sv5QMRDDKOU8hphAC
	 OPxH6WNhzhx8fc9KlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjBRZ-1sggNX0bbB-00eylk; Fri, 24
 May 2024 08:38:22 +0200
Message-ID: <8a92a08c-2a57-454d-a7ff-3edb3528b78e@web.de>
Date: Fri, 24 May 2024 08:38:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 17/20] ARM: dts: aspeed: Add IBM Huygens BMC system
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsi@lists.ozlabs.org,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, Mark Brown <broonie@kernel.org>,
 Ninad Palsule <ninad@linux.ibm.com>, Rob Herring <robh@kernel.org>
References: <20240522192524.3286237-18-eajames@linux.ibm.com>
 <2fe45df6-01a2-488b-99fb-5ee20491554c@web.de>
 <910b18b7-3717-4087-b028-fcaf5f2a604b@linux.ibm.com>
 <398bf753-6701-4925-b814-781a68a75cc5@web.de>
 <20240523-rinse-sturdily-7c78d8517884@spud>
 <d6289d1c-deae-49a3-9fc9-98a2f2e57802@web.de>
 <20240523203339.GS2118490@ZenIV>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240523203339.GS2118490@ZenIV>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r06ohMYipjx7MaDK2OvRnKAwkIBVsS5fvyAmsplcvM21XF7HMAm
 A0Src/BHL8flyhJsz3MdFdif8NmB9aq/3fPsFxXcV0kugN2P4baA5bybyQbqJ/d6dNe9V+y
 KfQwRn3SQK5W6mReVOGkQ2OSBIazmuosZVNLZ33w5EUM3wEEBDegS2xAFsb1BzNwauzEvv0
 3DSCxroZyv2XOPlUjbbcQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kCE3UA8E6+4=;ji6T0ME+UaTyDdrzMP3bhGy4KvJ
 x6/ZMWjLm/maIjQj8faQ8jaaXxne+4RWYF2gWiwqpZFSRptL6UemOufq0G5J/LuJUqlKprCRO
 /gLLi2bzQNuv7L5dPd+cQ+jDFNVKlL7COeE1EczqTQNoUOdebG5s43B/sjNI5vSfEx5m+gvlS
 uD7wXufB3FmjWU1Npmatn16cvxxNHci4pYVniVX/jOaqtsE14DiOzrf1vIl2+IbmdBTuMovrd
 WxLSMdoOW98/tOqyFBxx0LUmyqKFdUBB5P7vBkGLRoqesA71fZYv3VGAco4KGWNAwmEYHVGCA
 8KZH7zZsPHUaEcLJQxXiX2IxyCnEFxsZ5hKfgqbfIyUDom/zuAw/nrTu5O26LEs9sg3cNqoNz
 Ajd+7kqFOY761H+OmpG+4Sh4ZWhOqZOP57ngiqhhLXQp1HXL6D7pUaOZH/SISHpJ/KUpvwyc7
 CsCwY1rlgRzt8OHnhhwCwXFX8rEjGdFZ/lzuTtkxo2kul297iEZvM16PdEERo8xWSxnEwZK6C
 y8Vnc245eoWOZTxRh45sPoCL56j69Guxz2NZNENIG6egmMLAVdDPmkeHkerpC805YEUMT9iYj
 jaQhBbtwrOeFTQc0CB3MmF/cdeR/gJKQ/vhnIRKf9HX0T3u9jfKOkbhtVyqQHPKJXSqztp3iy
 X+x2+EfCK7jIjHqRl1Q2EG1lYoAWnE+UwXvkc4XoUoecguH4JfaURbK+vljt7vZPoWrpqV5+i
 H9MsnTFswl8dXlkNEs3OhuYN6yAHkdSiSBptLw6RwEyfZcUZzOVClcorvQ4n9TEtIwDJxpp4W
 mLutMFCP5rXz2JvcO73g1uR3r6UH0Y2DHPF5Y7mCr2JYQ=

>> Why do you interpret my patch review contributions in this direction
>> when the official Linux development documentation provides special advi=
ce
>> on affected wording details?
>
> Your "contributions" are garbage in general,

My contributions are also varying (as usual) through the years.


>                                              and this thread is not an e=
xception.

It is just another example for involved communication challenges.


> More specifically, you are picking an advice

Some development activities are reminders according to known information s=
ources.


>                                              that is inapplicable,
> transforming it into a question and "contributing" the result.
>
> And your entire modus operandi fits that pattern - you spew random garba=
ge and
> expect the contributors to spend their time and efforts on checking if y=
our
> (contents-free) "advice" happens to make any sense.

Do you express special concerns here which can be reconsidered because of
advices and requirements from software development guidelines?


=E2=80=A6
>                           Unfortunately, the kernel development is clear=
ly
> not among those.

How does such a view fit to an other data representation?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=
=3Dauthor&q=3DElfring

Regards,
Markus

