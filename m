Return-Path: <linux-i2c+bounces-4270-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C949136CF
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 00:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356961F2266D
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 22:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4825FB9C;
	Sat, 22 Jun 2024 22:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AEFER2rZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F155D524;
	Sat, 22 Jun 2024 22:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096832; cv=none; b=UwokrtcjB4+6xwVGi6GtbaUheLG+MZVTCZboXZ/deMkaRbi7KtuuT6UGZdb89uXkB27OrlhAO/d9nwob2bu2dxF+bAB6koaMc0aFn9uj6lq2QyU+SvXTrkWj1HgEwTDpvFIxU3nhsncMUytmpGS5WzWCAeirkSzmThWnRoOVUXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096832; c=relaxed/simple;
	bh=cOq8mO7E+QuGJAAGeHnapZie7NJGIDwH6RxdzUsOVEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R556ywA8s4ZvuT38e4e/TZabzycFHIYQ9Gdu0WwHaijfZaWxQlBi9lqz5LSB781Ezdn1Ti/Vw9VSF+Z0PhEfIA7ClpEQjAPqQff+3pQENV1HM9fpMyv4w5uIQmZlnyD6h7NZBHMhTlZBwqcZ7yHI5MsJc777E18jHQuQdQPfyE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEFER2rZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a724598cfe3so33065166b.1;
        Sat, 22 Jun 2024 15:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719096829; x=1719701629; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9ZounZ//goHyVCVfJ7WUDEuTLEJUqUCtI3ROtjC7TQ=;
        b=AEFER2rZOQ43TVnl3dPd/a5hfJPu3mXzFG3D1XArFxs0XOC7tQZD6BpFzGYXHZ9jQV
         KygT6bbBga51+d7rykE/JtCVY2TD5NyWUj3gSt6AiV8m8y9GvXVH/YJHFENqVipZYYxF
         BW8Y5YssflJJrXyoYrarImxZt1Oey6TCAP677goaJZdyuib1TmLlT/Ny4d7kjyaiX7SG
         GsOUquoRBJKeS9h/Fo78q2iYAT2Wyb9WdupyNznJ/dIyAcWLDKJmPPwxmQfI3nBNLMN9
         rLpZPgirfcowp8KM5x1Xq0k4PQfTqPpJTK0ZmOV22KwGhMwWA1Q1cZSVpfW7m4/Vocgi
         Mj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719096829; x=1719701629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9ZounZ//goHyVCVfJ7WUDEuTLEJUqUCtI3ROtjC7TQ=;
        b=KzeZdMJo5fDybx795G/mABAWAQ8Akioqlg87u4blch3YM3xT4jaRHA4f7rUurYpWSg
         63XChyQABoZ0YxHv6XxpqbDXqpcAeo4w8Zm/Uii7119/iDUDxFh7vUjP1OvXYXUc25Ta
         BxkGt9hwGVsnONZBUlrT2VSrDkOhkyyya2UAotakEjD1rBz6zQAMQgk6PooX0YLUUZYq
         RfFEC5Ntt7nvC1hCCwygnjAJzG+s78tqshjfhM5MFJmbW4Sap5dLK05HODkxeRH5qIyc
         Qtbn0E+o8nPVrjfVaS9d7AJnPlsIbcdkNaNuTb1lWBwx8rG5saN44kebtS9C3MVRULf2
         GkUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcLSyNPxKSpOtZ0pLzyOx0BDsaEaR2fWl2q7HWJS9VCMhzOIjE/vPNRqh9b7GNERl8IYtPkK9FGMSCe7yuIiLJCJrTfT9QQPoRP/DiRMnDtg8qQ0tq8UVaUlfQfZMM2PJ4wW2uTMt7CBeL/lCh7Q==
X-Gm-Message-State: AOJu0YzcQ03udIHuTv/WUS4g5DswMgTkc2D9Fk8K813N5OvQmzRogZHh
	VeGHTMOa10OA+DdMVI+U5fl/9/aFUNeCGIALEHRxdM68ThlKLjVN257kNvRdsHpMBb0UaH7MUPg
	C33mDdfOUoHOfCAoNgFn7gF851ZM=
X-Google-Smtp-Source: AGHT+IGo0CjDpzUpQHhJ6AUNkJILHXMrwcFbgSilt+fDLv4bsDzK/UsPJTAEdKQ2OOJ0xYn4VibjOgPhc25KZ9HTWcU=
X-Received: by 2002:a17:906:299b:b0:a6f:4e1f:e613 with SMTP id
 a640c23a62f3a-a7245be799dmr56694266b.37.1719096829141; Sat, 22 Jun 2024
 15:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621122503.10034-1-hdegoede@redhat.com> <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali> <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali> <20240622164349.fycelzxcd45j4g22@pali>
 <CAHp75VdVhiMN7TN-OwF=9ahv9W-2Yk+k=V5DvQGhTpUuR-b-xg@mail.gmail.com> <20240622225025.s7tbfb66pnhavqw2@pali>
In-Reply-To: <20240622225025.s7tbfb66pnhavqw2@pali>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 23 Jun 2024 00:53:12 +0200
Message-ID: <CAHp75Vc=7VtTLUEMoty6kjQxarH_b2mQ8KZk1ova40ZiiHOWKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>, 
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>, 
	Dell.Client.Kernel@dell.com, Kai Heng Feng <kai.heng.feng@canonical.com>, 
	platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 12:50=E2=80=AFAM Pali Roh=C3=A1r <pali@kernel.org> =
wrote:
> On Sunday 23 June 2024 00:43:17 Andy Shevchenko wrote:
> > On Sat, Jun 22, 2024 at 6:43=E2=80=AFPM Pali Roh=C3=A1r <pali@kernel.or=
g> wrote:
> > > On Saturday 22 June 2024 16:20:15 Pali Roh=C3=A1r wrote:

...

> > > Definition of the table can be simplified by defining a macro which
> > > expand to those verbose parts which are being repeating, without need=
 to
> > > introduce something "new". E.g.:
> > >
> > > #define DELL_LIS3LV02D_DMI_ENTRY(product_name, i2c_addr) \
> > >         { \
> > >                 .matches =3D {
> > >                         DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."), \
> > >                         DMI_MATCH(DMI_PRODUCT_NAME, product_name), \
> > >                 }, \
> > >                 .driver_data =3D (void *)(i2c_addr), \
> >
> > I'm not against this as we have a lot of different examples similar to
> > this (with maybe other types of ID tables). But what makes me worry is
> > the use of (void *) here. Shouldn't it be (const void *) so we exclude
> > the (potential) cases of dropping const qualifier?
>
> I do not know what is the best way here for casting short int to void*.
> For me it looks strange if such casting is needed. Anyway I think that
> in any case casting 16-bit short integer to const void* does not produce
> different result as casting to plain (non-const) void*. It is not about
> const qualifier but about integer-to-pointer cast, where is dropped
> everything to that integer type.

You missed the long-term issue with macros like this. If we ever go
away from an integer to a real pointer, it will be easier to make such
a mistake. using proper casting will prevent you from doing that.

>
> > >         }
> > >
> > > static const struct dmi_system_id smo8800_lis3lv02d_devices[] =3D {
> > >         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5250", 0x29),
> > >         DELL_LIS3LV02D_DMI_ENTRY("Latitude E5450", 0x29),
> > >         ...
> > >         { }
> > > };
> > >
> > > Any opinion about this?

--=20
With Best Regards,
Andy Shevchenko

