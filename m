Return-Path: <linux-i2c+bounces-9911-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EDBA68969
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 11:22:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A774917933C
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 10:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0215C253F0A;
	Wed, 19 Mar 2025 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Myvly8M/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E9B2512F5;
	Wed, 19 Mar 2025 10:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379753; cv=none; b=BO7gZ6DarywW1fMyIIhT+Ujzw1vf7DVHQKiR9hnSe/RUKZAGNlEvGHdhSJcip4a55KJPgnxU88jDvpkR1Fws1UEbNyplPtzz/uDc8rkV6N31GBl4OieGaEd+sVtlGb8fBM/5P75jULTqL3gMcnMc0VeBe8u4YZwxmWjdWSZL7Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379753; c=relaxed/simple;
	bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PoOo1o9Ut1nfwm8T81w4ovRivqmQ4dbFBG3bB9thira/ozEHIw1pJOJfJ3uLQIeANICUgWUZEY9ONcJIANd59DOCTr174MbbJo+ehOarCMEr/uHHha8oHj1maJs19KLYzYejGCt36j2ByXRlha/VFrl2NoD1/gsZvHobdavYbIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Myvly8M/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abbd96bef64so1160334366b.3;
        Wed, 19 Mar 2025 03:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742379750; x=1742984550; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=Myvly8M/PzwDJ19AUi/xhPPXgFzKUemh2qyKRC7XxRYPB0sjSjhU1+wPMbQkW1F1AY
         wdhDZdy6doSBVCk/k4PgtOVRFDkYVTnrj7Ps33QxY39UwsXzX3XEuvgVTxXZD4EUr12X
         /I/+FzX6Q0rm50Vf+v9KLxQT0/dKgXcEggcS0uPR+VKWHGbo6iL7N1m9A7hoM5GurYHr
         wyVQy0hweQAvF48BZBIIJSSgFs7GZWQbskDt2EeeLuMkWLgYDhkQmvBRWGLTtq9q/rOF
         e8lSAbdnqvbPdKDJI21v4Ol4I188scJX34zb0tpIFSMnoHDIuLKw/edExrkzIzl6x+YZ
         dEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379750; x=1742984550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAciZfuoMKuWSR7eQBgdr98ucgp4qUAEyHPTl4MU2Sc=;
        b=kWA9Qkz96vZVnayJyd7L0cneKp8BtCIjPOGD3bh19Q5CHJ7r0GP41yMxJYnDMcGsf4
         ctB2a9amU8PSpdVlkOjipvMaek/ej7KB6GDDYdPeBeXC5ucjzucvO5BK8Bjn8ecELD2M
         1LwPLF/ArCRkMYOlXiLeHTZlXuvGsLTd5Gzqc8DuigF8mJ/Px0NpJwi7DGaUGUnFUKCR
         5vxBiSH25zaBW/iSXdn6YC7gjoE6LFUfKSS2YjVBy8K7uqqnNywrOSCtZajLT2Gel14s
         B7CCrOowExpTAIQXK82PNkxaE/mcouCB4Mk8CegLVk5H6xti9YS4L3q93Bq2UNnh2N6I
         rx6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU9WbCOLd2cGM4Mf8MK/EszkDbDNOaKQig9AXU2vzHqPMCyOVkm78Y1EoymEIEtLY/xQRI49NPekIVg@vger.kernel.org, AJvYcCUDUVBFckmsDqpaqva3Gbde/pCCR84A+8ykFdmUPes0AmMFDEISgx/kL7SeXbpTWr3/b+PyGupIQiubMWpc@vger.kernel.org, AJvYcCUupl9mlW5pcrbLpJmzJvOVSqNJhY+mFqNcsg1qHaYvzWzYjhLceHSZi0yajrbNqLFHjWGEXVXWO6u1Ieoa@vger.kernel.org, AJvYcCVCfeFBlEqmHbpKSI1lzwY8x5sAH6Ggs7xVH/TP5Zpwsqd1h6fCMSqgH4d8Wh8P54+2YHAnLE1m/mvPept+zm43nYnrNw==@vger.kernel.org, AJvYcCVGa7C+5Aox/1Q6i5/7qaQLA8PGgC1vbqRYq1XJ+Ew9TRx5M5kwDoMh+k1ecC+hdbBvXfZtxO0ryPeN+Q==@vger.kernel.org, AJvYcCVKxCEg8x8M9DB6kcOuh2eVajLPfo0zRzu5a+nm5SbKgnMJlyeHkNJTR5Mi7NILdkzfZ88ZYC1mel8r@vger.kernel.org, AJvYcCVQYHG+DN3rjAVaxvaVc2ncInUHjEs1D6+8fhJOMNVyk9q2h8ac4BCz1GM/QyTHJjdJkKwfP4BVptyHjhs=@vger.kernel.org, AJvYcCVjjl+zX/3DX8jqqMJo7n+KPAcgTyBDo4kqrz1hk5VFnh9lVsbWHDV7mF6QZ6nrOu8ESoO0z6718OCkfCvf666ULA==@vger.kernel.org, AJvYcCWD0Q89x46jIsDg1Gf+dBSCI9EY7zbaxUrhYrSTe09VwOmHKYTEl5vxgDB2FWh9eUKmsHV+Sg1vcFSV@vger.kernel.org, AJvYcCWU
 Oq+0AnMBkOw9fQ1wLKMIO4LVn1a/8MI8w1Bs4RbFc8iYYF4Q3a3qe5pxnIS6X8MExRLNmUs9@vger.kernel.org, AJvYcCWgC2H2xr96bDhNPr4VHomQTKgQSVH2k9sfcOTVJsUAD1a7bctn+rnB9hdc8aJD+Ms8ttYX9vM7mMXYjA==@vger.kernel.org, AJvYcCX1MyX05cl+h02gJVY+d1rD2zaOhV/dF0Du2JFEbvEb7Ly/OzLLafwqgBx0FompWfYjkvILGPrzmSz4xw==@vger.kernel.org, AJvYcCXVAHkDGtU/nUguecIPWmn7TjdvsjokhR6d1JT9O8RQmNk2RSJ4GrR5miyuuD2HP4bHvJ/jvWckQ35L@vger.kernel.org, AJvYcCXaUQH4h6O6R8iyzfi5sCGqEL5fgmdYFv8eqpaLgQzXtnjoq/7mQ6kouoOSVpOHaTLNMlDGbYUMmg8=@vger.kernel.org, AJvYcCXhYWwA8WqgNjhk/SiMr4NwhYx/AFe7jQgoafqBCTjrV6HutwFHvBcxINTrtxxeuOOqa9MyI7TO5AhqYBQpx1Y=@vger.kernel.org, AJvYcCXv8YAeCe5InOOlsS+D6lo7e2fLqm/Zt3hzXJpV3pTGA2XOv09ZY9Gi6YXoywvVQ2xH0mJ8kCqq2ta7Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkACbKMbyHL6N1XirCyGOK9XtlPHQ0uC0z9hhH8OV6sY+NbfVD
	AEiEe2Mt2CkZBF8D5WRd897F55ntb1GP++RBYlCtlkzHUjVKU555WE9fXECkieoeQBHerzrnETX
	tq/a8CijHImp4kIq5PszXYxfWCPE=
