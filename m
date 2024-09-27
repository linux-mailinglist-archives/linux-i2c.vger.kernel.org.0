Return-Path: <linux-i2c+bounces-7039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 656DF987CD1
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 04:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965861C229C0
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Sep 2024 02:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EAE28DCB;
	Fri, 27 Sep 2024 02:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYsVtjV3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF4B290F;
	Fri, 27 Sep 2024 02:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727402638; cv=none; b=uzQM6ugRmGNnrFkA52bJgO5qq78ZnC/dH/Oqst6eUXlcFE6wvO9YZyW5fTrQdsEpty559H2zv8vj3rrchgICuiaO6V4ciwSLulT03I57LBsa9vD4w2NWDpz7Kkafa7EuwV35OtYi4dgyCibOLhvahni1WjAixZjrjp1CeSvI/xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727402638; c=relaxed/simple;
	bh=U54MpCtMI0X1xEVoU5TTP8tzTsrnqN22AKSkJYCOjgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=buymz0o38V4LynHdsHo4xNtdcyqEQ9eNS4reDpjvIcmGVeaDh/3uVtGOLZDVrtUNhM6s5pwSHTT/HU+RlMDnOfJDFFjM8zAXqNpaS9M/s7F+6FsxjtueM+LuyP+CJq27I22evCfFLKYIuxbM6U8lYZtZwV15CjJu150M7xOpWzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYsVtjV3; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-82d24e18dfcso69611139f.3;
        Thu, 26 Sep 2024 19:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727402636; x=1728007436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jh6r0BOOneL+0+uXM+raqfA4bRD3EJOioSx3dRRd20=;
        b=gYsVtjV3o+c3c9WX6Eh5Ynks3/Lxbc6GBPY25WZPZMKIiKFckqIbYEmWK8GdTfBBsN
         FPa2yVlWCWyoIMwfCq0CWJCs9t461zvEbJ+JNvxCffnx94HqbPdOVIdcqH8uEW49a13L
         mtLdLXfArkIDe4Pr+vJCYjB3gdJkLKDMLBoC6TZroaSvYqSsicHUCmdqHfxlOxRQcLrE
         XEjtsW+siaJxrrhNNTe/MDHgp3UqDUtKpjNKR5wULpznXOLOyhRKc9h/2Lim10g6rRn8
         OlGL2kAEn17POHoAHDa6sHKzdsZh4rBI+HPcB5fnIdgfsZOlB/tCn7uHv8cbyM2zZEa8
         nhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727402636; x=1728007436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jh6r0BOOneL+0+uXM+raqfA4bRD3EJOioSx3dRRd20=;
        b=iXQ1Y8bg6NGtoM4OYJl090DLLbnZvaP6ZM1bQ5gK1MLQbAywfgmPm8+HcSDA3cjh29
         Rb8JpJ/cHZ85c2WnxSzFMpcchMWqf6hGhT395v6Y3uj7LBJtMAGH+e3Uforu86IfiSrE
         g4gu0eFHml+XKEFDNntSa3/w4AY5RZLLlKoSwufnMzIeIcVwng4DrktzIj1sv8mJyEBj
         2f9OAm19zZIe6rrYgmx0h0iDvsSTVhq6boE82Z9JKobgtZzv8N4uyUk/iq1OGvY37P5P
         pOgWCqXeTGYt5IMOR6lPzPv/5Y/kWVkMJPH3aQ9+6stXtliCU5J14lOfS0rjn0PNtwp0
         1SzA==
X-Forwarded-Encrypted: i=1; AJvYcCVUnHRy7AQl3vjbTgqWOwwn/rh+SiHdQz/jEV2c6BMSZNNmPdkZC3t2HX/eipXtxqRUXSFO/B9Wl4gYQYOr@vger.kernel.org, AJvYcCXOGLkAkFcTtOl6EOH3vlQatwDZ22+gR0JcmquC9bb32CSR0YFLzn3n5A4O6TtBQ1F8COXKDdk80uA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzivDtAOj8VY1qRSd3UTpkV4urakYWyr56mPqBlXf+O3cJwUsuH
	eZ2O+nRf6253hmsuvvyMnSOU2soDbIziZI62ZQFKnrAXMA7pxyBXaU2XCjnX/xRps/u+1T6cD+e
	kG6Kk7ROPOUSs3dMBOzrtu7IG/A==
