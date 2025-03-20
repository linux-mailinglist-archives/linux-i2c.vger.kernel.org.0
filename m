Return-Path: <linux-i2c+bounces-9953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A29A6A99C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 16:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4C281882983
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A611E834E;
	Thu, 20 Mar 2025 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jtAZa04N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBCF14B08A;
	Thu, 20 Mar 2025 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742483937; cv=none; b=OMRJ94PgOp+SNGi6FwFDwH7e0smL2GYZNvHn/GdwtWsM95NdwPtSjzDgMkW7TWf561ejRlZ+EFCq0SfzMPE9SzS4X+xqCXPYUyqXZSnvIJjnjOc8j5Jb85MSk5BPWSZ2BvpoV3yCxVFjOGNW6PB3PLdDsMMdF102CN/dUsUlPTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742483937; c=relaxed/simple;
	bh=1Z6H2iLvH3rXMt19HL+9taZFJeo/GqQ1pEgfLHm/VO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ffiktKpYT0dnPb3VPhH6Sm1TN4G5d03h4CC18XgEdoplTGPtyEJXlXWskCd4aM4oBLny5hi/h9dDFcytLmXEJkgiu1VOJn0kVQPipu07hdvDFxYBTAd3BmVzoZA+CiSNSCKBMxLq796yUehzDn7kYiiW7KkRpEnOx2XOvNpfd0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jtAZa04N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A232C4CEDD;
	Thu, 20 Mar 2025 15:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742483936;
	bh=1Z6H2iLvH3rXMt19HL+9taZFJeo/GqQ1pEgfLHm/VO8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jtAZa04NkVALEmArILtqhgvGWzNrqybg3hrSGdZZ2VVAFhkXh1nT4jpUcZ4Kc2DDn
	 0A6i4ERYcuiCeprXqYIMy4u4kiFrkwJYEeYsWv+53EA4mBSJ6BqBYD7yzk5jl0BW7F
	 3K+uSeS65G8FFh9VmSyWsSaODa9u59R3cNyzrD/bWKcMoby2y3/LjyBnzNkYD+iJSL
	 9QHQkLG/EQ0PXCuzUmTG72RV9mKDT4ZRjt1NiAC6yuM4pg17khef1prwdyUg+6q41R
	 XwbECsZNkZ4re5+LVruYEIZ107+IH+Jq6zDSLtPqFFjlA4zbkDNY4cbCQwK98Zoq0c
	 4mfWfzYas3b3w==
From: Mark Brown <broonie@kernel.org>
To: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: maz@kernel.org, linux-kernel@vger.kernel.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org, 
 Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
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
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Herve Codina <herve.codina@bootlin.com>, 
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 Huacai Chen <chenhuacai@kernel.org>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Chen-Yu Tsai <wens@csie.org>, "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Chris Zankel <chris@zankel.net>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>, 
 Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>, 
 Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Jiawen Wu <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>, 
 John Crispin <john@phrozen.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
 Joyce Ooi <joyce.ooi@intel.com>, 
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
 Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Linus Walleij <linusw@kernel.org>, 
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
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>, 
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
 Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>, 
 Nishanth Menon <nm@ti.com>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 platform-driver-x86@vger.kernel.org, 
 Prasad Kumpatla <quic_pkumpatl@quicinc.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, Qin Jian <qinjian@cqplus1.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, 
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, 
 Rob Clark <robdclark@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
 Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
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
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 WANG Xuerui <kernel@xen0n.name>, Woojung Huh <woojung.huh@microchip.com>, 
 x86@kernel.org, Yanteng Si <si.yanteng@linux.dev>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Zhang Rui <rui.zhang@intel.com>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Subject: Re: (subset) [PATCH v2 00/57] irqdomain: Cleanups and
 Documentation
Message-Id: <174248389026.68765.4225899402848645156.b4-ty@kernel.org>
Date: Thu, 20 Mar 2025 15:18:10 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Wed, 19 Mar 2025 10:28:53 +0100, Jiri Slaby (SUSE) wrote:
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
> 
> ===
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[35/57] irqdomain: sound: Switch to irq_domain_create_linear()
        commit: 83eddf0116b09186f909bc643f2093f266f204ea

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


