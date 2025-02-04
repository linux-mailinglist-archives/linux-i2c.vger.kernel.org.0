Return-Path: <linux-i2c+bounces-9283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F8EA26A9B
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 04:25:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A7BC166F3D
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 03:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3FB157E88;
	Tue,  4 Feb 2025 03:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7D4eArb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A6025A642;
	Tue,  4 Feb 2025 03:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639492; cv=none; b=Oq39AWsoZEoW8w+XwDNl3HgkPyqzoE/sNrD2X4cg+L7xvQHAvHCSRDg0NKTVwN8fKYPUm01fCg4XuFLmQqgNMIcuT1pzDVVBAUnAmF0UofUO2S8YVWimzj1N4zcJgWVwNYAA2VRbmBkikNiwx4PsnF0iCH83GZXYV2LnLxjqkEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639492; c=relaxed/simple;
	bh=MK/kgsCB755tLqGEF2PsD/FjDQbJHiEt+PB8jn3xK+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXImFRL86+BWHjEIDME7E6XLKIVWUDH1XLDKY1lmDcPe0rOhq6QkfF5gsprLRb5hZWlolNjHJ/VuBvBu7oHb7l9vvkpopmxoMKvJtIgRcUH3Gs2uzZhLBrE/0FbI/d+gEVUw2X4IGrMz7TpopcUzfhTKMf3LTZAWUrbydXhga0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7D4eArb; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6f4bc408e49so28857227b3.1;
        Mon, 03 Feb 2025 19:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738639489; x=1739244289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHZf3qPAJPMI6pvNtjlUfKmiEdCpztmVl3vR7/P9M6c=;
        b=B7D4eArbXfOxZU8C+CHgDHl3JJoPAdVlfGB+vVdj/RzCaV/j1UvRwbwsbHVxaVUdrS
         jz89ojtaZR7de3GPnQ1L0b4ITHIdb24WG56T9DXrs/r00jFjsVcurKxaSC2VW6lw0zJY
         AGqFBh6/7IpQo5nRxU0TD6HaS562P+wt0Fy5hHiJl03lONT3MTqbhrCEhtEbHWB4TKP9
         Q7ZBUzAVdkgxIaXFx+iIwQPuAWUBSFJT0IE2y7Qa6gfKDocSEo+wk89t7gYcjKj5j8RS
         g0xxfGYre2EYzSuobwk03ilgh2MTiQoSjj3HgFg9xeJwtW76w4V8kh/Qv2jEIQj64bkT
         Ag7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738639489; x=1739244289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHZf3qPAJPMI6pvNtjlUfKmiEdCpztmVl3vR7/P9M6c=;
        b=i0aO6V7XceNT3aAAmW40Ryo1jjN3a0ZLQpwgm9pYjrM8PmWwA51CVfRFzENzi9i95h
         Fwe77ah9Ki9+rmSAP829HfPrVCEx5L36MbKNnA/xDPY1NhlxJvz4Z0mir3slpZCiAdMN
         PWboxMwLcbPHLLZf+qKE/RxBsHb73+fq+i7Rk85+TsmkexGVYG4hmhC3jgrGMDiF8HjN
         6ttiRk0qXHDWB/cjiGoL+wTsrjoYJ7ch5YPZWgLR5JUxdbf+8gZnWz7ZmW6Tj5yraJ6E
         fJNXPW7hCu995obho8DZjoPHKrVbcVl0dswmfYJGvTA0J42oszy2K2ySCs6QoBHxiTcF
         Bk6A==
X-Forwarded-Encrypted: i=1; AJvYcCU7AHH5+IpM+tdMyIR4D1PgjJsSmPzvxVQfsgh0rTFVa8KeerOo1WzzcovJbg9ryy2pDEbPxCHipd7h@vger.kernel.org, AJvYcCUjd77M3ubtblhkaEDb3/fts6d9UbNdWTmB1KAhaJFYWoVDTBYUtkUVM4PGk/QvjYAnguAIByUc@vger.kernel.org, AJvYcCVJVySjIEhbWnHGIU4QjJYgKwevDRNph7GNwQW3FgmjOPoZqaHFNuz+5Fx0VAowaqxRrGYK9PUNZcks@vger.kernel.org, AJvYcCVb0R5xL6FPl4m8n+MiKimaMgmhaR/Unjw2zXSdc+Glzb/ysQX9AAdx0T/5zXhcQ6Go4JwO3Qd3uBELdWTj78U=@vger.kernel.org, AJvYcCVkMyaJb9pHPeVjXd75d1eR29LHaO9cSUcZmo9rZO3fiODsWCWTcWlHJi+Krh4/lchHQT6M2nxC9QU=@vger.kernel.org, AJvYcCVqzfC4k2jMuequD/M332EE8roEQ5I1EDDvwSR46GW1tNWLvOx7gtiwOXGdkKDtYZya00Ibz7/v4Wax@vger.kernel.org, AJvYcCVup5E7FeRvg1XERLlllN2r5htZMuK6nBw8+mD+GqxEf0IBflNntEhuILMHCh4ROoY4ZCDgnTnL9KMcOQ==@vger.kernel.org, AJvYcCWWI6KfGnOAXS6GD6OjonhNS0t5vLLhg74gmRfyhpE0TNSTPoO9YyYq1DUhuoenlrAYrzNNCq5UZueMW3M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYXpX+rTuUwAhXUjWjbKJ7GSqYCfV5LqhQXXW/g+eFWTQLsvE
	abOncGk23Gwu/1kCOMsZsCHogxxTYNSmaqxvCQFyoj3dHdymuTU7n6DHT69+Fp7XNQ/ePpJwb9l
	gGv1XtIwsiB+qIDMWJE6QZk8gxk0=
