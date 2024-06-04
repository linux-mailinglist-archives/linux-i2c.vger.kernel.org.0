Return-Path: <linux-i2c+bounces-3782-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 468728FACDD
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 09:57:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A6EF1C21321
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 07:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4161411FA;
	Tue,  4 Jun 2024 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gBmATtqj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F5F14389D
	for <linux-i2c@vger.kernel.org>; Tue,  4 Jun 2024 07:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717487776; cv=none; b=ARFxTBfsAW9Mi7CB/g8Kl0qo9j104zwDlHHowWtWNihf1ENyP/1L3ASU/P1VT/rK87SyOc4JTMfOrV9xXvem+HtA50PhqTciVHtTx6Mm1UCxBww6fo/5m87UfOfUUfgdH/u86wjCV0p2xKBL/iEMsZFVj+jRmxg8kEdZJlQ6bEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717487776; c=relaxed/simple;
	bh=rm1oRY/z52jLvW3Kz8JXXATPeBMQwAX7lAr8kin9CZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDTOA36reXVYoAutDTmoECPFV31y7I/na6abh4wKXRBYhq1dRNCuvIBh461M5D7RCjQ6o65R939Ehe5WKnHZ39lnaGodi2ySrVw/2/nnsgd6cPdgjISyoY6VXb7W7xZUibqJI1esTsZMYvNk/A1rz4evatmQae4z9KNcu8hEohw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gBmATtqj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rm1o
	RY/z52jLvW3Kz8JXXATPeBMQwAX7lAr8kin9CZQ=; b=gBmATtqj3T5cofztD9gO
	wfxytqAcRK1KHLixwigA6Oc7e/xns1PQZ3E06WSpR7IPkRNHgXTBg+YGm+t+vujP
	aptXEyeXeauNzTMI5dH6xfGfOxK/vG6KOu30wj3qf8CWwQibRC9KvLs3BDzGqe5/
	/Y9Hcyo7BT698jA85PFi33gOQLW1z3ouybN5JpyXkzLmpoNWl2Pe2AFo0d7BKAzs
	dHpSxsaEpXcYMcTPZ7L53aiHyYSMavcNdUbaEbGStnqNBQw91wlHN+nudbxeRY5J
	m+7vari59g10r4KJuHuUlrRNrIdhY/Rbv8s6T5bIUAYnlvyfPzbCA91PnYNwB2VY
	/Q==
Received: (qmail 2211018 invoked from network); 4 Jun 2024 09:55:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jun 2024 09:55:57 +0200
X-UD-Smtp-Session: l3s3148p1@IZitxwsaKtsgAwDPXzLGAH1eNELjOc3g
Date: Tue, 4 Jun 2024 09:55:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, 
	Allen Pais <apais@linux.microsoft.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
	Johannes Berg <johannes.berg@intel.com>, Gregory Greenman <gregory.greenman@intel.com>, 
	Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>, 
	Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <ugowfb44wmiwr4l5hiu5r4n5ldqkvbq6fgbr2ueecfrqmyz7wf@vgpxlx5xdaey>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, 
	Allen Pais <apais@linux.microsoft.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Perry Yuan <perry.yuan@amd.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Elad Nachman <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
	Johannes Berg <johannes.berg@intel.com>, Gregory Greenman <gregory.greenman@intel.com>, 
	Benjamin Berg <benjamin.berg@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Robert Richter <rrichter@amd.com>, Vinod Koul <vkoul@kernel.org>, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Nikita Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers <ebiggers@google.com>, 
	Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, 
	Abel Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, 
	Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>, 
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, qat-linux@intel.com, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-bcachefs@vger.kernel.org, linux-hardening@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, alsa-devel@alsa-project.org, 
	linux-sound@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	David Howells <dhowells@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, 
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Huang Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Jean Delvare <jdelvare@suse.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Potnuri Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Sebastian Reichel <sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster <bfoster@redhat.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lgxkpk75pktaafag"
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>


--lgxkpk75pktaafag
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C


--lgxkpk75pktaafag
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZeyI0ACgkQFA3kzBSg
Kbb9VQ/+K5JbYNFgNRSOLCQVcW8FHPcmcqxfMUbxVkQj8p+MQCHFSw4V+TPD+woh
oimLDPQJy89KSE6WjRZ0DidphnWkOL7XzfPOXx7T8qSquPIQL5lN9cuJnVsd/GKC
9/Qom8iK8m5zQlu/NhsYi2BWcN/ci81DUMTH3NqEn0KzZz6bQ0a7KgadEolySlDx
ZkBF4SdolMHRYDJmbKS1C0Y6XhQ9ex2E57ej05C57UmL39vtldAnmG1odExJBm/b
KxlLGXLgKtzwXstpeJGp/Mr++WjebZMqatkUXxKzHBwNepPTTRo5RVZZC8eAdN3i
cfGrYCwwGYO4XLvQ5Kdaw0I/CnmzTgJcpMwIm32XH+cOvL7/NKejjmGwtdmJ+KJw
SPtc5nvKmjC+EJH10wWm8lnVUxiME93IXNqZ26MrGCNiSiDVwZrkfeASwMEPlW7v
WcEjlIILXPIZzqxIaHC30aPPqL+wkAcMU0MWrgt5UxzDtImo+6OjfJjlrX4v55Sd
EYTOFIiv77B+oKO1sQ1NV+RPjFQL2kbefJ2QIXPjvyXGhheqN3eaoP/LitjmrkIw
WPu5KtyLZp4a9QjMn1atuz7OgJQIRW3GlKyua4J3KJMsbzOuMRw/3zBwKdQbhPP4
MVv3GuxDvcMyWI9CRtdfnjF9ATAdmA6jzv8mKgazzPeufq+TEHk=
=VbKY
-----END PGP SIGNATURE-----

--lgxkpk75pktaafag--

