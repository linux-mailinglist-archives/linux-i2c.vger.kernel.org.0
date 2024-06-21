Return-Path: <linux-i2c+bounces-4161-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA10911ABC
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:57:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5B64282E48
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 05:57:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C13E13CA9C;
	Fri, 21 Jun 2024 05:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="wO5bF2dn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EE33207;
	Fri, 21 Jun 2024 05:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718949436; cv=none; b=X31PrfQ0S0oJdDubaiOnMUdsMn6Vye6p4iMoGKGGRvGwpXl1B00iAvOLuikH8k6bxytjUxRl35vFdDdVpEq/vpU85TbKxYITSlh3sMG3cOqvAeUumgjdyHHpWSGZAze0VpzOVJama3m7XYQgBypqUtSUzDzLQFQ9fXnHJLVIkCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718949436; c=relaxed/simple;
	bh=70TtcVLm9kmqiepSERoWu/9Hwwx1Rf4phfsof9PPYa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=mw0bf2XjBoDSiasnpxknm+5c2p3uyG6izhFSSH/ixkfaNgPGKqMQGRk97CkdmVv8k2kuzjytAFfHeuWrAsqXloFG1/4YVnXjbCbBwnPrYZ+hQA2evdSWblXbi0MoGmTS3YDOQIno8Pa+fx70EV29qorHi3sV88pdvOGCoSJORSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=wO5bF2dn; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949371; x=1719554171; i=markus.elfring@web.de;
	bh=70TtcVLm9kmqiepSERoWu/9Hwwx1Rf4phfsof9PPYa4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=wO5bF2dnR36pYugAZFszjcO3gw0sL18WgGHyX6gNBuq9IaZKpqCaNVBg+xCZQrMx
	 Y2/x2INaouP5hzu5A401lKHRk7OGa3pJy5idb/1yHkzlUWvXWThvtMFbrnTqNOOaQ
	 DijgoTMjTEyJ+dI2rxFtO1nrQdEFiMI+S/8ZepiBj2pGkSWclmr6QLpGDbcMh40Q+
	 XRUlVAvh/BsNifyu6T8mjVYsbFLPDy2WrtwyIoO94VC1T7Y7w5W5sAhzntGtkBQkM
	 Sg3JFn+9S/TJCMLmkTHUru/f9YHCz3ElL6T4dGGVpuOJy1ueVodJvxjo5Odt1Pd/j
	 EoKpzuAwElV5I+mU2Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6FV-1s1cnG2hm9-00UG7M; Fri, 21
 Jun 2024 07:56:11 +0200
Message-ID: <bc3d018e-5a60-46b0-8e84-7158d231d2cc@web.de>
Date: Fri, 21 Jun 2024 07:56:10 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 07/10] ARM: lpc32xx: Remove pl08x platform data in
 favor for device tree
To: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "J.M.B. Downing" <jonathan.downing@nautel.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yangtao Li <frank.li@vivo.com>, Arnd Bergmann <arnd@arndb.de>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-8-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:iTUduqMb9cBGoyLdNuW6NQOj676Ul3b9o6PsNTkjdCixiNwYyKR
 oRvmzegMp0qsnzSo70irPsk4uNh054uLIALzh4CztbqWraJbmZHWwsKMRTm8H8QF3uXl6aw
 kX1K/LyUquko0H/IMh72DAyOoKYpTBJD4E6yCi3y21vP7Qgmc0rbTfrxSric9CHiwM0yEkI
 srUTTBp1uUclGZLL0j4BA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4zwWuLMBIcI=;p3T9mcjmv9EhVlHD/sbm6ZtwCba
 UW1bkeS7/UTJNK3NQOP8ZTd48Yusiy5ZCAL1lyRMxOHwlVEQftGxe98qQylZmEpcdepsI+I/O
 /Gd7WAKyUHB2sWSHJFyt0//5tzvkYVAoJqXpUa173WTSwzFjjp8Mmm16e3xjTwMiEFa8s1wFo
 RMVLj3dQ43GBmpWNbS+3WoOplbIYIXLIkTgqR0dhJ4mOuVn7lHvfrCplqqsferQTJvMYZH7Ns
 INtfxjHQy8bLawfnhVbbBE/yeGK0Fy4EbE/1qo+BZpOZK8+cjnghxQiiNggT9SJC+GIa2e0zP
 rnZGJ5ZtpynHbThpuiManMYgp/NWQfdMvTFFm5GdzCAvNlfWeSzAbYaxc/DPQ8sT/Y6Xw89rd
 q8uoiSTyU6wQpib1I/h7mL0JaUI5nU9o3ByLA4f87UBVBXaz5YcBmAvvNVoEVCVylJ2gm24eb
 TWhgJG8fsq5TFXpP3zrBtVGr6/cqv3HwJv9XoRqhahaTAuc9AnSt9P/xeisDATr5AxmRFGNZn
 Bf/aIaIQEJArOgYQwP+hVLatduOlUoeajtsaXAzmhQhWtQhSvVjGxsNbdKOpwkku0X5GctvOg
 gJWAZy6HqbpBqQ8qQNH8sZen5E60fHE9ZMADZS9NrbJYBwfUApaMyYfHpyOEsdlZ9xrGY2Bvg
 s5zglaFXZisv5uabkgkayKCx/HDe0gnGtkZ6QIu4bm/w9BbmW0vXhd6jTqtK9ZCyhGf0aHRV6
 4HgugA1UVbpqfWetnoa0VNmw+tRV61JKjOqSbx+O2VEMFROG/2I206GuAeiCCobeg14qAVH39
 d60BOgwvPQJESFlorxlJel7invZ+WB2Ew+jDa9ggMRf9o=

> With the driver for nxp,lpc3220-dmamux we can remove the pl08x platform
> data and let pl08x driver to create peripheral channels from the DT
> properties.

Do you see opportunities to improve such a change description?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

