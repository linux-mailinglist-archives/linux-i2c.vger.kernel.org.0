Return-Path: <linux-i2c+bounces-8137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEA59D5AC5
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 09:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 748A0282F1E
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D1018A6D9;
	Fri, 22 Nov 2024 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw21WrI0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E623822075;
	Fri, 22 Nov 2024 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732263124; cv=none; b=fwxost7CFCkk2ePBszawGvNdc+J5U0M+dBy3WPhlmmM30uosqr2yKnAvzIYBIRsIO9GH1nMjPngeJN1X19GXYFcDjEQNmoxoRF32qHm8bt3pbv8KoNJLiPeMcXuEr3gLp+/35Ae5t7FsaztEB54n0UkgtSXJdSmT8NZcz9AIYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732263124; c=relaxed/simple;
	bh=vfa73H59aXhR7J0Cv4I/H0vg//RnzL84g9+gABL6x10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VjO+/gde0yRgk5J0aUaiKsWwlH44rsw5b9nRL21NK/p33c9an/xSRDCBE/Mu1ZPSN91hmg2h5/SlkLOGmF4j/KPstg2tTzCUb0HmbEczELwhnXGvKMMNwz+xDzzKs7M6NTLGUpOYb7eIgVnS8WKC4wBzxuQ+/I4f4JIasWFCva8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw21WrI0; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ee7b886b5fso18413347b3.3;
        Fri, 22 Nov 2024 00:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732263122; x=1732867922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBVVfxBZW2KFqRVvhdXWhW+v4WR7l4QlIwMPMmDHj5U=;
        b=Bw21WrI0i24iZi/fSUe98oPj7BCAbL0gup0uqRjTO907lmxf0HPTv7a6r+i2kL0rDG
         qD00C4U1svCzsPWKHL4/BBF8+mzssy/rNYhg5J9nb5YqpkAYl868mhGUyWJjve9bxwoC
         83QG701GoBdLKEv0FSBSV8gmdGxheX1sl9fKeKMhlvLlXE/VdFA5+UU/gVYwdOMPKda4
         1NicrZvTgMNhUhwC3p3uim+rijYVrl3s46ZqnFXdiDonEYB/TiH/w3nwLzwZdB0Tag0w
         MwhkXW61rlp1jW6/cRUpVLdU3YCvps7dm2Ftm8rH0hOesKu+bBp8QgT6Pv2uGspLR8CI
         IgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263122; x=1732867922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBVVfxBZW2KFqRVvhdXWhW+v4WR7l4QlIwMPMmDHj5U=;
        b=T3ew7zzvp4eKWU1uwfEgPkti2Btxn6ZExK8LnpN4nmDII4p6WqOQQm1LWBd+ph4F+R
         p5/T7qJ6PVWpn9eYTB6cUmcNO8MEpFbQI0vJgEADW9pCZJKWL8UmVbMzliv/VyjscYgN
         d6tdEqRxVlaB0eS76pTZuJfsIPI01x8I6Ks+Nnhr9G+uu0vTUrc/Sq3OfMTXjToI0GbJ
         Q02X4YRyPc59ujdTwzoF/9Rra4kZPj3dHzwk8k5MyUv4yb1744biGnRkNlIK9/CTEZAL
         Xp8d5emakCpEuDM7wL+HVYppQUIKCV3XMnCD/IzyxoPP0vXo9pWUU9JgahWY6K4M8KXZ
         ucHA==
X-Forwarded-Encrypted: i=1; AJvYcCU1/nZrJjzneiQp8j+EwLzsxiq3lebEYfys7Jmk7MDz9vC/5+t/H9E7kpZ5dJIxo8uo91A5C2l3VerU@vger.kernel.org, AJvYcCU9fXGfTTGwtP+nL9GNjo1xX/FGrWf4RHrg8cg0DSHkpZed7jmsFa2zHNK5AU7KO2SKU1pUYFOkr3nVq1Bo@vger.kernel.org, AJvYcCUbGF3AeF4hNw6QwIa7Oa1PBKWwBo4n6ehIXQo7cOtZQU8V202ObXaOQ7s3B74JsJ2GUVnMwWiD@vger.kernel.org, AJvYcCUxI1CzXuxD//Gc7BMKN9oNPBXD72IABeRbf7n0MFTQ0JMSr8ZaFwh3NjMf/+vDlSKhDO/r4bJewQ4siw==@vger.kernel.org, AJvYcCVxYRO77xrX9fjFgP9tyJrV/kk811YXdhyn3AeAi2q6aXFuIE9iLHMMTUGWN+QE2amVjFALiLXElEZU@vger.kernel.org, AJvYcCW5eU4dwLo74n1lDGdxkJooS99q4Jo4elT25nC2hJ3hT9+TQMp1iz0RViP3Aw4pQ1r5VAN7GL4Tu2HxlqM=@vger.kernel.org, AJvYcCXdDsT5T4lekrQ18yTB7oq+ftCI7ZvQ/t3FfIaXTCdrCNLZg8Tu/pl47MXjRSKz4MTQ0fCa8GZbgUo=@vger.kernel.org, AJvYcCXokhqSfl446yC5RMoZa28aAR2OPoSKNb9vJR7tk60Q3CnVYVj1Efs/QRBP5J7mWuHPfxQDxMpsjGwv+fg1cC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ6XZ1bQdCxM5/smmLR+ZaJmEn9yA/o9ToOOQtTF+7hu5XF599
	OPfz/7MnNxiYZJGwlwuOPJaayMUNrM2vYtKZ42p1YPSXsxv74ft2u/wqORUPihMxS9Ka3r4gvC+
	opvhSMqs61qkHLEJXfAOOFTb4wrU=
