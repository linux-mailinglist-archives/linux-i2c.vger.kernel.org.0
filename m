Return-Path: <linux-i2c+bounces-8819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B63AB9FE3EA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 09:47:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77F4118827FA
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 08:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D217A1A2387;
	Mon, 30 Dec 2024 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGjSnuNI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F259D19F461;
	Mon, 30 Dec 2024 08:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735548454; cv=none; b=QnSlzoqV4cIDNJMR6E6JJA7RKemQg4AwsmRO4sRj0TniMiRVKs2KYtf98Bj4F3avF9QZqvnhRJzyHapyXY/KmipgJ7FvBIGDTZ8QnU9yCYo/bPu7mlaaJJmWzsmRkSOe+HWkQU+Frs2IVLrnbZjE4zf/r1iUtMpVJyYpXNo7aoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735548454; c=relaxed/simple;
	bh=A9lAmnPj7ljs1c9NPs031aYEJ/3GWicOKL2byQaMvq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiTg1TA79/C8UjBuqTof6FSRSbYRrFW8ndPYKz6gnkFmN4iZ+AP6yt9/tIuibVk7x6qy5wk6UT99khtWXu2//mYi4kQFHGjhMsBhX7qPuKTrOM25ugXoSiFjGJXUReIl8YmnNI2oHNZZ3WLTGGI3gfRjh9nPDLwcv85QujlTvO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGjSnuNI; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e46ebe19368so9845398276.0;
        Mon, 30 Dec 2024 00:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735548452; x=1736153252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVJ2Q5DUBqO5fFi7xrKE956fBgRDsL3A9t3sMepmPuo=;
        b=nGjSnuNIr19kKhY/lJwu4+fQTSljXoPNkCCFtEDmjwFM6a8D/ojTaMAAyatci/WqlN
         ZQEtvEGo7p7IGfHHnirzkNNOaYjdFC7t3P4U4JAW7iUrEb49FZg25TVY8wtEQ62+vtQd
         mcKbJCIppZI7+sx/wcWhKvZOdDOsdNoTzBL0Vf3aQ+DHUA2pLRQT4UhkRmpuxqNRQrfS
         z6n5pqpFZFy1gm5vJ/z8qgfArPEOmJTT420uboILQj3R6XhJTmOjwA4/a6lUbus4fdY1
         Zc1cQzb6tZqkc3TVIBJUwqW+lBHapz/62j+ctnclaQba239bL+ZkVLJrWzZIGTusAxs2
         Gn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735548452; x=1736153252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wVJ2Q5DUBqO5fFi7xrKE956fBgRDsL3A9t3sMepmPuo=;
        b=vKuckw9od0veMfBDbR0UzMyjnoR4zi/D8IODikzTed4y2z0dDaB8yK/Lb/0cEdGaXR
         gJTvHc32c2x8rUA05teZJXRppXQo3GhF1k61pU4pI4cX+exUgOgafaPL0q9eqe7MbZRO
         nTxPYG9g4vzckDiLjhOCEvOoQMhROHmxUPZ9oUHMUmqasZqhbvjqHczOmsJqisAUpKUu
         GyUgM4C6td6jjbN++TepmNxBlAmRVaVTf/QTn+0mfurp3c849V0Wxz+GFwpiTRM1rFma
         oI3r1zX+aE7DekdIRBsF5p4z7+TGpkYNqemmm8QSwM8vMlsE3n/sjKloGaUyklmFRfae
         Wnmg==
