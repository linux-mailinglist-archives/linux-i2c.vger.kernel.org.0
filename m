Return-Path: <linux-i2c+bounces-8112-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6529D49D4
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 10:21:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 323681F2156F
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 09:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA711C9DC5;
	Thu, 21 Nov 2024 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0z8xZ9Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985D71CD3F;
	Thu, 21 Nov 2024 09:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180905; cv=none; b=b5IMOXeFcVYwHSEKDLMenkIom4s+2ZGTH4jy5RDj+eyrIUlebN75OWdpBUkgXnCUJIPUFg3KtqAaRURN/lKlrIkVeQT11RNqjzUhNaVAE+mz0TupYlxma0rHLCLKFvQjmA2fSPd87ZXta7blq6eXoGNteoQmZNV1wPNAv3n7Xas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180905; c=relaxed/simple;
	bh=TTORaKPCMM7itHbbeB4qFt/UdoTMPgdwSYRuHBR2iwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4OdJ2KAL9ktQmGCFhyL/qQguHkhGciZiTFVaEwE6ZEXTiBM2ToJmTS+88/ajcmWBZisFxDKwIo+ZITXTlsFCRrrWx62dKKR8hQCGK8UGmMJsfEAd0IizTVsYMrULUZOXlqYwn7HXwLDKozZeUapJLEIYFUwFMHZ3L49ANXsB0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0z8xZ9Q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9ed49edd41so122330766b.0;
        Thu, 21 Nov 2024 01:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732180902; x=1732785702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40p5hZwagywve/vODZdE9tqwRuvNJx0T8/82/xlk0co=;
        b=R0z8xZ9QVcEXhkv7pHzSFspxTw914FBHd9Ak7MrpSW7BRUinlawTWvPEp/uvGi2Yr5
         qNRL62PVPwqSbAutBZNDaBg/XRB755s2OXXlWYPA8ImxZarT7LHi4lVrJkBQTBRIBjXi
         US2ZvdRSvG5BHVilUzqNmO1YbhfXnpWVEXm638vcdhvJpv7/e+1iqmvD+HDVDBjBAB9h
         JsH/ZvT2Le6uNYrn2B4zceO8gG32Z1RacQIa6eUnz/UYaYdTdWID9IjTPbqspUMQaWCN
         eIDpCCAkAksv/oiiFrRD5l7eQ1WcJnQGZcdRXVGEW7KXIKv6s1xVybBhZQiqJfhReflN
         R18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732180902; x=1732785702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=40p5hZwagywve/vODZdE9tqwRuvNJx0T8/82/xlk0co=;
        b=aQ2SrbAPD7gX+OH+ouLQjh5+YPknv8GXKevJOpz4AcRyqnIGkHjqwg/TdDqSQiSd7o
         4LkVI5rnBNqj+7zsmrtaPTX9Q0o4ridAOgZ/wkZU7X3hFvo7Vw2a9gTqe6PLvioQ+uyk
         WV77Z8p3V1H52lifC6+SQ3NgyNSbONEgI36UUdkf/rRf7ar0ZSpVckETTDkka0CF9Ilu
         84qkQYaJNQoUfbZrjBDXhff0bxDSfU6Fk/eyaUj+HSsIglJQ/ZsEJSrHHM4lH3I8pA9f
         fpui6Bpp1a4A7Y5wuNU+aIBbNSuoSGlUAawIUeUjRubCRjNzrxiV3RILR6RwsN8DRVXl
         reXA==
X-Forwarded-Encrypted: i=1; AJvYcCVClIFrJmCbqmb7e4CyRlVP2FMFdx+8inUj0UhRbaj+Heeh/EGdYINPYRemJXo5UaO8+3LcioaEPFhmGtAR@vger.kernel.org, AJvYcCX3619ErA4eBIl5rNoJAdO/irTyEeHiwXWfRWPggJ9lRq6Os0jUdd5pBS3+RYxe8Jx6gOYCNaMjibY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHZkR9nNZz0Q2hmVj5Kefxify3d5zBFs5AkmNUJ6n7usg0dDW+
	QyXKUfm2+yVTJ6dXbv1MsM/Hjz9YfvUobjM/7ySmtTML07Xcndh41e9t5Iw+DRwF7zZD9pGhHBA
	04zLsx9D9506Zi+Ag4FNlF8TyFA==
X-Gm-Gg: ASbGnctutqJPuvWfh/s37Wav1i2NARjL5VqBGAKRmRsC6BWK6wUWF1CSBkiv4klQeJi
	fu4f+4HD9TEZHsiKK1wqkqPkdtIlxYR9uBg3gvt6NyB2gZrJRfy0WL2mhiYY8fyI=
X-Google-Smtp-Source: AGHT+IEhhFYGbTWv93AYlUkb+CCJ06skd59FfhS7MPLQWq2oHkHNO7ox+gkDwJLv2wvHkCT66jGcvxU3sqR96ik8vJ8=
X-Received: by 2002:a17:907:da7:b0:a9e:8574:e154 with SMTP id
 a640c23a62f3a-aa4dd749ec1mr588963266b.59.1732180901738; Thu, 21 Nov 2024
 01:21:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021062732.5592-1-kfting@nuvoton.com> <20241021062732.5592-3-kfting@nuvoton.com>
 <kzsvr3jepoqjahn7n2jch5vrqim5eknylrasvsbjugfhzny46o@bemfk6knfmxi>
 <CACD3sJbWKkBtyq-gnicASJvRnz_nGjVAyVgnreNV7RS+MLOWJw@mail.gmail.com> <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
In-Reply-To: <cexpymszobfl7676acibp474eq3qx242ppo22wrbjepxhufkvt@w4ptnmfjx7yo>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 21 Nov 2024 17:21:30 +0800
Message-ID: <CACD3sJZ3B93-bb9e=cmyd3awS2JteE1xRsf_-zokttg=Ykef9g@mail.gmail.com>
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

Thank you for your reply.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B411=E6=9C=8820=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=886:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> Sorry for the late reply!
>
> ...
>
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
>
> What I mean is that slave_addr now is completely unused. We
> declare it, we initialize it to msg0->addr and it stays like
> this.
>
> What I'm suggesting is to remove it completely.
>

Sorry that I might not describe it clearly in previous discussion
thread. slave_addr is passed to npcm_i2c_master_start_xmit() as
https://github.com/torvalds/linux/blob/master/drivers/i2c/busses/i2c-npcm7x=
x.c#L2182
suggests. If slave_addr is removed, may I use "(bus->dest_addr &=3D
~I2C_M_RD)" to replace the slave_addr parameter to
npcm_i2c_master_start_xmit()?

> Andi

Thank you.

Regards,
Tyrone