X-Gm-Gg: ASbGncuV3jmeFHdQmoQtUNcuStc0253+HDsWJwKBOOFYtWmXXCSOVuKinUiWCV6mJ3m
	EUfs0vCbpxkOZ2ZiqfR684qfj9rrGsmQ=
X-Google-Smtp-Source: AGHT+IGmgdSbiik8QuTUl0/67zUkXwlQddlW2hCReHsnX53P5ohf/5TneLt36igaRho14/sg+tTkQNogVtwDsPUozas=
X-Received: by 2002:a05:6902:1245:b0:e38:f293:5b63 with SMTP id
 3f1490d57ef6-e38f8bd97d6mr2235315276.33.1732263121799; Fri, 22 Nov 2024
 00:12:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-6-tmyu0@nuvoton.com>
 <2d21093f-7efd-4356-a1f5-2ae3af4a0da3@roeck-us.net>
In-Reply-To: <2d21093f-7efd-4356-a1f5-2ae3af4a0da3@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 22 Nov 2024 16:11:50 +0800
Message-ID: <CAOoeyxUMGhvNukqc0ufT1UrCi4WK60cNaOpyx1ngqOxm5OsT4Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] watchdog: Add Nuvoton NCT6694 WDT support
To: Guenter Roeck <linux@roeck-us.net>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Guenter,

Thank you for your comments,

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B411=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8810:15=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > +config NCT6694_WATCHDOG
> > +     tristate "Nuvoton NCT6694 watchdog support"
> > +     depends on MFD_NCT6694
> > +     select WATCHDOG_CORE
> > +     help
> > +       If you say yes to this option, support will be included for Nuv=
oton
> > +       NCT6694, a USB device to watchdog timer.
> > +
>
> It is a peripheral expander, not a "USB device to watchdog timer". Watchd=
og is only
> a small part of its functionality.
>

Understood. I will make the modifications in v3.

> > +       This driver can also be built as a module. If so, the module wi=
ll
> > +       be called nct6694_wdt.
...
> > +     ret =3D nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_G=
PO,
> > +                               wdev->pretimeout, NCT6694_ACTION_GPO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     dev_info(data->dev, "Setting WDT(%d): timeout =3D %d, pretimeout =
=3D %d\n",
> > +              data->wdev_idx, wdev->timeout, wdev->pretimeout);
> > +
>
> This is logging noise. Drop or set as debug message.
>

Okay, I'll drop it in v3.

> > +     return ret;
> > +}
...
> > +static int nct6694_wdt_set_timeout(struct watchdog_device *wdev,
> > +                                unsigned int timeout)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     int ret;
> > +
> > +     if (timeout < wdev->pretimeout) {
> > +             dev_warn(data->dev, "pretimeout < timeout. Setting to zer=
o\n");
> > +             wdev->pretimeout =3D 0;
> > +     }
> > +
> This is only necessary if the pretimeout was not validated during probe
> since otherwise the watchdog core does the check. Please validate it ther=
e.
>

Understood. I will make the modifications in v3.

> > +     ret =3D nct6694_wdt_setting(wdev, timeout, NCT6694_ACTION_GPO,
> > +                               wdev->pretimeout, NCT6694_ACTION_GPO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     wdev->timeout =3D timeout;
> > +
> > +     return ret;
>
> ret =3D=3D 0 here, so return 0.
>

Okay, fix it in v3.

> > +}
> > +
> > +static int nct6694_wdt_set_pretimeout(struct watchdog_device *wdev,
> > +                                   unsigned int pretimeout)
> > +{
> > +     int ret;
> > +
> > +     ret =3D nct6694_wdt_setting(wdev, wdev->timeout, NCT6694_ACTION_G=
PO,
> > +                               pretimeout, NCT6694_ACTION_GPO);
> > +     if (ret)
> > +             return ret;
> > +
> > +     wdev->pretimeout =3D pretimeout;
> > +
> > +     return ret;
>
> ret =3D=3D 0 here, so return 0.
>

Okay, fix it in v3.

> > +}
> > +
> > +static unsigned int nct6694_wdt_get_time(struct watchdog_device *wdev)
> > +{
> > +     struct nct6694_wdt_data *data =3D watchdog_get_drvdata(wdev);
> > +     struct nct6694_wdt_cmd0 *buf =3D (struct nct6694_wdt_cmd0 *)data-=
>xmit_buf;
> > +     struct nct6694 *nct6694 =3D data->nct6694;
> > +     unsigned int timeleft_ms;
> > +     int ret;
> > +
> > +     guard(mutex)(&data->lock);
> > +
> > +     ret =3D nct6694_read_msg(nct6694, NCT6694_WDT_MOD,
> > +                            NCT6694_WDT_CMD0_OFFSET(data->wdev_idx),
> > +                            NCT6694_WDT_CMD0_LEN, buf);
> > +     if (ret)
> > +             return ret;
>
> The function does not return an error code. Return 0 instead.

Okay, fix it in v3.

> > +
> > +     timeleft_ms =3D le32_to_cpu(buf->countdown);
> > +
> > +     return timeleft_ms / 1000;
> > +}
...
> > +     wdev =3D &data->wdev;
> > +     wdev->info =3D &nct6694_wdt_info;
> > +     wdev->ops =3D &nct6694_wdt_ops;
> > +     wdev->timeout =3D timeout;
> > +     wdev->pretimeout =3D pretimeout;
>
> pretimeout should be validated here.
>

Understood. I will make the modifications in v3.

Best regards,
Ming

