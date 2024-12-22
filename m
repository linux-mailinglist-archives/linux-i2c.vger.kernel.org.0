Return-Path: <linux-i2c+bounces-8688-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4839FA3C0
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 05:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9AFC1652E4
	for <lists+linux-i2c@lfdr.de>; Sun, 22 Dec 2024 04:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F5B21106;
	Sun, 22 Dec 2024 04:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHXANTeO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F826FC08;
	Sun, 22 Dec 2024 04:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734841022; cv=none; b=KdONnSX92LAXmUvtVxo0vu91jIANCkugdTBlUdCURskLQcy6zj6TWusNmCz24+lYSKUp6l0D+/OFWIAkhhUJuwX97mGDXh6aurfoLwUk1o/702CE0tMvXHiscwZ4gPKW8P74nP2b2YyjkEQCYFLJR/qwS7yS6px7xrb8KcSRovk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734841022; c=relaxed/simple;
	bh=AYbCUPoQM3fjFVzcQHmFE+OMx/cm6Y5+dHnxyY9Iwvs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=jw81w1T5czOtDGnxeP8mFDYQqYhuwcTr0SPpLPNMjatG9tajt1quZXppfoeaOabbpruNC0yfbBGke/hA3uMJdfufy6kqmPY1hJl4gqeJhLdC8DYXaSfEiZZYB96kmduWjloxG25hWf6hkx9P1dKcZ3CvRZjdVs4NpQMS6bBBjPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHXANTeO; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-518954032b2so1010849e0c.0;
        Sat, 21 Dec 2024 20:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734841019; x=1735445819; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MkA5U9T9m0D5g6RYle8v/2vsOIhOBbdr4av4rgR8I/I=;
        b=ZHXANTeOaSh2YJ+b8De1DOKaV5HYtGLSWznv/h0wa7AMYwiwhELbgSmWyOnFWHC8JT
         hWa21Ok7NdEALwjOyoXiKQJ1JpmpHyQw1Gy9i/4VRy3pI3dHmpu1hkNmQUsP47pGoDLx
         Guj1K06qK2xY/zXGzQXoV48DGlgYEKd29DihV2/Z7e+pmQ/S35y2PjARZ/wQaXZMHR/L
         WVEz1cUgCQtmO4sYnXUIavU+mA4FO9noq/2NZfDOwPNBVSz5/nlPAfjeiyq0bdM9uz2D
         TFXJcgvhWeiOWT8Gq/gUVP6/BiZ13eMj1WkY28PX+2b8vi9NZ9ZSu56KpgK54ZUay6Nv
         t0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734841019; x=1735445819;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkA5U9T9m0D5g6RYle8v/2vsOIhOBbdr4av4rgR8I/I=;
        b=Yow/XrSKcXNFl9TWXVaS+WUKMZUeoiWWmnSASyrpVHZ9CXtQSmSDS4iWdhsiAhW4hD
         wIF4G35ZTFob/EZ1V6Xph1uqlUqkP7LgCrRy9SKYFW1ttrSOapIxcFYfdG/kkGJb0AWa
         Ro5ABhv6DDHXvMHXTzFMgTVj+u4ARWWBjedaVC9Bbv9CApGBnz3MfWO8dGDTxmi7Edxp
         0k9wI+2Zu2qjl1zwl5LXIHhXbBBELX/QIP3HqktPaRrCaMwZ4mre1ea6ESVSHO9m7Dfy
         5i03PhorssfyVtQoOHEgi1NAwgdrMFDFn0iDRoqDM1slgUMPo69hMFNeGmG4uVkL/rm5
         wf2g==
X-Forwarded-Encrypted: i=1; AJvYcCV4P1F7NvHihRYgcopVxahf86t6RXTVI/PgwmPIve284S+kpLGzkytwpOTKdyhsD92dWQHsR7Fy5hrNxfet@vger.kernel.org, AJvYcCWCttVQI3SB8YR8Ho1iDqmiE4ihNyW/AwyhOBqFqSATXmc9XyoBOdlVlcllneJtkZClXkyAYBE7G4o=@vger.kernel.org, AJvYcCWklZlUr+R3ILPblksT/1JEQSo8+sMhjRsqMW97T2bNt7fyXO1CBA7L+9r+zuzWgvDgRgKMJAmYhfFFizO00ZukBpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Mq/tHvTGuStYicPjgJvZdpX9HIE+PjJLyrEgjY0s24dYRkof
	PwKbDn1TIPSA2cs7AERnDezmw2Lxd7bNTXR2w6v6Y84oQQUmt0+SqomDL1gyhKcdR3kgqttf3Fx
	HWJugZ+rJsich23oKwE78eNnoxIM=
X-Gm-Gg: ASbGncuiyqMNCixMxVZfRgEKAc8JyuTtU7XccUMUYzmYbyKUuVWT8tnpb1AxhM0bHIE
	P8hX+sHiUWVv6dC8kIH7IdFORJFRLm46LoC5uAMQEFpXOWuWgSYNQS8yPsYGB4HpyKNhdoZQp
X-Google-Smtp-Source: AGHT+IFbZW6NrvnfJXFAtcBSyYysm13ZzzQE1K6epy0eZuQeM5XWgkBQWmrd/uTyYVd7RzPZMxtnyVEKMTt/U1dp5JY=
X-Received: by 2002:a05:6122:d8a:b0:518:7ab7:afbf with SMTP id
 71dfb90a1353d-51b75c6e677mr7764848e0c.4.1734841019364; Sat, 21 Dec 2024
 20:16:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-9-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z2XhI4L9nzUqa22Z@ninjato>
In-Reply-To: <Z2XhI4L9nzUqa22Z@ninjato>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 22 Dec 2024 04:16:33 +0000
Message-ID: <CA+V-a8ueqegA0Rpxwus2SUH_HVeVpPj2xDf1O7QACBEO9o71PQ@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: riic: Add `riic_bus_barrier()` to check bus availability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Prabhakar <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Wolfram Sang <wsa@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thank you for the review.

On Fri, Dec 20, 2024 at 9:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> On Wed, Dec 18, 2024 at 12:16:17AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce a new `riic_bus_barrier()` function to verify bus availabilit=
y
> > before initiating an I2C transfer. This function enhances the bus
> > arbitration check by ensuring that the SDA and SCL lines are not held l=
ow,
> > in addition to checking the BBSY flag using `readb_poll_timeout()`.
> >
> > Previously, only the BBSY flag was checked to determine bus availabilit=
y.
> > However, it is possible for the SDA line to remain low even when BBSY =
=3D 0.
> > This new implementation performs an additional check on the SDA and SCL
> > lines to avoid potential bus contention issues.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> ...
>
> > -     if (riic_readb(riic, RIIC_ICCR2) & ICCR2_BBSY) {
> > -             riic->err =3D -EBUSY;
> > +     riic->err =3D riic_bus_barrier(riic);
> > +     if (riic->err)
> >               goto out;
> > -     }
> >
> >       reinit_completion(&riic->msg_done);
> >       riic->err =3D 0;
>
> This initialization can go now. err is 0 already.
>
Agreed, I will fix that in the v3.

> With that fixed:
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

Cheers,
Prabhakar

