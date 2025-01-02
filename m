Return-Path: <linux-i2c+bounces-8854-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5869FF7CC
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 11:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EA701624C4
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 10:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F81A4F22;
	Thu,  2 Jan 2025 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDn3YsTK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5664D1953A1;
	Thu,  2 Jan 2025 10:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735812357; cv=none; b=ogl6gXsO+zXuQQu/7TDPlJLZ0ikuooy7hvh66cXEGSTpPVMFVqxv1bLPN3H3WauXV9maOWwLNbaS+uGtwOMX51eemhS6paBdpPcKmSHgbkHm233JoOQNR7+LG/r9rl6LANg8PxFksrpSuktIdGGMyWkpGfEwkp0qzixjqXcUZJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735812357; c=relaxed/simple;
	bh=9mjIh99SR1LjlK9Tft9Viyanpm2KZ2ml9U1ornDdnE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O3hKHJfXxlGNZL7qWZS5wn3Y8fxqcueP51DIVqi2a0kKzIE195z9b6gMS4KazHI+sAgQO1J4XrrjydZPuJQOdnfSKye2K/RRNepW0ZLk9rmSDaqwVX4zIrbMBY2/l1576Whu4kB5i/kxYNL6tVhu7oAfV5jxW4ndfCfQZtvcOQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDn3YsTK; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5174f9c0d2aso3360249e0c.1;
        Thu, 02 Jan 2025 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735812354; x=1736417154; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHz2AhSovzV0uAXnq6NDMqoDQ5E1HSJt+EfuXOFdXBY=;
        b=NDn3YsTKK7/w2fT+6AuAH63oOUvcDxlIkUMwlPl/jZAnzv1+h4qH+ay6jsvmhlqG/4
         5ftQZMqX3KI+NmeHYwgYf+LU7bQqtkYNzmO1EBeTJnc6HT+j003IjtOhBz+lW6944Dzx
         I7wLvAgHyrgeqQuGxMY71YRWsj0HBSc0wQITdSHeGtDEjkpOo4rXDqWh7f6jUu3fJqTB
         1WpICPD2vK384JzUn+LgYdq2DtTyiEe26nuxDItsMN5sT1ZPILVPhImy735Pdtk95eHZ
         KKTYioTPRPt4RnaXEiJcqcmggIvu2IN3Wd9YWLkjYcuhCRmH84hGhhN817Gf1UIBw2iV
         ayvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735812354; x=1736417154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHz2AhSovzV0uAXnq6NDMqoDQ5E1HSJt+EfuXOFdXBY=;
        b=bNqIu6UL7FZNN3OslxWxTgXlqDiO6rlueSQyVBYhXgFYL4gYJtSEdAiGllsWt8GiK6
         ky6+r8huYNq5O/M54Iy+iqNAusFtYhtB8a+s3CANDaSLzxc2Whb2Q6TPVFqAxKXpreaj
         7OXI2a/ifGq68M2c2Z5ogbnFgVXAZQZ354V2XKGF4wEOUrDnHOZkHNxDek4WY66mqMMs
         3zjKSoWzmkp0nDN0Bd1zqeLl9F00DWjcX4Y7Xp2OVAbgWq7V52Y26dPQK9CgRaf3WP7P
         cHgzhVPiitrImAZVrVJchQTDvfevldy2zoN4qdQyZaicaD9zDWg5AiXk1ruYPGfKJTJ5
         Cupg==
X-Forwarded-Encrypted: i=1; AJvYcCUdze4vB1CwR1fdoMVdffKKGJGgQ7J2sRnDWNyZ2+g0sjXBVYG379h5cDYOEPYdFHYrZBlsPeCh4fEAM2Ez@vger.kernel.org, AJvYcCWaeS0B3yC8krgsbZPOcCGXNxYA9/0tSXdAPln8coVoJj+4oxll1v/epmt9zZQoa3DxPW8IJwbff+Y=@vger.kernel.org, AJvYcCXEX8UZP1DQ7uQqtre5lLaeIErKVE9PllYbM40OVcc38YeZA54c84gTQOCUfsd+SG5yYiT2Xftu2w+vnwFpRWxXRvA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0y+WTR5L/p+rjdS2z9WR07XasiJ67WRJnQrAgSTjPQvsVGMbF
	FXNyivBMKBn+CzFPoScCbWWnkXVD7JpddCFY1BtyP+onJuZogExV1SgQ13fB+h0Vpg7WEfZ8LZy
	S/pDnOhkU5Oh7oBhzNLa6RLArAjmwjAcw/dY=
X-Gm-Gg: ASbGncuPBk0SKgv/6cmaTJZYFDs83T9hJR2UvO6c6kmwE2goyq9lNPWirKVvjzhH2h7
	oz1QP8kujW2pRVsqXBuZrzUApEabGBSaoZb39eyV2icusWJBQECIhTVwj/5BP0eSy8mn59zE=
X-Google-Smtp-Source: AGHT+IFqLu8xmPE0v4Yqy4ahIrmC3kxTEpejFgAUdmRbCJTjvogaKJlpG8345DIB/h2ymqcc4x+RwMEm0lh1MIOhy8Y=
X-Received: by 2002:a05:6122:1999:b0:518:8d54:567f with SMTP id
 71dfb90a1353d-51b75c5fcb8mr32570476e0c.6.1735812354077; Thu, 02 Jan 2025
 02:05:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3CLypNNqqlSsabo@surfacebook.localdomain>
In-Reply-To: <Z3CLypNNqqlSsabo@surfacebook.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 10:05:28 +0000
Message-ID: <CA+V-a8sivMvR8-2gBOBSRmoiY7Axwo2Lh+Y7tbEx2opem7yJGQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] i2c: riic: Use predefined macro and simplify clock
 tick calculation
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for the review.

On Sat, Dec 28, 2024 at 11:37=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Fri, Dec 27, 2024 at 11:51:53AM +0000, Prabhakar kirjoitti:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace the hardcoded `1000000000` with the predefined `NANO` macro for
> > clarity. Simplify the code by introducing a `ns_per_tick` variable to
> > store `NANO / rate`, reducing redundancy and improving readability.
>
> ...
>
> > -     brl -=3D t->scl_fall_ns / (1000000000 / rate);
> > -     brh -=3D t->scl_rise_ns / (1000000000 / rate);
> > +     ns_per_tick =3D NANO / rate;
>
> So, why NANO and not NSEC_PER_SEC?
>
Agreed, I'll switch to NSEC_PER_SEC.

Cheers,
Prabhakar

