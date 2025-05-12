Return-Path: <linux-i2c+bounces-10931-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0FCAB322B
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 10:49:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B1D4189BB51
	for <lists+linux-i2c@lfdr.de>; Mon, 12 May 2025 08:49:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E83925A32E;
	Mon, 12 May 2025 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LwTjYDGN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E86E2586F6;
	Mon, 12 May 2025 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039738; cv=none; b=GF6FYdsnJTTP744gq0vzxlw2j3hTeNJesDxbLrNPzmECbJZ30MfmfUPh7XJrf3tfGba9zmiMvVQTGCYGCX1Xn1KzHtIH0CvOkRubo1N8Ak+mlsjoDJRb5vhkf1jzsBVy4S28mxI4wL3lcb/98PvB2+Ovmr+svqDifDKgQXdL3/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039738; c=relaxed/simple;
	bh=lkeydaDQhOVDY2emwYy+Nki7xldXDJATMBo1Zd76lPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ly1wmnxeIUDTpsGWNtN5zsy7CFCZ9jn2mlpp2DeJfensLK1Nu4XyhmW2yU2ahBbAELaJBihhpsZbvEeTz+jeesWDdh2jJMO3crEx8wYBbp0yMHk8ckXeV3Yp4/1pffs2gXdAKIvonx1Jh9cs1d3KAK3oEGzhPn7Q/OlIlDT6bm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LwTjYDGN; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70a32708b4eso27069697b3.3;
        Mon, 12 May 2025 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747039735; x=1747644535; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9owvXXSS3Z25bfsyDSETQw2QiBL7MzvlYy/z9dIazY=;
        b=LwTjYDGNs5Zj1xpkWAVZN3g9T2Evpqz2frfre58jqvBS52v0rUPniF265feswYzVao
         H/Nbf1C20qCZfcoT8oZF3C+ibAkjZ8cZuqcnPYFrN8phxTTGh6Nj2Yrpv4QS7YrXfi6v
         zW40fjjqp2ImujZz9zgSnufEnRyV8kV7QpTKhDbOC2vy/qgZXygsi5NtfISj8jgIjlLf
         E5zRN4IIZ+wNhzqlSNnSwAr/9b0JWGpy8QXYNZp7cOQhVPvInlBEfhylZRu5c1Aw5/un
         9LnnYOmZ+GxWjsMgasWYGaLgAdIdcQruzc4eg1At6EIQtvcPHeMLwFUwjePDvzv/Rtay
         HanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039735; x=1747644535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9owvXXSS3Z25bfsyDSETQw2QiBL7MzvlYy/z9dIazY=;
        b=uclt0JgnM9udzS4iLh5BVyqcP1e4jd6jawUwQQzVUU489xf8grc/K3dVoHbmkSBbyr
         Mfr9jdZgtgpb0Trv3QQWqA8VwVZnr48zVEyS6VYpsq3sujkfo9oNN+Um0ZudoAZzSEMd
         G3anvfa3mgPb933mOrhsY2RnOkgDdH5m0jU4PNymAO+YDVyTjxdrfvzC1iBqBdTT90br
         lJY8b0pE0GM73PPGOARqY2i2kyq/ICJLJ/Ogw6Bb4bukXDJmAvzYNNfBUgATlPtiAEbN
         O7bh0fah8Xa6M9YnsPqvmP4o4Pqo2usmY4pqopIk2RJFehsh+qRs12RNUcjXL6TcNZvI
         uGmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJPHXnPfT5WMqzvXYOJIU3q3gNFr+rl2B2LeqCeOS9NynJYnW2zbPiwq7rkGdEGP+QubNQxRuYvj+1@vger.kernel.org, AJvYcCUJxnPVKjGBVHphIkrvcepZfukGOX2nEAMIkHb4CPI8dJlKBotfsr5Ai3ev5SFJmn9HIQWq2qEjko29Wg==@vger.kernel.org, AJvYcCUVR92qcIR5PJxVG97DAXHd8DG+Hxe+04jW8C11Gq5YZO8RAI56vh/szMXfweO4AS5mQ4wbKqN2KUb9@vger.kernel.org, AJvYcCVNG7cAf+3ampJzkRtTp+jKlixhIHgdPrAA+G9P+ryqaxGQT7HcW7SJ7sUVEI+VP00k2sDnEapubRurjdY4@vger.kernel.org, AJvYcCVVU9Jd/XQdJHAfOziCGuD7UL6zaDbvliqMelC57qWyiacYrZ6NlrMWS2gkNO63LVHFWHTGmlqxbPk+tHI=@vger.kernel.org, AJvYcCW+hudjkRwvAHMHacecLNhrzm+L2PNATDh213l6FKarASCeiCcdivHp2GcGKvT3EKyciuK3b6787yc=@vger.kernel.org, AJvYcCW4Boupptr2ZLKRUz+AZwSijnKpm1z5c5JleT1c/HysN3MahggMuMDsyDJadKWNP2YkcABAuOkO@vger.kernel.org, AJvYcCWOXskcMjyu+iz3FWO/9Ksg/15AvUadQUOlzxQmwMuY6wYN/KuuDCLEAwuOS/5sgN0NyhZUcTocBccZ@vger.kernel.org, AJvYcCWbRypAitLKx3EdBzUpWLn2QGI2L7e7Epj3vrFrhyEMeEV+BvJuM0ov5l+9cJpNOP07DU/yc1JKd6AQWsYBu+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbbHvCBSN1t2LPwOl5xBqzeMBmVPTB8+B49E8tiTvc3vQ6vGhL
	vfjApqtTaPspiP21vSv0nq7F+Xtyg1ZBIs9DF2X1Qw5PJezh6qsrb3wx3Er1yuMKwoQihvFb/Ks
	cJud27p918ZBB7R+bWJAX46cEk5s=
