Return-Path: <linux-i2c+bounces-14502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B197CCB3FF5
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 21:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93F393011B15
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 20:50:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0873054D1;
	Wed, 10 Dec 2025 20:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="A5lusV7z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3429C305970
	for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 20:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399851; cv=none; b=IEJCg6/AKz+pKunRFgiUCGz7cQP7UdLNg/m5/hIZu9kh67QYjTUa4G72Cq1EmNHYH1diBINk4bI53ff+tGGdpYwM40C290qdmC4uEN/hH2K6GcqGnJKENs0nIBwyl9SF2uM8pd9/dWI7QH2vAaAkbfzLMWUJpUzTHoWDMHCyjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399851; c=relaxed/simple;
	bh=Ni/DlTRLrWNBrRfruswlghq4vvB8vlWS1U6dlJqQLC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=dYzBgbegkIOByBPbVS7WPhx1bnwblms+8ObHsJA2d1Cz34YsdCky6Zl9EN/+PQOqO9czw0AEDkeRgoGihudRs7oAQj/jSw6q5xA4mI0/nUSjKFDkaf2kwGhHL7UcG1gCzt37d8cRBrFCsyAaP/vLs+sGI8oRUs88Po/IdtV+5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=A5lusV7z; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64306a32ed2so238111d50.2
        for <linux-i2c@vger.kernel.org>; Wed, 10 Dec 2025 12:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1765399846; x=1766004646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHUWRafJ365AEdJneJMcUNVrKE6WQP71DnOIKXCfU0Q=;
        b=A5lusV7zHjhqUFEE7GvUrKcbSujX/EXFfWv0R2KGFh6e/kOwB3g9ZDMS+vDb8I+AQM
         H6Rg57TqX3fUxZi4PrcekEf6GHYi2BcHqjC+Brnz+q3uPpieRIEXorDtwn1DsqW6rVyK
         QX77wIw9EGl8iK3LxIYmaR9MZTY1NB/KIhxw3PnHOQ83TzpbUbNXbmolNyLyoYpBy55/
         bNcl429389c6RRSGXCBDfCpUeN41dhFcryhDXnO2f608Ctmclyr7VeF1mLzghBm8g2jk
         uII96qnAs0Zf6WfvUlskLv9oTZH488aR1+1jAWdwDlUdRAmz24ezBaHjoTVzJkM7m4+2
         xs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765399846; x=1766004646;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHUWRafJ365AEdJneJMcUNVrKE6WQP71DnOIKXCfU0Q=;
        b=wJB1TDnMZUWhSrRVnsKuzrfvI43gOfnSMeSwM7bnZQcHSF69gwAAWJ7ZnzOnxFwKE3
         fcgA20XdGLGz0Z7fI3XFahGgMs0bo0yA569D9+wVU1itQUwfA+1bUnw3a97ahprSm91M
         FGc6apSxY+fgrm8qgwCRwqDvUfrkNIKdaSttUq3oT3I5EYraq/RIJUFV3nDhGrZfwcn5
         Mc2j1mEFcJMXs7fk2jN3Z7JMPy5DVQ3VIgRcYSblzj4p8NMh43Egw+OQtBc3NALK2ebi
         uJlR23NDtjsKmHUnT5xPlgygH7iTapxHYaKTadzxgA7bM1dH/TcemIjn6j3uJh7XLRcw
         KZVA==
X-Forwarded-Encrypted: i=1; AJvYcCXsbKxrrG2c6CNXcKHwMfixjU7n0ZFEeamE6a//tA6xsWrZpUyKPk8cYA+MC9YqjG5tGISEsENB9Ls=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+vnDKBDv7bI2VoAMBtdnnZJt6sF0rG07mZTuO5YIr8FqL+T4Z
	N8qDBPkLpRsTvXV+4tlnVVetb8ppEyW4ocXHbhUDEs2jwN/uVKDhF854IdDzt1MrWGPMtWuTOoF
	eqktd5pJn6RT9KoermqDflnfXgqXD5Y7Lbfv6dAqBs4FKlq4s04ifXi7LycGU
