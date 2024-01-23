Return-Path: <linux-i2c+bounces-1440-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20863838EB2
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 13:45:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE5561F26577
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jan 2024 12:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A829A5EE74;
	Tue, 23 Jan 2024 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RiarLDzz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB05DF00;
	Tue, 23 Jan 2024 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706013910; cv=none; b=k+Yzaid5PoCgn7JiwyIp6/tiXrOx3asC3Y5P/pUCPXV92mKWdDwFlUOBwNWpBbFx1k5a5x87Fkdpqq75EhMyrULIBP3fmZ4YXZ4g70ZHcyh6TXlrOs7vofdPL0kujMEN44h5vo9V4jaNla9fryTguD+WKstXe6hM3/TE9h0WK9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706013910; c=relaxed/simple;
	bh=m/c1lPPu1YXGObYrj+WgGUhF4RVTsLyLde300zR9Fns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvlT7v4oNJZkdX+HDpc7MmFP8LDHhqP7xHVAPPNs8ucsfbZQaADfb+KsmMG9/7Zk6ZBEQmSfARfDaUiL5Os/JYCI4jDarQQ6xrnljaG/19caJPCoTMeCWxhlzZBalLppDLzsqaZfMDHZKP0hfQDhyxLPfT3LmiBba+euXTA/olI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RiarLDzz; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so439119166b.0;
        Tue, 23 Jan 2024 04:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706013907; x=1706618707; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oA1UQQc1JfCo+FECv9KYv1eo56zKsN80lRRNAWxIGh4=;
        b=RiarLDzz4o7g+PNLVaiubC8q0cDjVGzxGUlNPJ+7/nGUmDRV6CThw7JFnB1I6XOWVE
         TCgNCkFWlshDmfKsBjmQG70r20n8Cfk3nAAcYlkS2LxRPeHb5qmgXQ+6N4D43VOsHyLQ
         IOzs6+DgzPleDLGn5GaxSmHLW2RKHnGnzIHG1VapQNXh0ccMs/AVNVrE64FgB36PNQv9
         5HWW9jqhxgRpPxe6VdZwNqS9Kc8a/JRKiR2/mTWi0cH+14PLszKQUdUacN/q57buB+Ym
         bdYOzORVpARoaA38V6RCZqB7tsL58jGbaCCJSWuOkHJEV61B1scbWmMSuCnbluE1aPj8
         U4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706013907; x=1706618707;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oA1UQQc1JfCo+FECv9KYv1eo56zKsN80lRRNAWxIGh4=;
        b=XkWlQT6ZOCikwPh1ZiaXc4AWjG6WvkgiOptty1lltGF6kPMMPtmJKOhQyyEdNOMHM/
         FJU6qXCxxWUxoZZ4bMKXtv8rETWcBszVlRb+7bMe7iXJj7a5Ve4C9G+JWuUYEtSaOwgB
         oin5K4dMohLtDJeMhyHJny0Ct5Hy5C170d0fnC9yNQE+PkqZwlFK3KkOxL3XqFECqUD0
         gGQz3gVp+K9l8/n76qMX0iKRKTA1eSuXTZ3TDjg6x+PTG8IvYvJ0u9eWMQMMpOH3K5cS
         aBESTDJ3/5s5zkIkf/DyCqX4xbu6yMjtI+vqx51ayF8FO4K5xwzejarcq3u2e31hVLfi
         MMFg==
X-Gm-Message-State: AOJu0Yw7o+Q1/h1sslyGUJXZhsYwrVlkg8k8kexBEzQ7MuAXhoyWqhXR
	FOcVbnZtwLysYVBARmmi38Q9OAdf5lF7o6UQmOJFgV9TrcpmRiP2Ng+VF2bN3cBlQvCXYutv8GQ
	fTsg12AGMJuKtDeSMhuqdVsAgWVs=
X-Google-Smtp-Source: AGHT+IGVOi9cJtPjLV8rCcZZAIqP8Of+wjWmyBE/0kgMRwdEcXgkHHcr8D02Phwnkk/tQc54fmCf7RPslpX8DcJ6cZg=
X-Received: by 2002:a17:906:2b4d:b0:a30:cc38:f192 with SMTP id
 b13-20020a1709062b4d00b00a30cc38f192mr517708ejg.96.1706013906745; Tue, 23 Jan
 2024 04:45:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240102-j7200-pcie-s2r-v1-0-84e55da52400@bootlin.com>
 <20240102-j7200-pcie-s2r-v1-2-84e55da52400@bootlin.com> <CAHp75Verff06LE0QFaDRoun=ANpGfVU1tHknvvQZd_KyzLVP5Q@mail.gmail.com>
 <223422cc-2a1c-417b-8fa1-20d3b3eb41ef@bootlin.com> <CAHp75VcaABafPh7o1TjrHW2txXRRSxjT443XJe33gfS1YD4bhA@mail.gmail.com>
 <b59067f0-fdba-40d1-bb52-9f66fd833f40@bootlin.com>
In-Reply-To: <b59067f0-fdba-40d1-bb52-9f66fd833f40@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 23 Jan 2024 14:44:30 +0200
Message-ID: <CAHp75VdwwfTdYYG59DcwO=kPXmPxrkShk6VjoSQPHKDi_p=iMA@mail.gmail.com>
Subject: Re: [PATCH 02/14] pinctrl: pinctrl-single: move suspend/resume to suspend_noirq/resume_noirq
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Tom Joseph <tjoseph@cadence.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pci@vger.kernel.org, 
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com, 
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 4:33=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
> On 1/19/24 17:11, Andy Shevchenko wrote:
> > On Fri, Jan 19, 2024 at 6:08=E2=80=AFPM Thomas Richard
> > <thomas.richard@bootlin.com> wrote:
> >> On 1/15/24 21:02, Andy Shevchenko wrote:
> >>> On Mon, Jan 15, 2024 at 6:16=E2=80=AFPM Thomas Richard
> >>> <thomas.richard@bootlin.com> wrote:

...

> >>>> +static const struct dev_pm_ops pinctrl_single_pm_ops =3D {
> >>>> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pinctrl_single_suspend_noirq,
> >>>> +                                     pinctrl_single_resume_noirq)
> >>>> +};
> >>>
> >>> Use proper / modern macro.
> >>
> >> fixed, use DEFINE_NOIRQ_DEV_PM_OPS now
> >
> > ...
> >
> >>>>  #endif
> >>>
> >>> Why ifdeferry is needed (esp. taking into account pm_ptr() use below)=
?
> >>
> >> We may have an "unused variable" warning for pinctrl_single_pm_ops if
> >> CONFIG_PM is undefined (due to pm_ptr).
> >
> > This is coupled with the above. Fixing above will automatically make
> > the right thing.
>
> Yes you're right.
> By the way I can use pm_sleep_ptr instead of pm_ptr.

Yes, pm_sleep_ptr() is the correct one in this case.

--=20
With Best Regards,
Andy Shevchenko

