Return-Path: <linux-i2c+bounces-7282-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A82995F37
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 07:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF0F31F24683
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2024 05:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21FA713C9C4;
	Wed,  9 Oct 2024 05:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVAo6NsQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419AB2AF1D;
	Wed,  9 Oct 2024 05:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728452895; cv=none; b=jsv52Mqh9GocpqQHVkbiiqWffgVbVHD3jgvxxEjccjup0IqY4PUJM/CspCDz+Utt5C9WxW9Bh1C6+K775nFiAF9RUXYimhutcrelzv3h/VYEED3Rn9g/NAOa4DlT58WSM7ASyl1Wi96JBLzeCol7LiDM/cVXz9ijTJx6mf1Bqq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728452895; c=relaxed/simple;
	bh=hTtBM9iFePeqL0/+xc0wXXCr7MVnwVra4EW6H/mw/h8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meP+ptbsZOQl0VfV8OrCVjm8S0bdT8av+gpaF+24ObXO+1Sw4sQr4IIne8hUH7Q1ONc8dbIFgcDcXCJZl3E5r9bMLjRVku8TO4ShPqDICunKmtANUcQBCl0nqhOvCcZ+1yssYzSeIYjFgt74y2WhpTfryZcCW5VKKcRAsTDrUXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVAo6NsQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398cc2fcb7so7290228e87.1;
        Tue, 08 Oct 2024 22:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728452892; x=1729057692; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NObWxCBTZ7RUOz3dFok5wYOXIGuBPTZzt1EEJpRyYuU=;
        b=CVAo6NsQzzzdlOOqCnuWXZOBOj4AeDiud8dcS9M5RBSVUGZiFwnOZ1A624htbIfUSB
         ySRXCIjqVLZ4WhPrWHKEE15ciE6qKsEO1ZYv3ISaBfcZKFj7WY6qizvUDvienSe9GkZn
         RXg08okvnGDXyAdrJY80WOQTXlNrR9Q0djg/7OTBKLzkJBGOGS3mZh7MsQ5dJHdS6qPp
         vCOqWh58gnbGifmj8bDKvZu6Be7ghKjbkbmJrQ+P2cr23yfbcfx93QobqXY5cu2IkRNH
         3sGIzeD4NY+lRkXELsZqWNUd88beKzpQOQu4HWovsfrx5LWykXM1SytyZcZ6oVNouKLF
         zQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728452892; x=1729057692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NObWxCBTZ7RUOz3dFok5wYOXIGuBPTZzt1EEJpRyYuU=;
        b=eA1xXraOvCGmFtvO0I6kCDr39Pe8aU2DOwQrkay68DHhPWzJ3hfoVi7uYPFApjI5rs
         +zgJsHm1MHYZSddUzj/NUr+Z8rz6JFRTeSB53NWrRMrGoE7PEGugtA8Blh/LO3euyfn5
         GTslzooTv5b9fywj+dQZKXTavMZa/iaG1iv+o0DHXscsC1NlADXeWnQnQhnwZxlES0qy
         zg6Z13LIjTRfLEFEHYYrwF+rnDuJyJrAW6fFCFqDxMln4T28aQFEHujLqyqRAjFd9lNI
         UmP362oYLud3ShgLYesuLvlCcJx/Yeio5FhD9gshmuokTidDTHj3KiCds5poLpZJhAuR
         2BVg==
X-Forwarded-Encrypted: i=1; AJvYcCWryTqueWfGQeBovLPTxB/qAzQV99d6CYZgKIH/uQUNaHks1eK2nc89sW44XHTCiwYTCjgPOPCSRIegA42B@vger.kernel.org, AJvYcCXg8POephVGTuyh1pnNSjb/DGVs+uuq5rskw5QxrHvSOs2XTf77jc/Oi0D6ECeUZCffL3kHTG5DxJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqoDTjmcCjgdpkO6LD459QzgphcVx3lQ1c10hEasn2kpqK4BSg
	dGq2CewItus2gQyBM0zqrWwNiYxgU2H8GeOQGuGeBz90E3VFIIhZ9ToxqU7Ev7miVCZRe9TWoZg
	7L+WHcJF+zEQvlnRdwYeLUz5oiQ==
X-Google-Smtp-Source: AGHT+IHwS4bHyxTCyWm/s8+wB2Y9y9wEcYJX/jE/HI4PaVJ6axU0RoZ6LHW1stlMz1JQq3jJSDMqLAgurFddsOVwjIg=
X-Received: by 2002:a05:6512:2245:b0:536:548a:ff89 with SMTP id
 2adb3069b0e04-539c495ee90mr549023e87.39.1728452891961; Tue, 08 Oct 2024
 22:48:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com> <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
In-Reply-To: <ZwVcGu3YeJ6pI0sM@black.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 9 Oct 2024 13:48:00 +0800
Message-ID: <CACD3sJa0g=JR3utj=U8-zJm31W3gT_4Hb4wxGhAmdGhOSw=rSQ@mail.gmail.com>
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
10=E6=9C=889=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8812:21=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 04, 2024 at 10:29:10AM +0800, Tyrone Ting wrote:
> > Hi Andy:
> >
> > Thank you for your comments.
> >
> > After a second thought, I'll explain why slave_addr << 1 is given here.
> >
> > Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > > Hi Andy:
> > >
> > > Thank you for your comments and they'll be addressed.
> > >
> > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > > >
> > > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > > >
> > > > > Store the client address earlier since it might get called in
> > > > > the i2c_recover_bus() logic flow at the early stage of
> > > > > npcm_i2c_master_xfer().
> > > >
> > > > ...
> > > >
> > > > > +     /*
> > > > > +      * Previously, the address was stored w/o left-shift by one=
 bit and
> > > > > +      * with that shift in the following call to npcm_i2c_master=
_start_xmit().
> > > > > +      *
> > > > > +      * Since there are cases that the i2c_recover_bus() gets ca=
lled at the
> > > > > +      * early stage of npcm_i2c_master_xfer(), the address is st=
ored with
> > > > > +      * the shift and used in the i2c_recover_bus().
> > > > > +      *
> > > > > +      * The address is stored from bit 1 to bit 7 in the registe=
r for
> > > > > +      * sending the i2c address later so it's left-shifted by 1 =
bit.
> > > > > +      */
> > > > > +     bus->dest_addr =3D slave_addr << 1;
> > > >
> > > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > > >
> >
> > The current implementation of i2c_8bit_addr_from_msg() (ref link:
> > https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> > is
> > "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> > extra consideration about the read flag when retrieving the i2c
> > address.
> > IOW, if there is a read event, the i2c address contains a read
> > indication (bit 0 of the i2c address is 1).
> >
> > The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
> > i2c_recover_bus() later. (ref link:
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1691)
> >
> > Suppose there is a read event and the i2c address is 0x60.
> >
> > With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> > With the original patch, bus->dest_addr will be 0xc0.
> >
> > If some error condition occurs and it requires i2c_recover_bus() to
> > recover the bus, according to the description at
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1742,
> > the address "0xc1" is used
> > as a parameter to npcm_i2c_wr_byte() which is used to send the address
> > in the write direction.
> >
> > If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> > described at
> > https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-np=
cm7xx.c#L1742,
> > which is about to send
> > an address in a write direction since the address from
> > i2c_8bit_addr_from_msg() contains a read indication.
>
> Okay, then I would do the i2c_8bit_addr_from_msg() call here as AFAICS
> this is the real event where you save the address *of the event*.
>
> And in the respective user update the comment to summarize above and do
> rather ->dest_addr & ~I2C_M_RD there.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Thank you.

Regards,
Tyrone

