Return-Path: <linux-i2c+bounces-3803-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D523C8FC2B9
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 06:29:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 633251F23BFB
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jun 2024 04:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CBB139D1B;
	Wed,  5 Jun 2024 04:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="0G0o//Gd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5540F2C95;
	Wed,  5 Jun 2024 04:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717561771; cv=fail; b=KnqL6eJH/haXjjwpHK8KRVO7rHs2i0YwjM0wGfESy6GJaSukL6l1XoMeuRK3y6x8awgHEWpdV7asSKdx/OvWcipZt3+LJrChEL2j2dTncHv4AP7nb1bQhrrnCfLkY7oNdGoirq86jOK84W0PXnumBCLSEujnYuDRvGh3vsw8wj8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717561771; c=relaxed/simple;
	bh=mLvyYxESEhyylShyrEkBDaSEuWU+jnm8i3Qa9s4x4BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bDOb2tlWSjvenfzGgNzVArN38dFnmEmtbzwXyAj1ET5If45+7DeGMOH2oCUf8KpJLs11JstSQ/SuqroGiezhTHLDmJzu//j8ctrXFsxuwmlqZNKDgP3GHDEx1NM2fO9nbXBj5ipu6F23yv6sX9VKFY1YAw7if8Y00jcXIzGkArY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=0G0o//Gd; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XUSesPNpWuyLTwtXZCqzkSjqzDRZ/SVR/0V/C31z01relle05+Vb+08NPPgXADBmMKz3KHKisVrcwHjAYK/uZ9mCuN5GNeRxNRR29c4PGPl19H6TrtJ/db4MQBibvL1xFzSAiLlKuakTeocIQXlbgODyy9CpGhfz58sIGaoEqEbkOOiS7ONwcpMSIDvSd4Qk18xMUmNRVne1HwGZJKPSreY8t4w5L3HfDDxYuY05hnOCHjxbIdCd3FUuCZHT+l4tRzoYazbppvTW/jDOi+dhU9itiJyHp1QYQjApZpRxNog0D5O2Dz7lY4dhxDFGW1SoOg9Npgra/ZarQqWa/AYk1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxgcLqg7K6tYbiI1YLFLI8WZj2voyoRV28JFaVuKhvc=;
 b=VpV4m2TPfXtsaRmotkM+ZMvc5b/65DhwWPpE/azv2ccweNK3ZV1TuXyUCncbyGcwJ5wdnQqgDOrc8by0lVAdD2+7bTTr1mhCid66rW5y1K6VGzXGvRirMFLlkvTOd+lhltAdgk/ijQNLQsJtu6Xbi5+JyKIWtafIkNBz+9Q1ipAJwR6KMvXXYPhavjmDMSlVds6BC7z50j1nhRm4UZOo2gxv7vZ+3ooQz9ImxFopPgxhmm4+Av+JeveJK2QjnFlE3jodEjRo4rm/UaUIyhAkLsoF9tVEB/EGzLEUbhGHLrQKUrcMj4rzRd18jN9p4d3clrW3ekEsSEh7XReCt9AubQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxgcLqg7K6tYbiI1YLFLI8WZj2voyoRV28JFaVuKhvc=;
 b=0G0o//Gdp9QnQxsEoSJzHZdh7c6wgKJvjqNALcHtN41Ybz0y84N95k85SzbmhhHd2HEI/waBbMs0MFbkmWKT1MLNfD4dYxdsHBAuCUV16+blX8MPmO9F/gSS0EIGfPZodyR4H4aifGrGJ/FW71cUoA9LGo74dXqBuFuP6DUYLLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB8252.namprd12.prod.outlook.com (2603:10b6:8:ee::7) by
 CH3PR12MB9430.namprd12.prod.outlook.com (2603:10b6:610:1cd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Wed, 5 Jun
 2024 04:29:23 +0000
Received: from DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2d0c:4206:cb3c:96b7]) by DS7PR12MB8252.namprd12.prod.outlook.com
 ([fe80::2d0c:4206:cb3c:96b7%5]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 04:29:23 +0000
Date: Wed, 5 Jun 2024 09:58:21 +0530
From: "Gautham R. Shenoy" <gautham.shenoy@amd.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Corey Minyard <minyard@acm.org>,
	Allen Pais <apais@linux.microsoft.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Elad Nachman <enachman@marvell.com>,
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
	Johannes Berg <johannes.berg@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Nikita Kravets <teackot@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Stanley Chang <stanley_chang@realtek.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abdel Alkuor <abdelalkuor@geotab.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Eric Biggers <ebiggers@google.com>,
	Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Daniel Bristot de Oliveira <bristot@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, Abel Wu <wuyun.abel@bytedance.com>,
	John Johansen <john.johansen@canonical.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-ide@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net, linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org, qat-linux@intel.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, linux-bcachefs@vger.kernel.org,
	linux-hardening@vger.kernel.org, cgroups@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org,
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org,
	linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Huang Rui <ray.huang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Jean Delvare <jdelvare@suse.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Hu Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Kalle Valo <kvalo@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Sebastian Reichel <sre@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <Zl/pZXNss8vQfEh+@BLR-5CG11610CF.amd.com>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
X-ClientProxiedBy: PN2PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::9) To DS7PR12MB8252.namprd12.prod.outlook.com
 (2603:10b6:8:ee::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB8252:EE_|CH3PR12MB9430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d71100c-5903-4196-bc10-08dc85181329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|7416005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TR0jt3DjeeeFlYLQoRK2wd4FGN/qTr3M/0NhgRSmV5FTXAZ/ChFE6dOz2WlR?=
 =?us-ascii?Q?RMMO0TSe0y8fX1FvMswwuB+Cw60xsR/r2B6JGTzFTYMaOAlt5qr0Kw4dqx18?=
 =?us-ascii?Q?B3M3dPGzwmuEkZ2i/PORnH1Cjs2NmVTdzgoFgVFqKQflM1JAQCxAA9I/qzC0?=
 =?us-ascii?Q?VI8dDTCeGJmS+hax3H3F4akhZOMB0f+5BkkSgjxqXHBMWkPR9eri5q9IBOvx?=
 =?us-ascii?Q?Z3M1sWhtFry/KKRr0Pvjhskfk+NoT0YCbToQSLouR0cdVTAH5r3/GKup/o2u?=
 =?us-ascii?Q?cwJFq49a0/YJPWMoEAUI/L2xszblWBYyt0K5elmhE+lH1jLNEw6hIzcLmv3A?=
 =?us-ascii?Q?DztytQo5qICQJZGeuA233IM9ydL4Qpvs80AIrFwCzqNewrZhIYgkkJ3GnsOl?=
 =?us-ascii?Q?Zc0AJmn8U8Aw33tTmX5arFSnJN9oQp490Uf3s9anqeuoghN6buuBp/5xvQMN?=
 =?us-ascii?Q?/RzcO35GTG7kUsBIGFh2Ex1O19OaMEXr1O6mJO0lmc8b+tXLRsF5zW8Q/gqQ?=
 =?us-ascii?Q?akFY40YyeLmyAwo+bkXA6sPanw8a9PvWG/zFDP38yiQeOdRebEkB+jBZce/j?=
 =?us-ascii?Q?BfX5CIn90PerZLVEFS4yIbqmUY+/js7wShwpwgfcIkEzmTZF0bAzefevYNoi?=
 =?us-ascii?Q?8y+KJtQf6D7CC+pX10F6SFuYecSVWcScT7hX0fbfJJ6wVFcrRmz0i5jhq5GB?=
 =?us-ascii?Q?2X/FNw6jSOk8mwF3KPNnIgYOoTkwEEdQRJ11/hDkLnC1JJ8OLTtamMVGb0EE?=
 =?us-ascii?Q?cbfYvjgvKdh3w0m5poiM8jzzPgwfE0M1+/gdkppes1u3JSSODPXT0+AhKrD3?=
 =?us-ascii?Q?EEdzHGvifIuMCazilW7+/+/7EdmfCTxuhalrwTTbBsDhtcR1jowTiVnAqvfY?=
 =?us-ascii?Q?LzuZG5kqPuKS73GxjsdktcxxEVZQKsyKHLJQpSmQm3w7SXVRb/ZBgkVVz66s?=
 =?us-ascii?Q?OgdHAIdmWaQx5Q63Zed5XcNHLbs3mrE5jKn4/fmEV9zKgn8/bZ++UYVPCJNG?=
 =?us-ascii?Q?zmmd/DPwjRPYCMvLEbRnIOXmN8z78SRpaLmGzgrjIiMZkQ3IP8UO+8amN6qH?=
 =?us-ascii?Q?eF/55RKpY92DJATflwhDgATB1W+WKQKBuwf/blgiDMBzigIhxVRyE1+s3L+A?=
 =?us-ascii?Q?wdRvspgSjX4RAgj12RcvlubO+A70SF9bl2NGtpiNgMs/9Oq/UYXheWS1lSoi?=
 =?us-ascii?Q?atWMI67YH/k29faGl1/3Knvf6FotIQV2H2s8rg8h0XcxexD+ijz3AEurgXfB?=
 =?us-ascii?Q?epr1lSlgUoFVFZIVqym7GXtC4IPyfz9pV/R7KriAUwk6wNLM8vEsCYV/5zlm?=
 =?us-ascii?Q?dIFCftoggNuzpEQyyuv66T8Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB8252.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GoEdR4M+NZV+gKBBU5jniAj8lrECAZQQk3XbFhYOIwRnrIO+C48lXqYmxP9C?=
 =?us-ascii?Q?ABtJTJKrksvKKp6yNN7qFBOUY/JMS0LE04sI6aPhOWnCHQZlnXHGzwxOyT0P?=
 =?us-ascii?Q?CPbdaa01A8jfqaijmYok1y+TqtaczhSq6kN54tvmHkaS/J106nTP1hDsGzjC?=
 =?us-ascii?Q?/HKFK4vtvNvM55/0uBFf8C64xGRLLTgHHSxpCRUi2l8V4/x5yA2m+oR7fg9g?=
 =?us-ascii?Q?vk8i6cHhYIZl/r8BmLiaWsv1/Xlk4K3eXtg+qbqohsgxnqxsI7FD3DBsABW3?=
 =?us-ascii?Q?yWtS9XOWnFjb6U8VGOTMPoWIhkPnbS5BWx4Dmygal+rw0vdKBeIU9xp4HFTE?=
 =?us-ascii?Q?M1xNNMx3YSvTEGB/PlMmBtQHw6ohmjrfiQC6+hfbw49ny4ND+lCfDG+S6PFg?=
 =?us-ascii?Q?VkFlkvwMTpUc6LIcFCndyw8b2LVdtval2XZ9M6JAn/eH4nHQ0vfXkbGt5ZAX?=
 =?us-ascii?Q?LXo+J/wdsAZ93jy12SZ48fv9gIAcjnu5a7HNskesrUFCX7dYxtZ/ZiPIjsoT?=
 =?us-ascii?Q?1UBuk6emMfPDh6N99+IKpPeTUNOplNtO/0ua78EyuQefuDRwKwvc5R6hItzz?=
 =?us-ascii?Q?bDpthfat7YjslVru9QKw+T8AcFibvwQDF2n8r10KADE6xuGFWgJozb5/Brsq?=
 =?us-ascii?Q?yfDUNaJg9puRhk3USkMXA97/MmsQJbUMuX2kyihsEenzWI9RKzH8glPGu8Q9?=
 =?us-ascii?Q?Z6BJt7+CqZ88qxLx/w21QrHyergJGC49N/+gt0ggTcQBg+0HESWBdXK0N4om?=
 =?us-ascii?Q?kJ5qP2+iCsDkYVPOuLPRs/wXEy+5POFQs/wNn7Z4M8TIcvlHM+KDalPM8z+J?=
 =?us-ascii?Q?hf1STfPPbV5GUTOo8wm7TjUdUfEM8k1CQ66ueIFNW0X73NG0AjvMAPe8AF9Z?=
 =?us-ascii?Q?BD6EroIlOma+zBp741WtpUnw14lf8Sg63mfwIG8mBabAW4PGRLHSB/Gy2xkp?=
 =?us-ascii?Q?CMmXirRjt3g0Qz0XVwj6pvVjn3I/Nzq3MaCaRmrAZ6noneNXMMXjtGug08de?=
 =?us-ascii?Q?lT2XHdgyD7ZSuby/Taie6RLRQP1oWErvwxZIftsLrejZuc28mVBijETAhxXW?=
 =?us-ascii?Q?MDX3EPL3wVbEgGeeCjuenD1eUlqSnvpKTdaQaRT3xtUpJuiZ5BEGw96toTPT?=
 =?us-ascii?Q?XPNue4VPzxqTxOfQSgVKCgE/OasJblcEgfZJqGBaPMYqZbGaK+0C20EEl4FM?=
 =?us-ascii?Q?L3OLf951ueg1DSuh0oSvpYIy3GQk7cB74NZoR5D/UzoETTeu/H5TxVlzLGSe?=
 =?us-ascii?Q?JAFs8QJIJIZIPhvJPxyrcUiiyhqkBgl4Jd1KExuYHG+hXbV71/Ed3qeISyyw?=
 =?us-ascii?Q?WphVOY8CNz/ZJOr3teXBeN2vF3j/e8PoRLwJPeZAYUDsi0fnk2jzW5CFRJDa?=
 =?us-ascii?Q?MpYvvJGgly7jDmrlewBYgikmX/1NJYPs1dwit9yYP0qPdOkyRtssX6fV1DDQ?=
 =?us-ascii?Q?pfZEH9Z5qZuaYTuEjkReM+t8okSJ4JPh7iLiMQ/dMA+nMTjHJAaKv7bQQCZp?=
 =?us-ascii?Q?4xwIyBNdZrVLoXWlY4/mISFkNd64rTH0NN2fIZ6ZlTsMzZEjGaqjdvbjd6ms?=
 =?us-ascii?Q?jT8Q5Nfg/U2HzGQfaZnH6/JVvNz+UdEnsDcQx4YI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d71100c-5903-4196-bc10-08dc85181329
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB8252.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2024 04:29:22.9168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T1dxbax+ztSvrRDMCEYhc4X8/u/IH6yJ+Lu/KrmdUjAtcefr09pt0ngCNQOZd3mreFJef3FdCvf/gZpFaihJhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9430

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.


> diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
> index 1b7e82a0ad2e..b6f52f44625f 100644
> --- a/drivers/cpufreq/amd-pstate.c
> +++ b/drivers/cpufreq/amd-pstate.c
> @@ -1117,9 +1117,9 @@ static ssize_t store_energy_performance_preference(
>  	if (ret != 1)
>  		return -EINVAL;
>  
> -	ret = match_string(energy_perf_strings, -1, str_preference);
> +	ret = __match_string(energy_perf_strings, -1, str_preference);
>  	if (ret < 0)
> -		return -EINVAL;
> +		return ret;
>  
>  	mutex_lock(&amd_pstate_limits_lock);
>  	ret = amd_pstate_set_energy_pref_index(cpudata, ret);


For drivers/cpufreq/amd-pstate.c

Acked-by: Gautham R. Shenoy <gautham.shenoy@amd.com>

--
Thanks and Regards
gautham.

