Return-Path: <linux-i2c+bounces-9902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF085A687FC
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:30:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 206FD17787E
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 09:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E25253B4D;
	Wed, 19 Mar 2025 09:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JHFpFquv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4EF1EEE6;
	Wed, 19 Mar 2025 09:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376638; cv=none; b=e1pZnfdbyvuC7ZC/ZSb7FkiBNg0VVurF2man+HiDb++W9aRLzia3biottSeWZuyt74n5xznNevj4Uvj7WoYzeWBqeauBAIw72YB/KlsO+YSWgR5STQ+rK2PNDqPRJioJivJbzecxoawPDYhVOF5YopsIsW/TrAetBFDmCv7JIQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376638; c=relaxed/simple;
	bh=kIAOhvTDwNJUqqsksoBZcEdbt37vq7mpC+KqsAhXVn4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gAPM5b2rGGykHS4xKYa0k5J82RSD86uzfjzA+/EOkiE6y4zYO81xoU/3250SnIFvaD1QlnFtlj5RdXZcXWne8BzVbDYX7+Sw7E5vYe+egK3n134FaS3LrIiA87TVYaILob0Nrs6QwcOGhx6PqUnyrI6T9aqh+ZDOli2m7wj9XpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JHFpFquv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCC5BC4CEE9;
	Wed, 19 Mar 2025 09:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376638;
	bh=kIAOhvTDwNJUqqsksoBZcEdbt37vq7mpC+KqsAhXVn4=;
	h=From:To:Cc:Subject:Date:From;
	b=JHFpFquv/U6v4vkowPwaMXcGCfItYIAsWV00Ih7EbBLTrDnNHDkqgRUa5ZcdR6PPT
	 GE73t7IHMHaA5apvRNwpbDEvupLn5GEAROfwG8bfOC3cWm4r+wAQpSmx/nSdIOfft3
	 g6zWFgTwbkIm1pTwp9PFGCWv+F/37wpisUTihZ018rrKSrTzndRRSods8QhjPWc0h0
	 Dz0blnLWWjitFHWBcwSlPWcVj9l1cqhOjMZjmHLHersV3cpNGEMv4hjcn3IBGUGMpD
	 Uwpffo6LtYQoMnAAzDkwZWIhy/r5yBypbyXxtoG2EVI7F+M9Ak3ZkA195gONZahMqe
	 3dXetUJTXAo6w==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Alex Shi <alexs@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	amd-gfx@lists.freedesktop.org,
	Amit Kucheria <amitk@kernel.org>,
	Anatolij Gustschin <agust@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Andreas Kemnade <andreas@kemnade.info>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Andrew Lunn <andrew@lunn.ch>,
	Andy Shevchenko <andy@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Antoine Tenart <atenart@kernel.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Anup Patel <anup@brainfault.org>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Corentin Chary <corentin.chary@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Daniel Mack <daniel@zonque.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Doug Berger <opendmb@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eddie James <eajames@linux.ibm.com>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Geoff Levand <geoff@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Chris Zankel <chris@zankel.net>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	James Morse <james.morse@arm.com>,
	Janne Grunau <j@jannau.net>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Crispin <john@phrozen.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Joyce Ooi <joyce.ooi@intel.com>,
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
	Keerthy <j-keerthy@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-remoteproc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-um@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	loongarch@lists.linux.dev,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Mark Brown <broonie@kernel.org>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Michael Buesch <m@bues.ch>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <michal.simek@amd.com>,
	Miodrag Dinic <miodrag.dinic@mips.com>,
	Naveen N Rao <naveen@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nishanth Menon <nm@ti.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	platform-driver-x86@vger.kernel.org,
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Qin Jian <qinjian@cqplus1.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ray Jui <rjui@broadcom.com>,
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Rich Felker <dalias@libc.org>,
	Rob Clark <robdclark@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Robert Richter <rric@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Samuel Holland <samuel@sholland.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Scott Branden <sbranden@broadcom.com>,
	Scott Wood <oss@buserror.net>,
	Sean Paul <sean@poorly.run>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Simona Vetter <simona@ffwll.ch>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stephen Boyd <sboyd@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Talel Shenhar <talel@amazon.com>,
	Tero Kristo <kristo@kernel.org>,
	Thangaraj Samynathan <Thangaraj.S@microchip.com>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Toan Le <toan@os.amperecomputing.com>,
	Tony Lindgren <tony@atomide.com>,
	Tony Luck <tony.luck@intel.com>,
	UNGLinuxDriver@microchip.com,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	WANG Xuerui <kernel@xen0n.name>,
	Woojung Huh <woojung.huh@microchip.com>,
	x86@kernel.org,
	Yanteng Si <si.yanteng@linux.dev>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