X-Gm-Gg: ASbGnctYMnVwqjwbaMkr+s8ay0TFIheHjkRuFQ135q+iGg4A+EsDOWj8lcK88Tzw0CS
	9TYsXgXQCfHKirlihGROF1Gpug9uNnQhQ1S8BRkpdEG65rmVfAdtZUJ7I9u3wHFRNMon751W0gV
	9ukpnsBKnUNt7WzB0VXdw6UW38yMQhd14=
X-Google-Smtp-Source: AGHT+IE09Gi3ca8JBdhccV2nmsb+G7Mxn8icbzfNE/93+HrK2OFTG29wJWw2U9CAVzfm42NsDopJBH4rbrMUflKWcRM=
X-Received: by 2002:a05:690c:9a03:b0:6f7:64a8:e23 with SMTP id
 00721157ae682-6f7a84246cdmr211542487b3.37.1738639489487; Mon, 03 Feb 2025
 19:24:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-5-a0282524688@gmail.com> <fc927b75-5862-4ead-a355-a40c27d8307b@wanadoo.fr>
In-Reply-To: <fc927b75-5862-4ead-a355-a40c27d8307b@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 4 Feb 2025 11:24:38 +0800
X-Gm-Features: AWEUYZnEhI9JNxJOh_LDE0_r1vETpiCuUcVdrotMrjh4ge4F6zvwefLgocld9G4
Message-ID: <CAOoeyxWivAZmZPe92+_LrL-HvMn7Lqs7M4B__JULKqHeJMTioA@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, tmyu0@nuvoton.com, 
	lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for reviewing,
I will address the issues you mentioned in the next patch.

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2025=E5=B9=B41=E6=9C=
=8826=E6=97=A5 =E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=884:47=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
...
> > +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> > +{
> > +     struct nct6694_can_information *info;
> > +     struct nct6694_cmd_header cmd_hd =3D {
>
> If the variable only has constant initializer, make it static const:
>
>         static const struct nct6694_cmd_header cmd_hd =3D {
>
> Apply this at other locations in your different modules.
>
> > +             .mod =3D NCT6694_CAN_MOD,
> > +             .cmd =3D NCT6694_CAN_INFORMATION,
> > +             .sel =3D NCT6694_CAN_INFORMATION_SEL,
> > +             .len =3D cpu_to_le16(sizeof(*info))
> > +     };
> > +     int ret, can_clk;
> > +
> > +     info =3D kzalloc(sizeof(*info), GFP_KERNEL);
> > +     if (!info)
> > +             return -ENOMEM;
> > +

Excuse me, I would like to confirm, if the variable is constant
initializer, should the declaration be written as:
static const struct nct6694_cmd_header cmd_hd =3D {
    .mod =3D NCT6694_CAN_MOD,
    .cmd =3D NCT6694_CAN_INFORMATION,
    .sel =3D NCT6694_CAN_INFORMATION_SEL,
    .len =3D cpu_to_le16(sizeof(struct nct6694_can_information))
};
instead of:
static const struct nct6694_cmd_header cmd_hd =3D {
    .mod =3D NCT6694_CAN_MOD,
    .cmd =3D NCT6694_CAN_INFORMATION,
    .sel =3D NCT6694_CAN_INFORMATION_SEL,
    .len =3D cpu_to_le16(sizeof(*info))
};
, correct?

In addition, does this mean that the parameter in nct6694_read_msg()
and nct6694_write_msg() should be changed to const struct
nct6694_cmd_header *cmd_hd?


Best regards,
Ming

