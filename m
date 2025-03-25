Return-Path: <linux-i2c+bounces-10006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4EFA6EA59
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 08:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A983F16E1D9
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 07:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2405D254857;
	Tue, 25 Mar 2025 07:20:19 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F72A20E6F7;
	Tue, 25 Mar 2025 07:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742887218; cv=none; b=TCDt+GUDqUBxtXlejW5IVxw9IcgkICQKaEgaiDt/fzaOhPQyDodOWmlkmsQ4aWJISN9nkkNA1Pt5IgYktYs29RjJLjOJyAFfvMrCwMcfZi9aUUqsYH0VdYo7rqCuo1+mN6J51JG4hvLpsEtPkoHrz9byDnuqvy5J+aN46Mol1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742887218; c=relaxed/simple;
	bh=7yAN5DWEseLPhSuJtJplgqzsW8Fn2NnOCRGJNmY+TWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJtNdqIm+UZrzoVtz/WLlfsOnT59+cPNPgkgOpG+OY1d0tz6PJscs274wNO6CJZZaOkD63wIwhVaspagEZUGjjOtT7dcLCpROIH3p8Wx2oiRaBT4AdT5qcmMI03ZxwbPQ7+I0/fd2WCRazI/nr3jagIBGer1fNgPQAqBB9YwyJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4ZMLXZ26Lwz9sSV;
	Tue, 25 Mar 2025 08:05:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFFIDcgfzoK7; Tue, 25 Mar 2025 08:05:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4ZMLXY2g73z9sSS;
	Tue, 25 Mar 2025 08:05:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DA00C8B766;
	Tue, 25 Mar 2025 08:05:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id FEOhRsdEs3K2; Tue, 25 Mar 2025 08:05:16 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 285238B763;
	Tue, 25 Mar 2025 08:05:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.17.1) with ESMTPS id 52P756MK009381
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:05:07 +0100
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.18.1/8.18.1/Submit) id 52P742SQ009337;
	Tue, 25 Mar 2025 08:04:02 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: tglx@linutronix.de, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, maz@kernel.org,
        linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        amd-gfx@lists.freedesktop.org, Amit Kucheria <amitk@kernel.org>,
        Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>,
        =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
        Andreas Kemnade <andreas@kemnade.info>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Antoine Tenart <atenart@kernel.org>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        Baruch Siach <baruch@tkos.co.il>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Corentin Chary <corentin.chary@gmail.com>,
        Daire McNamara <daire.mcnamara@microchip.com>,
        Daniel Golle <daniel@makrotopia.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Daniel Mack <daniel@zonque.org>, Daniel Palmer <daniel@thingy.jp>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dongliang Mu <dzm91@hust.edu.cn>, Doug Berger <opendmb@gmail.com>,
        dri-devel@lists.freedesktop.org, Eddie James <eajames@linux.ibm.com>,
        Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Geoff Levand <geoff@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Herve Codina <herve.codina@bootlin.com>,
        Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, "H. Peter Anvin" <hpa@zytor.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Changhuang Liang <changhuang.liang@starfivetech.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Zankel <chris@zankel.net>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, James Morse <james.morse@arm.com>,
        Janne Grunau <j@jannau.net>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Jianjun Wang <jianjun.wang@mediatek.com>,
        Jiawen Wu <jiawenwu@trustnetic.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Johannes Berg <johannes@sipsolutions.net>,
        John Crispin <john@phrozen.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Joyce Ooi <joyce.ooi@intel.com>,
        Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
        Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
        Lars-Peter Clausen <lars@metafoo.de>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linus Walleij <linusw@kernel.org>, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-remoteproc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linux-sound@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-um@lists.infradead.org,
        linux-wireless@vger.kernel.org, loongarch@lists.linux.dev,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Lukasz Luba <lukasz.luba@arm.com>, "Luke D. Jones" <luke@ljones.dev>,
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
        Mengyuan Lou <mengyuanlou@net-swift.com>, Michael Buesch <m@bues.ch>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michal Simek <michal.simek@amd.com>,
        Miodrag Dinic <miodrag.dinic@mips.com>,
        Naveen N Rao <naveen@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Nipun Gupta <nipun.gupta@amd.com>, Nishanth Menon <nm@ti.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
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
        Rob Clark <robdclark@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Samuel Holland <samuel@sholland.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>, Scott Wood <oss@buserror.net>,
        Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
        Siddharth Vadapalli <s-vadapalli@ti.com>,
        Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        Stephen Boyd <sboyd@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>,
        Tero Kristo <kristo@kernel.org>,
        Thangaraj Samynathan <Thangaraj.S@microchip.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Toan Le <toan@os.amperecomputing.com>,
        Tony Lindgren <tony@atomide.com>, Tony Luck <tony.luck@intel.com>,
        UNGLinuxDriver@microchip.com,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Vineet Gupta <vgupta@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>, WANG Xuerui <kernel@xen0n.name>,
        Woojung Huh <woojung.huh@microchip.com>, x86@kernel.org,
        Yanteng Si <si.yanteng@linux.dev>,
        Yoshinori Sato <ysato@users.osdn.me>, Zhang Rui <rui.zhang@intel.com>
Subject: Re: (subset) [PATCH v2 00/57] irqdomain: Cleanups and Documentation
Date: Tue, 25 Mar 2025 08:03:28 +0100
Message-ID: <174288553816.2234438.13558299160543301187.b4-ty@csgroup.eu>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742886214; l=533; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=EKh0/GewaFERhfnFRfKBg2j5NzMhdBBECdrA+NV/qUk=; b=vA70hw72XKaj1SXthnl6PXh4i9Z2K3Egqlb0PIRXfpHV2vrVCLTo/AG4L7b0hc2x3UCZ6Qx3v FOB4ERwauOeBecqk7A7PBvaW/237URvW4CKvgDK24Wh/OVU59RY4zZO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit


On Wed, 19 Mar 2025 10:28:53 +0100, Jiri Slaby (SUSE) wrote:
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
> 
> ===
> 
> [...]

Applied, thanks!

[48/57] irqdomain: soc: Switch to irq_find_mapping()
        commit: a70a3a6322131632cc6cf71e9d2fa6409a029fd7

Best regards,
-- 
Christophe Leroy <christophe.leroy@csgroup.eu>

