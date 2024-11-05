Return-Path: <linux-i2c+bounces-7770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB09BC2C7
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 02:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E501F224BE
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Nov 2024 01:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3697F1EA6F;
	Tue,  5 Nov 2024 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf3hTIEv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45602179BD;
	Tue,  5 Nov 2024 01:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730771587; cv=none; b=hpdKk9PWxjfVfqZpsGYNTa0vVAN/7H6G4T+HAutN5aVhoUjF26GZ0z9lQQCs4ULIpHMD9rRVI+GGiRDMhs+ZMffTKwyqjnhRQbSWj9W+j8TLd1OPswLjrVMrR59Mt202mhUnG7Gks639x8cAEl1x3afzjarz7UHLUpnX1z3/i6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730771587; c=relaxed/simple;
	bh=b3TaHhGEBsxCYF56Y/qge5KEW8LQCF7yxqdKwVtChhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYTTa2zaHa1bIGuAeTALqUcNhvafigWG1pBpPLPz9ImdMOiHXU4nnjHtXyAEdNeFe5HxqT8PUJk51Af9u3nXZ23glX0ttPPXOB60PSjBPVFgvVRMQ5SS7TFMMUrNbAjVWHIZHoa9Y3bbZWRtS3NuqTXWOh4GfzQkmP28/nTy9bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf3hTIEv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a99f646ff1bso668723466b.2;
        Mon, 04 Nov 2024 17:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730771584; x=1731376384; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIdb5nyjPQMMLtSpo3yTfiFAYqNS0d+cY2Xi5pY2LfY=;
        b=Lf3hTIEvsEvYHMiIZKaNqKzQDEg/ac+3rv8sADjKLtH48HcnDkNp14ihwn1OkoIzYD
         SlTLQn1gcyjsPNUGcUuTzYbl9lOSpnVsiRj1wl2SpQGGApZW/WnQfEFECpNR8X98HCCA
         ex4rgneduFIgaeQR8Cpq2k9wV/GbcllSqu3vnouhLPED+deEq/bRdn5dbrq5UTOwab8n
         A8ELIMi+74BZVMVfS58oRCk0o51HZwjav8Z+FW8LSFxwTut87CzWhvtAfDKNvAmVgO13
         aaFob0XO0tfAlymE8mZNMSxHKltVDogmlu/APop8z5dtNU6up0xu+3MrUBM6qFU9Jhb3
         VIdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730771584; x=1731376384;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VIdb5nyjPQMMLtSpo3yTfiFAYqNS0d+cY2Xi5pY2LfY=;
        b=hpSWLGsG5w1UwCLdwfoP87gdbkosUzNtXL5DIuU+LfeixSMRahGIQc5gKi31gC4xEI
         ap3/1cQ1srtF+QaRpsLASFbiIuXG6TPORX+Q3gVzJquVHbR7rpSOzxqvcEVvfLqWoaTG
         N2eWwfQPmeY66Tg2zaEDS6TgoJqGJW8efkZa9ouE/8r83NK/1yeQEUx9louMgZv+6TXV
         gnsqVMaQJWqLPggP951LHP9gIkstfELpHjYi9GP0HIiAQgXJ1d3tD9KlLg51L+bsloAC
         sUEM0uS1nw2wPU9B1KrcOYd4c899/G5GA+T+Vggnbd2Ry7LOELdKqDgeKLUTKBJ6NeoS
         IZWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH5jKpWN7TI6eAHFfr+faPN7RQHHvzAEq3c3WTyU49rFsskwQQ78AHMru9vXG+CQeRAgWFllxx821p2X4W@vger.kernel.org, AJvYcCVw5WlGG/P2IOoeoiCw1YetTKZcClMbrucXaA8PVXNGsDQiJ3DJr9AqhLDtcdQFa+hcq2h1MMiVDMY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw09Huncd05bBS//qA41wKaEHe/4r2WoWdzTbeKRmvPjcSk7JK6
	H4XNAuJpEDreRL09QyhtDUDoTR41SGDa2CSlrHuCoE6d+QhD9I7FgBGGa6EztgrKc8KD1CDb3Px
	EkLIDQRPfKUp0QeAj6H1x//XEng==