X-Forwarded-Encrypted: i=1; AJvYcCVFfu5fSq8tLfQkSyS+w3fQa7327vB9cN/Kcg94XVAArH+sZpVP7y81siOk4o62RA/NuPkLeUkQ6bI=@vger.kernel.org, AJvYcCVoqf03UeXYk8nyKMHowgVRPM+k07pC9HknX+rZPERVBlVr4pE41Ib9HqgYbgh1jOtMPw1jziHdNwmRwQ==@vger.kernel.org, AJvYcCWDon9oaQmlftSCtnxIxHTvkm7PPQitqA1thNI8HzwY9yU7Sm7q4tmZCDR9JIGlTOBErucOUR4FD3nXGBDRh40=@vger.kernel.org, AJvYcCWF1QizAoqoz3PO5foUB2eWT1sBDscXNvYpNoz8qaI4A9UYrv0u4NavcVTmRdPwBa0B/LQ9hYc3jTIR+Jg=@vger.kernel.org, AJvYcCWKcV3BhrBDtNa/nFQDQcnrtrZ+Y7QffaiTaw5Bfh6sqzMHkpeRv7PMMYZN0IhVXK4m+q8VzRC5Jaex@vger.kernel.org, AJvYcCWfmPMQbpQpM6FRHma8cbw2X1Dq5n5OH9kUZ2bk0l+ropUu8Ld8R2iZ00Ko9CxY3dks+vndhENg@vger.kernel.org, AJvYcCXW//xWZgwDCjFdezNykiQpvdATkGPFygs8jQr12MMAPdoZHa/YYptyO6gMmkfVfvSZV8Ipnkd0mKQt@vger.kernel.org, AJvYcCXi4jkY7rJksOjrKYqCf7hyeTUefly1cRd1IwYyUAh5NupVn44ZdcwiQNIET5isU2rzSm6/aekNRPh+@vger.kernel.org
X-Gm-Message-State: AOJu0YxJkw6m9MeejiOlICB222pNZ1WWZilVPD+kXsFX1jpe8Gu0peQx
	0+vYcf/E5dqecHaboBmiymTRwayJ9plUfNoPMqM1cqA+MPyH4Tj/+Ho7MPhUXJ6PHrMoGNyWej5
	rcDstGEbybs4F3Zo8+8ZTj7bK76A=
X-Gm-Gg: ASbGncvWRUevA9EeaCj4TpjhfQoDwwG1T/4rq1dSvdaAxVVdq92GLhZzGg6t0pEqJN2
	8HbGp/01cmDchYkfCCoBH/AqDX/55RLbhekGGyUFqcJ0D97n1amALzZy5872KXAwxOM49IpDp
X-Google-Smtp-Source: AGHT+IHYnvruf5N4ZdJNNzu3kUNHnvHvRb+iYU8S/mpNZvyDQimOlQEF2qN1qLCXqjPYCHvT+V5Y4lRBFbE5oCVdn5w=
X-Received: by 2002:a05:690c:5889:b0:6f4:2b4b:358e with SMTP id
 00721157ae682-6f42b4b3639mr106485307b3.7.1735548451881; Mon, 30 Dec 2024
 00:47:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-2-a0282524688@gmail.com> <b1c5b18d-efe1-41f8-9825-2a3e090c47f5@wanadoo.fr>
 <CAOoeyxU5nM4BZhgqcRxVHVVDxzLFzVS0+z7Yi_YGpvWc87mAbQ@mail.gmail.com> <d52fbacd-cd07-4ccd-9a46-9e8ca650fc26@wanadoo.fr>
In-Reply-To: <d52fbacd-cd07-4ccd-9a46-9e8ca650fc26@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 30 Dec 2024 16:47:20 +0800
Message-ID: <CAOoeyxXOa-JK1-wRn0hsD1nuTOLs-5NBv5-YswOSS1JJbGmU_A@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8830=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:34=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
...
> >> If I understand correctly, your device is an USB device, so shouldn't =
it
> >> be under
> >>
> >>   drivers/usb/mfd/nct6694.c
> >>
> >> ?
> >
> > I understand, but there is no drivers/usb/mfd/ directory, I believe my
> > device is similar to dln2.c and viperboard.c, which is why I placed it
> > under drivers/mfd/
>
> Well, at the end, this is not my tree. Maybe I am saying something silly
> here? I am fine to defer this problem to the more relevant people. If
> the maintainers from the linux-usb mailing list are happy like you did,
> then so am I.
>