Date: Wed, 19 Mar 2025 10:28:53 +0100
Message-ID: <20250319092951.37667-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

tl;dr if patches are agreed upon, I ask subsys maintainers to take the
respective ones via their trees (as they are split per subsys), so that
the IRQ tree can take only the rest. That would minimize churn/conflicts
during merges.

===

While I was reading through the irqdomain code and headers, I found some
naming and documentation hard to follow or incomplete. Especially the
naming of _add/_create/_instantiate functions.

I tried to come up with a better state with this patchset:
* only irq _domain_ (not host),
* only irq_domain_create*() functions, all taking fwnode uniformly,

Finally, all the irqdomain stuff is now plugged (and generated) into
Documentation. So that everyone can walk through it at
https://www.kernel.org/doc/ (once applied, of course).

Changelog
---------
[v2]
- 'extern' removal patch dropped (already merged into tip),
- some new patches added,
- only _create*() functions preserved, all _add*() are removed,
  as per <87wme3m4a9.ffs@tglx>.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Alex Shi <alexs@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: amd-gfx@lists.freedesktop.org
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Anatolij Gustschin <agust@denx.de>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: "Andreas Färber" <afaerber@suse.de>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Antoine Tenart <atenart@kernel.org>
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Daniel Mack <daniel@zonque.org>
Cc: Daniel Palmer <daniel@thingy.jp>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: DENG Qingfang <dqfext@gmail.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Doug Berger <opendmb@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Eddie James <eajames@linux.ibm.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
Cc: Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Herve Codina <herve.codina@bootlin.com>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Chris Zankel <chris@zankel.net>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: Janne Grunau <j@jannau.net>
Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Jim Quinlan <jim2101024@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: John Crispin <john@phrozen.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Jonas Bonn <jonas@southpole.se>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "Jonathan Neuschäfer" <j.neuschaefer@gmx.net>
Cc: Joyce Ooi <joyce.ooi@intel.com>
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Lee Jones <lee@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-rpi-kernel@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-sound@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-um@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Luke D. Jones" <luke@ljones.dev>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "Marek Behún" <kabel@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Mengyuan Lou <mengyuanlou@net-swift.com>
Cc: Michael Buesch <m@bues.ch>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Michal Simek <michal.simek@amd.com>
Cc: Miodrag Dinic <miodrag.dinic@mips.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: netdev@vger.kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nikhil Agarwal <nikhil.agarwal@amd.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>
Cc: Nishanth Menon <nm@ti.com>
Cc: "Pali Rohár" <pali@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Rosin <peda@axentia.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>
Cc: Qin Jian <qinjian@cqplus1.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Rich Felker <dalias@libc.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Robert Richter <rric@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: Scott Wood <oss@buserror.net>
Cc: Sean Paul <sean@poorly.run>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stafford Horne <shorne@gmail.com>
Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Talel Shenhar <talel@amazon.com>
Cc: Tero Kristo <kristo@kernel.org>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Toan Le <toan@os.amperecomputing.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: UNGLinuxDriver@microchip.com
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Vineet Gupta <vgupta@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Woojung Huh <woojung.huh@microchip.com>
Cc: x86@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Zhang Rui <rui.zhang@intel.com>

