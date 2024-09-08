Return-Path: <linux-i2c+bounces-6354-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A819706A3
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 12:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3A5B281FAC
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 10:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC0B150984;
	Sun,  8 Sep 2024 10:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ham38r2j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DAE1DDC9;
	Sun,  8 Sep 2024 10:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725791964; cv=none; b=nlwOFQgn/R/TxWouwND9S9YdwG7PZICTuMoEL+iljvaMXrJuYHUB8V/qAfqBlikEz5jA2B1Kbgr4v3agkkYZ6tAg7VvKW4NRJIfBmpxApA92sNdQ1wDIIKAWRW/f742Oog+mTpk49/PSF7PSm8jqn3n2K7hforq/lQmK9+11W0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725791964; c=relaxed/simple;
	bh=WIpuUnXJlsMs+zuwt8sFWY0A+PiiPlSaPMHytO9GMuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSeGPkG5f1/2t+WNP2UTAYDy2AMZMBr7aVbvGtfgZXhR99s9fbPHapt2e12rTXTIHBPjv7lZl2ScJM6G+S2h/6q6u6dRE4ImEb4DIMHuoK2yWx2BbNh9EgX7px8dNq++g+eKdiy9PL/cL+N5adJRXZbE84ckU4dvugccuIXZmz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ham38r2j; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f7528f4658so21759331fa.3;
        Sun, 08 Sep 2024 03:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725791961; x=1726396761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBlzT4DhXGVmK0DDC40shs2P1XOGabvgOZdRTDdJKzA=;
        b=ham38r2joHdgz5KhAYwEb7f39eqXtWecLZ+CbHPhx5fjQnGMSrYOXB/0Hv4jilepn9
         TNMkctruQ4ZxJSafCJNR8KTGlutc+rQfR/5hxQhsJJqKN1wXTRq7VxPNIMM1AjsK8pA1
         QNpUc6uVstIismfEUDXeQHUziSFUxr/Lo1W03OLf8Y2RbVIluXJyTNN5Nvlnk3UDRFwZ
         pSz1OaV8Pscz2K6DtNPpFfiwwBrbWzFjhqVwQIOBy/5dFTpQ7JHL3uJu1sj7eUEQPvhY
         IGK3a4O/LGIGPW94BZhNiFAboBq6ALRK25vF3KmKwcSzO+B4LU9l2DPBmUejhHs+i/e3
         24sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725791961; x=1726396761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBlzT4DhXGVmK0DDC40shs2P1XOGabvgOZdRTDdJKzA=;
        b=ICFpHY33N/34G8kU4QqFFP0Z52EQSBt+wyFROoGHWiAjqVb2xuMzpfI+8TccGbEpom
         C9atUra7IF8cmuZx5boo1XSPfCFPJAQBz4OPpcBvIu2NFRdfXvbL8pTt5jBcot85kQXE
         0IekzcVxXU2djFazDWhCcGUHophXBA/65abrDfVwHKy3Wr+82B1uXTvDh7iZ5GpN1Eal
         dlbbxbqjVuy8JH+NSU2Qpk6Mry1eyeWbdl+51CTCBqRwiPr0ArqJiOi09nLJqI9lzOUM
         PAxJv5BXi0c/fesXDK+IAMu5GHNDxe/WhCbqgcZzt9H5PjrMXp+GzOD2XgmY++ReOu/x
         BIXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAnB8KOPyGE8Qj/tNfAqZnGTlpf3EQBeJRlVuhD3LV90nCce5YWxVmgi3StzzQGbgVGk2mvZ7XSUg=@vger.kernel.org, AJvYcCVH+5mHbX5PoatZ92I04xrt+2a8wmMJl5ZgeGo4c7dgUrgLqKX6KbbwNyP44MUFGCwU8CldBmNcaYgC5Oqv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRzr5Zu3nu8GB3nRSyr6k+CNJcNYsgMoAYw6H5QZBI43NH6Nu
	YCXN5JQTsOS6634ECPL6yQrmPgmxo2nJ7DNAMrOIzk9HT8CiCTP8D647126ZaL3FQncrzTOl9K8
	/461YMMjx1OjYwd7ihcZc4++/wi4=
