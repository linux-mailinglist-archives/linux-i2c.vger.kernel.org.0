Return-Path: <linux-i2c+bounces-9031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38550A0AA05
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392C31887974
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130991B85D4;
	Sun, 12 Jan 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i6JtsctM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2BF1B0F35;
	Sun, 12 Jan 2025 14:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692071; cv=none; b=b3ihedGF6ow4yZ8+jQ5CyrbBmpBDN8fJTa7TOtBxR0EMlJ+4gsud1yxvwfFFsXni8WRbA4XmLwwOKMRNPvfVWfK0//fyLqI5ZHjeJvrOWLjwxPh9lbqFYxvsJB45Wc3dAnAGHzZdyt49vIByzMzDk34EEiySRBngKrm8WEQWir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692071; c=relaxed/simple;
	bh=77zMzZQdRFcChbqZ1KAWji4ddQzc8CIcOrtx5KnhwOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD2LIH63lUhr/Kq6FnavEA11b9ntmRxnFAYZ6p6ZsfZHsxcSvp/ou4roIWHUkYzn0bO3mJvN9HErKYl9aonxR43aayrDso1GPDRfr9GZ8GCWh4+2paRnXEPbPuNTSTc9PcOCbgVguyX90YjfDuve36lD3+ED/Foij+BfkI24ubY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i6JtsctM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9e44654ae3so546031266b.1;
        Sun, 12 Jan 2025 06:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692069; x=1737296869; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77zMzZQdRFcChbqZ1KAWji4ddQzc8CIcOrtx5KnhwOc=;
        b=i6JtsctMYdBsYZTwXBM8sVtItVsG2DOcgZlA6jlgmj+NQpDcKi6Tr9Urp3Cbfsrngx
         9wRfmTPujrfOPqXQis+cGIAQXlSUienpF7m5zC9nNtNJONE6FJCEfNEs4CqdaSGuroVm
         uEwJfjKXcttolbAQbzUzCcJjgbe+oUyGPDvp2+8o0cguVwmZyrnWntYtTbGqL+XSpjAf
         AVb1eY6NnrJgZevd3Vx8w52rSt3Xmp8+Iv07Twhhfs6bb5/hJJR0+jc16L9c6gsujgVr
         A2jOtnAduyBIwC/Q8RbsUpPkiQ1SmCl2bRlmveUelk3xibwAIcHD+ZLa8wC9f4vQ9ud8
         5Jvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692069; x=1737296869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77zMzZQdRFcChbqZ1KAWji4ddQzc8CIcOrtx5KnhwOc=;
        b=urBuzbCPvCFkpAkLgR5KeHjt7vbiCOgXtBpXJ/DN5lh+dfs6vcckSEEiyZPvvECZ7y
         JneFLM/Z8luvVISWGmYi4hkAYl/23FIhiMipC+LSVai8r/bR8Tl63eO05DkyYpwNQkBT
         nwwzvpCqqSHAOWkRLPsz/bzXa5WLEK5wdT0RHbWEn6c4z4bBZOUltu5K/0QhsH3G149N
         hqhxrZwOD1bO4K4VFeUhPNpr7gBTrDB2y6I7LGDiig2rdVIIk6T6yDnnJYexv9xDt2uB
         2bKnrJf4gF93lebaVOR2mN77QjJoGZ29Ck3VF7RaGyyfWfeeMshRdxHUvl5fp2SKOEGW
         2lOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH7IvX5pSUjs1NGR7tbdeVoXUmvfGdEwURaVuRl4AvBL//cbuEPr200ZMstpHz7hkfwJCQbbnssonUkWjL@vger.kernel.org, AJvYcCVwGLSAjAEsBvdm1Yt9iEDrPCGmX7sqd/hZ1xEUZUKGXH7Hl71NJ32kv7wDfSD11b5/FtN3Fsz1vZeNCMW3/zwFYh8=@vger.kernel.org, AJvYcCXN3cQxIFpEhChjrZqnfiPc8vxVP4d9UDsAhgEtbDwvujcYECbGnayZA+wc4TRv+NcKtz8fcmOq3YI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqyn7lBO7zIpuECyeNhjycaFuP4YOiwCASRosWHKExojZGoJVA
	cpMyOE5z+vBCYO1OCIjlouM7qQrz/YZD0MaXuBdLd2XWyKdu9OInCtyVC1ifvgDrHzrxOVLqERi
	9beCXL9qToOMSGD7giwEzgJaVmPg=
X-Gm-Gg: ASbGncunAkWWBdh6r9LW6SibHeus4djp81SdRRgiOg9ndhGe6AAwVQjBvdYz3eK+fET
	6Nd7BjGw9Y7kXK9e90vssou3IP6bUJLPrgpyVKw==
X-Google-Smtp-Source: AGHT+IGkUTli8qFj4Ur8hYPPpmqIEZJ0oWCUZXWjpEYRrIMzFZjFYoTZxp0RMna68OdFj4jD2ET8dDANgLVNCAjn3J4=
X-Received: by 2002:a17:907:9814:b0:aae:ebfe:cedb with SMTP id
 a640c23a62f3a-ab2abde43e2mr1453408366b.51.1736692068608; Sun, 12 Jan 2025
 06:27:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <2am3ib7lohj4ilqv3ldww3pkku456m2vyd2zzgm5akx6vluivm@g6wf6d32h62q>
 <CA+V-a8t2V1HP-T-3H4GdMENiaVy+FBXreLd6NxbeWZ-umupJEw@mail.gmail.com> <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha>
In-Reply-To: <xyphhdf7iesomnbdihonmcnyihgervwczqd2n73a2oguuqvn6s@4axo2yd7gfha>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:27:12 +0200
X-Gm-Features: AbW1kvadHwCl_ts-pOFj6VhJP4ESozGzqfR7Efm-IYnODr1JWE9uDAHopmleVV0
Message-ID: <CAHp75Vf0nea9q1G3-B-9VGmKAvp=T3-_9UxcidR-9ocQLpAwmw@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] i2c: riic: driver cleanup and improvements
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 4:44=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi,
>
> On Sat, Jan 04, 2025 at 08:15:56AM +0000, Lad, Prabhakar wrote:
> > On Fri, Jan 3, 2025 at 11:54=E2=80=AFPM Andi Shyti <andi.shyti@kernel.o=
rg> wrote:
> > > I will need for Andy's ack here because he had some comments.
> > >
> > I'll have to respin the series fixing patch 1/9.
>
> if you want you can only send patch 1. It's OK as far as I'm
> aware of it ;-)
>
> I pinged Andy privately to give an ack here, we still have a few
> days to the merge window.

Sorry for the delay, I have got sick just at the end of my vacation
(and I still have a couple of days left), but I looked at the v4 and
most of the patches LGTM, the respective comments are in the
individual replies.

--=20
With Best Regards,
Andy Shevchenko

