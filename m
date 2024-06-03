Return-Path: <linux-i2c+bounces-3757-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 968AE8FA54D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 00:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271191F228DD
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2024 22:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8735813C9CF;
	Mon,  3 Jun 2024 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JWil5/qF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09EE42ABE;
	Mon,  3 Jun 2024 22:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717452036; cv=none; b=Qmiy+bHclC020GV5PTKL0M7TjSTJz60lSY7LvoVgW3fN0//zhnp8yMqdOJWTXRBxToecG2CYX5vsfAepkfFd6LWcwUlKry86vdUaViPLdNa6jYu/gApGEuxHFk0HHF2lTKxbzePXIxMJhQDsyzDJYwuQBCnvQb+i/a/sw8Ny+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717452036; c=relaxed/simple;
	bh=ZMS/4Gp6hXyd9fPwx/y5x+q7VhsaGgJvMHFGFXB2aCI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a2bSp2lBcMD5U+Pc9BUsgl1djkPrpriT7AcT+RfCTl6uKrunUFTkiy3iYymKORe2OBXfIeheKRElca4GmfAx3hXgs9HduZ0GkTYfTfCSuaf5lljQfQmGNnGtnjv3S9EqL8KTCox1f5yj99UmN06yFhCU5Wd+I3a0fergGuQWmyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JWil5/qF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54BDEC2BD10;
	Mon,  3 Jun 2024 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717452035;
	bh=ZMS/4Gp6hXyd9fPwx/y5x+q7VhsaGgJvMHFGFXB2aCI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=JWil5/qFuymosoPDATfZqx6FJDnMlkeS59q6fSB+oGtZnzLWlZsOYK17IUuX1oHS1
	 +ZGbOlO5XGTxStebKzleLLdP/ku6ByksYgWD6+z1Mv7KGjnwR3GMzWiuZo1J++YQBe
	 YnonzpNdWoLK+5fnowMqG8M5MeJ10EV/gsKGvDpIY4wVIBC1HO+F/kfe8gBd+/QboZ
	 BrnDQ+EAlvw7Yi4J9eZ6M1GbDt3y6+iqhqMKYxUzNtAOVfJ3SN/iHY1B0HdRGk77/Z
	 OryQ3BNvB0McYwdX86nz7FOZKP/BNHRMgHpGVTqXr+aaBtJCcPNM0ORUNnE3rDopfE
	 4lfytT5yAufhQ==
Date: Mon, 3 Jun 2024 17:00:32 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
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
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
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
Message-ID: <20240603220032.GA701908@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>

On Sun, Jun 02, 2024 at 06:57:12PM +0300, Andy Shevchenko wrote:
> Make two APIs look similar. Hence convert match_string() to be
> a 2-argument macro. In order to avoid unneeded churn, convert
> all users as well. There is no functional change intended.

Looks nice, thanks for doing this.

> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ac6293c24976..2d317c7e1cea 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -210,7 +210,7 @@ void pcie_ecrc_get_policy(char *str)
>  {
>  	int i;
>  
> -	i = match_string(ecrc_policy_str, ARRAY_SIZE(ecrc_policy_str), str);
> +	i = match_string(ecrc_policy_str, str);
>  	if (i < 0)
>  		return;
>  

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# drivers/pci/

> +++ b/mm/vmpressure.c
> @@ -388,7 +388,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  
>  	/* Find required level */
>  	token = strsep(&spec, ",");
> -	ret = match_string(vmpressure_str_levels, VMPRESSURE_NUM_LEVELS, token);
> +	ret = match_string(vmpressure_str_levels, token);

VMPRESSURE_NUM_LEVELS looks like it's no longer used?

>  	if (ret < 0)
>  		goto out;
>  	level = ret;
> @@ -396,7 +396,7 @@ int vmpressure_register_event(struct mem_cgroup *memcg,
>  	/* Find optional mode */
>  	token = strsep(&spec, ",");
>  	if (token) {
> -		ret = match_string(vmpressure_str_modes, VMPRESSURE_NUM_MODES, token);
> +		ret = match_string(vmpressure_str_modes, token);

Ditto.

>  		if (ret < 0)
>  			goto out;
>  		mode = ret;

