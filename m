Return-Path: <linux-i2c+bounces-6377-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC89D970B83
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0D1C1C2183B
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997531097B;
	Mon,  9 Sep 2024 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PC08iqdI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE69D33EA;
	Mon,  9 Sep 2024 01:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725846563; cv=none; b=dJ1NCg3SbqghgIHcahyYmMyAjxe16Ytb7E/PiYu6xaKAr9V9FGHRMtzxwaxj6LeR1ZvaHBBCZwciBFKk8zGvdKCSrxmOLGYZD8nCVq22MLcdVgOmxq1B00skBFH/GTQER9VtfHCKTtU8HqdhbP98zkYCfDwXY4z8vGUyhcLp038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725846563; c=relaxed/simple;
	bh=duWcWw9zSxLNXe8mIztxGy/8L0kO03ud5NljwS1l3fE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cMxkgyPv5QhZZcNNmKY8G7iI3KmiSBwnnJLQg3L+4ZaJbpXCKcujRNGlJpBuetcjGNQTpOvHeBVBEj55m28afjJN0L1D5UtP1/CXU+CitPs8D39P6U7rlTReFq30YxlbFrj69aMlaF3SqwuSIb8bYOJFK/Uv5/EkISTo9gnk0yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PC08iqdI; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5365a9574b6so3341726e87.1;
        Sun, 08 Sep 2024 18:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725846560; x=1726451360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DBLxzOHYDxcsNwOMRYkWi8QMRo95NS/vm6yH32jIt0=;
        b=PC08iqdIG32tlx4nBCnbJ/xXNCNq3AlZA6YzL1cO3sGnmjN2eZ5okbm9DIlHJ0gy+F
         Lo5sp0SAKsmXwyYAXELwvVBXoLTwvXcGgTD5rg+v9ccb5SUvJ1bd8XXKUC7FTgPsXEvo
         3AkPzRAcgg1DPFs02FX2NYTKrP8p+d3ocMfytrXV2FSw2Ct4qyABlbia0k7MEim+zwDl
         kofMb2P1HCksGN079aWHz0MLJzkoA7bPbFrmvrc/+8KmuFNCmR1Abss+sRugcHtFHmh+
         Y2bZq0D26l6OD82cf6V5Be8Ocors/PKCVryrVqvCyg1h45aKtRMUGE9KCgx4ariq5fvH
         bXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725846560; x=1726451360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DBLxzOHYDxcsNwOMRYkWi8QMRo95NS/vm6yH32jIt0=;
        b=ukw8q9MvSJ0CcuxwYyokMAIZZ5gZSRuibeXCMUfFpEeBC/+SfMQ3tINA9xM+D5wlQ+
         zVCeI4/GoYVF270HAImHcH74y3vyqHtqcyk9oFA65OMfPrv15PrgAH0Lc1kwU0fqQkmA
         GwOtwTG4hE83FxPiObIrGPBK/0Jb2iBll2xmAz6cUJANe8oc0dyVLAoIBsucO9wYXvkq
         w/HC9LXqx3bino39ZPXM7rz9nvb8hWOOciWbZBglZvzDUVkHy8eYqn/E4Wx5j+g9hBnS
         c56cowEb7tsGhTrr0UnumQgkpSvsvxlQq2OqBTqScfRf9MRasTtXPICvR4SmjNFRUpat
         UdcA==
X-Forwarded-Encrypted: i=1; AJvYcCVj+ECHCAtY3Djt1JyuobqRFgRA+MN63ZDqUIcXsmRA9dcs77x/mVTffBPUrT0gmLJi+J+uTMqiZyfnHYep@vger.kernel.org, AJvYcCXUKH1A7yB+k5L7R0s2lS3f3PWJDE/uCrC/2HQ3lX9GxbfEjsARv9RcsayFp7iEP5QENKeYSJhfMRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPpNfa9213dMxWPkabS3hKzmMURpBGUbKFeul68ZMf3BTB3oU2
	22Pa3N4ghCioEYz//Czj3d3MIzD2TTaOibLPf8F7pz6QC95ZcC9ElRijn25NNwax6z802T9mfkD
	AjjF7QNut4y/egOYmYBWPlNhHYQ==
X-Google-Smtp-Source: AGHT+IGUTBnBdo2MDFMCXRuCZfg+3U+TmHQMD8jAWdwAxp47hlreehyNTYkpqoeZqRiHMOumze1d0UCgGCpscB41k/4=
X-Received: by 2002:a05:6512:3983:b0:533:71f:3a3d with SMTP id
 2adb3069b0e04-536587ae7a3mr8414317e87.24.1725846558780; Sun, 08 Sep 2024
 18:49:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-3-kfting@nuvoton.com>
 <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
In-Reply-To: <cfdfldh5tuhb4r5pdpgolcr2roeewsobedet2uvmpbnqlw5yh4@c4a2szsbs2r2>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 9 Sep 2024 09:49:06 +0800
Message-ID: <CACD3sJYfpo+kTFCYdEnwk=GuHUa7y8SHFUFg_Knx5bnrkdKvUw@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] i2c: npcm: correct the read/write operation procedure
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

Thank you for your review.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:29=E5=AF=AB=E9=81=93=EF=BC=9A
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
Understood. I'll remove the Fixes tag in the next patch set.

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

Thank you.

Regards,
Tyrone

