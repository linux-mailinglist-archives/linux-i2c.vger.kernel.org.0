Return-Path: <linux-i2c+bounces-15085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B9D17085
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 08:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 755933043A55
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 07:34:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A1F3101BD;
	Tue, 13 Jan 2026 07:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CNSkCGVZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE431327C
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289658; cv=none; b=MbnvYO6cDCAlGkLhMTcK2gqY0s/HFLqo5BWfH7XK3dN2ZQQfo3dzK6qm2QNJ4hWABbuoLhy4aMkcVPogoDeM7Ty1Q7f3KXkjvKq758J/PKdpK0gI7NFEJHkUZLxVvzTh6GMYMsV3kd6yuJS6bb1tQZsNe9OqUFbf/LwriN+8qsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289658; c=relaxed/simple;
	bh=0rrTlQPqQdLjn1RIpwFT0WwM6r3ds9WrA02vvzwwviY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7LXgaJWIuYJRgjQaVuD3ubFDkRJFDvxhnob8+Eog7Ky4p1Ymr7LbeZnu14dvUGP4GW2B6gscG0kjL/9S7/uGNlYOd8TuKq37sIqfmowCOz9oiBrfR6p1g2H5pvD1hxTaywPPGchedIpjyIi344LdzXdqOGDZXt/tSUu8C+WM08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CNSkCGVZ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4ee14ba3d9cso80904171cf.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Jan 2026 23:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768289656; x=1768894456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVW1LfYeCyMz0VHYNhTwgu7ZUVypSJir+DHcSPeOf9s=;
        b=CNSkCGVZMis8on2SZcP9GbfN9Zp/AZqLWMIDAiSResOe1bCuJOBhZEHIvD6CbiRwxx
         iSUg31h10lpvSQ85jdQVqq06OX7Gk5NpNat5nXLjgs2Bt5cO0SU0Cu/j2DDkKq3Nclle
         IiLD3wxE66F2+NQEXJEZpSRXgnc8RzLDf0OoEg83df+B2PtpE2gIJsHJmjwBMmGH/HSE
         sTjWdKCo/JSwy2Z0zCerNQ/hTyqsXoo1dK+fRWfpo+iGIGpvlsuhrgwhas3HCu4FDzO5
         Rx6nG4LTznxicdRvqSZv6j4BhTkQQG7diaksjY04YqpEJLYpEvJ1hl9U/SYHcCiWhUgk
         EIlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768289656; x=1768894456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVW1LfYeCyMz0VHYNhTwgu7ZUVypSJir+DHcSPeOf9s=;
        b=jeWCX7YIxMGL9ZEghOFQoWENKYVM3ePTvmTMcJyB2jQXflQQp3cITNdY8aaDYdIG7y
         8qD0mM0fy9/8B/VNSVeUxJrPFGL/IAboOW9tBtptpW6HmRzC3za44vk3OxqqiQpoHonL
         UyXu98Krn+qBPTXhPYmWbVRDhxoMLq8cYg606wZCWy0EXyLM8lCIgDcWRHI0jvaxv7OY
         OGK9X21uZZdXs5/iKSzW/wXiz2uo1RGFVGU2lG+S4OHgR9X1TA7HeQkgYy+gZ76zF5/+
         MMnEtQJ2cL695OK3vhqXjOHuDLoo87SZzsxtrwBQYJjGfO7Xovner5XYXn9u58bl9ZoG
         xZ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWCpIompwYn48+4/eZ+n5QcPmiV6Mme9WyALXe3ajLvSMFhLLQnOHRW3/HBlQB+0r3vzSETglGkh+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGnFynYNd6+Ub1Ur2kFmRbKZmgBgYkFgTDCHkDmgIwLl8Em3hK
	hEKJKJsoax1hYwVzh+kQtARmy+aC3P34Y2V1FhZMUg8O2IPX5RVlwu5g0vxmLp4d43LqPIv7oJh
	vusSOfPtXiolX4WN7KIuYkxkwUny9z7E=
X-Gm-Gg: AY/fxX7eOeznyMOja07dbTKpVtc92NGNneFlkHoTYOk4I2Fwz3panKpL6pHINSuCP7A
	ME9TC2OKgYugqouo2vekWZD/SapPGFWajzJIDm7TKnFK25DiZQmCGHsDUVmWFxQ6PPC98VcyJaN
	SNO6NbLqKimOw8Uy/NW7LxOO81SKT24j9ltGMO0oLnx4lJL0EsP+WsmEMF1RRDrbc+/KJV1tUZ9
	Qr6Ll4kjkJ5Ffn7uXNqLMRXHGRifPLZtUExvayUPDLxfpgg6G/9/VuTX9b3WFpkLXjpsRmd/NvC
	SkVdHg==
X-Google-Smtp-Source: AGHT+IHToUb1n4lqBADxGPhTVfIOVGakuNkHfz0UzWrBvQQY/Na7NpBuB1e2wESponvMimSIXH/dIFWpxhOksC6qgs0=
X-Received: by 2002:a05:622a:1823:b0:4e8:9704:7c83 with SMTP id
 d75a77b69052e-4ffb47d759bmr309546081cf.14.1768289655986; Mon, 12 Jan 2026
 23:34:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAN8T_P09Qe4091eq+YXnqzCtSxLQgxcw=jH2bH7uw20N4_DsbQ@mail.gmail.com>
 <aWUn-m56_SUw9nei@smile.fi.intel.com> <CAN8T_P2n5f0FJRi44r+pKcRQbF4SGVLv6H2W_w7JGcD3tDVhjw@mail.gmail.com>
In-Reply-To: <CAN8T_P2n5f0FJRi44r+pKcRQbF4SGVLv6H2W_w7JGcD3tDVhjw@mail.gmail.com>
From: Alex Ivy <whu2gh@gmail.com>
Date: Tue, 13 Jan 2026 15:34:04 +0800
X-Gm-Features: AZwV_Qipb_sWNMsTqsP5OpxJlTpbaD_-jHhfZ7Dp7nF19UZsgUF0ZcqQSRwxYsg
Message-ID: <CAN8T_P36OfZ_rvDc0c3t9ZJdeU924ab_EHhqn5LspGeYV0OXew@mail.gmail.com>
Subject: Re: [QUESTION] i2c: designware: Why use GPIOD_OUT_HIGH instead of
 OPEN_DRAIN for recovery?
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com, 
	wsa@kernel.org, jsd@semihalf.com, p.zabel@pengutronix.de, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

I was not familiar with the LKML reply format and learned to send the
reply again.

As for the  GPIOD FLAGS, I solved my problem  by using GPIO_INPUT to
simulate OPEN_DRAIN for i2c recovery, by just updating the Device Tree
to include GPIO_OPEN_DRAIN for the recovery gpios.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> Wrote=EF=BC=9A
>
> On Mon, Jan 12, 2026 at 10:10:02PM +0800, Alex Ivy wrote:
>
...
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
...

Got it, so let's talk about the GPIOD flags this time.

...
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
...

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
gpiod desc.

This solved my problem.

However, my question still remains why the imx changes get merged. Is
it needed to apply the same patch for the designware i2c?(which my
need many dts changes)

--
Best regards,
Alex Ivy

