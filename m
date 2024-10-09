Return-Path: <linux-i2c+bounces-7283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8094E995F3D
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 07:49:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A91EE1C2187C
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 05:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E45615DBB3;
	Wed,  9 Oct 2024 05:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYoQaXeH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3D12AF1D;
	Wed,  9 Oct 2024 05:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452972; cv=none; b=rqKpyUn2fAvozGh0SvbaVAODcIGvwiaWOls49sjt7w5D+n4p4gvbaE+SPNcMmFjK0Zz92A0PbrGM8qpgwsyX9U10CW/S4CRJRBu01GuX/qflFzLXO7yEYYDvCoz6SzguTgA3tLZXfJWLloFrLmDLBCD7AJHD40l8uf9qyM0Rt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452972; c=relaxed/simple;
	bh=pNoSVKrOj1EJmV0xmS4D7Cf6uf15eKnAP5gC8eQP59k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IEiXSDyZGNlGS7k9F8j0Kseang5oLt9NOr26Ch5jNf7RCrY5W51gev3m9jAZuRFtQnAZDKmdJn3qhbnD8yDxYWH5IimziVui3XQPLFdep0EG9QWYqFvgjc8Th7ELyNefcLpUa+bSf2xf+bAogJhtDEZhQCHSa4IQcOHV5FMZdIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYoQaXeH; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso89435481fa.1;
        Tue, 08 Oct 2024 22:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728452968; x=1729057768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENzJiVPw0UBC+RQ8ra/ujHUBJgI6xVlyt2ZEDmcywEk=;
        b=OYoQaXeHiaK4W1EW2RnuKACyjB4zCEotwZu6pDLQdmw9UC6Z9fIa7KQp1cTFpQ2ZnL
         08DTFaQkE1YlXvlSYI64ymFq54rjK1zSLuDvVZ5GxYwlnV8+CV2qkUP1ZwBcRY6XaKlP
         q0GS8oz8MGFw+chUGr5eWAUBMCPTMG6Vq8pRIDnD/QOUV4UN5U2JhE9rV2IXOUBpXNBo
         lZPdsq48eX62uS/U57eUcP2Xj7HHus95A1c+jyXrD82iitn7Lmm4WGpvN6IP+wc6Z55I
         3MAsjd24UAs7qIJ0tKWmw9HTBMVTDEEjYGVYlxA8P1qHwbIL9wXPUutK0CLSnT0ZozxN
         isjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452968; x=1729057768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENzJiVPw0UBC+RQ8ra/ujHUBJgI6xVlyt2ZEDmcywEk=;
        b=qrhNZ5mbwdl3VOfnD7PXeaNnboLfv/14FpyweuwJoTqJE+keBXkLFpCgmRaWD/yCsV
         llH0ksRKQIc9esZ7D7PYQGgn/716ITWjrh/BFQwZR5f4LjF8gYIrgakhzIC5VcFV2s9P
         bRRABxG1m6P7wol/YVvn2bcJVRVgtabctAoYdvtcGNFufn3vhJ3qks3XvwyxO2LqEi5V
         i+2ayJH3DStHbD7GtfHxNgBVhMc9w8ycq3JZihkie7vxjOnsE63fIbi+HRvj+XRVBVXa
         dWO2x2knqjcr6bcbV9lRXVgyksPWiaTKDtChgLSCQqFcfQkkSUq/otplPe4RNk06Asbp
         Ecpg==
X-Forwarded-Encrypted: i=1; AJvYcCWKsBz+DWb+FJ3k1GZgcSIoW82gzaV6qCSjlfIASsFkFPoTjFVRkMt898pMymGd/s89mJAR4lVMaAE=@vger.kernel.org, AJvYcCWWH9tBf6YFs97f7UBmUtCsW6FmRAILMI6UAze7w2mgXPby/qKff1f4aB3PHeMx/9Lgdsx9PE2eq+rziXs7@vger.kernel.org
X-Gm-Message-State: AOJu0Yy29i2xINNwcQKSupiDP5t2Pv3gqdGHMVLy95Iv+/wYRJkqEE5F
	1ykFkPmJJu21tZKHFQvMZESAZ4Iy2dH1d/CHxSI5jpet9PWYfF0ZvogXf6Tl1dhExHpUODAE4xX
	v9p3ssTlf3UR1XG/j1ukhBRZvDQ==
X-Google-Smtp-Source: AGHT+IGLqQ5d2U9Klq5WUN9RsjfD8ri5xLAqxNv5oCLfDG2Ji5z4WioYXHs5RThMrB2q65gGd1H1fT+pZ98MS9/kc/A=
X-Received: by 2002:a2e:859:0:b0:2fa:cd3d:4a76 with SMTP id
 38308e7fff4ca-2fb187f628bmr8783861fa.43.1728452968243; Tue, 08 Oct 2024
 22:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-4-kfting@nuvoton.com>
 <Zvv1m3RT916dyYRC@smile.fi.intel.com>
In-Reply-To: <Zvv1m3RT916dyYRC@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 9 Oct 2024 13:49:16 +0800
Message-ID: <CACD3sJYhAYV3zBse5ntFsQmLV+TpLKtOiyyqgp3g8qeja54Ejw@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] i2c: npcm: Modify timeout evaluation mechanism
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
10=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:14=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> On Tue, Oct 01, 2024 at 02:28:52PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > The users want to connect a lot of masters on the same bus.
> > This timeout is used to determine the time it takes to take bus ownersh=
ip.
> > The transactions are very long, so waiting 35ms is not enough.
> >
> > Increase the timeout and treat it as the total timeout, including retri=
es.
> > The total timeout is 2 seconds now.
> >
> > The i2c core layer will have chances to retry to call the i2c driver
> > transfer function if the i2c driver reports that the bus is busy and
> > returns EAGAIN.
>
> -EAGAIN
>
> ...
>
> > +             /*
> > +              * Adaptive TimeOut: estimated time in usec + 100% margin=
:
> > +              * 2: double the timeout for clock stretching case
> > +              * 9: bits per transaction (including the ack/nack)
> > +              */
> > +             timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) *=
 (2 + nread + nwrite);
>
> Side note (as I see it was in the original code), from physics
> point of view the USEC_PER_SEC here should be simply MICRO
> (as 1/Hz =3D=3D s, and here it will be read as s^2 in the result),
> but if one finds the current more understandable, okay then.
>

I just check with Nuvoton members and they prefer the USEC_PER_SEC way.

> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

