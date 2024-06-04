Return-Path: <linux-i2c+bounces-3797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 172718FB823
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 17:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11E6281AB4
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Jun 2024 15:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9833E149C6D;
	Tue,  4 Jun 2024 15:53:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA463148FE6;
	Tue,  4 Jun 2024 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717516406; cv=none; b=J/ElMn9fnrAqKHj3Q04mRBprYqY+wqNGifUYyZiyMFLQLHCTS25Uj41KAD7XE06esu1IlUxJft+wyaIdDyTdhp7T/FBd6BJAtIa87svht6SR53OFyPuN5s0Fk6Vej4j+uOOzbygcSuA+kTNL5UlecU3UpWXjznFhBuuFSNTcJ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717516406; c=relaxed/simple;
	bh=jqzyU34fAZG4/WHYtSv7WuekoSVYXVRfGb6ve0icGKI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p24aUvh2sK+xxHKdgy6Nsc5etRY5CTEgKo1l4S7OjdgLXzMcnrN24i2KecpeN4cQrCEo2G5nkOI5AFT/v/bN9IbHUJb2/eqkeQWsl4pHDIpZORyG//m5nc3Wva1nnddlD6cegodt4qLjznDIf8yAzGpYSrbrXWn6acFsy+qIupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41BC2BBFC;
	Tue,  4 Jun 2024 15:52:38 +0000 (UTC)
Date: Tue, 4 Jun 2024 11:52:35 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, "Rafael J. Wysocki"
 <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Corey Minyard <minyard@acm.org>, Allen Pais
 <apais@linux.microsoft.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Perry Yuan <perry.yuan@amd.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Nuno Sa <nuno.sa@analog.com>, Guenter Roeck
 <linux@roeck-us.net>, Randy Dunlap <rdunlap@infradead.org>, Andi Shyti
 <andi.shyti@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, Lee Jones
 <lee@kernel.org>, Samuel Holland <samuel@sholland.org>, Elad Nachman
 <enachman@marvell.com>, Arseniy Krasnov <AVKrasnov@sberdevices.ru>,
 Johannes Berg <johannes.berg@intel.com>, Gregory Greenman
 <gregory.greenman@intel.com>, Benjamin Berg <benjamin.berg@intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Robert Richter <rrichter@amd.com>,
 Vinod Koul <vkoul@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hans de Goede
 <hdegoede@redhat.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, Nikita Kravets <teackot@gmail.com>, Jiri
 Slaby <jirislaby@kernel.org>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Stanley Chang
 <stanley_chang@realtek.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Abdel Alkuor <abdelalkuor@geotab.com>,
 Kent Overstreet <kent.overstreet@linux.dev>, Eric Biggers
 <ebiggers@google.com>, Kees Cook <keescook@chromium.org>, Ingo Molnar
 <mingo@kernel.org>, Daniel Bristot de Oliveira <bristot@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>, Abel
 Wu <wuyun.abel@bytedance.com>, John Johansen <john.johansen@canonical.com>,
 Mimi Zohar <zohar@linux.ibm.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Roberto Sassu <roberto.sassu@huawei.com>, Eric Snowberg
 <eric.snowberg@oracle.com>, Takashi Iwai <tiwai@suse.de>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Mark Brown <broonie@kernel.org>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, keyrings@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-ide@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, qat-linux@intel.com,
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
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, David Howells <dhowells@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
 <lenb@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Damien Le Moal
 <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, Daniel Scally
 <djrscally@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Heiko
 Stuebner <heiko@sntech.de>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Huang
 Rui <ray.huang@amd.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Karol Herbst <kherbst@redhat.com>, Lyude Paul
 <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>, Jean Delvare
 <jdelvare@suse.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Pavel Machek <pavel@ucw.cz>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Tony
 Lindgren <tony@atomide.com>, Adrian Hunter <adrian.hunter@intel.com>, Hu
 Ziji <huziji@marvell.com>, Ulf Hansson <ulf.hansson@linaro.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Potnuri Bharat Teja
 <bharat@chelsio.com>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Miri Korenblit
 <miriam.rachel.korenblit@intel.com>, Kalle Valo <kvalo@kernel.org>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, JC Kuo <jckuo@nvidia.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Sebastian Reichel <sre@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, Helge Deller <deller@gmx.de>, Brian Foster
 <bfoster@redhat.com>, Zhihao Cheng <chengzhihao1@huawei.com>, Tejun Heo
 <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall
 <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Daniel Bristot de
 Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jason Baron <jbaron@akamai.com>, Jim
 Cromie <jim.cromie@gmail.com>, Paul Moore <paul@paul-moore.com>, James
 Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Dmitry
 Kasatkin <dmitry.kasatkin@gmail.com>, Clemens Ladisch <clemens@ladisch.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1 1/1] treewide: Align match_string() with
 sysfs_match_string()
Message-ID: <20240604115235.044acfd6@gandalf.local.home>
In-Reply-To: <87tti9cfry.fsf@intel.com>
References: <20240603211538.289765-1-andriy.shevchenko@linux.intel.com>
	<87tti9cfry.fsf@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 04 Jun 2024 10:45:37 +0300
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> On Sun, 02 Jun 2024, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > Make two APIs look similar. Hence convert match_string() to be
> > a 2-argument macro. In order to avoid unneeded churn, convert
> > all users as well. There is no functional change intended.  
> 
> Why do we think it's a good idea to increase and normalize the use of
> double-underscore function names across the kernel, like
> __match_string() in this case? It should mean "reserved for the
> implementation, not to be called directly".
> 
> If it's to be used directly, it should be named accordingly, right?
> 
> Being in line with __sysfs_match_string() isn't a great argument alone,
> because this adds three times the number of __match_string() calls than
> there are __sysfs_match_string() calls. It's not a good model to follow.
> Arguably both should be renamed.

Agreed. I want to get rid of any functions starting with an underscore
except for those that are basically the same function used internally for
convenience.

Perhaps "match_string_dynamic()"? Where it is used for dynamically
allocated arrays without known size. Or, allow a third parameter for
dynamic arrays.

#define match_string(_a, _s, ...)
	char _______STR[] = __stringify((__VA_ARGS__));	\
	if (sizeof(_______STR) > 3)			\
		__match_string(_a, _s, ##__VA_ARGS__);  \
	else						\
		__match_string(_a, _s, ARRAY_SIZE(_a));

What the above stringify((__VA_ARGS__)) does is to check the size of any
args added to match_string(). if there isn't any, it will turn into:
"()\0", which is of size 3. If you add an argument, it will be:
"(<arg>)\0", which will have a size greater than three.

(trace_printk() does this trick in include/linux/kernel.h).

This way, both:

 match_string(array, sting);

or

 match_string(array, string, size);

will work.

-- Steve


