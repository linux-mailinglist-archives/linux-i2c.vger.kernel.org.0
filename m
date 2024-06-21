Return-Path: <linux-i2c+bounces-4159-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44891911A9B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1241281CCE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 05:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4678913B5B3;
	Fri, 21 Jun 2024 05:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BcHwKT8q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A982883CD7;
	Fri, 21 Jun 2024 05:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718948811; cv=none; b=p3yoZ/uOGgchCqFQXTSMqbxtJWfAlC9aDLvCfcV4AJUxH06/e9RJVyEk9E3bx4vRe34+mpaO9D5Jl+FMR1Dax1E4iVP2Z5bbMf1DsXWOSpBXeboteBrbz8/w5H2hCq//GJgiO6yt28S39vlBr0oUzxoJYK8fEjWs7IdIogI9WPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718948811; c=relaxed/simple;
	bh=kkYqZYijKZreQC7isvDQVtuAI4cUP9+RI5g70SolPKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=t11XRK/jGDQsZeoS4LycVk6cKD/UZSoXl6eBjWwYc7PPvzttgbIqotHjpKuLAEcJH+MhKzLEVIR+3dwlTayoYDqo3VRjK26Iuy1ik9efD+a1fFzd0JrtAz6rOcKKI/mBiLVMp9HDt92GQ2J4TL+UEzTqdxQ43YOoBzqO+ojaRAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BcHwKT8q; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718948759; x=1719553559; i=markus.elfring@web.de;
	bh=kkYqZYijKZreQC7isvDQVtuAI4cUP9+RI5g70SolPKQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=BcHwKT8qczQBUZmomUv0AM6QnX97SDGgPlBDIVTabydiiO2YNuvLTi0vxybiHhtx
	 6ooiz0LklK63jJ12sUOR41eTFnHJ29i6E8dwPItmoNQ8eJ85122eKDwij4wJDHN7E
	 jyhyIJVk1GiWjQyvMjc4L2HZ9tAkI56L1V1w9BsPe0Q4wpW9+gOOMaaqgQfI1/EfQ
	 bL4WzQetE6FwBgkj0JRIkCdRabXU5Yl9TdVjHesjkqim7Er/RNbJyQ9UcnggovU/c
	 jyo4VWLQUVqaDTF9GjRZ7doK/FlD0NXDCi2Nl/YD2mc268HvX7Rf/6BG240vgSaxa
	 hJ2hXVSkzKRX78qM9Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MyvB8-1sYT6j1kTS-016cfq; Fri, 21
 Jun 2024 07:45:59 +0200
Message-ID: <4b368817-11ba-4d6d-9a46-59bee8406ee7@web.de>
Date: Fri, 21 Jun 2024 07:45:57 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 05/10] clk: lpc32xx: initialize regmap using parent
 syscon
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
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>,
 Li Zetao <lizetao1@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Chancel Liu <chancel.liu@nxp.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-6-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/HnPeG1IAMU/Df3lJw189pApwGB8C6p6sxQOjGGDgYaEXEYX3rR
 1fzF6oMG/oC3y4WJ7MEJ4TBAKQIyhyJR9kLS1DmPUSeNWoeRLiHOx6XiA4dc3aykL6q8xK8
 ppHVp27GOpJ/Bs+b4hwtsFX07S22yoUi7Yykat+/2SOia9gZAP0dOgdRdMUjNp+ybmCNrse
 f6I1C/okSjZJiM9p46NnQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RZzKrzeMnoA=;3Xr8mLJNU5K+f3Yl83BIysqGVe0
 4rpRYhraZfI1bck68O03DyDm4Cg0Ralh0kzhMQ7XEn/NHb22XhOO/qEek+tkZj9AymaCo5rlw
 bSKPoi1i/ladDc5kcnxbIKRRmcQGzYb4SSgAVMqhYt/qj/PBeAEk81mo2AOh/48zJcgz+wqoi
 MPAi/oqcMFuSKBk+mdhb2o9DXXDBjHLdAU3Yav7jWcUVm9sv3UXQg5rkBV+K14j45sxBBfCgj
 BF0eH/zDH8oj6G819SSeDhWuOAk+DOSqO7rbNv2Qt7c+GSAO2UYlxSB/Rjlnk6hp8CJKsxJLN
 TYBNewFaMSiY6DlviClA4CjSyDZabDzR2UfartoiCxpy0CsdpCAwUZZ7+/W/nRM4IPTPBuXVq
 DZOPeZX3tdo2dEw49H4cW1veaubeQCNBos2daRlftqwTo/+d6d4aoQtD0rHTwlsvcd0g6RObu
 37Jmd3rYX0642LHQoEDxlMQ9ZVSJCkdNf19a7al0wniU1zydyKkNOG7JOzZoS5qXb+WREAufY
 QKToA9R0LG4Ix6eTpjodQq1tzUl7rLtW1asXsu4MO6VZ+MSTWdYTmapSC2TD9GmScTYm+lZwY
 5gpJpFwGpIL0viYTOu0iXtFgTO0Lpw2eVrKsKPMkDP++IbWbuu4VOrvp/t8bgavYXXMUu4T6N
 /6VsHf5yFd4+pm1faTJC+gQmyIZzRN78+tAQwW4DfScDwIVbbvlXUxZShAa6XFjM4//+SobX1
 GbjpiRCVpeFw+GzVaX7nD6J9JYgj6Gh8vBIsAD0+ZwHk6nmmTdIMTVYTFwx3FvFnzFu1tSMhy
 9FKVb+6gaSPCl/M1gSvlML1hIN3Q3IKlJwNFX4wmTfG34=

> This allows to share the regmap with other simple-mfd devices like
> nxp,lpc32xx-dmamux

Please choose an imperative wording for an improved change description.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.10-rc4#n94

Regards,
Markus

