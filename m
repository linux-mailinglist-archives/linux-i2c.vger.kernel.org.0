Return-Path: <linux-i2c+bounces-7248-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93B993C5D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 03:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64294B236EC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 01:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29F91388;
	Tue,  8 Oct 2024 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IicOiRTW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42401DFE8;
	Tue,  8 Oct 2024 01:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728351731; cv=none; b=OA8LFVF9lWkiRwr8rtrVia/xf+hvvEaWNUkQnxTXJ37Bk4ZZDN94OpjQ7uyYJG0Ne9K2DsjQLPEKA7TrrNrrf5Ab7GEO12rfrSbdWOhKfuPQ2JSIzhrQFDN/3CB1kE6y7K53fAGtctCLRNxFaJ8pyfZBL6fndWmiGyM34TjaH3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728351731; c=relaxed/simple;
	bh=Fns9eipf5ZnjQPOq0rR7rcxSRtJdrrJQCclXWN5lAbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxKMThwM4d5p7OGGtZj4Abs5VhCEX9LsC1CrlqquNXBQAFN4Z+uo09jnxmgZXyInRScqGDww31GAeT745KDM8NwNmclIHOyJQjiFTLCCEMs9PkW70HVMjDdA+DbIbhkROO4daelDJiRaKbHevUac7q0Ox3wuiRRAbohvGbsMDGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IicOiRTW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-537a399e06dso5262889e87.1;
        Mon, 07 Oct 2024 18:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728351728; x=1728956528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3H/OIpQ+NUwZNvJrAsNKijREzfomqrSjb5DeGZB3tnY=;
        b=IicOiRTWO/OA/OgPzfHd0PQFNfHUHg5UvMz+/Rma0IKwayELsx3SSrwH1mCEwwfvuj
         NxGCSA+n5YBvWcpOyXvAjkRLFzxeiSXb2dd4mTYvadt8eCkIRriTAfGQEMYYBqUzGpMB
         dw753EcPN5YzZKkuA82A0d6sji3tgpmpzlMbpU8Pxhz2bU+02GacGSOBR0IGINUadFje
         JjLN8gnyZ9uuxvzfscSbXeixYyHUiV6piJxTrEOz1k4ACnVEhJUhqkNG8jw47zc7hbg2
         G/ppIFvnqiXDjE3okXBxfFNDj3rTbKL1A1KNJn6FT/Ay3kFivGSSfhBtJny6yv6AAQQ3
         kQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728351728; x=1728956528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3H/OIpQ+NUwZNvJrAsNKijREzfomqrSjb5DeGZB3tnY=;
        b=VpLSfzhGwqaXdPgdZ9gHRryOGMLk1kZnkDkq0XfBEqJ/RPTe7jAS255/iNSBmZdvov
         enDMSjj3RR/pysY9UhP0LJh4GBQ88IgaTujiPoXG5TJSRo3trtbe8efFbj864ddlNTEa
         aiAYipS10Cqfo/Pt59tVojqGFSCca2a4absLYEuqTuikZRABxGC0DztX3FtN6EQZuofL
         ZOVbR2k5KDC7hRTbtEFF+BUy4uAqbVUK0GCIM2cL1XQLMZr9DeN67KMXyB5FHKOh6rK3
         7FSNBM6BPCJPZTeMwAOqiPvvfF+UFrX3F4uN90XMV5f0zL+GS43RiC/riR/n9wyiXnTl
         VxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCURwzBPCMkmNyi0N5Sbifo5NYFONrHcMlW2Oyg1ON3ODuYd0C7BgYdVaNwujP97z/jq6HT/ORTV2XU=@vger.kernel.org, AJvYcCVdK9AKzmbjZUfpFCUF0rmR/EWmCvNDFZME7Arl9V2lAp5d9F/ubVm8TnVQ1mmVYCAhIvMmjmW9PAPPdSET@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4SSA6DaK2ox5+4Zvjtw6hsocm1+1d92cY4VQmcwCS37fYUOjt
	qG30NZTmRGqn2imkRcLg39lZL+EPm7tSmcW4nFaHDGAsDZRN8XoPD3a+6GornFKErMQLSp0hRxl
	dCh6UhXD7w8yKWkgkYmN3iOv27G9rsAi1ag==
