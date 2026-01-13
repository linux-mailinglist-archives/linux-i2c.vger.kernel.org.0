Return-Path: <linux-i2c+bounces-15083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD95BD16ED9
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 07:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF3C0302FBDB
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 06:58:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28338369220;
	Tue, 13 Jan 2026 06:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOd7Vi7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4D825F98B
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 06:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768287491; cv=none; b=k/rgNQ9495ujYmLCRXA+7F0KLRjt7zsJQXj5ql/qmJDLvHPpF1+eupMWJKptLP7Hb7K/2EZpyidUrYsQGXIpXE2tZkcyuckHQKh7R76p70b9UW975Nb5qL/OFm4TpFQmNUZ3lPC9vEiLVtjRgPlDsFh1KfXxKdFrtPXmgcu064Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768287491; c=relaxed/simple;
	bh=6jminxr0DqliOriiX/8zDfPseX+qizqx22OM4epuqIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdvBspEIgLYW330V4PtdP2Ry4jsxnSXOpSL5rJpjvwdQP+0BodZnDjGkcIBXfZO3C1oR0y6+JcZUMQaVAQ4jCKraQ6Ax6oNvIi6NxENB9HIF+/MRSryhdf2RVJCTKC83O38wCRKZbfLDrDfHJ0WXrJ9VzJyFIqANWzfKK7N4NsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOd7Vi7a; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso80622171cf.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 22:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768287489; x=1768892289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVmHxFnFhL2XXOOX/MiJ22lQR7Yt/NWHSFhuQYbbBYA=;
        b=hOd7Vi7aEjjgLvSRi2l8PbF1/dyfptW3tYwdgxmDdKvICq5eeeQz/j5l9IZsX5NNPx
         2yoWt2/eXyqwKhPu44qD7loGtG43riRcJ8TeHqtoD6EUrCxOX7bB09o/WW6CqPqZQ9DJ
         M/uXzBROAYNRDEt7p3uz9b6VfJpcA7N3cav32+ZlPlEGnqkIRwL1B1ZZ/KGyHsvKwvKd
         nkINi8QytVXJV2/vEuL9NWRkBmKlDMoCY1/pMePU3iGkYnAntLSgO0DBoyAH7B+7/hDD
         mCxH6xwPcc0aUAhs7I5pg9bz8vjnEw7f7OXGOnXN3lmY9oXdANrIw1h5hwiiOY9l8YWK
         SRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768287489; x=1768892289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iVmHxFnFhL2XXOOX/MiJ22lQR7Yt/NWHSFhuQYbbBYA=;
        b=k6ED7v2MnBVTLQ+Ak+Hl92Q+NHS3tMARaLrVvjBG3T32Vww172FH8k92yFC5HhakMO
         9d/h42JFpZmC/EpRxef4YBoV5cas1MgH7N2SWUGZUpHrzHdN7X7Ou+Uw088KTaxlNsaW
         X0BXdM0JuqM4N0JchhHXxa2E8giDP2vJGJ67R0BjODGn2YO8pk2HFvIavvlfUsCzKEqV
         QB+dMTvmE6Qe2PdcFv+9fVrBKXr9PFd0HbBR/jGCjDfeSMbHiJgpZdohB5lfucXg4YsK
         wx9giWPr8ZgijypWVkiNGXOV58v5lmA1WRUGyBVBNw8jIXo/xqVJTi1DTHWdUhvwHiDj
         gKSw==
X-Forwarded-Encrypted: i=1; AJvYcCXAIffEkcerEu8H9RxXwb8SFuWbBuCpBfGdaX0ooATu7pcA+iL1wCCdv/L7ssR440X4Fuxiva5z4/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaHyjM4ksuWMCLnivtFw3EHxHhTIqhoOAg1pfVFO+LfZ4cNyb
	7J1LKDjCddr9w2u6UfhrY8CHn9t/dxzZcfhphIcrGQ66nMcZvNpo9DI7m3oR1HJAqRM1xxrBqzd
	vKhzjlJGnKYHIyKsWapb0K856TF2/pF3u9L/LHMI=
X-Gm-Gg: AY/fxX4yQyvShzcD55JGPdP9eF83q06b9h+uHsIAECWi/mhuM70TnxFn+BUcZFSWmHP
	uLFlRueDEAOELM9LJXnQiTaemRd6l4cbtXN/iIzVA2opW+Hjws7cODMYltw01vPt9YdYuUzs3pT
	lKN6iQh5Dn+xBF/QQc9CYK2OmIxbq22qV8IrFOxoOSvV+f3ntNKyHD8djIG7x69Jk0ts5u5gUqx
	wvBjKf0zWY7mhjB1F4TfZ6ugnOyPbDw7Z0q6/r2Ije5l7jhukM/nVawHV6jElagWa/TUqU=
