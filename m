Return-Path: <linux-i2c+bounces-7501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F239A9C0D
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 10:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A82C7B215F2
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 08:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898E515539D;
	Tue, 22 Oct 2024 08:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3dPxvpn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFEC1547E3;
	Tue, 22 Oct 2024 08:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584541; cv=none; b=ZZToMFZIDa6wsweTWiiFStuvIfMuZ0+9IPgwuFJ2HfBD4k9MOa1OY0T6quuhBvsduYHbEIcOw0OmPb71aQ9vlutZtBHhIroGjkxpeKS5p+AYdALNfX3UjY1av1tZqAZUNBZbMI0QlABcvUTnuY9NHsNgxTPOiO8CDxMlLi+l2G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584541; c=relaxed/simple;
	bh=dagUTI2xnkwMbRNnYChRQLNtRh98ECa64SkOqpuscXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSMdFQu+1+0EGocdTIfBXRIt3oUKykApWmtmFpezd54y4KViCgxpZRYYzfAcnztEoevRSSsL8O8zQVGjNWys8BoH/2zaiSLIEz53Ae4vE0SDyfXJ7/hqJoAmZvQmtDgg65xEeNa5M2KBPzdj5ABjobCd9gmjzcMCW/Lrcfhme2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3dPxvpn; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so6586706a12.0;
        Tue, 22 Oct 2024 01:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729584538; x=1730189338; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RAxTUOgyeH/1NC7uW/0971TmzKMGlKwhAldeokcnpw=;
        b=C3dPxvpngC/qoHsKhhiaX+UDZN2EMW0qWAXHzXoZ4TKizfUjpkqqVHSC50bRKW0aKC
         QeOTjMIgXHDTVKDHoaRPlHGfZ1Mu+vnd3pTLKG5Plg9danwAjw/w5ked9bw26WKmqPpE
         vAcVvCYReOmPCq1woUihlf5l90V1APNmg4c4h6W4e5pttfI2RHswzjyckDuOdgSHVDQQ
         Z5YnQVVg6hlZl9jimgzPNunM30uwcGlqMoDqEG70js+57/gl+FylEVU+JJE/G15kCmgM
         /JGqjZ6jRkU0yYi3rRbQ5ikpwyLiyhPGIt8VZT9bzx5sbww9vDh/TrCHRJokRfN2cr6Q
         0kVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729584538; x=1730189338;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RAxTUOgyeH/1NC7uW/0971TmzKMGlKwhAldeokcnpw=;
        b=cl0m2pstqB0MFIX4IU121Ors+djr8DC/REomhcRwvWVZAg1EbryQouczLcqO35ZQU9
         fFwgR6JWuSYrLmJemQ+gtP/hYW7AIW7jcUk+79m5jfx/ok4btffGZtrYBEkXNKs/phoo
         6BvWp+ZSW1ET376AKykJIHG4rYx1NQF1jnB9fA8/LE+x9Sw1NXQH+p1Cqy3uMA8jeKMv
         6pk0c1zOX6Rqov9BMzpCE+54YuA32a1WHGBGocobhcdr82Mb1nf8GU4nvrApf+SSesyy
         dlCwkcxGZ0gwv+EqZWCqWtowhUbPE7mp7i6mX05/zTMQ883jwNm8tKZyper/SOIPygZb
         fIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2m+WuB4mHBTzCEGmCCiQ+CA2ONQP5GYnEOLbMo+nAc+WHJFd6T0mWT24gha1C5hOER2hjVoSeogrNy9tU@vger.kernel.org, AJvYcCXrB7Jv/WrwTxBXacYuhPBgujpW0nNrORvtU5Dkyjb+rPqKO9gzTvBCg8RBbmad7atfFX96lB7IcOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUKayVvjdGAhepnkgxqnM67TqCOgLHo0Fv6ng4+I+Lhv+U154
	8JZmPn3rcujyh6sfpQZETPDbXryGmOCWMypAlO6LlClayxYGHV4RYJUK9Z9YVvAV1fDl7kn7422
	ErdPGb2Hh9WUytPtzCiOyydJmOw==
X-Google-Smtp-Source: AGHT+IEMyzU8oyfnzRI+pT4T4yIREUGwYqA6I7VpHwZ8v8JLgOy4CIxmXoXC9birxtulDqF1tvfCjzvR+SG6CwoK3RQ=
X-Received: by 2002:a17:907:3f9d:b0:a99:fc3d:7c76 with SMTP id
 a640c23a62f3a-a9a69bb56admr1684531166b.37.1729584537520; Tue, 22 Oct 2024
 01:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
In-Reply-To: <67d34216-e98b-43d9-afd1-2e73ffb71968@molgen.mpg.de>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 22 Oct 2024 16:08:46 +0800
Message-ID: <CACD3sJb_xF_wYuLEMV3yF0HdtrOX3vnPUdZ6_x5yof7yj4yUNg@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com, wsa@kernel.org, 
	rand.sec96@gmail.com, wsa+renesas@sang-engineering.com, 
	tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
	KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
	openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paul:

Thank you for your comment.

It'll be addressed in the next patch set.

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8821=E6=
=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:01=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Tyrone,
>
>
> Thank you for your patch.
>
> Am 21.10.24 um 08:27 schrieb Tyrone Ting:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Store the client address earlier since it might get called in
> > the i2c_recover_bus() logic flow at the early stage of
> > npcm_i2c_master_xfer().
>
> Thank you for the description. For the summary/title it=E2=80=99d be grea=
t, if
> you were more specific. For example:
>
> i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
>
> It=E2=80=99d be great if you noted the commit, your patch fixes, so it=E2=
=80=99s clear
> since when the problem has been present.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Tali Perry <tali.perry1@gmail.com>
> > ---
> >   drivers/i2c/busses/i2c-npcm7xx.c | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index c96a25d37c14..a9a9b21f1f0b 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -2155,6 +2155,16 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >
> >       } while (time_is_after_jiffies(time_left) && bus_busy);
> >
> > +     /*
> > +      * Previously, the 7-bit address was stored and being converted t=
o
> > +      * the address of event in the following call to npcm_i2c_master_=
start_xmit().
> > +      *
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
> > +      * and then used in the i2c_recover_bus().
> > +      */
> > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > +
> >       /*
> >        * Check the BER (bus error) state, when ber_state is true, it me=
ans that the module
> >        * detects the bus error which is caused by some factor like that=
 the electricity
> > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_adapt=
er *adap, struct i2c_msg *msgs,
> >        * bus is busy.
> >        */
> >       if (bus_busy || bus->ber_state) {
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
> > +             bus->dest_addr &=3D ~I2C_M_RD;
> > +
> >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> >               npcm_i2c_reset(bus);
> >               i2c_recover_bus(adap);
> > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adapte=
r *adap, struct i2c_msg *msgs,
> >       }
> >
> >       npcm_i2c_init_params(bus);
> > -     bus->dest_addr =3D slave_addr;
> >       bus->msgs =3D msgs;
> >       bus->msgs_num =3D num;
> >       bus->cmd_err =3D 0;
>
>
> Kind regards,
>
> Paul

Have a nice day.

Regards,
Tyrone

