Return-Path: <linux-i2c+bounces-10932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 535FCAB3432
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 11:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB4E03B1DEA
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 09:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADDF262D02;
	Mon, 12 May 2025 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRopC9c+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB32025EFA0;
	Mon, 12 May 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043783; cv=none; b=ighws9hBnn4+T36krcuA8Q8RKMwC1ut9qET56ZOy8Ke361AJl3FymeK+cVQdNi37+tselLZOZBL2WOCmBH7qLYHyMVjIt1gPb5kwgZKKdw6V1M16mbcaWRIouIhMBVqZ3sBt8p+nKIs4lYXDhw7n6NLnBEvkVPzS+CJdNUQrczY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043783; c=relaxed/simple;
	bh=i+C4MquKCE5DzjebZIg1suA7nSkmpPf5qHNeApUsg1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOAB7g/ALFTR4u7FslLdb3p7+khLm2vxKDb7Gop/W/tZvgS7E2IjB68QzGUg2y2kCUn3KN3CPQ4AnDxUAGJws1wjnwIuizjgZTYCFGVxpXvpYfC/S3EfJbgDeas1zxzNi+rTWxLLInDmOw02yEdW+0rQ8QFNbH5cjXoUpdNwN/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRopC9c+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20E1C4CEE7;
	Mon, 12 May 2025 09:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747043779;
	bh=i+C4MquKCE5DzjebZIg1suA7nSkmpPf5qHNeApUsg1A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qRopC9c+wx/+YYC0sJ/UvJzWi+Nuq8Af/LOL6TTdw1ObAiA1N4EP+e6QolBr4MpT6
	 p5ltChjlCbyDDYRz89R5OVuaZ83tbLw+pYcksx/XVXGNoBUri07jOIpHu8d097AHB/
	 gSDUJRuD+w/qmayEwLfKcRkm+4e+sfpRcvHaPFTEPbrRTxGpnFsatWWUdcTBd7OQnA
	 w+ym87xDkxssPWo79tPQu/rSntgc4PEKUjTQ4e3C6qaM9CVgjCp/lHxzZltc1AavRM
	 /LPUSo4AklmCrtIuWgWZpLqR0YnBmCrfB22k4a1IjHg5OgJnYBulNV1QgQrtx5KTRE
	 uIiF1y2I3VB1w==
Message-ID: <a40c0dfc-b531-4cc0-80b2-5b972d9fb65c@kernel.org>
Date: Mon, 12 May 2025 11:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
To: Thomas Gleixner <tglx@linutronix.de>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 amd-gfx@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
 Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Andreas Kemnade <andreas@kemnade.info>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>,
 Andy Shevchenko <andy@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Antoine Tenart <atenart@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
 Baruch Siach <baruch@tkos.co.il>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
 Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Borislav Petkov <bp@alien8.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Corentin Chary <corentin.chary@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Daniel Mack <daniel@zonque.org>,
 Daniel Palmer <daniel@thingy.jp>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dongliang Mu <dzm91@hust.edu.cn>, Doug Berger <opendmb@gmail.com>,
 dri-devel@lists.freedesktop.org, Eddie James <eajames@linux.ibm.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Chen-Yu Tsai <wens@csie.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Chris Zankel <chris@zankel.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>,
 Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Jiawen Wu
 <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>,
 John Crispin <john@phrozen.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Joyce Ooi <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Keerthy
 <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Linus Walleij <linusw@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-remoteproc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-um@lists.infradead.org, linux-wireless@vger.kernel.org,
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Lukasz Luba <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Mark Brown <broonie@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Max Filippov
 <jcmvbkbc@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>,
 Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 platform-driver-x86@vger.kernel.org,
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Qiang Zhao
 <qiang.zhao@nxp.com>, Qin Jian <qinjian@cqplus1.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>,
 Rob Clark <robdclark@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>,
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Samuel Holland <samuel@sholland.org>, Santosh Shilimkar
 <ssantosh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>,
 Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Simona Vetter <simona@ffwll.ch>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stephen Boyd <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>,
 Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>,
 Tero Kristo <kristo@kernel.org>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Tony Lindgren <tony@atomide.com>,
 Tony Luck <tony.luck@intel.com>, UNGLinuxDriver@microchip.com,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>,
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Zhang Rui <rui.zhang@intel.com>
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <874ixxonyy.ffs@tglx>
Content-Language: en-US
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <874ixxonyy.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06. 05. 25, 15:41, Thomas Gleixner wrote:
> On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:
> 
>> Hi,
>>
>> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
>> respective ones via their trees (as they are split per subsys), so that
>> the IRQ tree can take only the rest. That would minimize churn/conflicts
>> during merges.
> 
> So. It's rc5 by now and I picked up everything

Good, thanks.

> which did not show up in next yet. 

Which is the majority -- routing through subsystems didn't work as well 
as I anticipated.

I planned to retry with v3 after the next merge window, but you were faster.

V3 contains a switch from nodes to dev_fwnode() in some cases. It 
simplifies the code there. This did not get lost, I will send this 
separately to maintainers once everything from this series settles in 
the tree. I.e. likely after the next merge window.

> @Jiri, I fixed up all your subject prefixes as
> 
>    'irqdomain: subsys: Switch to foo()'
> 
> does not make any sense at all. These subsystems have their regular
> prefixes and these changes do not justify made up irqdomain special
> prefixes at all.

Yes.

thanks,
-- 
js
suse labs

