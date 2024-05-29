Return-Path: <linux-i2c+bounces-3707-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B11078D400F
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 23:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65B921F24024
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 21:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297F91C8FA3;
	Wed, 29 May 2024 21:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP/OPStH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0C15CD77
	for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 21:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717017001; cv=none; b=XMD4XuoHbKETHWBzYp28oWV248MwggzMwCORUdbDYPtXJOeEc2oBm6raSrUgHXidm62ruvFu0H/+V8wiTYzhIXxz5hK4HtqzbSppa1ZYOb2KiE4MJIYxYlPWPAs8mNEnBJn97x8UZOpwhkIRq1cllNokkcQhBE/qWoiRlgi4SJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717017001; c=relaxed/simple;
	bh=jAhFEYDFR+AceZBlF8ciVVyuJMGRJ8Df3iODl/3Ak0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RWOZC+pzmjOz0CadjHoJSoBc1/KXFOBMxm53RsxmQr0g01g/CcJKovXAB1l9u85PqeV6wWFgIs+05/vedEAg/Qhyp+io68lG2DPlE8U6oy63QRZk8nKdFuga5DpXARYNkao/nzA/ASQFg+F1uaszNHUp4ypbr8lINUJ/X2z0ccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lP/OPStH; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2bdd8968dabso126091a91.3
        for <linux-i2c@vger.kernel.org>; Wed, 29 May 2024 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717017000; x=1717621800; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqepwojQITdRaaNvzhd1MyPqkWDLdApUnBwQiHn7u18=;
        b=lP/OPStHBIjfMLraU8oDl6dRGHlkRW7gmmA8DHXOvOJHduSxNyNv/YAal8oDVmdWrI
         0rcvn+0wl9x7z8BBqqOHQO/ajTh4Qr2RZToEvWABOhbORkk/P774rdEHXvNKmW142hMR
         fVp8XX5/eTY3fbtwguNp193/kQSFyApBU0ewCVO59ZtNCGI3tWnZk0tH9upVa/hmvF9d
         iYCyLTDjGPLSewX3a42Dvpc7buZjZY2dmvTcQbPRcI7H//LsI6v7ksMy+ZOI6byqyOA8
         of3w5aTnlmetM6EDE/ndOiqT4vSe9naz84zqrfShe+WWuRou4GCzXFkNqTUsWr9BPAD2
         H2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717017000; x=1717621800;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqepwojQITdRaaNvzhd1MyPqkWDLdApUnBwQiHn7u18=;
        b=DVhGgqkX1Z0R0GXiOsNLFo+jLs8lxj9yWSPFG/TjxEM9HVjLA3hpsdToLP2o2Ae8yz
         RG1dt++qSjMKOl/+mpSqN9YRpjA4X9gdaaKMWUSSesMdqkT1emEXYPXHAJem9uEAqn6B
         dY9mtpzak3/JJZ6onfz2FbfSK9uTGtHfwdTkbZfoH2FEJQ1UDK8x45g0B/RYZ1RCIJ1r
         mpGTiySU46w7WIFv1igdROHssTGsY5v7rRx8eJfb4uTNwBI0DLWpWuUovYNcYCEIR+fS
         Eab6AvMVttbTABd+KFl/ELx1L2AkEv4Y39UvTSaI1iDwUnH7fZ1V5Ci0XP2mCzts7IRr
         kNHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdFhggIHVZnTCEqEZehEGLhckyVxrSmAVbp3gJoEuKKXmnLkUHZU33IqgKRrrr9NV0ZiFmrY0CholZT3Rn0uLA3rHZTut6T9Pw
X-Gm-Message-State: AOJu0YwzWUVege2nLY4ArwBcEVOXUcMUc7JTnduiixyaKKqYqDGIKR87
	l7YA36OXYOOaa+hsRG++bmTmNRzf3cB7ifRW0NzMToDH1wafCnuronjWPQ3vzJzz7YsGgMmwVya
	UYwVkbX46r+ekBgTlzDdlFYi+hGWnQA==
X-Google-Smtp-Source: AGHT+IHOKFjkG00OuD8+7WwytX76EoipH/o0vveYhjZ0hzvFBZD/IQvMKnTYW8sPKhx15D5KLNkijnY2miBwU2Jo+24=
X-Received: by 2002:a17:90a:dd41:b0:2be:d143:8d60 with SMTP id
 98e67ed59e1d1-2c1ab9fab4cmr291810a91.16.1717016999723; Wed, 29 May 2024
 14:09:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ed236ed6-0e6d-4243-8316-28485c9797c0@gmail.com>
 <CADnq5_O6YMr2EK3J+NnnfycLpq321PTwgt2-NNE0X82Jq+DC=A@mail.gmail.com> <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
In-Reply-To: <x7p5tf6tdgyflv4niimtvjc3hwovj72bo54a6dkmk3uxy4qvc6@2i2atfyfvgsv>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 May 2024 17:09:47 -0400
Message-ID: <CADnq5_M=sd_spEFnboWECMU2t4--y0XF-CcMAL8e_49Zt4dTig@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove deprecated I2C_CLASS_SPD support from
 newly added SMU_14_0_2
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Alex Deucher <alexdeucher@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Evan Quan <evan.quan@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>, 
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 2:47=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Alex,
>
> On Thu, May 09, 2024 at 01:15:32PM -0400, Alex Deucher wrote:
> > On Thu, May 9, 2024 at 8:02=E2=80=AFAM Heiner Kallweit <hkallweit1@gmai=
l.com> wrote:
> > >
> > > Support for I2C_CLASS_SPD  is currently being removed from the kernel=
.
> > > Only remaining step is to remove the definition of I2C_CLASS_SPD.
> > > Setting I2C_CLASS_SPD  in a driver is a no-op meanwhile, so remove it
> > > here.
> > >
> > > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> >
> > Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> > and applied.
>
> TLDR: can you ack this so I can apply it for -rc2?
>
> Reason: I2C_CLASS_SPD was scheduled to be removed for 5.10. For some
> reason, the newly introduced usage of I2C_CLASS_SPD in this driver went
> unnoticed in -next. I would really like to remove I2C_CLASS_SPD now
> before other users appear in the next cycle. In my experience, it is
> possible to send Linus such patches for early rcX. Like it fixes a "bug"
> when trying to handle a moving target.
>
> So, would that be possible that I push this upstream so I can ultimately
> remove I2C_CLASS_SPD without further dependencies? If you prefer to push
> it through your tree, can you send it to Linus soon?

Yes, I'll include the patch in my PR for this week.

Thanks,

Alex

