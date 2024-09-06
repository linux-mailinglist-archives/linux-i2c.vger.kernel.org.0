Return-Path: <linux-i2c+bounces-6288-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150096E7AB
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 04:24:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 767D81F233C6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 02:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF481E49E;
	Fri,  6 Sep 2024 02:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9vCtbEI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66001CA94;
	Fri,  6 Sep 2024 02:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589436; cv=none; b=Mdoint0SEnl/Rodr9P1E4FmjTCFOUJK64SS7G1wHGI8fU0ef03W9T0qKyKznpl+OOW3d6u/pxJjJIohss1VfW67oC/bRvDGYiliYqFDF+xPf3swacXyOKjVvqiY4aM2736MzAkTbWhQ0lonZZrifjGmDk2++3aOy48+fsGwo0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589436; c=relaxed/simple;
	bh=balkUZ1IThXIJZ7vSY07jJGRq5PO/60pht3MaUzs9GE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpwFRi7lOaIQMpfrujrLYRX0kIrG64EoFjDyDCRHrVDJC6wvKXrDK62bTUzvRpIi9eAmCZ7C/81V0yFzJRug6Pn50t/eXPqWJB73CMfMiPMu0gkSdfBMFLEE71Mca/1xZWoOT86zcYDqtW2Ym7HwFPGxp2Cfpwk78jhEoCM18Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9vCtbEI; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a86859e2fc0so203012966b.3;
        Thu, 05 Sep 2024 19:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725589433; x=1726194233; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLb7K/Z46+wQFZAmVlcCZBJn2OoyK6hgoxj9ExHMDJ4=;
        b=g9vCtbEIKEWFmLLscQw+BjP882Zp8uRoGCpoIRh5UD93q0LFQcUecBTaisz/BxH/ql
         7qztPiHQCHrkIvCn5vPuxg9lOsUtR32aEBqEHPoALqaW0O9QIFGMP+mJ62ky6usPdE9+
         taUzyVB0or4X+jVS+HQC8kHNFD/+kt+RNrM9eIWswbi7AeNjR6leX85DbU2ZMQ+7VYAu
         RCb96bdBatTBDaOn/Me4vpNKMPuujrIRp1NVJOx1c79uYdULBWwf4WPaddvCUlmBYZx2
         MWER9eXT349A4pXMot5X3YoDhqGbZAJh0AehQiBLRyl4k07vIfW66sdDAu2Y8r2rfrVl
         /a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589433; x=1726194233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLb7K/Z46+wQFZAmVlcCZBJn2OoyK6hgoxj9ExHMDJ4=;
        b=jADPxWtlgKSrHFN/9s9FrYSTRhXI9R3e6LS3cs+xMSiiqImeVxK2XlDmVS9oj+XgSC
         Wke8Rux0ogvj4VZnGDNHXJ8VcFKRoVc6dzEGSUhVdNGbXZnYrwg3gItO0kpQevQF4O6j
         FezsD6BpPwP0T+fJgvs3IZ7OE4vHms6PZ03RuFPnzGpSkI7yq3xdpSeHgWnEYZdu7bXU
         k2/LYCMgyhuPClsuF/982vCzUvuijDGK5A1X3BXzDVuJimQFym4w1ffiNg+cAZlHXuUk
         4h98hVt0KdVc2ybcKu1uel+leYId5XzGea/KRgY67Kknbzc7jtp7W8W2qzvZgdKuRoI9
         +hxA==
X-Forwarded-Encrypted: i=1; AJvYcCUShgtNKE0p7tAFV3H7bAwM0q3+3knSsDSXzYPikw9PuKlM/hn8ymygJDf8UvAjkwMB/wtCxerz1CCqF2WT@vger.kernel.org, AJvYcCUiW9Tkot4faHc6UtPbgQ0As2h481vaxlydsPzOLrh2NrAM3INGeAtqwYrwf9E2I/RVg9C84D2m1Cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRNUo5sGL4Oot105MpgnxRad70l5O119bt2xsOmWcjQlUAUUTS
	+9kf5r29nwkJXd9BebRYcD3Whw+MOtFsg+6ZZw6KhVeMtBOdexmNkLFKSxX7I9tJ+JLFFqQ7EhB
	UraLNFyS7HnAxjs/cmNoW4pds5Q==