X-Gm-Gg: AY/fxX6XJPYpuTdV8LCtJlAT3LKOhmJlLNriCdHdDWroYWakqD3pg262bOcT47uJp7C
	L6ARN9CyAV1g3cP8i9zTNfVIn03RAv2aXez1/vKTGNZ/0awKU0t5wuOrdzK6z7aFLVTmVxWS1+3
	6wYLApoEsTrQcJLdZCFxoPr5lBi30+MZmmdppkOBThiwLspqOXvQhHwanEFHsLkIubO+AtUlz8s
	N581sc6JlYy/Gc/tTmpzOJ+qcb7GzvbHDztvuHbf5K6m8iF2sy+UnfotnEv5rI2iNgZHDtyOfif
	8tOo5oIrckE/W1+PTo7jZdC9u6QgDiB8RsdtpTRo6GLVqNNhVByA2v/2
X-Received: by 2002:a05:690c:4b92:b0:78c:5803:f68e with SMTP id
 00721157ae682-78c9d725a6bmt34112047b3.33.1765399845997; Wed, 10 Dec 2025
 12:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210052254.279899-1-fcoda@frba.utn.edu.ar> <aTm3EGNR8smNE4Xl@darkstar.musicnaut.iki.fi>
In-Reply-To: <aTm3EGNR8smNE4Xl@darkstar.musicnaut.iki.fi>
From: Fernando Coda <fcoda@frba.utn.edu.ar>
Date: Wed, 10 Dec 2025 17:50:35 -0300
X-Gm-Features: AQt7F2rrgKNAb5w2YQElHsCcBB6u6tOldkHdf4RvDB27jgxE2qXKgx6dd-lof4Q
Message-ID: <CAOXe=TXbvfnqNJJooAV5tzMH+z4Yd8s-1c-41kmRmuspwNV9Vg@mail.gmail.com>
Subject: Re: [PATCH] i2c: omap: fix incorrect SCLH timing calculation
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaro,

I double checked and it's now evident that I wasn't understanding
the meaning of the flag OMAP_I2C_FLAG_SIMPLE_CLOCK.

Please dismiss my submit.

El mi=C3=A9, 10 dic 2025 a las 15:08, Aaro Koskinen
(<aaro.koskinen@iki.fi>) escribi=C3=B3:
>
> Hi,
>
> On Wed, Dec 10, 2025 at 02:22:54AM -0300, Fernando Coda wrote:
> > According to the AM335x Technical Reference Manual, which uses the
> > i2c-omap driver, in the section 21.4.1.24 (clock timing parameters),
> > the SCL high and low periods are defined as:
> >
> >     tLOW  =3D (SCLL + 7) * ICLK period
> >     tHIGH =3D (SCLH + 5) * ICLK period
> >
> > Every other reference to SCLL and SCLH in the omap_i2c_init() function
> > follows the same pattern:
> >
> >     SCLL =3D value - 7
> >     SCLH =3D value - 5
> >
> > However, in this line the value of SCLH is computed subtracting 7 inste=
ad
> > of 5, which will produce an incorrect SCL high period.
> >
> > This appears to be a copy and paste error.
> >
> > Fix by using =E2=88=925, consistent with both the TRM and the surroundi=
ng SCLH formula
>
> What's the impact, and how the change was tested?
>
> I think the code line you are modifying affects only OMAP1
> (OMAP_I2C_FLAG_SIMPLE_CLOCK branch), so AM335x TRM reference has little
> value.
>
> A.
>
> >
> > Signed-off-by: Fernando Coda <fcoda@frba.utn.edu.ar>
> > ---
> >  drivers/i2c/busses/i2c-omap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-oma=
p.c
> > index d9f590f0c384..d0a33f5f1bb3 100644
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -459,7 +459,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
> >               if (psc > 2)
> >                       psc =3D 2;
> >               scll =3D fclk_rate / (omap->speed * 2) - 7 + psc;
> > -             sclh =3D fclk_rate / (omap->speed * 2) - 7 + psc;
> > +             sclh =3D fclk_rate / (omap->speed * 2) - 5 + psc;
> >       }
> >
> >       omap->iestate =3D (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
> > --
> > 2.52.0
> >
> >