X-Gm-Gg: ASbGncvcGTBBFc10anjJJU+hzZNGJzzFGuo82d1CNJBW4J5P7+KXMaWeM4ZU4ykYwcj
	wAfC7E3i8kxIdP+QMTgGK2JMclpgLtazi3fc0IuIL+SD1HlUQPYte5a+tznj4gP9cFm8nJCRSpj
	Iqiflj4fStismdAYVNEtZXHGAtlgAqxM8S1DVF/YgVePbNtXtfDcqmsMImCN+7iJQiwIQ=
X-Google-Smtp-Source: AGHT+IGoV/9Uhqv+Fns6NNN0/nBMkui2r5bJm6i3AohL6oVMnwKeqZTPBLmpOVCazRLyrYCpscO9SNAXRpjxx0PT0z0=
X-Received: by 2002:a05:690c:45ca:b0:708:bfc6:c7cd with SMTP id
 00721157ae682-70a3f9f3123mr178533627b3.6.1747039735377; Mon, 12 May 2025
 01:48:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423094058.1656204-1-tmyu0@nuvoton.com> <20250423094058.1656204-2-tmyu0@nuvoton.com>
 <20250501122214.GK1567507@google.com> <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>
 <20250502080754.GD3865826@google.com> <CAOoeyxWpYmcg1_FBXYqDfMi28R5ZXp2Sk2PhUo=cL10Nn3iVEw@mail.gmail.com>
 <20250509142819.GG2492385@google.com>
In-Reply-To: <20250509142819.GG2492385@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 12 May 2025 16:48:44 +0800
X-Gm-Features: AX0GCFuSSgbm9l1EHQJ-GKZ1ptNofQdnhKrnmSKJDnk1WNlyff_Q4jNqRqJqio0
Message-ID: <CAOoeyxXxS21S-puegHiCZg-XxEz4rBtq=WJ0Veo1UvbqkbG4GQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B45=E6=9C=889=E6=97=A5 =E9=
=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8810:28=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B45=E6=9C=882=E6=97=A5 =
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=884:08=E5=AF=AB=E9=81=93=EF=BC=9A
> > >
> > ...
> > > > > > +static const struct mfd_cell nct6694_devs[] =3D {
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > > > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> > > > >
> > > > > These are all identical.
> > > > >
> > > > > I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, yo=
u are
> > > > > already using PLATFORM_DEVID_AUTO since you are calling
> > > > > mfd_add_hotplug_devices().  So you don't need this IDs.
> > > > >
> > > > > MFD_CELL_NAME() should do.
> > > > >
> > > >
> > > > Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
> > > > sub-devices use cell->id instead of platform_device->id, so it does=
n't
> > > > affect the current behavior.
> > > > However, if you think there's a better approach or that this should=
 be
> > > > changed for consistency or correctness, I'm happy to update it, ple=
ase
> > > > let me know your recommendation.
> > > >
> > > > When using MFD_CELL_NAME(), the platform_device->id for the GPIO
> > > > devices is assigned values from 1 to 16, and for the I2C devices fr=
om
> > > > 1 to 6, but I need the ID offset to start from 0 instead.
> > >
> > > Oh no, don't do that.  mfd_cell isn't supposed to be used outside of =
MFD.
> > >
> > > Just use the platform_device id-- if you really need to start from 0.
> > >
> > > As an aside, I'm surprised numbering starts from 1.
> > >
> >
> > OK, I will use platform_device->id instead. However, I'm still unsure
> > why the ID starts from1.
> >
> > Additionally, I noticed that when calling mfd_add_devices()
> > separately, the IDs are also assigned consecutively (e.g., GPIO: 1~16,
> > I2C: 17~22, ...).
> >
> > Do you have any recommendations on how I should implement this?
>
> If you are to use this mechanism, you'd have to submit separate
> mfd_add_devices() calls I guess.
>
> However, this all seems a bit silly for simple, contextless (where
> device 3 is identical to device 10, etc) enumeration.  Can you use IDA
> instead?
>

Okay, I will switch to using MFD_CELL_NAME() and adopt IDA for
managing sub-device driver IDs in the next patch.


Thanks,
Ming

