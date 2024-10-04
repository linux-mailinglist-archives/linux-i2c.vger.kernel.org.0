Return-Path: <linux-i2c+bounces-7212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B598FC05
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 03:49:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FB6A1C22C71
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 01:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE8013FF5;
	Fri,  4 Oct 2024 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="czv651bK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5DD8C13;
	Fri,  4 Oct 2024 01:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006560; cv=none; b=CB3GQSI9lzaDEeNhJQ+UNgd5kVGd94iCZ3Jv9ZNWrvZGVF1bzfD7e1a1lRwvHLTW08EEK+LC7kADleHdNurvq/0miyKsFMGDgJsklqspN49vFg7nT3Iwr066i3QtpC6VTVC+DMuyQciS/gHZSxIv0Lc5+WT1hHWTsQnHk7X2KnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006560; c=relaxed/simple;
	bh=X3phpp0CW6ugTHzFVfpXpAJ6YkBDLiUKmMi/7I69TGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXQ3cElC+zND8CbbjXM6di3BtX/uQEvPQ8zdDtxT+qHdXKv3TeqE7SChWmwPN6cy8t0QAtZVV4tIy3b3UqqLuMosclYOlfsChHNFoybohTziZ+m5tacF2jQ/09BitM4ZYBtaSHn5C+3A/u4hpVGeyFzzXhH4bOk5aqdqTqxGgpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=czv651bK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c8844f0ccaso1976886a12.0;
        Thu, 03 Oct 2024 18:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006558; x=1728611358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Nc7ApnR6nbyTatR6bQIp3Ei0Y0fheg+jMLkC8GG61A=;
        b=czv651bKYb5xMeQG58MWkAKPw0qjGY5KVfwTHKcth55YK8eCY6CcxGXsvw4sHniebS
         YbC66rw7w5fqTRXGMjPJs4eBBTO3/eW7Vlgi27N6cgBJYxpxLanj4M5RpdrRvUW+Tyxe
         QTbFXeRPKAasu/dkkBpB7T7E7RKIVDaZ6xROxXfDGxeR8qCr7otT7imAWe6IGiDPN3dX
         0OIpBWqdVCyLzFF2U5m4snQvfhSc+rIM865OSx2qz05o9mUcTHhO7QSoRaSBy21SnKD7
         HLMMAD6kVlvZUNJv5JcIGWYcPTd3o0bfSNt2i9Q8TbJHipTIYcTAh8e5MSG5dSR77IAO
         GOXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006558; x=1728611358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Nc7ApnR6nbyTatR6bQIp3Ei0Y0fheg+jMLkC8GG61A=;
        b=t/Felmhr2v2WNuHuuTdBms4AdkuTTIwp/4lUAOvsmX2mSrNehGtIREH2upD6k/a1YF
         tY96a0HTv2A/y2ECm2ytf8Np7nQ+WQwFkr9LOzHNVAILjAlIBi3hdj9gV7J2Pl/0Mci0
         j9Y1wyYusDkFtM4kmSt+QTcIbA7MIZstsBe4zgZeGKBxmOYFro8pMuPmdZilmBhEvKPq
         5cvNnTNAopNoXYVAg838R2NqTLfUOrAdml6mKyVq03J3WwvaCipvzBLVh2/Szkrqcuna
         lMvmPumofTjKoG+yf18YE0cfEuOVejci+O1a1nf02ZNFbTLZ8FllUVkNEYfjOPUQw9i8
         1WeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBFivWC16t5VfKKEXidzD3PpT+3+wjHlWFkCriUjY4zWZM417dmXXoE8WpadzL92dYbj4Qs3Z0eh3P6DkH@vger.kernel.org, AJvYcCVwmfk8+gx5YbE/lDmcx2PgqDh5AAUuEAakWaMlU2DFDRN2MK+dSfpApvv7CiL7Dy39/rSKyR7MTiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww6J5vM2YpFdNBWjK8BSIK9dMgNlbCyKIHAkafmD2g3ckwhi+4
	hKFUnGgkEuo1qdjlgsQIKC5ulVmWY1fE8QXp+xo4COnnFEzWAQdv6UhVw2HKNSxteQytaFVrUl+
	+dhW96vST1tZ5WY8SJ4w1MaoN9g==
X-Google-Smtp-Source: AGHT+IGpeQ7q3Kr3iLTaYIb8b7EqgDiIEjkL0C2Jt5Ak8J50Ew0L6q5RgXNnXeyzuu5dxJG3zeRV5Zpr+2HnggZzPu8=
X-Received: by 2002:a17:906:da89:b0:a8a:837c:ebd4 with SMTP id
 a640c23a62f3a-a991bd71c4emr108821066b.27.1728006557641; Thu, 03 Oct 2024
 18:49:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
In-Reply-To: <Zvv2Y10hJqGnUDvW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:49:06 +0800
Message-ID: <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] i2c: npcm: Modify the client address assignment
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

Thank you for your comments and they'll be addressed.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
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
> > +     bus->dest_addr =3D slave_addr << 1;
>
> I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone

