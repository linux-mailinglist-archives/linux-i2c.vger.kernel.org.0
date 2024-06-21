Return-Path: <linux-i2c+bounces-4160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A748B911AA8
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 07:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D895C1C22070
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 05:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C56713C689;
	Fri, 21 Jun 2024 05:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="g9WFBtZJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5883207;
	Fri, 21 Jun 2024 05:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718949164; cv=none; b=am6WMuOe0Mmv/PHkONZaqR4eY8Q35EHn+l9XhQlcR45D3pg1ED2uUJnzq4Nsf0nX3J3s2ctsTxk+VuBWZ8Y1I9sHNh8Q3C9cs6zPUx0yQrk2N05Mb4dkQDVqbyocto1MUlQQ1/pXqqV/uEBpacRE1qlKhVz9vygEM4fNkCPRUU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718949164; c=relaxed/simple;
	bh=B/FtBrdM0MhQsIGzDSXhE0531n+bBkbvzx6WIgFpcl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=WF5dh5mhoERM/ShgLyO8maIbFDy93rbAGIiD5ixNvwJo9S4gV/8Pg/02WRT1RBbOywVONjiOfCxb4zzliOLfwctkgHtXYhiiZJzIbuYgf2/m4OU8Bkfl2Apz8mz+OR++ShzAO3lhOuUKfpaFIXllLGoF8gCPdSkya8zuB1IROUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=g9WFBtZJ; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718949090; x=1719553890; i=markus.elfring@web.de;
	bh=B/FtBrdM0MhQsIGzDSXhE0531n+bBkbvzx6WIgFpcl4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=g9WFBtZJ6jlB7Xhm4LApEB33Lek0861qyFNqPb11SiEuEbAqlDQlxKGJ5LkLcnKc
	 BLrvnBx5OAZfeh7r05oZsGab+pZ3zwUw4URvK5pCKhai8AwyJ+I/pjcANj2N0e0Ok
	 Mkmv5/vIM+W39FeC0LdnMz95DnOVdsSFEQ+vZOZ9m7d1f1aLUhBTEz2FlVHJ+Msge
	 F2abgY6fqjIjiJCuN8Xjwe9BEutZDXssCtL8EMyIa8rMKy/KVuzTLEbV1DW2YCUKl
	 jfdAXFHp5JAi+4+MgmH6z/bfnkBLFFTvtuXHYcrAekFxHSUZpK4NhTH0MVAPA7ATR
	 7Ouc4OrP0NrGubXFlQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MQPdl-1ryJTH0wtN-00XZsv; Fri, 21
 Jun 2024 07:51:30 +0200
Message-ID: <62a564df-e78f-470b-a1b3-2e49b6c05395@web.de>
Date: Fri, 21 Jun 2024 07:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Patch v4 06/10] dmaengine: Add dma router for pl08x in LPC32XX
 SoC
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
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20240620175657.358273-1-piotr.wojtaszczyk@timesys.com>
 <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Content-Language: en-GB
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240620175657.358273-7-piotr.wojtaszczyk@timesys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bPaZvoxzJ/h40pvO52zJQM/EXwvqLuVGmwbJlhznsZdSb7+5vV9
 ivg/UFZwjDfRawbpm6w0wCBUaQyp9SJcyDqFrot02cTYmewtQVP7vrWLKc5MV0m8Yvuzqml
 3MMYaa56tKHofEPv+LYWJE+ygSMZ+e5P2grD4YKSoPHdjNrcG5SnDh1+y4SlXyeVzIcF9Y6
 7Ufmk6v6MTeNw2cuMzL1w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:UuJ6HPlnuco=;b+auAotmGPrPfJRrtNoxICqpvzR
 pKZtILPKcz2H6Q3tjierCqUY1bw3iXANbljk6kGRZQ8Ir2J+sNZeAoqtxl3Ol0bMTRtSR+4A5
 R+79tcqE/AFMIX8Tj1+dTIq7iGX7H4Z/u4Wn+kGkiczsJT8uP+YBDZA8XWHHbBvTsgBvIgd/M
 t9dbgwBnBviEkn54bA4PV6n6FJWZ2Y4y+qtNc/0yhyMsZfG7v0588p63zWHDOl0BeqabSRk0R
 iSEF/OpLj1jUM9QoM53KVYIxp38zUjrP0FNRW9Bg99ZVq+9y4Cm4pt4oIst1Zi6lZ24WYkyvF
 BbLoTfMQq5eSvbcruXX4b4W4yMHhw5+LoDEdfBn/pTE++mjkuh4AWG5xEAjppkayQT5jEk7+e
 yfcqBPTlRwvN6YwtV8y0qh3+k0GcUhaS/rk5Zy7282DcKttFw8dGIzfia8vte2yv9T+KDpp7x
 ZoVyYf4Iic/IeCnBZg6D0yD+WT406j6qhg495/RmOh3i+X08miyIXWRWAtUxvD+Z2q98HXkGZ
 OnDeEaI4pDSADbegqEszNfdwJ/7SJuW4t99TgT5m1p647pYuyGNkeHX71fk1jCeF/cva/8v4g
 TaikQTpWxd8OrwGHTigbYnrR3Vlnp1LmtBfdQRH8Cw/GcZVyr+9cvXVDmQondRXAg7T013/yY
 IUdhxPtFPZpkDp9Ex3fUOe4K5g0Yvq38AyBxinSmvccQ0O9581SX9FEcl6oyvQFs6TqaswsiA
 v9A67FvaC4G/xzhDWdxVjzSCMCp7GXb3ZVKMN2KLd4wMMcDjDQRJ1S4hyog0GLC1LbvrxWaTj
 pBtdYg/1eB+cdDSUEzEgIwCtPrPRwhWBwKvX/wkLonUvM=

=E2=80=A6
> this driver allows to route a signal request line thru the multiplexer f=
or
> given peripheral.

Would you like to choose an imperative wording for an improved change desc=
ription?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.10-rc4#n94

Regards,
Markus

