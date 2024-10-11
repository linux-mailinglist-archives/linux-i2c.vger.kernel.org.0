Return-Path: <linux-i2c+bounces-7343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7569799A54C
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 15:45:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32E42282539
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 13:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037F3218D9A;
	Fri, 11 Oct 2024 13:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJjxuWcS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704C804;
	Fri, 11 Oct 2024 13:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728654296; cv=none; b=fwXj5hgWwqMalQdDkOEaSOBkkkQmQ/LjO0fq9hk5xy8JPSIR2/KO0uxax2tO2IgBz6ifmxSJcKH22ybQ980Itlgff1DD9qyJu7YTJ+lDZ+hiXnixrvpDmIxjT/YEYLN0wpiiw2QbXeYB3VilBJcAEuWqB8zU0N/K0c+JJVdtJUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728654296; c=relaxed/simple;
	bh=dU3fFhFIgbYSCfGSsXuzCP67XhqLGkePBVU1S71XnZY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dET9ZbJPTRMffJAUdZfUwAkF9zS8i8aKwje56mGZFg8DBi5BXf8HxCj1f8+Rcw1Ngg1JTRwgY4Q9mDGyAvdUvSxNLWgpAwVQY443iqQfKx5wHUmTcYgXrcxVbBXyjvN9OtoxLyvKPIEHUGz9bgF+b5T8UfPT+QL0AXlWcGvqi64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJjxuWcS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a995f56ea2dso325893066b.1;
        Fri, 11 Oct 2024 06:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728654293; x=1729259093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFmcATx1odRBRodNNtT/YMf8Rdbu+ncYOjMaxBgaZqo=;
        b=SJjxuWcSm6DIHY0scPGfjknRCknsdPMFjvHGz8rC64QUlriz6Dya/f4ha+TJGv1LyX
         sMnjZFYsINVJPjBvLRx/pNJXtDSzNzaKJxTNXstUfd5LtpEplK9RO1ahCVsv6sw/OVMV
         CV1BYpFxoy3yQmI4zuReVzioc3X/yj3S1I21O4H+UQGUyXiGgBkxf08cYnyOXs4hVcav
         69RmWM1QPnBEbWIMoeUt6hN2EsGDNgPph2oGGSgCPxOYo0yg0mO4d5G/0uSf2wVYOacZ
         PgNYQftW4IvHQYdxEz1RMJ6Le/3cVmD2nwFJLuN7gH5dbMDNP3qGW4GZ5ns9v3pn+1/q
         UQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654293; x=1729259093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmcATx1odRBRodNNtT/YMf8Rdbu+ncYOjMaxBgaZqo=;
        b=sJ9HXiuP4QPF0uycdqcd6PfhjBHums/p5wHLXzuKZAKxnN4CugQNEhSAY0+YLMbVNx
         bOkRlNe9vikIv6uFl8Rz2aMtCSXfb6Zomxag7QbXG31cSXm8zTU4iNEeozZpygSXfE99
         K1D8iBzTQY40G6R+L2eLWWfv2AUIuszHBX/jKgLOSOlzWuakbpzbF2aFcvHMzlXPOrDF
         WJ9po/6FNfwj8fVCfzBNT7g7XjErspG21XWYNlOkvwnpHqs1rWq9Vf1orTa1QtoiUdvL
         4rNW3D6sxGlWPql1+1AZXY+nKZRfo74vzK/YkMlrQwLtES8Wm4bO1rZb5w5tAoeQChnt
         xCkA==
X-Forwarded-Encrypted: i=1; AJvYcCWhdbqEglDfIFLJb3MuG72IEm9RMXAiWbMvkWxg7rLp8uViYaZus6Nac3KakMTrn+DXA2zNDsbehyUqtMMD@vger.kernel.org, AJvYcCXT6CqLeVetE37fO/Kn19rRsmvptqCktZqep70y7FrQzQs5fsu7cU58gNfRcw5jdZjxWnqlXvZsIOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUYX6bTHm0IOZ96IKa/JjAm8wOF3nGph51RY/GryKqIxHRONQ9
	dFB4IYbd9OsvbIBRZuroA93QrRGCmbAX1KzFuIKIQqpWvjSOo7cxkKmUJmGXMiFTBVW2y3lvDm3
	C6QyldsNp0jYllcqlDpsiF0W0Pw==
X-Google-Smtp-Source: AGHT+IGDVt0dw5a0G5CT/lg3sbm+HcJzm8qRuJl8QBnUjs0jZTr5VLEwZcO2c6Bra3147lynUJXcW0UTD9RWKIUKq84=
X-Received: by 2002:a17:907:94d2:b0:a93:d5d3:be4 with SMTP id
 a640c23a62f3a-a99b93018f2mr214011066b.13.1728654293099; Fri, 11 Oct 2024
 06:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
In-Reply-To: <ZwkFWVC3_5xr6OQW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 11 Oct 2024 21:44:42 +0800
Message-ID: <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your comments.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=887:00=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus() logic flow at the early stage of
> > npcm_i2c_master_xfer().
>
> ...
>
> > +     /*
> > +      * Previously, the address was stored w/o left-shift by one bit a=
nd
> > +      * with that shift in the following call to npcm_i2c_master_start=
_xmit().
> > +      *
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address is stored w=
ith
> > +      * the shift and used in the i2c_recover_bus().
> > +      *
> > +      * The address is stored from bit 1 to bit 7 in the register for
> > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > +      */
>
> I would rephrase it a bit like
>
>         /*
>          * Previously, the 7-bit address was stored and being converted t=
o
>          * the address of event in the following call to npcm_i2c_master_=
start_xmit().
>          *
>          * Since there are cases that the i2c_recover_bus() gets called a=
t the
>          * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
>          * and then used in the i2c_recover_bus().
>          */
>
> (E.g., the last paragraph just describes 101 about I2C 7-bit addresses us=
age
>  and may be dropped completely.)
>

Understood. I'll modify the comments and remove the last paragraph.

> > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
>
> ...
>
> > +             /*
> > +              * Since the transfer might be a read operation, remove t=
he I2C_M_RD flag
> > +              * from the bus->dest_addr for the i2c_recover_bus() call=
 later.
> > +              *
> > +              * The i2c_recover_bus() uses the address in a write dire=
ction to recover
> > +              * the i2c bus if some error condition occurs.
> > +              */
>
> > +             if (bus->dest_addr & I2C_M_RD)
>
> Redundant.
>

Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redundan=
t?

> > +                     bus->dest_addr &=3D ~I2C_M_RD;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you again.

Regards,
Tyrone