X-Google-Smtp-Source: AGHT+IE+DIedWEdJqsiLtHII2NK9kHa47Xaow05C4OozW+YoOAAtbJO4vmCweYGmNlUvwZG4L90DgTJDB2+8ihAAlMw=
X-Received: by 2002:ac8:590c:0:b0:4ee:ce3:6c9d with SMTP id
 d75a77b69052e-4ffb4824c02mr301069101cf.19.1768287489353; Mon, 12 Jan 2026
 22:58:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN8T_P09Qe4091eq+YXnqzCtSxLQgxcw=jH2bH7uw20N4_DsbQ@mail.gmail.com>
 <aWUn-m56_SUw9nei@smile.fi.intel.com>
In-Reply-To: <aWUn-m56_SUw9nei@smile.fi.intel.com>
From: Alex Ivy <whu2gh@gmail.com>
Date: Tue, 13 Jan 2026 14:57:58 +0800
X-Gm-Features: AZwV_Qi4uZPmIbslpj9Jb4Th8F1FWTr_nwk4Cbdtvfa_7kIXpX4_sIw7plrLih8
Message-ID: <CAN8T_P2n5f0FJRi44r+pKcRQbF4SGVLv6H2W_w7JGcD3tDVhjw@mail.gmail.com>
Subject: Re: [QUESTION] i2c: designware: Why use GPIOD_OUT_HIGH instead of
 OPEN_DRAIN for recovery?
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com, 
	wsa@kernel.org, jsd@semihalf.com, p.zabel@pengutronix.de, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

As for the  GPIOD FLAGS, I solved my problem  by using GPIO_INPUT to
simulate OPEN_DRAIN for i2c recovery, by just updating the Device Tree
to include GPIO_OPEN_DRAIN for the recovery gpios.

Board: ARM64 linux 6.1.158 , with snps,designware-i2c and snps,dw-apb-gpio.

STEP1:
I performed a test on my ARM board using the logic found in commit
d2d0ad2aec4a ("i2c: imx: use open drain for recovery
GPIO").https://lkml.org/lkml/2018/7/13/682
diff --git a/drivers/i2c/busses/i2c-designware-master.c
b/drivers/i2c/busses/i2c-designware-master.c
index ddf9673ec742..2cd257bc06f5 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -914,7 +914,7 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev =
*dev)
                return -1;
        }

-       gpio =3D devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
+       gpio =3D devm_gpiod_get_optional(dev->dev, "scl",
GPIOD_OUT_HIGH_OPEN_DRAIN);
        if (IS_ERR_OR_NULL(gpio))
                return PTR_ERR_OR_ZERO(gpio);

Then "[    0.653908] gpio-496 (scl): enforced open drain please flag
it properly in DT/ACPI DSDT/board file"

STEP2:
I updated the Device Tree to include GPIO_OPEN_DRAIN for the recovery gpios=
.

Result: The gpiolib warning (enforced open drain...) has disappeared,
and the bus recovery still functions correctly.

STEP3:
Then I discard the modification in i2c-designware-master.c and use the
Device Tree change only, and the GPIO_OPEN_DRAIN flags remain in the
gpio's desc.

This solved my problem.

However, my question still remains why the imx changes get merged. Is
it needed to apply the same patch for the designware i2c?(which my
need many dts change)

Best regards, Alex Ivy


Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E4=BA=8E2026=E5=B9=B41=
=E6=9C=8813=E6=97=A5=E5=91=A8=E4=BA=8C 00:57=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jan 12, 2026 at 10:10:02PM +0800, Alex Ivy wrote:
>
> > I am currently looking at the bus recovery implementation in
> > drivers/i2c/busses/i2c-designware-master.c. I noticed that
> > i2c_dw_init_recovery_info() seems to manually reimplement much of the l=
ogic
> > already present in the I2C core's i2c_gpio_init_generic_recovery().
> >
> > However, there are two key differences that caught my attention:
> >
> > GPIO Flags: The I2C core uses GPIOD_OUT_HIGH_OPEN_DRAIN, while
> > i2c-designware uses GPIOD_OUT_HIGH. Is this specifically intended to
> > support SoC GPIO controllers that do not implement the OPEN_DRAIN flag,
> > which would otherwise cause devm_gpiod_get() to fail in the core's gene=
ric
> > helper?
> >
> > Initialization Flow: The core's helper performs a pinctrl state toggle
> > (GPIO -> Default) during initialization, whereas i2c-designware only lo=
oks
> > up the states and defers the actual switching to prepare_recovery.
>
> This might affect the workflow. Note, in the past one of such conversion =
was
> presumably done without real testing and brought a regression (I'm talkin=
g
> about PXA version).
>
> > My question is: Would it be possible (or welcomed) to refactor this to =
use
> > the core's generic helper, or is the current manual initialization requ=
ired
> > to maintain compatibility with specific DesignWare-integrated SoCs (lik=
e
> > certain Intel or ARM platforms) that have restrictive GPIO/Pinctrl
> > requirements?
> >
> > I would appreciate your insights on the historical background of these
> > choices.
>
> Do you have an access to real HW?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