X-Google-Smtp-Source: AGHT+IEz4qumqBA7rHtuJUKgviy7OhOPrHFCtAJGL+HmLaYfeAbK7PKJnnT4HA4aSriqVYckU6uLGuQmRga35ZLkKAM=
X-Received: by 2002:a17:906:478d:b0:a86:af28:fc2b with SMTP id
 a640c23a62f3a-a8a888ec65fmr86820066b.54.1725589432384; Thu, 05 Sep 2024
 19:23:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
In-Reply-To: <o4vds7grtpvgn34afke5vbkb5ymqqglvudi2hdb4oekz52ujs6@ymuhslhr5oh7>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 10:23:40 +0800
Message-ID: <CACD3sJbAYwiXrapgBDrtwNfVLr-109zExMrktunui6HKxtO-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
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
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:24=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
>
> please remember that the "slave" term has been replaced by the
> "target" term. I will change it when applying the patch.
>

Thank you for your reminder. I'll change the term ever since.

> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
>
> I don't think the Fixes tag is necessary here. This change is
> primarily addressing a static analyzer warning. While some cases
> come close to a buffer overflow, it couldn=E2=80=99t have occurred in
> practice since we don't actually have the devices listed in
> npcm_i2caddr[].
>

Understood. I'll remove the Fixes tag.

> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > ---
> >  drivers/i2c/busses/i2c-npcm7xx.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-=
npcm7xx.c
> > index 2fe68615942e..bbcb4d6668ce 100644
> > --- a/drivers/i2c/busses/i2c-npcm7xx.c
> > +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> > @@ -136,11 +136,13 @@ enum i2c_addr {
> >   * Since the addr regs are sprinkled all over the address space,
> >   * use this array to get the address or each register.
> >   */
> > -#define I2C_NUM_OWN_ADDR 2
> > +#define I2C_NUM_OWN_ADDR 10
> >  #define I2C_NUM_OWN_ADDR_SUPPORTED 2
> >
> >  static const int npcm_i2caddr[I2C_NUM_OWN_ADDR] =3D {
> > -     NPCM_I2CADDR1, NPCM_I2CADDR2,
> > +     NPCM_I2CADDR1, NPCM_I2CADDR2, NPCM_I2CADDR3, NPCM_I2CADDR4,
> > +     NPCM_I2CADDR5, NPCM_I2CADDR6, NPCM_I2CADDR7, NPCM_I2CADDR8,
> > +     NPCM_I2CADDR9, NPCM_I2CADDR10,
>
> Looks a bit hacky, but serves the purpose.
>
> The core issue in "npcm_i2c_slave_enable()" is the lack of an
> upper boundary check, which could potentially lead to a buffer
> overflow. In practice, we rely on the assumption that these
> addresses don=E2=80=99t exist in the real world.
>
> An easier fix could have been:
>
> @@ -629,7 +629,7 @@ static int npcm_i2c_slave_enable(struct npcm_i2c *bus=
, enum i2c_addr addr_type,
>         if (addr_type > I2C_SLAVE_ADDR2 && addr_type <=3D I2C_SLAVE_ADDR1=
0)
>                 dev_err(bus->dev, "try to enable more than 2 SA not suppo=
rted\n");
>
> -       if (addr_type >=3D I2C_ARP_ADDR)
> +       if (addr_type > I2C_SLAVE_ADDR2)
>                 return -EFAULT;
>
>         /* Set and enable the address */
>
> But yours is a bit more robust, so that I'm going to take this
> patch.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
>
> Thanks,
> Andi
>
> >  };
> >  #endif
> >
> > --
> > 2.34.1
> >

Thank you.

Regards,
Tyrone