X-Gm-Gg: ASbGncu2jCujqGTewcSrM812PqJehAVdNZv+rxlKNW9mx9eNcMwJlYsT4PgYFXIFJbs
	JzsFrQgDav4yDX/EOSvk6RhdrkrRlIDbQ7AI1AbGqdewNA7FW6+XWysKB5RysAy5halIVvzHjiz
	ICAel3biJQTxgItN9PLV/tMLvrl4RK
X-Google-Smtp-Source: AGHT+IFUke584GUxH6BvQB3fX7lUAUv9QcZ9e9muiwjx2XhCfAyl6Rwt1VC/I5GgI047etAZIOOFi7pICkkhLIq8oi8=
X-Received: by 2002:a17:906:f59f:b0:ac3:97f4:9c08 with SMTP id
 a640c23a62f3a-ac3b7de1176mr194902266b.31.1742379749621; Wed, 19 Mar 2025
 03:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319092951.37667-1-jirislaby@kernel.org>
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Mar 2025 12:21:53 +0200
X-Gm-Features: AQ5f1JplWeGobilHQOGjnSRx3FqTIg2f9LEWqzrz_L_kygQImpD-DssVqoDvovg
Message-ID: <CAHp75VfJPgaGyERBaSxSGap+Daeuy8kOjyjg+QkCtzxUydzHiQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/57] irqdomain: Cleanups and Documentation
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Alex Shi <alexs@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, amd-gfx@lists.freedesktop.org, 
	Amit Kucheria <amitk@kernel.org>, Anatolij Gustschin <agust@denx.de>, Andi Shyti <andi.shyti@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Andreas Kemnade <andreas@kemnade.info>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Antoine Tenart <atenart@kernel.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Baruch Siach <baruch@tkos.co.il>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Corentin Chary <corentin.chary@gmail.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Golle <daniel@makrotopia.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Daniel Mack <daniel@zonque.org>, 
	Daniel Palmer <daniel@thingy.jp>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Airlie <airlied@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	DENG Qingfang <dqfext@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Doug Berger <opendmb@gmail.com>, dri-devel@lists.freedesktop.org, 
	Eddie James <eajames@linux.ibm.com>, Eric Dumazet <edumazet@google.com>, 
	Fabio Estevam <festevam@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Gregory Clement <gregory.clement@bootlin.com>, Guo Ren <guoren@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Herve Codina <herve.codina@bootlin.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Zankel <chris@zankel.net>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Imre Kaloz <kaloz@openwrt.org>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	James Morse <james.morse@arm.com>, Janne Grunau <j@jannau.net>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Jim Quinlan <jim2101024@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Johannes Berg <johannes@sipsolutions.net>, 
	John Crispin <john@phrozen.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Jonas Bonn <jonas@southpole.se>, Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Joyce Ooi <joyce.ooi@intel.com>, Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, 
	Keerthy <j-keerthy@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
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
	Ludovic Desroches <ludovic.desroches@microchip.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	"Luke D. Jones" <luke@ljones.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Mark Brown <broonie@kernel.org>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Michael Buesch <m@bues.ch>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <michal.simek@amd.com>, 
	Miodrag Dinic <miodrag.dinic@mips.com>, Naveen N Rao <naveen@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>, 
	Nipun Gupta <nipun.gupta@amd.com>, Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paul Cercueil <paul@crapouillou.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Peter Rosin <peda@axentia.se>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	platform-driver-x86@vger.kernel.org, 
	Prasad Kumpatla <quic_pkumpatl@quicinc.com>, Qiang Zhao <qiang.zhao@nxp.com>, 
	Qin Jian <qinjian@cqplus1.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Ray Jui <rjui@broadcom.com>, 
	Rengarajan Sundararajan <Rengarajan.S@microchip.com>, Richard Cochran <richardcochran@gmail.com>, 
	Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>, Rob Clark <robdclark@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Robert Richter <rric@kernel.org>, Rob Herring <robh@kernel.org>, 
	Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Samuel Holland <samuel@sholland.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Scott Branden <sbranden@broadcom.com>, 
	Scott Wood <oss@buserror.net>, Sean Paul <sean@poorly.run>, Sean Wang <sean.wang@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Simona Vetter <simona@ffwll.ch>, Stafford Horne <shorne@gmail.com>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stephen Boyd <sboyd@kernel.org>, 
	Sven Peter <sven@svenpeter.dev>, Takashi Iwai <tiwai@suse.com>, Talel Shenhar <talel@amazon.com>, 
	Tero Kristo <kristo@kernel.org>, Thangaraj Samynathan <Thangaraj.S@microchip.com>, 
	Thara Gopinath <thara.gopinath@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Toan Le <toan@os.amperecomputing.com>, Tony Lindgren <tony@atomide.com>, 
	Tony Luck <tony.luck@intel.com>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Vineet Gupta <vgupta@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, WANG Xuerui <kernel@xen0n.name>, 
	Woojung Huh <woojung.huh@microchip.com>, x86@kernel.org, 
	Yanteng Si <si.yanteng@linux.dev>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Zhang Rui <rui.zhang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 11:30=E2=80=AFAM Jiri Slaby (SUSE) <jirislaby@kerne=
l.org> wrote:
>
> Hi,
>
> tl;dr if patches are agreed upon, I ask subsys maintainers to take the
> respective ones via their trees (as they are split per subsys), so that
> the IRQ tree can take only the rest. That would minimize churn/conflicts
> during merges.
>
> =3D=3D=3D
>
> While I was reading through the irqdomain code and headers, I found some
> naming and documentation hard to follow or incomplete. Especially the
> naming of _add/_create/_instantiate functions.
>
> I tried to come up with a better state with this patchset:
> * only irq _domain_ (not host),
> * only irq_domain_create*() functions, all taking fwnode uniformly,
>
> Finally, all the irqdomain stuff is now plugged (and generated) into
> Documentation. So that everyone can walk through it at
> https://www.kernel.org/doc/ (once applied, of course).

I am all to support the idea, but in some cases I would think of a bit
more work to be done to get rid of the of_fwnode_handle(np) in favour
of dev_fwnode(dev). Note, this is based on a brief look, I haven't any
example at hand right now.

--=20
With Best Regards,
Andy Shevchenko