X-Google-Smtp-Source: AGHT+IESXKOjm7teMlCbIj1M/25GcmW+2f4Q9YHEecanjXzZqTD6GJYoaZIGvpw7qjrnyDsUtZR46qTpUxIRdJwfPL4=
X-Received: by 2002:a05:6512:2203:b0:539:92c7:e68c with SMTP id
 2adb3069b0e04-539ab9eb2c0mr5364182e87.58.1728351727316; Mon, 07 Oct 2024
 18:42:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <20241001062855.6928-5-kfting@nuvoton.com>
 <Zvv2Y10hJqGnUDvW@smile.fi.intel.com> <CACD3sJbJ0cNCRiBba73BOAkO=jn9KuJJXC1-Sy_iVf_8EJSjxA@mail.gmail.com>
 <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
In-Reply-To: <CACD3sJa23TEfBQ_b8PGM8ot2L0g4n=GcqvPk0HJGjRf-d+=-pg@mail.gmail.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 8 Oct 2024 09:41:55 +0800
Message-ID: <CACD3sJZxswUmNoSoGAAhfWUeVLDW=6xdpwVd3mQzwdjBommm5g@mail.gmail.com>
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

May I have your feedback on my reply about keeping the original patch
"bus->dest_addr =3D slave_addr << 1;"?

Thank you for your time.

Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=8810:29=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Andy:
>
> Thank you for your comments.
>
> After a second thought, I'll explain why slave_addr << 1 is given here.
>
> Tyrone Ting <warp5tw@gmail.com> =E6=96=BC 2024=E5=B9=B410=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:49=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > Hi Andy:
> >
> > Thank you for your comments and they'll be addressed.
> >
> > Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=
=B9=B410=E6=9C=881=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=889:17=E5=AF=
=AB=E9=81=93=EF=BC=9A
> > >
> > > On Tue, Oct 01, 2024 at 02:28:53PM +0800, Tyrone Ting wrote:
> > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > >
> > > > Store the client address earlier since it might get called in
> > > > the i2c_recover_bus() logic flow at the early stage of
> > > > npcm_i2c_master_xfer().
> > >
> > > ...
> > >
> > > > +     /*
> > > > +      * Previously, the address was stored w/o left-shift by one b=
it and
> > > > +      * with that shift in the following call to npcm_i2c_master_s=
tart_xmit().
> > > > +      *
> > > > +      * Since there are cases that the i2c_recover_bus() gets call=
ed at the
> > > > +      * early stage of npcm_i2c_master_xfer(), the address is stor=
ed with
> > > > +      * the shift and used in the i2c_recover_bus().
> > > > +      *
> > > > +      * The address is stored from bit 1 to bit 7 in the register =
for
> > > > +      * sending the i2c address later so it's left-shifted by 1 bi=
t.
> > > > +      */
> > > > +     bus->dest_addr =3D slave_addr << 1;
> > >
> > > I'm wondering if it's better to use i2c_8bit_addr_from_msg() here?
> > >
>
> The current implementation of i2c_8bit_addr_from_msg() (ref link:
> https://github.com/torvalds/linux/blob/master/include/linux/i2c.h#L947)
> is
> "return (msg->addr << 1) | (msg->flags & I2C_M_RD);" and it takes
> extra consideration about the read flag when retrieving the i2c
> address.
> IOW, if there is a read event, the i2c address contains a read
> indication (bit 0 of the i2c address is 1).
>
> The patch code "bus->dest_addr =3D slave_addr << 1;" might get used in
> i2c_recover_bus() later. (ref link:
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1691)
>
> Suppose there is a read event and the i2c address is 0x60.
>
> With i2c_8bit_addr_from_msg(), bus->dest_addr will be 0xc1.
> With the original patch, bus->dest_addr will be 0xc0.
>
> If some error condition occurs and it requires i2c_recover_bus() to
> recover the bus, according to the description at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1742,
> the address "0xc1" is used
> as a parameter to npcm_i2c_wr_byte() which is used to send the address
> in the write direction.
>
> If i2c_8bit_addr_from_msg() is applied, it might not fit the scenario
> described at
> https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm=
7xx.c#L1742,
> which is about to send
> an address in a write direction since the address from
> i2c_8bit_addr_from_msg() contains a read indication.
>
> > > --
> > > With Best Regards,
> > > Andy Shevchenko
> > >
> > >
> >
> > Have a nice day.
> >
> > Regards,
> > Tyrone
>
> Thank you.
>
> Regards,
> Tyrone

Thank you.

Regards,
Tyrone

