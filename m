Return-Path: <linux-i2c+bounces-7561-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645889AF716
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 03:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87B391C21BC5
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 01:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99C0487A5;
	Fri, 25 Oct 2024 01:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzK/aOHr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E38F22B644;
	Fri, 25 Oct 2024 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729820619; cv=none; b=mPSZ1f31+asb7IuS9VGf1Kxj55vtl7dDjxN6SnSsXx9Qd/LwDBehtQ08rVd2yZr68CFUIC/tVTA2JcGBkx4rPeZsNzkKVnUp70VukgBtfI/E7IcKZdm+KcRt+5V298ljt1JsNmsqmaIYnGhfnHYpYGKDYVzkv/BbYEL/ZWVwPu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729820619; c=relaxed/simple;
	bh=vh/GUwa56KEncMzBLe25VniCXjx6L63gJj9RXh/F75A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZoOR/y6+vEjh6Haq5rlYwXwKsmvZGHKdoYzYU64wg+EhKuZtBtNZdUW9VdxTFQRlAIAU2XKSRp5ecrWDBks7qwEh2xHpowpU9y8Mrveaj8tE7+M/jEZv6kbr4OXTaz8uUehyqRyXn6tBGM2TUjoDeNYfRZzUMze67bwWQ9j5xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzK/aOHr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9acafdb745so298579466b.0;
        Thu, 24 Oct 2024 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729820616; x=1730425416; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O8Vm6VBOFLWecOYwWVt2Ly1tLDYX7Q/a+VPKjbNnv+M=;
        b=DzK/aOHruPG5QUfsrLw0a/d+Ty/7m7ULibJtppzO+pryDaxHoQf3/B5KOMKhh8IHnl
         84MeR3Ct+qP2YogBMwthGITKB2A3ZsMrKRiJvdRa7G708xsaNdKBhIKgPapj6EtRE4wO
         Oqp3qmVRWMK0y7/MUJWZEItFtwCQuNdt4JZ9y90eB9Q6EpJOcX17rjb+8G3RBwdWmp7Q
         5SDahZq1Au+Wy+ngH4LuLtsBkWsjvrwlnHkdyNOOfaLlfZVClLPkrEkOao6vukGI0btf
         Kt9OuBvTpiEjGAjrDTnSAYrP6M+ifQp/518DcI8nXLeTT2R9tCqwe4PF7cGFdcDm0Cuj
         KL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729820616; x=1730425416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O8Vm6VBOFLWecOYwWVt2Ly1tLDYX7Q/a+VPKjbNnv+M=;
        b=XVYmdpjGMqyAVxh3q2Rh1Bw4vp2z5ZATtI28pbtM6Cw19wROV/Pn0ZjZQMbQuFC9oV
         +mB5wluLRd+N0wI5fD5pshrtneFy4Q7QYyyg3XZtKfwbuURYZnmK6JdzP3c0UXxeXU9j
         li5HIdjlqYH2OyUI/TWsWzGdUqSFuGZ0f4urMBuofqdAKecUXZ5Ox/vnBzYVSC+LPjkH
         2WrMik3OYNiibs0zURdl9a7PxAcNDffFz32QTJlQknWSPsDfrVb3gtgyMD3F/6X4+WF3
         K7JzCxRxAahHf9zAmzDbdEL70GNhjJob6XM9Wt5faWebQKBTEktmy4Fe73uSSS+haU7p
         PA4g==
X-Forwarded-Encrypted: i=1; AJvYcCW+2SVRjeL8Nvo40rqldd4JyrOHULeUjQR2C+l9khwVkLDDU9jJ2GGdu7buzcVL85JVlGIx4kUz+Sw=@vger.kernel.org, AJvYcCXQkwSmclIGugOzu4GxSRsIGzaKXh9M4pnCbbx+gZwlxPP9B9bsRLkQ6JcCYVwpfciLTFj5U50NuHdvMF8c@vger.kernel.org
X-Gm-Message-State: AOJu0YzU6UfslhbqEDpeCOEYvzaO8qKDbN9s5R5BFErWTLo+DsVkJDpq
	NZOy5KU0hQOGH+Qo+oQ7ByBOCLnEgyUVwhG4SgLkFKmZxrov6qSiBylSuos9e+K3TWOnfBnavpR
	jkRW5Hmx+ryrKCpfaGCTXF5oKmw==
X-Google-Smtp-Source: AGHT+IG2yTlTZyXCaLKgoPrumql2OcBC6aY42zOMh7/jxnTGVLHw+xWLaAcZNjr7TGv7MpXPdpVu4d0Kq2Ev6cjj24o=
X-Received: by 2002:a17:907:7282:b0:a9a:17be:fac7 with SMTP id
 a640c23a62f3a-a9ad19bd232mr426053666b.14.1729820615789; Thu, 24 Oct 2024
 18:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
In-Reply-To: <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 25 Oct 2024 09:43:24 +0800
Message-ID: <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com>
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

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=886:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> ...
>
> > +     /*
> > +      * Previously, the 7-bit address was stored and being converted t=
o
> > +      * the address of event in the following call to npcm_i2c_master_=
start_xmit().
>
> Do we care how it was done previously? I think this is not a
> useful information as the code readers will se the code the way
> it is now, not the way it was done "previously".
>

Yes, it's not a useful information anymore.

> (there is a related comment at the end)
>
> > +      * Since there are cases that the i2c_recover_bus() gets called a=
t the
> > +      * early stage of npcm_i2c_master_xfer(), the address of event is=
 stored
> > +      * and then used in the i2c_recover_bus().
>
> I could rephrase this sentence to something like:
>
> /*
>  * Store the address early in a global position to ensure it is
>  * accessible for a potential call to i2c_recover_bus().
>  */

Understood. Thank you for your help on this.

>
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
>
> We can now get rid of slave_addr. It's just used in
> npcm_i2c_master_start_xmit(). Right?

Yes, slave_addr is just used as the link
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L2182
suggests with this patch.

>
> Andi
>
> >       bus->msgs =3D msgs;
> >       bus->msgs_num =3D num;
> >       bus->cmd_err =3D 0;
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone

