Return-Path: <linux-i2c+bounces-7646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 162209B44DB
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 09:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C36B5281A32
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Oct 2024 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6484D2038D4;
	Tue, 29 Oct 2024 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXGqnr21"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA0202F8E;
	Tue, 29 Oct 2024 08:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730191818; cv=none; b=SezGu6kRq3fH94V7JV+uCEu9sK2Oolt5PllK7H3XMRA2zf7Dibe9JMxVVvgOCCBjOWYIDJfNBlJWWGVhzgLiJ2jQyeycgGTlJtUzt1RueWGtn5wA96yhM/qNCNUkKn9kXDpAASq2YCc+sVpsLcsbTVm6lekAOL7FHHbRjV5Ruxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730191818; c=relaxed/simple;
	bh=BCdIlpfZk5NdlDUoMJi/vA2LtFa3NEgqdt52Etz0yag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r91AuB6CLWt8oVyY9BDK3cqXmY0gBwX0Q9dvjJEkEQJkZcBBsGo6aV9Z08xP+9iMcLMMHmty8pFtDkcRsDHNcFt68krZkp1E6NdPFlVoZSupAli8U9cP4Dk9lliQO8RfMyTJYzO+jceKaEvSCfjLuRBFXkWbAHmdOtvKwLyuq3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXGqnr21; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c97c7852e8so7360769a12.1;
        Tue, 29 Oct 2024 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730191814; x=1730796614; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1C7g+ecqTH571IGrF1o9PEiuGBd5idFcyM4+gP1MkY=;
        b=HXGqnr21bb/aKmqO/5LR9RApVe5rj3yqgmSiQ7SglBG8+i9oFgFuVqUd7on234U+LK
         NehFUblfCoEcqNBr/Y7vlWbifoyyBCXMDLGVwvtZs5X6mqAe7rEPNbAhzty2aeHlUGiL
         xc8L+TKzsg9MZLgsl0r5nt7ZwHNujBjaSvy3BAagB30Y3Fo+4ZrbyL0/Ya4v1mL3t/4l
         CFEF/ieQJEy0IpmOhfS3/jHF22+gv/LYfMBI7WNLt6GNkJ6mR90eVCDA2ZqvGLvFTcXY
         EkdgDbUnS9upD1GU/TrrE7W3kl8vaLtvG4Oax9V81xa8/zu7XgZdgIv7XCPr7PXZiTvk
         gEZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730191814; x=1730796614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1C7g+ecqTH571IGrF1o9PEiuGBd5idFcyM4+gP1MkY=;
        b=lOM82XzLkEnWHKRHMQ79jB6rbIT1FWCzCe0EHuC2l46xNyOU7jcTT3uAGL1vD7bcUW
         iZjr3iPTpetK1tLGZ72T6wZTVWtxxWkY9cKZLavX35mRrFIC5bE+OilGN3EinYQU3qUt
         PYIWbUTOdqALHcJCBF1P2XZ7rXQhk9FZJiwKC6hzH1lqrMskWHzXbrJyinLMgvUBSNxQ
         xlsjJ3JEm1DG8HY742bIydLsS7+y7Nj5en1/Zw3f6jtjtvsWTHjpnMgHZsIOUIcwnBo1
         qQufqSiYTw/sgq/v/s4pwNuZRD6snJglkccoRyuskj+TPWspjHS6aNLEOsTM087cpEmg
         lf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXghPaCtJx9Hrjvs4CeNkRku1KtblYZQmMFLEAos1AJxeWxWetIldgw1yqTfzKBjyPG/G6rxAE1+k7qaD7E@vger.kernel.org, AJvYcCXsJgyI3gjgunI/s8De6tD4o6W6QmTHORlAKh5cG0rUdbL6NhPRbrCFmwAOOmWfgzvzuMWoGCDGYdk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIyZ6AYN4D2rvyTuGao54Z1p94IK0oMUNAx40cS39517RAYtoM
	YD/ZSJ/XfPQ3gnwryKX8vxllinQkRsYoNYGd7Mr9IeLRNFGtMpaElNq9z58MdneQb/KVQpEPMq8
	aPjAzpUpocWofpvRXwnyFTCDjJg==
X-Google-Smtp-Source: AGHT+IEnuUd1RY/e4qO/uOcahve0/rtuCFrasHA8pKx35KthdwW8c9CBr7Ahe2VjFx7ocEvkq2IJ9WEXxO0pHiCd/BQ=
X-Received: by 2002:a17:907:9620:b0:a80:f840:9004 with SMTP id
 a640c23a62f3a-a9de5c9f68cmr956758566b.12.1730191813880; Tue, 29 Oct 2024
 01:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi> <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
In-Reply-To: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 29 Oct 2024 16:50:02 +0800
Message-ID: <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] i2c: npcm: Modify the client address assignment
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

Sorry to bother you.

May I have your comments about my feedback on these patches?

It'll be great to know if I need to prepare the next patch set for reviewin=
g.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Thank you for your comments.
>
> Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > Hi Tyrone,
> >
> > ...
> >
> > > +     /*
> > > +      * Previously, the 7-bit address was stored and being converted=
 to
> > > +      * the address of event in the following call to npcm_i2c_maste=
r_start_xmit().
> >
> > Do we care how it was done previously? I think this is not a
> > useful information as the code readers will se the code the way
> > it is now, not the way it was done "previously".
> >
>
> Yes, it's not a useful information anymore.
>
> > (there is a related comment at the end)
> >
> > > +      * Since there are cases that the i2c_recover_bus() gets called=
 at the
> > > +      * early stage of npcm_i2c_master_xfer(), the address of event =
is stored
> > > +      * and then used in the i2c_recover_bus().
> >
> > I could rephrase this sentence to something like:
> >
> > /*
> >  * Store the address early in a global position to ensure it is
> >  * accessible for a potential call to i2c_recover_bus().
> >  */
>
> Understood. Thank you for your help on this.
>
> >
> > > +      */
> > > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > > +
> > >       /*
> > >        * Check the BER (bus error) state, when ber_state is true, it =
means that the module
> > >        * detects the bus error which is caused by some factor like th=
at the electricity
> > > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_ada=
pter *adap, struct i2c_msg *msgs,
> > >        * bus is busy.
> > >        */
> > >       if (bus_busy || bus->ber_state) {
> > > +             /*
> > > +              * Since the transfer might be a read operation, remove=
 the I2C_M_RD flag
> > > +              * from the bus->dest_addr for the i2c_recover_bus() ca=
ll later.
> > > +              *
> > > +              * The i2c_recover_bus() uses the address in a write di=
rection to recover
> > > +              * the i2c bus if some error condition occurs.
> > > +              */
> > > +             bus->dest_addr &=3D ~I2C_M_RD;
> > > +
> > >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> > >               npcm_i2c_reset(bus);
> > >               i2c_recover_bus(adap);
> > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_adap=
ter *adap, struct i2c_msg *msgs,
> > >       }
> > >
> > >       npcm_i2c_init_params(bus);
> > > -     bus->dest_addr =3D slave_addr;
> >
> > We can now get rid of slave_addr. It's just used in
> > npcm_i2c_master_start_xmit(). Right?
>
> Yes, slave_addr is just used as the link
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L2182
> suggests with this patch.
>
> >
> > Andi
> >
> > >       bus->msgs =3D msgs;
> > >       bus->msgs_num =3D num;
> > >       bus->cmd_err =3D 0;
> > > --
> > > 2.34.1
> > >
>
> Thank you.
>
> Regards,
> Tyrone

Have a nice day.

Thank you.

Regards,
Tyrone

