Return-Path: <linux-i2c+bounces-3765-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A2D8FA7AE
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 03:38:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E596B22104
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 01:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E2913D2BF;
	Tue,  4 Jun 2024 01:38:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2DF7462;
	Tue,  4 Jun 2024 01:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717465101; cv=none; b=JvxZkDxHuCb221SvNWLsy7LDyq2/cJhXDesH2TSL0d2EBGAGTmpgf7GkkY58zFmT8ooLBuWWmy/Ax9fz7gI8HfwXBO56ArDiOPAA78FS++EA8yBQ0kjF6nsxCwga3ymGWHxf5nILIHC0n0Dq0CtvSmMi88DvZ4Os2bOPE+1x1l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717465101; c=relaxed/simple;
	bh=AJSz8KJObMMDxhywmduW5EuoLxLL09BUaUxOa9QUubw=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=W76wPOqJhcfdB6bDI384qYWr5It8IGNtsF7P3ZiEf2do4DteNys1XNAEj5j60+v6mm0u/CGqeb0nwGs+414yqQsMpnESMXIbwZneeb0x7Kbi/vtHxEGiYG4HQPZLqgd0UOu3U5f8c5+SFb6zgHHWbikoW93g8IYO0vRmjfGZQu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4VtY6M2gZgzxRDr;
	Tue,  4 Jun 2024 09:34:19 +0800 (CST)
Received: from kwepemm600013.china.huawei.com (unknown [7.193.23.68])
	by mail.maildlp.com (Postfix) with ESMTPS id 7C016180069;
	Tue,  4 Jun 2024 09:38:14 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 kwepemm600013.china.huawei.com (7.193.23.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 4 Jun 2024 09:38:02 +0800
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
	<apais@linux.microsoft.com>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>, Giovanni
 Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
	<linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
	<andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
	<lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
	<enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Johannes
 Berg <johannes.berg@intel.com>, Gregory Greenman
	<gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>, Vinod Koul
	<vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Linus Walleij
	<linus.walleij@linaro.org>, Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>, Nikita
 Kravets <teackot@gmail.com>, Jiri Slaby <jirislaby@kernel.org>, Srinivas
 Pandruvada <srinivas.pandruvada@linux.intel.com>, Stanley Chang
	<stanley_chang@realtek.com>, Heikki Krogerus
	<heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
	Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
	<ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
	<mingo@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, Daniel
 Bristot de Oliveira <bristot@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel Wu
	<wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>, Mimi
 Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>, Roberto
 Sassu <roberto.sassu@huawei.com>, Eric Snowberg <eric.snowberg@oracle.com>,
	Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Mark Brown
	<broonie@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
	<keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-acpi@vger.kernel.org>, <linux-ide@vger.kernel.org>,
	<openipmi-developer@lists.sourceforge.net>, <linux-clk@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-rockchip@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<qat-linux@intel.com>, <dri-devel@lists.freedesktop.org>,
	<intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
	<nouveau@lists.freedesktop.org>, <linux-hwmon@vger.kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-leds@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-omap@vger.kernel.org>,
	<linux-mmc@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<platform-driver-x86@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
	<linux-bcachefs@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
	<cgroups@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <apparmor@lists.ubuntu.com>,
	<linux-security-module@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>
CC: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller"
	<davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal
	<dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally
	<djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Florian
 Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott
 Branden <sbranden@broadcom.com>, Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>, Heiko Stuebner <heiko@sntech.de>,
	Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad
	<pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, Huang Rui <ray.huang@amd.com>, "Gautham R.
 Shenoy" <gautham.shenoy@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, Viresh Kumar <viresh.kumar@linaro.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
	<jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
	<tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
	<lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare
	<jdelvare@suse.com>, Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Pavel Machek <pavel@ucw.cz>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Tony Lindgren <tony@atomide.com>, Adrian Hunter
	<adrian.hunter@intel.com>, Hu Ziji <huziji@marvell.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Potnuri
 Bharat Teja <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit
	<miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh J
 Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>, Andrew
 Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sebastian Reichel
	<sre@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
	<rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster
	<bfoster@redhat.com>, Tejun Heo <tj@kernel.org>, Zefan Li
	<lizefan.x@bytedance.com>, Johannes Weiner <hannes@cmpxchg.org>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin
 Schneider <vschneid@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jason Baron
	<jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, Paul Moore
	<paul@paul-moore.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn"
	<serge@hallyn.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Clemens
 Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Linus Torvalds
	<torvalds@linux-foundation.org>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <a6cff4d3-821a-3723-b261-3699053b5a51@huawei.com>
Date: Tue, 4 Jun 2024 09:37:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600013.china.huawei.com (7.193.23.68)

ÔÚ 2024/6/2 23:57, Andy Shevchenko Ð´µÀ:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> 
> Compile tested with `make allyesconfig` and `make allmodconfig`
> on x86_64, arm, aarch64, powerpc64 (8 builds total).
> 

[...]
> diff --git a/fs/ubifs/auth.c b/fs/ubifs/auth.c
> index a4a0158f712d..fc0da18bfa65 100644
> --- a/fs/ubifs/auth.c
> +++ b/fs/ubifs/auth.c
> @@ -264,13 +264,13 @@ int ubifs_init_authentication(struct ubifs_info *c)
>   		return -EINVAL;
>   	}
>   
> -	c->auth_hash_algo = match_string(hash_algo_name, HASH_ALGO__LAST,
> -					 c->auth_hash_name);
> -	if ((int)c->auth_hash_algo < 0) {
> +	err = __match_string(hash_algo_name, HASH_ALGO__LAST, c->auth_hash_name);
> +	if (err < 0) {
>   		ubifs_err(c, "Unknown hash algo %s specified",
>   			  c->auth_hash_name);
> -		return -EINVAL;
> +		return err;
>   	}
> +	c->auth_hash_algo = err;
>   
>   	snprintf(hmac_name, CRYPTO_MAX_ALG_NAME, "hmac(%s)",
>   		 c->auth_hash_name);

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>  # fs/ubifs

