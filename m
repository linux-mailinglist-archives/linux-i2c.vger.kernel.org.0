Return-Path: <linux-i2c+bounces-9415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 000A4A33D82
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 12:11:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 704B2169C28
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 11:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440682144BB;
	Thu, 13 Feb 2025 11:10:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5807321422E;
	Thu, 13 Feb 2025 11:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739445026; cv=none; b=Hv/2aaLZP8+EyJXL7klf3waehX6F8iMS2A5wk2CG45pJbT2b/D+gzF8g+HjsKT348/s/nzLGngjmSm2z3Bejp+t9d6zdHZdgK9/tTHSCi4O0FmZX4Z3xZGciGKgn3kWg3/S31X6+csSU1w8M+bIy8+MqSTxjHX1uYczlg2tU95s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739445026; c=relaxed/simple;
	bh=JEF57XRtXfdRkdU8beCLr3h/A6kdou4nxdOf+rgJteM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ugwKOohYPWimtgHywMSSB81PZQeyHWAlb7zwfNalrdWWZ9cdVyTkwdQGd75jdWs7lqkGcNr0gIDac+j+R4ogq3txzfWf27YT67Z93Vyhqz5ZNUFGcbn8nWJObymKVJigmIh6nzRcUtPpPucPA5La/tSWxVWZMRXuegBJOv5Pm+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-868e8cf9e20so275051241.3;
        Thu, 13 Feb 2025 03:10:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739445022; x=1740049822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwgkmhLwCdZnQCEgDKGior/XaAE1+cSjZI17Qz6Sy2U=;
        b=nenHoQNSg4XDrrCr939uaMzj6PMFneXTeg23D3qqazDvWigIW1OO8+kwfqnY9h9JCJ
         pRRLFjcPxjzveG+7ga++U6kWYKqguBFtubYQlCdGBZTo/EKrPjOJWAUz/IiGGCxC/hfj
         6HA7XYv6/AbOTsMBhKlpAMG9p3hzmdoNJN9kiSK2c7sx2VhjQhoh4wD0ZxOi23UOluzv
         bTayhTMaiEmBGy/Xw5ApEYjGNMRUskV7KRZew+MAQr2jB6O2hjWUFRBLlkciK6fmDCeu
         R53K6XGJYJtbb4mid3tXpXzW2tw+A7lDOyksOsQI4xgkMxopUAnSCue7j7gkqYUQhOLy
         5A+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7cIi7Qwk2ZX05bYkrCP145BInWqy805BDhGH8Fv6A5+kmoXE7/rOs3I3dzHNGaGNeouoUKMBZWtdB5KMxuO9xJ+k=@vger.kernel.org, AJvYcCUTrKreaACKubIVBt8BI0OkmvMKa0tha9JOkN8OLwFnpUCfA3w69OkyyYGy1XndNDyeCvVIl9AOOEQ=@vger.kernel.org, AJvYcCVi+nLyrROB4y7CIYrF4d3KdiQgGn56ap7kmtLOlua+QjRcA32p51CkY0U0bxvyDHi8IEukTw8/1/5eGozP@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk9NywNosh1xk1ILYJiIbNw6fsWile7qdTWTEi5p5DVq36LjjE
	7MDh5z26hHf0ozg+/Y6UcjGpJ4sVFjmVhEq/b/3deBYlQ4tdLpmq7gjElMRZ63s=
X-Gm-Gg: ASbGncsGTDHuN8L2NKXzyvk12um7ktU3YdjHCxPautbWxLFiiDhO9wtY1AUPGqkD0be
	J3oMBTnO5I9cqqKDaoqp6son5PWWtXJQFpLROEwnoMuvnq7lank9gBkQrfRKfgNtOiWz9dz4HY5
	ZulHIc8zzHJuyEqXgKz8c+iRQtqRjfNaoBxru13LCRmU9RrSX7bToWCn5zy/bINvBaFY+1dnNXh
	mbMuTAkMNIq/lkeDhg8Wt7PIb4xxo0JDmE0wZAg8NuMILVRp8GmqaXoGMDMCi7TKTQNwh6+RBUm
	4/PJKHeMdIVH0/n59jbVEJcpVjdJnsMM/q3AwyF5pNGQO54jwCV8iA==
