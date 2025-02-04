Return-Path: <linux-i2c+bounces-9282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9AA26A59
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 03:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAFF9162D32
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Feb 2025 02:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9839E14B094;
	Tue,  4 Feb 2025 02:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etj/gbCI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB73025A634;
	Tue,  4 Feb 2025 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637737; cv=none; b=YGKRsZY537eFYU6JA9gGi9rDt7fLGuMzJe0rM8E3r8i/l1sUZe2zqTz9qO1TZd+QxQYNKGm/McbuDkSaJr0mw8+brLCATceGf8qAq6dfG1uUIk2mOhR9NW9qOwtTIAOJQeVL+U4NtwWjaI3L5aqnLidoJLKnyxuuMJNNiSmF0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637737; c=relaxed/simple;
	bh=SsNR3E07AtxSVGliL4l9VG9uWcDyK1MvWPxO6bDoXYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2o9pPIeqTSBiICGH9CYJWgRoSNHTv6OByRVzxpH503Ojj/sdk1RDRSsKEX2AbJCh+B2tVd9Dlf/mDSEq6URPS8tDPabAJtN4KJiEaXxSknmMJEvVlph1S7YWSn8mDF9o0xwRmcoeaSHPP4z97KCVPc1jyAXWvJvx/wBYELQPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etj/gbCI; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6f74b78df93so34581097b3.0;
        Mon, 03 Feb 2025 18:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738637735; x=1739242535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1SJYRlvvDn+Q0s30BP7IsffmNK4kBgSvv+R3o3C+Vc=;
        b=Etj/gbCIfUbdryViFXuEZ/kQlBH4OajB6PRpQpE1EjHrlD7LlEUmNVVSHcYBypaAJS
         DyOzKh0VoCQAA4kxKZHtgEAgplbU+301sEA83cbENYLp5NXee9kVfj397X/pWJNLjmjl
         KZKZ8pXnQrfgae+nNeehy2+miO33kEZOcV0CO/j5NW2hGmjloCJ9qksnhNJlyDQ7Je53
         S2pnGNzYP4TmM9T/CjuIwxkgQEeJO5jjbTQDDg0hoEpdYkmzbANGEAvE/ViLIDrBP4Pi
         FIcaCOn5YQ9XcNEQ+ukb3+3Gv/P+94BnqUtRbdFcQsHg5J/BxEuW2zr1qyF6ZcZqlMm2
         bhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637735; x=1739242535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1SJYRlvvDn+Q0s30BP7IsffmNK4kBgSvv+R3o3C+Vc=;
        b=u5rzm/HahqBIoaeY0ReM1b1ozP9myAGgdYypTqSDeILzieIYnF9qm2DTTJ6SMA2Yh7
         op1DV4kvSos5Lk4HKMdShgN6rWMCJKSGRObxW9mhgd5ITe/nTVN30WzgXpnZCm5G6E0W
         2+2QLjwtD2aL8hw3dWNT4i5z8FM43Qmk0TJncyAXfoBYC/GtpyTMwas5lb1Jm0l6UNtO
         2oaCbUCiQjk/3TKbvUmXSGgBVsUzdsQmhUXGcpoB4ZSY+wfwZEhAzbuYBAOTw3kOFbBk
         YAUK7SQxANeCNTgfIg4PD05K8qhJPvJAT05crudxoJmjlSi2wfNHmCrb2E7vqpVKO0M0
         MKHw==
