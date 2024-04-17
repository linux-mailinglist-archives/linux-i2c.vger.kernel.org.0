Return-Path: <linux-i2c+bounces-2995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E78A80E3
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 12:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3873D1F21922
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 10:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B244A13BC25;
	Wed, 17 Apr 2024 10:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAGYoiIE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C054524D4;
	Wed, 17 Apr 2024 10:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713349655; cv=none; b=BunmFg78mYDXd4yOD2xYcn/04vcqKi/26SFPP5yyacguJEJciTUKho3O89C2nZTxSiQKN/Df5ZQza7RU5m0/U/K59Prg5DmbeHE0QhMR6S/pSmvJDI/2b3RZ3kxXQrJBYmfnvojuFNpEyiWCZawAUS8T7sPKOuDJ2dmNk/boO10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713349655; c=relaxed/simple;
	bh=vnUSC3ka5WUT55VpIJLLrYkNKkOcwEz4k5OySNJXGy0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sxf0nm3FinA6IjyovuZJPWygd9W+myfZ0RFplyNLUK0LKK5FoTu3C2qHT1QqsNrzvsjg8OTCSlJqQTYK6CQGswj/blJVTBlXFlb0rJ1VXL6eBzjQAa2DSX4Ynlio6BVQpqyPJId6c7Ahs6Bez6VZ0zWbg79u5hKxDiZSFiCrXCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAGYoiIE; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-36a0f64f5e0so24207625ab.3;
        Wed, 17 Apr 2024 03:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713349653; x=1713954453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9gODHhkiI2CMWa+I56PxuMxVlL6SJvFm8HZn6FZFsA=;
        b=YAGYoiIEtoiE6BP+uxIT8bV+yZbfuIKVukNEPEAplcZ37cAPOePXaWek4+pI7A+pPm
         eVtop5ZHAu45UW+eQ5dHDhMFL4G42ufq7bjpFwLmkXGb57HRWqy28xKD1ovZrMPpisrD
         nQJiOmmln22roNL7vthk4bZnHzW//gp7r8aGZLIQHEPAuSdzW27Dd1LBukcd9L1acbJs
         HGQywg8q1gWxqBVnJfu6pJmV7LqPDmvZV8tfCSZAQtg2xcH1NwZ5GWO9DemKdlvZcnwM
         7tS8vselefk8r4APYphmLHsT5GCksBKaf4r7AJQgxNSn0wi6nKInf/1W9fGPieuNLpmv
         wvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713349653; x=1713954453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9gODHhkiI2CMWa+I56PxuMxVlL6SJvFm8HZn6FZFsA=;
        b=q3HCbqq8kG7/VQzFLz84HOZIMFLv6r5nsyQk5vkvO2vxa0ljU4ADzKtLPMiRwozop5
         4of792p+hOHPWuFeLvoC1A60i+egjDJ8pwkwe3yti2ut68MP0Qvt11XI2VVbTRZusjeI
         +zCUj2cKR26buPvWuFXVYR17Bo/4pGpfHw0z61b2PWxl2AbbmQ/uWJdN6o3SJRc7lvz2
         /HAoqbLgY/N/8avY7Cn2FaTYv/646/HMnvkM1tt8z6tcmRx7Z2BxJdG5QsDKpaZwz1CZ
         Lg3UvP05Ztbxco5Geu4g77g3QcOKGKyfGTtMuD4V323gyIm8ai4C3TRUodUDx7w2pVL4
         54nw==
X-Forwarded-Encrypted: i=1; AJvYcCXeMY60bV/YmHVrc3zBDvYcL59BC7FqybSDnFRbSyK8xKpdCe0ln59NAinEv8CtPKfPagE0zyXOsKhLOUGXVH5wBZY+EqzRLVqDcgcHiN79lXR98BjcSs5yM0Icdujfe8ejs5Eynrw=
X-Gm-Message-State: AOJu0YwAY4gho6kyZUabx6muaGSdo3Zcvqr6VPIFydi98SzmtWAjPtxI
	nP3e25/mT0HokQg40HDWnbr6TsvbpESU24vAXvGx95Z1U8clMlx6DFFwq8r0hLjX1FNM27SCQh6
	0y0lQkqSiMGHoUJYeHV+MG7jRlB273g==
X-Google-Smtp-Source: AGHT+IFgzwjvQnZs4p5NtYFWor13r5iWiFIVuA5+WV6YqXPf0kzObvueqveKqgPQ7Uh+OBTiTMD/ZXNd4+1D53OnGp0=
X-Received: by 2002:a05:6e02:1fe8:b0:36a:3515:b82d with SMTP id
 dt8-20020a056e021fe800b0036a3515b82dmr19621800ilb.13.1713349653153; Wed, 17
 Apr 2024 03:27:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
 <951819eb-aa65-4e39-a60e-62886759e524@gmail.com> <7qmjriqdfhbi6mkegcxu3cfpi4j4mw3qynz3byujgg2uzl2lrh@5amydhvwcytj>
In-Reply-To: <7qmjriqdfhbi6mkegcxu3cfpi4j4mw3qynz3byujgg2uzl2lrh@5amydhvwcytj>
From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed, 17 Apr 2024 12:27:22 +0200
Message-ID: <CAFSsGVvnESmed5oGNAJoLv7rxj61QJEn6WvkdLVyhNi-sen-RQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] i2c: Remove I2C_CLASS_SPD
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Wolfram Sang <wsa@the-dreams.de>, 
	Peter Korsgaard <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>, 
	Guenter Roeck <linux@roeck-us.net>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 10:05=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Heiner and Guenter,
>
> On Mon, Apr 15, 2024 at 10:50:27PM +0200, Heiner Kallweit wrote:
> > Remove this class after all users have been gone.
> >
> > Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> > ---
> >  include/linux/i2c.h | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> > index 5e6cd43a6..970953737 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -852,7 +852,6 @@ static inline void i2c_mark_adapter_resumed(struct =
i2c_adapter *adap)
> >
> >  /* i2c adapter classes (bitmask) */
> >  #define I2C_CLASS_HWMON              (1<<0)  /* lm_sensors, ... */
> > -#define I2C_CLASS_SPD                (1<<7)  /* Memory modules */
>
> I missed the fact that we need some synchronization, as I'm
> getting a build failure.
>
> I will revert this and apply it after Guenter has merged his part
> into the mainline.
>
In order to cope with this dependency I proposed in the cover letter
to handle the full series via i2c tree. With Guenter's Ab for the
hwmon patch. Maybe this can still be done as an alternative.
Whatever is easier for both of you.

> Guenter, if you have a spare Post-it, could you please note to CC
> me when this part is sent as a pull request?
>
> Andi
>
> >  /* Warn users that the adapter doesn't support classes anymore */
> >  #define I2C_CLASS_DEPRECATED (1<<8)
> >
> > --
> > 2.44.0
> >
> >

