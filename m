Return-Path: <linux-i2c+bounces-10448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB2EA9140A
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 08:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC7B7ACDA5
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Apr 2025 06:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B20E1FBCB0;
	Thu, 17 Apr 2025 06:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0f8DkOx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C46B1E0DE8;
	Thu, 17 Apr 2025 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744871243; cv=none; b=I5R86iwoD2/rlJxOODQhZ1K1NJre0drZuCOsu2TVyUMgzky8asc5XjfHEQ+u+RTEUbSydl0oa+IwVWYa2hG9Gox7b6Ont2ywEb13R9HmOJDGnxgitigXuSJVBmEyMhVE2/hEbH5QO8gdFILtLNcb8eRl5EpNRTZ3La+4pLgD338=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744871243; c=relaxed/simple;
	bh=hzJBWmW8lICSwnMRPi/LH9kPNvWBF+pCWcOfKl3VUD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRUuc6VT6DZmpqh3Iss3VhErDezgMj2EzYIS7gWSby5+HauJwOTOx4KnoFiovPQ4oJWZCVi5kNVa+xP0mOHigt3lmKJCvNhGIKF1sWXzTRiMEiPrASGrk2VnD+gqvb1Y68Ua2t+mr0E4aOoX+v7kQNL47jhzcTMj+ncU5d8coVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0f8DkOx; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6ecf99dd567so6222576d6.0;
        Wed, 16 Apr 2025 23:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744871240; x=1745476040; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYASVlhOcfaq1av7/fl04126jANP6cWR4NufJae7Xbg=;
        b=K0f8DkOxBPpGU9vtVJk6I/BydF3S3qqcM7t49DV2rOGwOX/6flFpHtD/GcKeeF0LJh
         yzEZMCll0Pv7m2QpG9mTA2iDBVeKFgnDrj82MnZYPSoKJcfbiWQa4ETqkPmBi7FPRpJW
         C/BCPBBgJRZgzZtOM3QXwvu+W+v+WtwQMLdGXlDkHZNNCTUhXftQ45zeUG29QTI+kWia
         dG6HC8bx9Ys8Xs5+L45jJl5+ywnzNEiEr7ffdxcbQ78VDdPpKwiW9qjg/q4WihUow4EW
         MA2zYHTKRGRiPQc6JAeoDyk7FnnYSUOhe/Y9GlrCPGu32PPWpVg/SGKCKsdZff78n9VQ
         a3hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744871240; x=1745476040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYASVlhOcfaq1av7/fl04126jANP6cWR4NufJae7Xbg=;
        b=qV+BHr81na6jHrS1WoLDBxVqwi04diD8ToJNMiAjzwJO3qdsrr204KJv2Hw037lYe/
         eYG2ygH5zydn3BTMCQX4/8BPOp+Oh/9K8NEbTTRmSfFnRP2RE21L2aG6owm+dDtnY/LE
         g1YTEpvnm9gKdpF5XYQ5p00vGxXqpyGdzzBrIDJERgymjrhhBYxIcdRM+FVKjeQvuKXX
         ybANPmszuelBUVhlkWHl1i0FS3tbORbk4i6vUsTl7spcXpSz6L+Z6zmtaxficnUWsgeu
         yQItQrESz/qaaHJbRvt6yezFjg4NfUQ8E69n5vmZD9cWT7Y+DBgE7rxGBnhG79AMjDEV
         6rlA==
X-Forwarded-Encrypted: i=1; AJvYcCUbe098sOYVIlQ/182OY7H/HnBErSVGKudYl7f79ACXBMvX03THl635tiutIDvDm9qQdy4QjOeo552w@vger.kernel.org, AJvYcCUyVoj70R/m0SzHw36e/esswnqZTBO1kuu57DMZWACJncJP336K9DXjjBya9dj20avN2GaKbxpdhzTU@vger.kernel.org, AJvYcCVbQOx80itgI5HzcOqVCiYoHMosXq17ZYQjZqsMiz6yfFWc1RDflf2iYe3X3fOvOIthmpKQSHAfH7cv@vger.kernel.org, AJvYcCWhWx5ROiTkx6IuLIZ3Wl6+m0WpTgukoXkmiD2QvvygCpBFsmMABOwQ+RoM0aFk/athx3jYKTQoaK9kHaxP@vger.kernel.org, AJvYcCWqVO6Dd6OhDkPmytxXJeSTIJUMbuZIZ4jCAe2nVblnruc0a7KvPQWm9t1wIytZNyImR2bUnkoKT24o@vger.kernel.org, AJvYcCX398VqUskBjUoUYFQ3e77RZJPnUUPVXi/dQiHkQCUsPPzuLZrMEQM/VdWL/64Io2pXN+W55c2x@vger.kernel.org
X-Gm-Message-State: AOJu0Yx80vLtUDyXI2mAwtSoSsm6JRx5QBGidP1Na5ekHf2SNFmd+wsE
	FDZoIkJM5E3U2QvYNGuzJfUHbUQA3JqT9dvquzaEd9frwg7q1g/bwhQ5ADihBPMhL2fEmLFrFMS
	qHVz9NRZyuIXn7W+4MfzMOkYHmbE=
X-Gm-Gg: ASbGnctFSpW6wanqwVFxnfFfIpp6K1zek80cgDatkUJNqT8wtc7svJY8uXBqd9wRdVY
	nwCWpVD1I8bcqvYdoxOvuRcpUgiGxjYAfmpw567KMOzrZMHtum7hhwNjS2G0YYrsmos3wHbMszT
	/XQQo1Yb4U8bpmURuXvrKyU9Tof8uCeGp1EIFi+KjR0qeEGjTisqCYKlo=
X-Google-Smtp-Source: AGHT+IFtGW1OUCxVsFYK0aS+AATgm+R1KxN8WtGUG42EZWSWUImsJZzN5NBoIDk83tn8feVZCpeI87IWUhbWn44GVCc=
X-Received: by 2002:ac8:7f8c:0:b0:478:dcdd:a257 with SMTP id
 d75a77b69052e-47ad80c2478mr62378561cf.25.1744871240118; Wed, 16 Apr 2025
 23:27:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com> <20250416201523.GD3811555-robh@kernel.org>
In-Reply-To: <20250416201523.GD3811555-robh@kernel.org>
From: Alexey Charkov <alchark@gmail.com>
Date: Thu, 17 Apr 2025 10:27:15 +0400
X-Gm-Features: ATxdqUFawBnxynRxMiSVdRnmhaCCPBo4utOuqT_7dUg0IVBqoTqf8a1fVYs9mBE
Message-ID: <CABjd4Yw5g8oKn=j08a6pr2o=TK7bMPx_NgfEh5cMFX9MVfgP-g@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: pwm: vt8500-pwm: Convert to YAML
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 17, 2025 at 12:15=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Apr 16, 2025 at 12:21:30PM +0400, Alexey Charkov wrote:
> > Rewrite the textual description for the WonderMedia PWM controller
> > as YAML schema, and switch the filename to follow the compatible
> > string.
> >
> > Signed-off-by: Alexey Charkov <alchark@gmail.com>
> > ---
> >  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++=
++++++++
> >  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
> >  MAINTAINERS                                        |  1 +
> >  3 files changed, 44 insertions(+), 18 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml =
b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a5f77fa848e0f604bed63c3=
6b8e0996cf599cec0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pwm/via,vt8500-pwm.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: VIA/Wondermedia VT8500/WM8xxx series SoC PWM controller
> > +
> > +maintainers:
> > +  - Alexey Charkov <alchark@gmail.com>
> > +
> > +allOf:
> > +  - $ref: pwm.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: via,vt8500-pwm
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    pwm1: pwm@d8220000 {
> > +        #pwm-cells =3D <3>;
> > +        compatible =3D "via,vt8500-pwm";
> > +        reg =3D <0xd8220000 0x1000>;
> > +        clocks =3D <&clkpwm>;
>
> Same order as in 'properties'.

Noted, thanks, will adjust.

Best regards,
Alexey