Understood.

> >> At the moment, I see no USB maintainers in CC (this is why I added
> >> linux-usb myself). By putting it in the correct folder, the
> >> get_maintainers.pl will give you the correct list of persons to put in=
 copy.
> >>
> >
> > Okay, I will add CC to linux-usb from now on.
>
> Ack.
>
> >> The same comment applies to the other modules. For example, I would
> >> expect to see the CAN module under:
> >>
> >>   drivers/net/can/usb/nct6694_canfd.c
> >>
> >
> > Understood! I will move the can driver to drivers/net/can/usb/ in v5.
>
> Ack.
>
> (...)
>
> >>> +int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u16 offset,
> >>> +                  u16 length, void *buf)
> >>> +{
...
>
> If the two bytes may be used separately or in combination, then I think
> it is better to describe this in your structure. Something like this:
>
>   struct nct6694_cmd_header {
>         u8 rsv1;
>         u8 mod;
>         union {
>                 __le16 offset;
>                 struct {
>                         u8 cmd;
>                         u8 sel;
>                 }; __packed
>         } __packed;
>         u8 hctrl;
>         u8 rsv2;
>         __le16 len;
>   } __packed;
>

Sorry for forgetting to list the structure in last mail, but the
revised structure is same as yours.

> Then, your prototype becomes:
>
>   int nct6694_read_msg(struct nct6694 *nct6694,
>                        struct nct6694_cmd_header *cmd_hd,
>                        void *buf)
>
> If the caller needs to pass an offset:
>
>   void foo(struct nct6694 *nct6694, u8 mod, u16 offset, u16 length)
>   {
>         struct nct6694_cmd_header cmd_hd =3D { 0 };
>
>         cmd_hd.mod =3D mod;
>         cmd_hd.offset =3D cpu_to_le16(offset);
>         cmd_hd.len =3D cpu_to_le16(length);
>
>         nct6694_read_msg(nct6694, &cmd_hd, NULL);
>   }
>
> If the caller needs to pass a cmd and sel pair:
>
>   void foo(struct nct6694 *nct6694, u8 mod, u8 cmd, u8 sel, u16 length)
>   {
>         struct nct6694_cmd_header cmd_hd =3D { 0 };
>
>         cmd_hd.mod =3D mod;
>         cmd_hd.cmd =3D cmd;
>         cmd_hd.sel =3D sel;
>         cmd_hd.len =3D cpu_to_le16(length);
>
>         nct6694_read_msg(nct6694, &cmd_hd, NULL);
>   }
>
> This way, no more cmd and sel concatenation/deconcatenation and no
> conditional if/else logic.
>
> cmd_hd.hctrl (and other similar fields which are common to everyone) may
> be set in nct6694_read_msg().
>

Understood, that means I need to export these four function, right?
  - int nct6694_read_msg(struct nct6694 *nct6694, u8 mod, u8 cmd,
                         u8 sel, u16 length, void *buf);
  - int nct6694_read_rpt(struct nct6694 *nct6694, u8 mod, u16 offset,
                         u16 length, void *buf);
  - int nct6694_write_msg(struct nct6694 *nct6694, u8 mod, u8 cmd,
                          u8 sel, u16 length, void *buf);
  - int nct6694_write_rpt(struct nct6694 *nct6694, u8 mod, u16 offset,
                          u16 length, void *buf);

Both nct6694_read_msg() and nct6694_read_rpt() call
nct6694_read(struct nct6694 *nct6694, struct nct6694_cmd_header
cmd_hd, void *buf),
then nct6694_write_msg() and nct6694_write_rpt() call
nct6694_write(struct nct6694 *nct6694, struct nct6694_cmd_header
cmd_hd, void *buf).
(nct6694_read/nct6694_write is origin nct6694_read_msg/nct6694_write_msg)


Thanks,
Ming