X-Google-Smtp-Source: AGHT+IFU/HiFTzaHHaNmdW5DFz3sLC3XjW0Ap8eMqLs0Mmx/9EAtSI7Jx44H3OOpWGoXkIL0krrAP/BNe96Mye39TWw=
X-Received: by 2002:a05:6602:2c92:b0:82a:a403:f0df with SMTP id
 ca18e2360f4ac-8349318bdadmr162621939f.2.1727402635762; Thu, 26 Sep 2024
 19:03:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240920101820.44850-1-kfting@nuvoton.com> <20240920101820.44850-4-kfting@nuvoton.com>
 <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
In-Reply-To: <z4g5alkk3cug7v5bsmrmzspgvo4hhu2ebtykht72ewwhsqxqgq@kg2tlpvz3ctp>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Sep 2024 10:03:42 +0800
Message-ID: <CACD3sJZ8zSSO9kE30qAAYFf-qw+LQ3RRUbPgqnWO_BsxFV2fOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/6] i2c: npcm: Modify timeout evaluation mechanism
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your feedback.

Your comments will be addressed.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=884:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2d034503d8bc..68f3d47323ab 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2132,19 +2132,12 @@ static int npcm_i2c_master_xfer(struct i2c_adap=
ter *adap, struct i2c_msg *msgs,
> >               }
> >       }
> >
> > -     /*
> > -      * Adaptive TimeOut: estimated time in usec + 100% margin:
> > -      * 2: double the timeout for clock stretching case
> > -      * 9: bits per transaction (including the ack/nack)
> > -      */
> > -     timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) * (2 + nr=
ead + nwrite);
> > -     timeout =3D max_t(unsigned long, bus->adap.timeout, usecs_to_jiff=
ies(timeout_usec));
> >       if (nwrite >=3D 32 * 1024 || nread >=3D 32 * 1024) {
> >               dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >               return -EINVAL;
> >       }
> >
> > -     time_left =3D jiffies + timeout + 1;
> > +     time_left =3D jiffies + bus->adap.timeout / bus->adap.retries + 1=
;
> >       do {
> >               /*
> >                * we must clear slave address immediately when the bus i=
s not
> > @@ -2183,6 +2176,14 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >       if (npcm_i2c_master_start_xmit(bus, slave_addr, nwrite, nread,
> >                                      write_data, read_data, read_PEC,
> >                                      read_block)) {
> > +             /*
> > +              * Adaptive TimeOut: estimated time in usec + 100% margin=
:
> > +              * 2: double the timeout for clock stretching case
> > +              * 9: bits per transaction (including the ack/nack)
> > +              */
> > +             timeout_usec =3D (2 * 9 * USEC_PER_SEC / bus->bus_freq) *=
 (2 + nread + nwrite);
> > +             timeout =3D max_t(unsigned long, bus->adap.timeout / bus-=
>adap.retries,
> > +                             usecs_to_jiffies(timeout_usec));
> >               time_left =3D wait_for_completion_timeout(&bus->cmd_compl=
ete,
> >                                                       timeout);
> >
> > @@ -2308,7 +2309,7 @@ static int npcm_i2c_probe_bus(struct platform_dev=
ice *pdev)
> >       adap =3D &bus->adap;
> >       adap->owner =3D THIS_MODULE;
> >       adap->retries =3D 3;
> > -     adap->timeout =3D msecs_to_jiffies(35);
> > +     adap->timeout =3D 2 * HZ;
>
> Same here, I need some good description of why timeout is set to
> 2 seconds. If the datasheet says 35ms, I do not exclude that
> someone in the future will send a patch saying "we don't need to
> wait 2 seconds, wait 35ms as per datasheet".
>
> Thanks,
> Andi
>
> >       adap->algo =3D &npcm_i2c_algo;
> >       adap->quirks =3D &npcm_i2c_quirks;
> >       adap->algo_data =3D bus;
> > --
> > 2.34.1
> >

Have a nice day.

Regards,
Tyrone

