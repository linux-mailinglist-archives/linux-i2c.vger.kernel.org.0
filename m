Return-Path: <linux-i2c+bounces-11869-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CA5AFB9E3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 19:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B23DF423BAC
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Jul 2025 17:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B8A2E8895;
	Mon,  7 Jul 2025 17:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="InjHwR5y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33213254844;
	Mon,  7 Jul 2025 17:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751909303; cv=none; b=q0QNwDZilrU9g043f/OcX9ISM5wuDCHXJKNlyTxbD1i3mu+752jvLGYvi7qTV3w8xzGt2GnR33d1Aegn6QNrhhD1bej5Y5j39wuFWA0Qh3UxwqlpILxBnX5UTzCe7mvt75opf0ES/Z8d5OCKQDM8HxqKVGcRfNXqc+Xb7JeDLQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751909303; c=relaxed/simple;
	bh=DA0vYq7xQ92l2ohY6lnFRwwvg+usb4Pg+fhbyInf+a4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wyz7BmNaLMnUqnIw92xcJU+12zRQtii7M7qUK6TxuT6E5B89ZOeQj1+JF38lZKNCKpm9cMRFdVUgOwI+duwLmQHX1ZhN2FwIyAaCKS39hWNPvds4HsELNAj+1H0Xj5WXukFIZJickp2LeBjNquc4uQTfwS9L5Mt5ucbruAbOXv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=InjHwR5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFF4C4CEF4;
	Mon,  7 Jul 2025 17:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751909302;
	bh=DA0vYq7xQ92l2ohY6lnFRwwvg+usb4Pg+fhbyInf+a4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=InjHwR5yiJURFc32QyEd1ElrA8jBUJqwZ8RkJ+B4GfK/n7FXD5hG+RGeO/BOKa27A
	 MwjkvAiYZJtVvqzEawYcHG3VFaCQlA5RKsal9NDycBtcUe2EutUyQkC6Kn9PF8lwq2
	 sHw/1b1YqW79iFoMlq9bc+odY8w3LceQ4g/JGulNkLQD/oZHxqdFb//OxOm0ZWN4YB
	 pn09uSlBNDl4zxkQftoT47W9hm9ySJIIKZLneAXTbWEsSRLXZvmoIlXvw2oCtIasu8
	 40xY/X3u0Y7tdaDe/jBjhbsiF/9FTORO0wAHWXSXVf+uklisW2ns4ZQ+X3rRIZVHXD
	 8KB5UXjAb/D1Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b8134ef6aso29732941fa.0;
        Mon, 07 Jul 2025 10:28:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK+sU7+sUVkf2qm0jkpzFHkSaD24x4ypNw6YmfHaGVaFefXGjkrxqX8LDjlBKi7dIHgJgaDtRQRXpe@vger.kernel.org, AJvYcCV0gbAVqegtcFZuGtnhj/qv0za1X8KTI+YXHgWPmYEQaTI4MEQBVPRbmBj98Al7IuWutKGOPHXGdcU=@vger.kernel.org, AJvYcCVLzWd/yb+GS4LiHodhZoCcn3YU60g/B2kx1dRIH2yS2kRWnqifTP/gX5uq0UNPOmY9sxVEMzS6bxlp2KP2@vger.kernel.org, AJvYcCXgdpnbVfj0tQ8YSIrGQIch9cVdSjpcwiDXaqEwjEX1b3P1SknUawOrCHq0fZpD5cBBSSWQuTUI3ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUQo8+HOYffuKVxvio6F39eznXcuitCdyKWuMdmMiZOUWNC4hc
	LRvpJ9a0N73L98WF8mtRS3YkbVBDhACGAboKN4ednXQ9KIcuOaNbyhNEqel2uHjsRI8HI9A14tJ
	epar4ps22xXiHPCu4/viSJMhF6vUOmhA=
X-Google-Smtp-Source: AGHT+IFY+rLsffZJVhzZIq/tx6edFSvqTm7LgThpPh+tF0NsB2IUIPiOdKkZUrVJDtPq9uSRlUjRqtYSBJv3s5pRILs=
X-Received: by 2002:a05:651c:552:b0:32f:1f1b:1e68 with SMTP id
 38308e7fff4ca-32f1f1b32bamr22374831fa.18.1751909301146; Mon, 07 Jul 2025
 10:28:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <VI2PR04MB11147CCEFE4204B852807AAF2E841A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250707105816.GF11488@nxa18884-linux> <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
In-Reply-To: <20250707-careful-pragmatic-quail-e1a2d8-mkl@pengutronix.de>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 8 Jul 2025 01:28:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
X-Gm-Features: Ac12FXzWY8P19qDkdGNQUB3iwV0nucG8riI9TSaqcqIAG1yNxhf63TFCmT9amp4
Message-ID: <CAGb2v64PfUiKjrJyhcthuLt6FXQS6VoaShYZ3A3WO__3pu4O+w@mail.gmail.com>
Subject: Re: Dead lock with clock global prepare_lock mutex and device's power.runtime_status
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Carlos Song <carlos.song@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"rafael@kernel.org" <rafael@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, Frank Li <frank.li@nxp.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "pavel@kernel.org" <pavel@kernel.org>, 
	Bough Chen <haibo.chen@nxp.com>, "len.brown@intel.com" <len.brown@intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Aisheng Dong <aisheng.dong@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 7, 2025 at 7:05=E2=80=AFPM Marc Kleine-Budde <mkl@pengutronix.d=
e> wrote:
>
> On 07.07.2025 18:58:16, Peng Fan wrote:
> > On Tue, Jul 01, 2025 at 03:16:08AM +0000, Carlos Song wrote:
> > >Hi, All:
> > >
> > >We met the dead lock issue recently and think it should be common issu=
e and not sure how to fix it.
> > >
> > >We use gpio-gate-clock clock provider (drivers/clk/clk-gpio.c), gpio i=
s one of i2c gpio expander (drivers/gpio/gpio-pcf857x.c). Our i2c driver en=
able run time pm (drivers/i2c/busses/i2c-imx-lpi2c.c [1]). System random bl=
ocked when at reboot.
> > >
> > >The dead lock happen as below call stacks
> > >
> > >Task 117                                                Task 120
> > >
> > >schedule()
> > >clk_prepare_lock()--> wait prepare_lock(mutex_lock)     schedule() wai=
t for power.runtime_status exit RPM_SUSPENDING
> > >                           ^^^^ A                       ^^^^ B
> > >clk_bulk_unprepare()                                    rpm_resume()
> > >lpi2c_runtime_suspend()                                 pm_runtime_res=
ume_and_get()
> > >...                                                     lpi2c_imx_xfer=
()
> > >                                                        ...
> > >rpm_suspend() set RPM_SUSPENDING                        pcf857x_set();
> > >                           ^^^^ B                       ...
> > >                                                        clk_prepare_lo=
ck() --> hold prepare_lock
> > >                                                        ^^^^ A
> > >                                                        ...
> > >
> >
> > This is a common issue that clk use a big prepare lock which is easy
> > to trigger dead lock with runtime pm. I recalled that pengutronix raise=
d
> > this, but could not find the information.
>
> Alexander Stein stumbled over this issue some time ago:
>
> | https://lore.kernel.org/all/20230421-kinfolk-glancing-e185fd9c47b4-mkl@=
pengutronix.de/
>
> I encountered it too, while trying to add a clock provider driver for a
> SPI attached CAN controller which uses runtime pm.

Miquel from Bootlin posted a more formal description of the problem and
some possible solutions last year [1].

[1] https://lore.kernel.org/all/20240527181928.4fc6b5f0@xps-13/