X-Forwarded-Encrypted: i=1; AJvYcCUZKScz/IetgkjSg4NiXFY1xugn2y1rf107Y4kCdELWzN6YBRko3tggUqPzlnv0IWoNguQLrEa+7c9n@vger.kernel.org, AJvYcCV302aWbz8PffK2QkdyPfCzzev6z3JWJPuAgZnfc06R97wBMwU7W+QqS0OKNt0NeZuvxYTzQD8uWLko@vger.kernel.org, AJvYcCVgsDm6I8i6Snwcz8/btw/KokezG0hYAnWnTm9KVjTp5VuB+3hw37aXAkdNvD4MSEx3geehS+ER@vger.kernel.org, AJvYcCWE3lr/qnRnS88fVcwKOenPcpVZ51FpxNVQK8sxR1iHsm7bI+GH8t2lKHs+3GvgblLp2NPAnRiJNp75aeU=@vger.kernel.org, AJvYcCWXylckUgaWoEwBe1OzTFC/s8JH4OGu1TZB/iKrPijNdEG93fr/ewrE7uODuMpZDVwQdB1vhCLldwsgYujo@vger.kernel.org, AJvYcCWaS79tmknZmSdkAz5Wf9Z6XC3HOornz7XtPV5zhNOYmihgtWbtxH+ojvBw7WR5kyxgvzZYQ94u/e3C+Fem4dA=@vger.kernel.org, AJvYcCWlZ/G+uSbAtkSnOXDq3rUKnGSpNBDcNa0sKlv9PecFs7rLW8efUKdxEVr06anmZnjcVSCZOm6CXL6K4Q==@vger.kernel.org, AJvYcCX3vY0nX0/t85niAvYOIaLzR86uE7lE5iXCh1w1LpgKJidQ7z1nTRjd5PiSU9pKlCGUix4IYR8gV9w=@vger.kernel.org, AJvYcCXA9BKh/uqvzShXzXZ3P+EXLaanj0XswZt/1+paQWCfW4MnY7u46/bw9gmcIYHPrM+loTJz8swCSek+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ad26L7lStK7hmy+ELqTIXO2lzsmDkZogH8y5h/crAF7LRbDg
	l3Jtw7DIfDSJYoVkm+/I/ygo7GRR3z2sWrVFinN7v8UkD3iBlC1NEnjSkKJpyw70GKqxeRJhvu+
	9XHV1R9j9234ri76JGT4ZR6rvRRw=
X-Gm-Gg: ASbGnctfxR39rKhU5x56RLhrHaMTj/ASCqsclUxgDy/+kyW2aIM8w/mu8AJWz4ToIgm
	2Bxn3JAsi6wauj1NUiPeEdBR7OlWBrM3R6kwrqqo1cA2hzD1yamW0SukU/cOai2C9YXZqlTFYHo
	yO3SNblvMyObgAuflUWLDNMkCjqhE9v3w=
X-Google-Smtp-Source: AGHT+IENBUqPgbf3XnystowdZ7Zwn2kOrvE9Y428xwWfzgMfqR0LnW3bjro/m42elV9VK5OEx1nriy32P62809TuX34=
X-Received: by 2002:a05:690c:4c10:b0:6f9:4212:bea2 with SMTP id
 00721157ae682-6f94212c067mr100205287b3.15.1738637734763; Mon, 03 Feb 2025
 18:55:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123091115.2079802-1-a0282524688@gmail.com>
 <20250123091115.2079802-5-a0282524688@gmail.com> <20250123110929.GP395043@kernel.org>
In-Reply-To: <20250123110929.GP395043@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Tue, 4 Feb 2025 10:55:23 +0800
X-Gm-Features: AWEUYZnhpllhirz7e3Rb3330IhIRqRX_20MBGDHmKWzujJ7J2Wo8NG7YAbX9Cp0
Message-ID: <CAOoeyxU6cnCQz3r8JQC_EAhN0=5GwyhVaw=3MdG_Du1vKA0kdQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Simon Horman <horms@kernel.org>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Simon,

Thank you for reviewing,
I will fix the warning in the next patch.


Best regards,
Ming

Simon Horman <horms@kernel.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=8823=E6=97=
=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:09=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Jan 23, 2025 at 05:11:12PM +0800, Ming Yu wrote:
> > This driver supports Socket CANFD functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <a0282524688@gmail.com>
>
> ...
>
> > diff --git a/drivers/net/can/usb/nct6694_canfd.c b/drivers/net/can/usb/=
nct6694_canfd.c
>
> ...
>
> > +static int nct6694_can_get_clock(struct nct6694_can_priv *priv)
> > +{
> > +     struct nct6694_can_information *info;
> > +     struct nct6694_cmd_header cmd_hd =3D {
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
> > +     ret =3D nct6694_read_msg(priv->nct6694, &cmd_hd, info);
> > +     if (ret)
> > +             goto exit;
>
> Hi Ming Yu,
>
> This goto will result in the function returning can_clk.
> But can_clk is not initialised until the following line.
>
> Flagged by W=3D1 builds with clang-19, and by Smatch.
>
> > +
> > +     can_clk =3D le32_to_cpu(info->can_clk);
> > +
> > +exit:
> > +     kfree(info);
> > +     return can_clk;
> > +}
>
> ...