X-Google-Smtp-Source: AGHT+IEdRaB/h/SNwadRDGVN26F27UWP3dR4X5NlRGK4CZWoLfCvCVh06t99b4HQyu3AxnENmAv0qA==
X-Received: by 2002:a05:6102:3f94:b0:4bb:c8e5:aa6d with SMTP id ada2fe7eead31-4bbf21e1b99mr6946571137.17.1739445022384;
        Thu, 13 Feb 2025 03:10:22 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e86cbfa7sm150052241.31.2025.02.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:10:21 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-868e8cf9e20so275032241.3;
        Thu, 13 Feb 2025 03:10:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUbWSw7VyQFHl/rySsqeqKXcZN7sWJX2cafkH02lXlnbDAL1zvkS6SddzCLN7T7q/IgnYjPM7ExDF8=@vger.kernel.org, AJvYcCVHpp8xzcta1UnvKrxJNeEEixxYveoP69yGU3IUbdVSLiC9kR1rgHdc83Rru11c+t0XKATiixTA3n4IrlXkPNz0oBk=@vger.kernel.org, AJvYcCVIYL7xMSRfSJnEH4cPV9E71w2EcCXcECJ5FL/8zqa1b7yrl2llNn0A/wDbHK7Do8sWyAx/nDmqZ4YmrKtZ@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:4bb:edc9:f95c with SMTP id
 ada2fe7eead31-4bbf210aa1emr6434080137.15.1739445021452; Thu, 13 Feb 2025
 03:10:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com> <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
In-Reply-To: <Z6zwqbzd5evG0H2z@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Feb 2025 12:10:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_iojuf1+K=fWJaC2N9v+DkYEQHNpD8X5=2YG11aoAVA@mail.gmail.com>
X-Gm-Features: AWEUYZlUzirD3ek5L604Zv7gAkhCUNphgI2LIBZrWs7QIl-67Gk7L-7Wf9PzZr4
Message-ID: <CAMuHMdX_iojuf1+K=fWJaC2N9v+DkYEQHNpD8X5=2YG11aoAVA@mail.gmail.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andy,

On Wed, 12 Feb 2025 at 20:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Feb 12, 2025 at 07:36:46PM +0100, Geert Uytterhoeven wrote:
> > On Wed, 12 Feb 2025 at 17:35, Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > There are already a lot of drivers that have been using
> > > i2c_8bit_addr_from_msg() for 7-bit addresses, now it's time
> > > to have the similar for 10-bit addresses.
>
> ...
>
> > > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> >
> > Having never used 10-bit addressing myself, or even looked into it,
> > it took me a while to understand what this helper really does...
> > So this returns the high byte of the artificial 16-bit address that
> > must be used to address a target that uses 10-bit addressing?
> > Hence I think this should be renamed, to better match its purpose.
>
> Since you are giving a constructive feedback, please, propose the name.

i2c_10bit_addr_hi_from_msg()?

> > > +{
> > > +       /*
> > > +        * 10-bit address
> > > +        *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> > > +        *   addr_2: addr[7:0]
> >
> > I think the second comment line does not belong here, as this function
> > doesn't care about that part.
>
> I think the comment is okay to stay. It explains the full picture which is
> helpful. It may be extended to say that the function returns only addr_1.

Or it could be moved outside this function, i.e. at the start of the
section listing all 10-bit address helpers?

>
> > > +        */
> > > +       return 0xf0 | ((msg->addr & GENMASK(9, 8)) >> 7) | (msg->flags & I2C_M_RD);
> > > +}
> >
> > Probably you also want to add a similar but much simpler helper to
> > return the low byte?
>
> Wouldn't it be too much?

I (my OCD ;-) love symmetry...

i2c_10bit_addr_lo_from_msg()?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