Jiri Slaby (SUSE) (57):
  irqdomain: um: use irq_domain_create_linear() helper
  irqdomain: Rename irq_set_default_host() to irq_set_default_domain()
  irqdomain: Rename irq_get_default_host() to irq_get_default_domain()
  irqdomain.h: Stop using 'host' for domain
  irqdomain: cdx: Switch to of_fwnode_handle()
  irqdomain: irqchip: Switch to of_fwnode_handle()
  irqdomain: pci: Switch to of_fwnode_handle()
  irqdomain: ppc: Switch to of_fwnode_handle()
  irqdomain: remoteproc: Switch to of_fwnode_handle()
  irqdomain: x86: Switch to of_fwnode_handle()
  irqdomain: Drop of_node_to_fwnode()
  irqdomain: Make irq_domain_create_hierarchy() an inline
  irqdomain: arc: Switch to irq_domain_create_linear()
  irqdomain: arm: Switch to irq_domain_create_*()
  irqdomain: bus: Switch to irq_domain_create_simple()
  irqdomain: edac: Switch to irq_domain_create_linear()
  irqdomain: gpio: Switch to irq_domain_create_*()
  irqdomain: gpu: Switch to irq_domain_create_linear()
  irqdomain: i2c: Switch to irq_domain_create_linear()
  irqdomain: iio: Switch to irq_domain_create_simple()
  irqdomain: irqchip: Switch to irq_domain_create_*()
  irqdomain: mailbox: Switch to irq_domain_create_tree()
  irqdomain: memory: Switch to irq_domain_create_linear()
  irqdomain: mfd: Switch to irq_domain_create_*()
  irqdomain: mips: Switch to irq_domain_create_*()
  irqdomain: misc: Switch to irq_domain_create_simple()
  irqdomain: net: Switch to irq_domain_create_*()
  irqdomain: nios2: Switch to irq_domain_create_linear()
  irqdomain: pci: Switch to irq_domain_create_linear()
  irqdomain: pinctrl: Switch to irq_domain_create_*()
  irqdomain: platform/x86: Switch to irq_domain_create_linear()
  irqdomain: ppc: Switch to irq_domain_create_*()
  irqdomain: sh: Switch to irq_domain_create_*()
  irqdomain: soc: Switch to irq_domain_create_*()
  irqdomain: sound: Switch to irq_domain_create_linear()
  irqdomain: spmi: Switch to irq_domain_create_tree()
  irqdomain: ssb: Switch to irq_domain_create_linear()
  irqdomain: thermal: Switch to irq_domain_create_linear()
  irqdomain: ppc: Switch irq_domain_add_nomap() to use fwnode
  irqdomain: Drop irq_domain_add_*() functions
  irqdomain: ppc: Switch to irq_find_mapping()
  irqdomain: sh: Switch to irq_find_mapping()
  irqdomain: gpio: Switch to irq_find_mapping()
  irqdomain: gpu: Switch to irq_find_mapping()
  irqdomain: i2c: Switch to irq_find_mapping()
  irqdomain: irqchip: Switch to irq_find_mapping()
  irqdomain: pinctrl: Switch to irq_find_mapping()
  irqdomain: soc: Switch to irq_find_mapping()
  irqdomain: Drop irq_linear_revmap()
  irqdomain: Use irq_domain_instantiate() retvals as initializers
  irqdomain: Make struct irq_domain_info variables const
  irqdomain.h: Improve kernel-docs of functions
  docs: irq/concepts: Add commas and reflow
  docs: irq/concepts: Minor improvements
  docs: irq-domain.rst: Simple improvements
  docs: irqdomain: Update
  irqdomain.c: Fix kernel-doc and add it to Documentation

 Documentation/core-api/genericirq.rst         |   2 -
 Documentation/core-api/irq/concepts.rst       |  27 +--
 Documentation/core-api/irq/irq-domain.rst     | 202 +++++++++--------
 .../zh_CN/core-api/irq/irq-domain.rst         |   8 +-
 arch/arc/kernel/intc-arcv2.c                  |   4 +-
 arch/arc/kernel/intc-compact.c                |   7 +-
 arch/arc/kernel/mcip.c                        |   3 +-
 arch/arm/common/sa1111.c                      |   6 +-
 arch/arm/mach-exynos/suspend.c                |   5 +-
 arch/arm/mach-imx/avic.c                      |   4 +-
 arch/arm/mach-imx/gpc.c                       |   5 +-
 arch/arm/mach-imx/tzic.c                      |   4 +-
 arch/arm/mach-omap1/irq.c                     |   3 +-
 arch/arm/mach-omap2/omap-wakeupgen.c          |   5 +-
 arch/arm/mach-pxa/irq.c                       |   7 +-
 arch/arm/plat-orion/gpio.c                    |  12 +-
 arch/mips/ath25/ar2315.c                      |   4 +-
 arch/mips/ath25/ar5312.c                      |   4 +-
 arch/mips/cavium-octeon/octeon-irq.c          |  31 +--
 arch/mips/lantiq/irq.c                        |   2 +-
 arch/mips/pci/pci-ar2315.c                    |   4 +-
 arch/mips/pci/pci-rt3883.c                    |   7 +-
 arch/mips/pci/pci-xtalk-bridge.c              |   2 +-
 arch/mips/ralink/irq.c                        |   2 +-
 arch/mips/sgi-ip27/ip27-irq.c                 |   2 +-
 arch/mips/sgi-ip30/ip30-irq.c                 |   2 +-
 arch/nios2/kernel/irq.c                       |   5 +-
 arch/powerpc/kvm/book3s_hv.c                  |   2 +-
 arch/powerpc/kvm/book3s_xive.c                |   2 +-
 arch/powerpc/platforms/44x/uic.c              |   9 +-
 .../powerpc/platforms/512x/mpc5121_ads_cpld.c |   3 +-
 arch/powerpc/platforms/52xx/media5200.c       |   2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c     |   6 +-
 arch/powerpc/platforms/52xx/mpc52xx_pic.c     |   6 +-
 .../platforms/85xx/socrates_fpga_pic.c        |   4 +-
 arch/powerpc/platforms/8xx/cpm1-ic.c          |   5 +-
 arch/powerpc/platforms/8xx/pic.c              |   5 +-
 arch/powerpc/platforms/amigaone/setup.c       |   2 +-
 arch/powerpc/platforms/chrp/setup.c           |   2 +-
 .../platforms/embedded6xx/flipper-pic.c       |   9 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c |   7 +-
 arch/powerpc/platforms/pasemi/setup.c         |   2 +-
 arch/powerpc/platforms/powermac/pic.c         |   9 +-
 arch/powerpc/platforms/powermac/smp.c         |   2 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c |   3 +-
 arch/powerpc/platforms/powernv/pci-ioda.c     |   4 +-
 arch/powerpc/platforms/ps3/interrupt.c        |   4 +-
 arch/powerpc/platforms/pseries/msi.c          |   4 +-
 arch/powerpc/sysdev/cpm2_pic.c                |   5 +-
 arch/powerpc/sysdev/ehv_pic.c                 |   9 +-
 arch/powerpc/sysdev/fsl_msi.c                 |   2 +-
 arch/powerpc/sysdev/ge/ge_pic.c               |   7 +-
 arch/powerpc/sysdev/i8259.c                   |   4 +-
 arch/powerpc/sysdev/ipic.c                    |   9 +-
 arch/powerpc/sysdev/mpic.c                    |  12 +-
 arch/powerpc/sysdev/tsi108_pci.c              |   4 +-
 arch/powerpc/sysdev/xics/xics-common.c        |   2 +-
 arch/powerpc/sysdev/xive/common.c             |   4 +-
 arch/sh/boards/mach-se/7343/irq.c             |   7 +-
 arch/sh/boards/mach-se/7722/irq.c             |   4 +-
 arch/sh/boards/mach-x3proto/gpio.c            |   2 +-
 arch/um/drivers/virt-pci.c                    |  15 +-
 arch/x86/kernel/apic/io_apic.c                |   2 +-
 arch/x86/kernel/apic/vector.c                 |   2 +-
 drivers/bus/moxtet.c                          |   6 +-
 drivers/cdx/cdx_msi.c                         |   4 +-
 drivers/edac/altera_edac.c                    |   4 +-
 drivers/gpio/gpio-brcmstb.c                   |   2 +-
 drivers/gpio/gpio-davinci.c                   |   5 +-
 drivers/gpio/gpio-em.c                        |   5 +-
 drivers/gpio/gpio-grgpio.c                    |   2 +-
 drivers/gpio/gpio-idt3243x.c                  |   2 +-
 drivers/gpio/gpio-lpc18xx.c                   |   8 +-
 drivers/gpio/gpio-mvebu.c                     |   2 +-
 drivers/gpio/gpio-mxc.c                       |   2 +-
 drivers/gpio/gpio-mxs.c                       |   4 +-
 drivers/gpio/gpio-pxa.c                       |   6 +-
 drivers/gpio/gpio-rockchip.c                  |   2 +-
 drivers/gpio/gpio-sa1100.c                    |   2 +-
 drivers/gpio/gpio-sodaville.c                 |   2 +-
 drivers/gpio/gpio-tb10x.c                     |   2 +-
 drivers/gpio/gpio-twl4030.c                   |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c       |   4 +-
 drivers/gpu/drm/msm/msm_mdss.c                |   2 +-
 drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
 drivers/i2c/busses/i2c-cht-wc.c               |   2 +-
 drivers/i2c/muxes/i2c-mux-pca954x.c           |   8 +-
 drivers/iio/adc/stm32-adc-core.c              |   7 +-
 drivers/irqchip/exynos-combiner.c             |   2 +-
 drivers/irqchip/irq-al-fic.c                  |   2 +-
 drivers/irqchip/irq-alpine-msi.c              |   7 +-
 drivers/irqchip/irq-apple-aic.c               |   4 +-
 drivers/irqchip/irq-armada-370-xp.c           |  18 +-
 drivers/irqchip/irq-aspeed-i2c-ic.c           |   2 +-
 drivers/irqchip/irq-aspeed-intc.c             |   2 +-
 drivers/irqchip/irq-aspeed-scu-ic.c           |   2 +-
 drivers/irqchip/irq-aspeed-vic.c              |   4 +-
 drivers/irqchip/irq-ath79-misc.c              |   4 +-
 drivers/irqchip/irq-atmel-aic-common.c        |   2 +-
 drivers/irqchip/irq-bcm2712-mip.c             |   4 +-
 drivers/irqchip/irq-bcm2835.c                 |   2 +-
 drivers/irqchip/irq-bcm2836.c                 |   2 +-
 drivers/irqchip/irq-bcm6345-l1.c              |   2 +-
 drivers/irqchip/irq-bcm7038-l1.c              |   2 +-
 drivers/irqchip/irq-bcm7120-l2.c              |   2 +-
 drivers/irqchip/irq-brcmstb-l2.c              |   2 +-
 drivers/irqchip/irq-clps711x.c                |   6 +-
 drivers/irqchip/irq-crossbar.c                |   6 +-
 drivers/irqchip/irq-csky-apb-intc.c           |   2 +-
 drivers/irqchip/irq-csky-mpintc.c             |   2 +-
 drivers/irqchip/irq-davinci-cp-intc.c         |   6 +-
 drivers/irqchip/irq-digicolor.c               |   2 +-
 drivers/irqchip/irq-dw-apb-ictl.c             |   2 +-
 drivers/irqchip/irq-ftintc010.c               |   5 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c   |   2 +-
 drivers/irqchip/irq-gic-v3.c                  |   4 +-
 drivers/irqchip/irq-goldfish-pic.c            |   7 +-
 drivers/irqchip/irq-hip04.c                   |   6 +-
 drivers/irqchip/irq-i8259.c                   |   4 +-
 drivers/irqchip/irq-idt3243x.c                |   2 +-
 drivers/irqchip/irq-imgpdc.c                  |   2 +-
 drivers/irqchip/irq-imx-gpcv2.c               |   6 +-
 drivers/irqchip/irq-imx-intmux.c              |   2 +-
 drivers/irqchip/irq-imx-irqsteer.c            |   2 +-
 drivers/irqchip/irq-ingenic-tcu.c             |   4 +-
 drivers/irqchip/irq-ingenic.c                 |   4 +-
 drivers/irqchip/irq-ixp4xx.c                  |   2 +-
 drivers/irqchip/irq-jcore-aic.c               |   5 +-
 drivers/irqchip/irq-keystone.c                |   4 +-
 drivers/irqchip/irq-lan966x-oic.c             |   2 +-
 drivers/irqchip/irq-loongarch-cpu.c           |   2 +-
 drivers/irqchip/irq-loongson-eiointc.c        |   2 +-
 drivers/irqchip/irq-loongson-htvec.c          |   2 +-
 drivers/irqchip/irq-loongson-liointc.c        |   2 +-
 drivers/irqchip/irq-loongson-pch-msi.c        |   2 +-
 drivers/irqchip/irq-loongson-pch-pic.c        |   2 +-
 drivers/irqchip/irq-lpc32xx.c                 |   4 +-
 drivers/irqchip/irq-ls-extirq.c               |   4 +-
 drivers/irqchip/irq-ls-scfg-msi.c             |  10 +-
 drivers/irqchip/irq-ls1x.c                    |   4 +-
 drivers/irqchip/irq-mchp-eic.c                |   5 +-
 drivers/irqchip/irq-meson-gpio.c              |   2 +-
 drivers/irqchip/irq-mips-cpu.c                |  13 +-
 drivers/irqchip/irq-mips-gic.c                |  15 +-
 drivers/irqchip/irq-mmp.c                     |  12 +-
 drivers/irqchip/irq-mscc-ocelot.c             |   4 +-
 drivers/irqchip/irq-mst-intc.c                |   4 +-
 drivers/irqchip/irq-mtk-cirq.c                |   5 +-
 drivers/irqchip/irq-mtk-sysirq.c              |   4 +-
 drivers/irqchip/irq-mvebu-gicp.c              |   2 +-
 drivers/irqchip/irq-mvebu-odmi.c              |   2 +-
 drivers/irqchip/irq-mvebu-pic.c               |   4 +-
 drivers/irqchip/irq-mvebu-sei.c               |   6 +-
 drivers/irqchip/irq-mxs.c                     |   4 +-
 drivers/irqchip/irq-nvic.c                    |   2 +-
 drivers/irqchip/irq-omap-intc.c               |   4 +-
 drivers/irqchip/irq-or1k-pic.c                |   4 +-
 drivers/irqchip/irq-orion.c                   |   6 +-
 drivers/irqchip/irq-owl-sirq.c                |   4 +-
 drivers/irqchip/irq-pic32-evic.c              |   8 +-
 drivers/irqchip/irq-pruss-intc.c              |   4 +-
 drivers/irqchip/irq-qcom-mpm.c                |   2 +-
 drivers/irqchip/irq-realtek-rtl.c             |   2 +-
 drivers/irqchip/irq-renesas-intc-irqpin.c     |   6 +-
 drivers/irqchip/irq-renesas-irqc.c            |   4 +-
 drivers/irqchip/irq-renesas-rza1.c            |   6 +-
 drivers/irqchip/irq-renesas-rzg2l.c           |   6 +-
 drivers/irqchip/irq-renesas-rzv2h.c           |   5 +-
 drivers/irqchip/irq-riscv-intc.c              |   2 +-
 drivers/irqchip/irq-sa11x0.c                  |   2 +-
 drivers/irqchip/irq-sni-exiu.c                |   6 +-
 drivers/irqchip/irq-sp7021-intc.c             |   4 +-
 drivers/irqchip/irq-starfive-jh8100-intc.c    |   4 +-
 drivers/irqchip/irq-stm32-exti.c              |   4 +-
 drivers/irqchip/irq-stm32mp-exti.c            |   9 +-
 drivers/irqchip/irq-sun4i.c                   |   2 +-
 drivers/irqchip/irq-sun6i-r.c                 |   4 +-
 drivers/irqchip/irq-sunxi-nmi.c               |   2 +-
 drivers/irqchip/irq-tb10x.c                   |   8 +-
 drivers/irqchip/irq-tegra.c                   |   5 +-
 drivers/irqchip/irq-ti-sci-inta.c             |  10 +-
 drivers/irqchip/irq-ti-sci-intr.c             |   7 +-
 drivers/irqchip/irq-ts4800.c                  |   2 +-
 drivers/irqchip/irq-uniphier-aidet.c          |   2 +-
 drivers/irqchip/irq-versatile-fpga.c          |   4 +-
 drivers/irqchip/irq-vf610-mscm-ir.c           |   6 +-
 drivers/irqchip/irq-vic.c                     |   5 +-
 drivers/irqchip/irq-vt8500.c                  |   2 +-
 drivers/irqchip/irq-wpcm450-aic.c             |   2 +-
 drivers/irqchip/irq-xilinx-intc.c             |   6 +-
 drivers/irqchip/irq-xtensa-mx.c               |   7 +-
 drivers/irqchip/irq-xtensa-pic.c              |   8 +-
 drivers/irqchip/irq-zevio.c                   |   4 +-
 drivers/irqchip/spear-shirq.c                 |   2 +-
 drivers/mailbox/qcom-ipcc.c                   |   4 +-
 drivers/memory/omap-gpmc.c                    |   6 +-
 drivers/mfd/88pm860x-core.c                   |   4 +-
 drivers/mfd/ab8500-core.c                     |   6 +-
 drivers/mfd/arizona-irq.c                     |   3 +-
 drivers/mfd/db8500-prcmu.c                    |   6 +-
 drivers/mfd/fsl-imx25-tsadc.c                 |   5 +-
 drivers/mfd/lp8788-irq.c                      |   2 +-
 drivers/mfd/max8925-core.c                    |   4 +-
 drivers/mfd/max8997-irq.c                     |   4 +-
 drivers/mfd/max8998-irq.c                     |   2 +-
 drivers/mfd/mt6358-irq.c                      |   6 +-
 drivers/mfd/mt6397-irq.c                      |   6 +-
 drivers/mfd/qcom-pm8xxx.c                     |   6 +-
 drivers/mfd/stmfx.c                           |   2 +-
 drivers/mfd/stmpe.c                           |   4 +-
 drivers/mfd/tc3589x.c                         |   6 +-
 drivers/mfd/tps65217.c                        |   2 +-
 drivers/mfd/tps6586x.c                        |   2 +-
 drivers/mfd/twl4030-irq.c                     |   4 +-
 drivers/mfd/twl6030-irq.c                     |   5 +-
 drivers/mfd/wm831x-irq.c                      |  15 +-
 drivers/mfd/wm8994-irq.c                      |   4 +-
 drivers/misc/hi6421v600-irq.c                 |   5 +-
 drivers/net/dsa/microchip/ksz_common.c        |   5 +-
 drivers/net/dsa/microchip/ksz_ptp.c           |   4 +-
 drivers/net/dsa/mv88e6xxx/chip.c              |   2 +-
 drivers/net/dsa/mv88e6xxx/global2.c           |   6 +-
 drivers/net/dsa/qca/ar9331.c                  |   4 +-
 drivers/net/dsa/realtek/rtl8365mb.c           |   4 +-
 drivers/net/dsa/realtek/rtl8366rb.c           |   6 +-
 .../net/ethernet/wangxun/txgbe/txgbe_irq.c    |   6 +-
 drivers/net/usb/lan78xx.c                     |   9 +-
 drivers/pci/controller/dwc/pci-dra7xx.c       |   4 +-
 drivers/pci/controller/dwc/pci-keystone.c     |   2 +-
 .../pci/controller/dwc/pcie-designware-host.c |   2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |   4 +-
 drivers/pci/controller/dwc/pcie-uniphier.c    |   2 +-
 .../controller/mobiveil/pcie-mobiveil-host.c  |  11 +-
 drivers/pci/controller/pci-aardvark.c         |  14 +-
 drivers/pci/controller/pci-ftpci100.c         |   4 +-
 drivers/pci/controller/pci-mvebu.c            |   6 +-
 drivers/pci/controller/pci-xgene-msi.c        |   5 +-
 drivers/pci/controller/pcie-altera-msi.c      |   4 +-
 drivers/pci/controller/pcie-altera.c          |   2 +-
 drivers/pci/controller/pcie-brcmstb.c         |   4 +-
 drivers/pci/controller/pcie-iproc-msi.c       |   6 +-
 drivers/pci/controller/pcie-mediatek-gen3.c   |   9 +-
 drivers/pci/controller/pcie-mediatek.c        |   6 +-
 drivers/pci/controller/pcie-rockchip-host.c   |   4 +-
 drivers/pci/controller/pcie-xilinx-cpm.c      |  10 +-
 drivers/pci/controller/pcie-xilinx-dma-pl.c   |  14 +-
 drivers/pci/controller/pcie-xilinx-nwl.c      |  11 +-
 drivers/pci/controller/pcie-xilinx.c          |   5 +-
 drivers/pci/controller/plda/pcie-plda-host.c  |  16 +-
 drivers/pinctrl/mediatek/mtk-eint.c           |   5 +-
 drivers/pinctrl/pinctrl-at91-pio4.c           |   2 +-
 drivers/pinctrl/pinctrl-keembay.c             |   2 +-
 drivers/pinctrl/pinctrl-single.c              |   9 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c         |   7 +-
 drivers/platform/x86/asus-tf103c-dock.c       |   2 +-
 drivers/remoteproc/pru_rproc.c                |   2 +-
 drivers/sh/intc/irqdomain.c                   |   5 +-
 drivers/soc/dove/pmu.c                        |   4 +-
 drivers/soc/fsl/qe/qe_ic.c                    |   8 +-
 drivers/soc/qcom/smp2p.c                      |   2 +-
 drivers/soc/qcom/smsm.c                       |   2 +-
 drivers/soc/tegra/pmc.c                       |   5 +-
 drivers/spmi/spmi-pmic-arb.c                  |   2 +-
 drivers/ssb/driver_gpio.c                     |   8 +-
 drivers/thermal/qcom/lmh.c                    |   3 +-
 drivers/thermal/tegra/soctherm.c              |   2 +-
 include/linux/gpio/driver.h                   |   5 +-
 include/linux/irqdomain.h                     | 211 ++++++++----------
 kernel/irq/irqdomain.c                        |  88 +-------
 sound/soc/codecs/wcd937x.c                    |   2 +-
 sound/soc/codecs/wcd938x.c                    |   2 +-
 sound/soc/codecs/wcd939x.c                    |   2 +-
 272 files changed, 838 insertions(+), 945 deletions(-)

-- 
2.49.0