X-Google-Smtp-Source: AGHT+IF8YSDnTUVBg5gTulU8iOWZhp8+Web6nIHMCIZHXU6A4YxtGVVmAIDqAaz7dyJzivALraGk1Qt4N0/Zujzb45E=
X-Received: by 2002:a05:651c:2127:b0:2f6:43fd:f870 with SMTP id
 38308e7fff4ca-2f751f69865mr54977021fa.31.1725791959684; Sun, 08 Sep 2024
 03:39:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-3-kfting@nuvoton.com>
 <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
In-Reply-To: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
From: Tali Perry <tali.perry1@gmail.com>
Date: Sun, 8 Sep 2024 13:39:08 +0300
Message-ID: <CAHb3i=sHzF8p572SBMvfCVQmo+7VcYbOYuqUU-H2sEiTkfWD7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Tyrone Ting <warp5tw@gmail.com>, avifishman70@gmail.com, tmaimon77@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Fri, Sep 6, 2024 at 12:29=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> =
wrote:
>
> Hi Tyronne,
>
> On Fri, Aug 30, 2024 at 11:46:35AM GMT, Tyrone Ting wrote:
> > Originally the driver uses the XMIT bit in SMBnST register to decide
> > the upcoming i2c transaction. If XMIT bit is 1, then it will be an i2c
> > write operation. If it's 0, then a read operation will be executed.
> >
> > After checking the datasheet, the XMIT bit is valid when the i2c module
> > is acting in a slave role. Use the software status to control the i2c
> > transaction flow instead when the i2c module is acting in a master role=
.
> >
> > Fixes: 48acf8292280 ("i2c: Remove redundant comparison in npcm_i2c_reg_=
slave")
>
> Fixes needs to be used if you are fixing a bug (crash,
> device malfunction, etc.). If you want to use it, please describe
> the bug you are fixing. Otherwise, please, remove it.
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 7 ++-----
> >  1 file changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index bbcb4d6668ce..2b76dbfba438 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -1628,13 +1628,10 @@ static void npcm_i2c_irq_handle_sda(struct npcm=
_i2c *bus, u8 i2cst)
> >                       npcm_i2c_wr_byte(bus, bus->dest_addr | BIT(0));
> >       /* SDA interrupt, after start\restart */
> >       } else {
> > -             if (NPCM_I2CST_XMIT & i2cst) {
> > -                     bus->operation =3D I2C_WRITE_OPER;
> > +             if (bus->operation =3D=3D I2C_WRITE_OPER)
> >                       npcm_i2c_irq_master_handler_write(bus);
> > -             } else {
> > -                     bus->operation =3D I2C_READ_OPER;
> > +             else if (bus->operation =3D=3D I2C_READ_OPER)
> >                       npcm_i2c_irq_master_handler_read(bus);
>
> mmmhhh... you are changing the logic here and you are not
> describing the logic change in the commit log.
>
> Without looking at the details, if this is a state machine you
> are breaking it.
>
> Can anyone from the ARM/NUVOTON NPCM supporters and reviewers
> take a look at this patch?
>

Indeed, the driver can use both the register bits or the state machine
to determine the current state of the bus.
In slave mode the XMIT bit can simply be used directly to set the state.
XMIT bit can be used as indication to the current state of the state
machine during slave operation.
(meaning XMIT =3D 1 during writing and XMIT =3D 0 during reading).
In master operation XMIT is valid only if there are no bus errors.
For example: in a multi master where the same module is switching from
master to slave at runtime, and there are collisions,
the XMIT bit cannot be trusted.
However the maser already "knows" what the bus state is, so this bit
is not needed and the driver can just track
what it is currently doing.




> Thanks,
> Andi
>
> > -             }
> >       }
> >  }
> >
> > --
> > 2.34.1
> >