X-Google-Smtp-Source: AGHT+IHspJhT15caW/7rLneaz/8IbmEzTw+V8hoTRG1f9gwXEhSDWDC2CZBeah+K02DugV/yuKzB3d/9cAl1QjPyDTY=
X-Received: by 2002:a17:906:dc91:b0:a9a:4f78:c3 with SMTP id
 a640c23a62f3a-a9e3a5a0da3mr2162429366b.21.1730771583301; Mon, 04 Nov 2024
 17:53:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com> <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
In-Reply-To: <CACD3sJbyrzfE0UfoeMhjTg-c1huZmykXLeQKDj-FO8er=awwDQ@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 5 Nov 2024 09:52:51 +0800
Message-ID: <CACD3sJbC77doxo_mBmEVVMJfm2rX9bWAvT1cgeZ77aC60zG7WA@mail.gmail.com>
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

May I have your comments about my feedback on these patches?

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8829=E6=97=
=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=884:50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andi:
>
> Sorry to bother you.
>
> May I have your comments about my feedback on these patches?
>
> It'll be great to know if I need to prepare the next patch set for review=
ing.
>
> Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:43=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Andi:
> >
> > Thank you for your comments.
> >
> > Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> > >
> > > Hi Tyrone,
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the 7-bit address was stored and being convert=
ed to
> > > > +      * the address of event in the following call to npcm_i2c_mas=
ter_start_xmit().
> > >
> > > Do we care how it was done previously? I think this is not a
> > > useful information as the code readers will se the code the way
> > > it is now, not the way it was done "previously".
> > >
> >
> > Yes, it's not a useful information anymore.
> >
> > > (there is a related comment at the end)
> > >
> > > > +      * Since there are cases that the i2c_recover_bus() gets call=
ed at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address of even=
t is stored
> > > > +      * and then used in the i2c_recover_bus().
> > >
> > > I could rephrase this sentence to something like:
> > >
> > > /*
> > >  * Store the address early in a global position to ensure it is
> > >  * accessible for a potential call to i2c_recover_bus().
> > >  */
> >
> > Understood. Thank you for your help on this.
> >
> > >
> > > > +      */
> > > > +     bus->dest_addr =3D i2c_8bit_addr_from_msg(msg0);
> > > > +
> > > >       /*
> > > >        * Check the BER (bus error) state, when ber_state is true, i=
t means that the module
> > > >        * detects the bus error which is caused by some factor like =
that the electricity
> > > > @@ -2165,6 +2175,15 @@ static int npcm_i2c_master_xfer(struct i2c_a=
dapter *adap, struct i2c_msg *msgs,
> > > >        * bus is busy.
> > > >        */
> > > >       if (bus_busy || bus->ber_state) {
> > > > +             /*
> > > > +              * Since the transfer might be a read operation, remo=
ve the I2C_M_RD flag
> > > > +              * from the bus->dest_addr for the i2c_recover_bus() =
call later.
> > > > +              *
> > > > +              * The i2c_recover_bus() uses the address in a write =
direction to recover
> > > > +              * the i2c bus if some error condition occurs.
> > > > +              */
> > > > +             bus->dest_addr &=3D ~I2C_M_RD;
> > > > +
> > > >               iowrite8(NPCM_I2CCST_BB, bus->reg + NPCM_I2CCST);
> > > >               npcm_i2c_reset(bus);
> > > >               i2c_recover_bus(adap);
> > > > @@ -2172,7 +2191,6 @@ static int npcm_i2c_master_xfer(struct i2c_ad=
apter *adap, struct i2c_msg *msgs,
> > > >       }
> > > >
> > > >       npcm_i2c_init_params(bus);
> > > > -     bus->dest_addr =3D slave_addr;
> > >
> > > We can now get rid of slave_addr. It's just used in
> > > npcm_i2c_master_start_xmit(). Right?
> >
> > Yes, slave_addr is just used as the link
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L2182
> > suggests with this patch.
> >
> > >
> > > Andi
> > >
> > > >       bus->msgs =3D msgs;
> > > >       bus->msgs_num =3D num;
> > > >       bus->cmd_err =3D 0;
> > > > --
> > > > 2.34.1
> > > >
> >
> > Thank you.
> >
> > Regards,
> > Tyrone
>
> Have a nice day.
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone

