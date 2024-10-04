Return-Path: <linux-i2c+bounces-7214-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C68298FC51
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 04:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA2D283953
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 02:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07D91CAAF;
	Fri,  4 Oct 2024 02:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhSOALP2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8E48F70;
	Fri,  4 Oct 2024 02:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728008965; cv=none; b=nPPRlkexwV+OAf3y5ucLmicyCEqzeGKXMOaIIw/OsUfxpmjYmJVFfiBP4y0YjzwE8LkYN0cUV0D74O2EpITlfIcqD54n53LdDgVN0JmqFhqufzDDcnXQCeMisdU8nkA/9aSb0f5EClrYtA4upDlNorFA2sPq/z3Aku8zA5ahhJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728008965; c=relaxed/simple;
	bh=+x43RBIAmDc3gAQhppM1DW3bNsYS04thwJNzbbd81dU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BYopLHBAWyMqS5QTHulmcPbjeKgPKWj+CIa65R9QYKkTCScnZvyCWwv314NemSbtDa6hBPYFBLkxEZsTbXBBqnCSq2u5Twdk2dLk5NLXS8OQGSLL1n7ixF71E5tdR2Y+m5bH707x/ud2UtNYk6nxVNbg+wvOyLVF3EQH/mgfWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhSOALP2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so240032866b.3;
        Thu, 03 Oct 2024 19:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728008962; x=1728613762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mhCMNngyFRcrq9Jaifi5sCxy3Lm9pQkHqN1LFTdRQ8=;
        b=EhSOALP2y1PryravyUo4kI3K66yayMkdr1sBTY+zD9epV5pVjbyLkaHOkfIuBzNB6g
         ydigCV8avf93Cpl7V7HGwPsy46N3G5nFQ3BcXX8L1zn1ROfBqpX0+EvAb0TfcyOwtkBo
         NwIk3GlZkGVwBwn5scC+8eaa+jZpoVOcEoZk1xSurCQyPz2UpJnA6zQJcemtQ1OxjsEC
         gTVnxnbCEyWyzh+7B7cHew/0rXfYdCdSomCTwwIvYdyBzXwxByySNphomBbaMtISpd/j
         bfrGNq/hCWmMOTs99H9HjPiwFOYwZsEc/r2P6hYE0vxRz0kxuGrA3x3XL4EXx+en0aQd
         6XYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728008962; x=1728613762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mhCMNngyFRcrq9Jaifi5sCxy3Lm9pQkHqN1LFTdRQ8=;
        b=kgUWBIvuccnSFsbDQioJTo2IF61PHfZx/70EqoHDiTrr66Gv06rqlegYFpokNYhhvI
         jjfsjQFT5VAI+3ihtqpK9gaO+8aNaXstPt9f6r3Im4u/xgQStl8sSbPNTsp5pcNpDHHm
         iUheRoSc5bJBKJWw2GQLLCFL8QoEkQ/ruJRD5lsHFbAlTY1I6xIHh14HpQfzgaTo4YPL
         I5iN38dlmBLgV/M9TXeA18or1ewnameg/KJ+XopjvdKtNf5LAwfnHLHeSgeOU40rLfGJ
         4UaFqxkY8R5c3dz+yfG1ibHWKdM5b3mbAgXS9KHkPpGCzX1pYfd88gUnTIr3tLgaJbll
         4icA==
X-Forwarded-Encrypted: i=1; AJvYcCWKTcbmSnYE3ifkYiDO9fk+LE3WFsgc8UwqOqNgQhQRtthNJ2odagPshqL80aRAfd6k2OHIqqwJUBk=@vger.kernel.org, AJvYcCWsOZ3QgnEIQF7cSP7DvkWjMIsX3oT2BwVAxuEe4vQzLBLZ7wzOdRtUQyESJnfpS+Kc7I/dUQHHMQTXpUue@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9IOrqzvff1fePkaglPHA7ZlVjyfG0GTUKOhNAeKacNVLO28ia
	wOwfQRJoq7wEI4byo0wjnEIqXrcz6go2G9Nz7sBo7Hxux42fu9pnOpaBlTee7kMz0JkyIduRP3T
	TPP1GsSi2LFguA8r5d6621A+M2g==
X-Google-Smtp-Source: AGHT+IHyv/4HLv4MIflnH3aGXq3LiQKW2demZrfTWF98TpbeJidf5/cs0qnOwP+AZ07FFnPWLqfwC03CIfC+wk0jGVg=
X-Received: by 2002:a17:907:9619:b0:a93:d088:8ac9 with SMTP id
 a640c23a62f3a-a991bd71e36mr98775266b.36.1728008962227; Thu, 03 Oct 2024
 19:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
In-Reply-To: <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 10:29:10 +0800
Message-ID: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
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

Thank you for your comments.

After a second thought, I'll explain why slave_addr << 1 is given here.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments and they'll be addressed.
>
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=
=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > From: Tyrone Ting <kfting@nuvoton.com>
> > >
> > > Store the client address earlier since it might get called in
> > > the i2c_recover_bus() logic flow at the early stage of
> > > npcm_i2c_master_xfer().
> >
> > ...
> >
> > > +     /*
> > > +      * Previously, the address was stored w/o left-shift by one bit=
 and
> > > +      * with that shift in the following call to npcm_i2c_master_sta=
rt_xmit().
> > > +      *
> > > +      * Since there are cases that the i2c_recover_bus() gets called=
 at the
> > > +      * early stage of npcm_i2c_master_xfer(), the address is stored=
 with
> > > +      * the shift and used in the i2c_recover_bus().
> > > +      *
> > > +      * The address is stored from bit 1 to bit 7 in the register fo=
r
> > > +      * sending the i2c address later so it's left-shifted by 1 bit.
> > > +      */
> > > +     bus->dest_addr =3D slave_addr << 1;
> >
> > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> >

The current implementation of i2c_8bit_addr_from_msg() (ref link:
https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
is
"return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
extra consideration about the read flag when retrieving the i2c
address.
IOW, if there is a read event, the i2c address contains a read
indication (bit 0 of the i2c address is 1).

The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
i2c_recover_bus() later. (ref link:
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1691)

Suppose there is a read event and the i2c address is 0x60.

With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
With the original patch, bus->dest_addr will be 0xc0.

If some error condition occurs and it requires i2c_recover_bus() to
recover the bus, according to the description at
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1742,
the address "0xc1" is used
as a parameter to npcm_i2c_wr_byte() which is used to send the address
in the write direction.

If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
described at
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L1742,
which is about to send
an address in a write direction since the address from
i2c_8bit_addr_from_msg() contains a read indication.

> > --
> > With Best Regards,
> > Andy Shevchenko
> >
> >
>
> Have a nice day.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone

