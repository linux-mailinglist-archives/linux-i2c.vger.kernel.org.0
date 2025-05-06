Return-Path: <linux-i2c+bounces-10830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7A1AAC6C5
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 15:42:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A54A8178392
	for <lists+linux-i2c@lfdr.de>; Tue,  6 May 2025 13:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD6FF280A5F;
	Tue,  6 May 2025 13:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="H+VsQc83";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="A2WDNfDn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893A327A457;
	Tue,  6 May 2025 13:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538922; cv=none; b=Bn00Zo+MVOp58/hHjYKax14Z20wr7b4ZheCA4Z6bpqx2j8lKyH1XAY4sUpfJQ3qz/p6oeiRiAA2gaJ5KJa4+6YZGiV+lldxiz1azbKogjaAtEec4ooj6onW8GLSpQZce7aI26CjiuCy88gjva17OpBn4nN5HewHTX6EBfmRuWSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538922; c=relaxed/simple;
	bh=xid3ylr8PUedVja8ADfCHrXz8QvAkNFfRtSA6wAUKzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BOWTKVe4n0LUdryLoHZH/aJfRi1sDEVCNP1qft31IJCAQDqm83zLGThbHDUMc8kpFvxSAGf5A/q+CFKuyM9iiiNzLhdmbXBSSf2PBiqlq4MOvs1X5nqZfszzi6jesuS76sYaXbCYt2eK2OfG0DFN3qGaz5srkngtoZLJn8CLe+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=H+VsQc83; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=A2WDNfDn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746538918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
	b=H+VsQc831BMBvRdCis3hR9IME8F22ohOOmKZluRXXeIChbYi1i570UHmhVD5rd7PsM0wkw
	1HP7eA6z+5IOLUhZQhdmF7or5iTztS2QKJRbmEAgjwq+1Hky247NEhKEDwxezgoUgE8R63
	V0qhDAjB+7b6J29c/AFLytdeXny2As20JkHKAF/cRWfC8kJjaTkOeduY468BYQE2K9Pe7t
	RZn4xt/lidjhGxatyOKQrc3oS+XevZF44OnoNsT2EV+VMTLkWVspPyrnrP+fONNObWghO5
	kqLvOAkiLKb35XcFpn3CDCCYGOIkDA8SOrbQ3Xkiok9AVLUm0v7enGUguU9+4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746538918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6KIDdrTanUmKEwxmKjGlY7d/jG09aY8AhXQLqxXMqzQ=;
	b=A2WDNfDnfT0mD/DZk/nR0ud2qdiz1r7YzlYDJPAh4yEaDeywUZVRbpTk6UzDijgMvH2IBC
	SeknVmXTWgr5wDBA==
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav
 Kumar <quic_abhinavk@quicinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Alex
 Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Alvin =?utf-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org,
 Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, Andi
 Shyti <andi.shyti@kernel.org>, Andreas =?utf-8?Q?F=C3=A4rber?=
 <afaerber@suse.de>, Andreas
 Kemnade <andreas@kemnade.info>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Andrew Lunn <andrew@lunn.ch>, Andy
 Shevchenko <andy@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Antoine Tenart
 <atenart@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Anup
 Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
 asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach
 <baruch@tkos.co.il>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Bjorn Andersson
 <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Borislav
 Petkov <bp@alien8.de>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Corentin Chary <corentin.chary@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, Daniel Golle
 <daniel@makrotopia.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Daniel Mack <daniel@zonque.org>, Daniel Palmer <daniel@thingy.jp>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Airlie <airlied@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, DENG Qingfang <dqfext@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Dongliang Mu <dzm91@hust.edu.cn>, Doug
 Berger <opendmb@gmail.com>, dri-devel@lists.freedesktop.org, Eddie James
 <eajames@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, Fabio Estevam
 <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
 Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Gregory Clement
 <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>, Hans de Goede
 <hdegoede@redhat.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Haojian
 Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Herve Codina <herve.codina@bootlin.com>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>, Huacai Chen
 <chenhuacai@kernel.org>, Changhuang Liang
 <changhuang.liang@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>, Christian =?utf-8?Q?K?=
 =?utf-8?Q?=C3=B6nig?=
 <christian.koenig@amd.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, Ilpo
 =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Imre Kaloz
 <kaloz@openwrt.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, James
 Morse <james.morse@arm.com>, Janne Grunau <j@jannau.net>, Janusz
 Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Jassi
 Brar <jassisinghbrar@gmail.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Jianjun
 Wang <jianjun.wang@mediatek.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Jim Quinlan <jim2101024@gmail.com>,
 Jingoo Han <jingoohan1@gmail.com>, Joel Stanley <joel@jms.id.au>, Johannes
 Berg <johannes@sipsolutions.net>, John Crispin <john@phrozen.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonas Bonn
 <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>, Jonathan
 =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Joyce Ooi
 <joyce.ooi@intel.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Keerthy
 <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Lakshmi Sowjanya D
 <lakshmi.sowjanya.d@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, Lee
 Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij
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
 Ludovic Desroches <ludovic.desroches@microchip.com>, Lukasz Luba
 <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Marek =?utf-8?Q?Beh=C3=BAn?=
 <kabel@kernel.org>, Marijn
 Suijten <marijn.suijten@somainline.org>, Mark Brown <broonie@kernel.org>,
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Mengyuan Lou <mengyuanlou@net-swift.com>,
 Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Michal
 Simek <michal.simek@amd.com>, Miodrag Dinic <miodrag.dinic@mips.com>,
 Naveen N Rao <naveen@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal
 <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, Nishanth
 Menon <nm@ti.com>, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Palmer
 Dabbelt
 <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Cercueil
 <paul@crapouillou.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin
 <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>, Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 platform-driver-x86@vger.kernel.org, Prasad Kumpatla
 <quic_pkumpatl@quicinc.com>, Qiang Zhao <qiang.zhao@nxp.com>, Qin Jian
 <qinjian@cqplus1.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Randy
 Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, Rengarajan
 Sundararajan <Rengarajan.S@microchip.com>, Richard Cochran
 <richardcochran@gmail.com>, Richard Weinberger <richard@nod.at>, Rich
 Felker <dalias@libc.org>, Rob Clark <robdclark@gmail.com>, Robert Jarzmik
 <robert.jarzmik@free.fr>, Robert Richter <rric@kernel.org>, Rob Herring
 <robh@kernel.org>, Roger Quadros <rogerq@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Samuel Holland <samuel@sholland.org>, Santosh
 Shilimkar <ssantosh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>, Sean
 Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>, Sean Wang
 <sean.wang@mediatek.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Shawn Lin
 <shawn.lin@rock-chips.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stephen Boyd
 <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>, Takashi Iwai
 <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>, Tero Kristo
 <kristo@kernel.org>, Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Thara Gopinath <thara.gopinath@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Toan Le <toan@os.amperecomputing.com>,
 Tony Lindgren <tony@atomide.com>, Tony Luck <tony.luck@intel.com>,
 UNGLinuxDriver@microchip.com, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>,
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>,
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Date: Tue, 06 May 2025 15:41:57 +0200
Message-ID: <874ixxonyy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Mar 19 2025 at 10:28, Jiri Slaby wrote:

> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.

So. It's rc5 by now and I picked up everything which did not show up in
next yet. As there are some patches in next, I delayed the removal of
functions for the merge window so that we don't end up with merge
dependencies.

To reducde conflicts, I grabbed the irq branch from the PCI tree under
the assumption that this branch is stable.

The series sits now in

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/cleanups

and will be in next soon. If there are duplicates showing up in next,
I'm going to remove them from my branch, so the branch is not for basing
development on.

@Jiri, I fixed up all your subject prefixes as

  'irqdomain: subsys: Switch to foo()'

does not make any sense at all. These subsystems have their regular
prefixes and these changes do not justify made up irqdomain special
prefixes at all.

Thanks,

        tglx

