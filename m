Return-Path: <linux-i2c+bounces-7624-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A35E89B2987
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E98D1F25E86
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A194B1DC734;
	Mon, 28 Oct 2024 07:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMQckb+5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A11DBB1D;
	Mon, 28 Oct 2024 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730101365; cv=none; b=uEIzJotUBfb7C/BLwZeT7s/NGVDaVldxUx0nVxdbWWzOZKNgOHs3mvH8k4PomgWB9UrFL07+QNXYwFao66/dz0zBxsX4sgloFkE5thwJXEao86lFxAHjHMshRGppgHKKFVlPSGSxKmRn45bC2AYvnG53G9umgDHvgokhNPyVhPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730101365; c=relaxed/simple;
	bh=JXKFC5VpBEHlPtIfVygRx6UJGuI4jfPDIOIO3j1t/UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPC4bpXeNC3JaKQ4k0lXMjANUl0jl/g8eMGo/IzI+1cJtSBgYUVz/thFu9pulK2r+4lOe0jGf3g/K3pDTi+c6RkHbDLMdeLo061v7ZMu1r2WZYLPA5mMyVke8hgHKBnRyt4x+v4xKNmhB05Wy5ja1PsnqmDOV4JZoubJUVXWuEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMQckb+5; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2bdbdee559so4013304276.1;
        Mon, 28 Oct 2024 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730101362; x=1730706162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VfSo/759X3OS9N787muqObE8V5tHxeovvU61U0ecmlE=;
        b=KMQckb+5T6gK2NSrN17OK8Xcm6Qj4tgxaLsZqEBhC2DtYsOcS52bpqDzxX71pMAOOg
         4Sz1sEECWyIslcTdkkgaNPmpCb00fAR1Ur7zZxjYhpr8wtphrbUuCMzO4TX+eUWufDLx
         b1Buy6GKmpuXuI4gP9BNRD18blCWwipi8BiWw9qcoIJypThNw8AeGqTyALrLfabQcrN6
         SlxapW3jmEqeAv/CqcK0cQMqFAQ6IDl/Uc4Tbe1rCYUdVAWKB9QC04vn74GEfQl6JT6G
         Lfyl3nmfzanlCpQaq+SkuSTr/VY+r6J2O2pV0gIJL4hTNJ+6kMFI+6CoqUp8GyEj7ysQ
         NsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730101362; x=1730706162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VfSo/759X3OS9N787muqObE8V5tHxeovvU61U0ecmlE=;
        b=ssFxPa5qD9uq/hkVwONu1DUzuMaEjygNOcudiGDAoSjKpq1Dt6xlyXrlwJabveIUfC
         Wzjswe2S+TPOxNdGbxNz8b6BBXAQqQ7+kLfMd19ooC0cB991Sk4vbk+TQSSupMGEvSlN
         MwQvBjoZJD0TlsacUsnbwaa4nLPrip1Jk8z+9TtOBxAsoIDPUQHSwGHFALo2T2wwPjcx
         WM/QpKGFwQ97yY1QMJhLG1GJQuxL4tUvtuYHL94MEjCfca2RgbmPOjIRJAICXLemtqmw
         ULk7tOx2rn0yPCPX3gI9RH1hm3EldmvMdLn55zbtEDs/hd40Glpn8mcjNO4rMQBoWMM5
         SDFA==
X-Forwarded-Encrypted: i=1; AJvYcCU5VySnwaZk0UH+8rwIwzZwOxX3MpvSA/wB4xCgEEDmLMq+hMZk8H3SR+pJNl/PJYyl6JeUYMYk1/iLCn4zlrA=@vger.kernel.org, AJvYcCUNlLwLlOzJLMFftHDNmKY0YkBdLEM6dOuOyJ0EkkNP4IWCwKEgQynZ49Mpavmf3FELCC++BWFpLtnnmYW4@vger.kernel.org, AJvYcCUZRMLqTqR2K3Bkhaneg3fxcibV6oZrC43kWR7Q9cBoMWGyBKMXfw6E7ezTITQIXNYqXHxMws3pXI+xkm8=@vger.kernel.org, AJvYcCUud7YTywR2UfyJ8rmdPcGSm2zbd8s0cA0tRL3K9RVgGhlMZvZtPktcw49OWZ089MG8FyfMr1Sa@vger.kernel.org, AJvYcCUwFZoubqJHO65zruExH4E16s1yriVYNPut8js34NhPeYo5OmyWzYaf0JpqQj+A7hURI0IlEMVr/krD@vger.kernel.org, AJvYcCVG3NvXhj9tyxd45MjRiuamZAcsx3KZwQhyQvWCnv0Hb0QG0xU8waXC82IHKrOxHDu83c5BaFIEnqI=@vger.kernel.org, AJvYcCVLlnGkX6tc64QONhAHSCXK5JmHXHbSw98HcDg2a3JxBnxiTJ1yVBqxnjRwhwbIUMe/iUphsPPodRsR@vger.kernel.org, AJvYcCVeLpdHLOVyR/jkQnnVolYJXJJE2d1054dykJwKQQ5R1Iv8alQJo328bPYgWPi1mVJ1VbplSdLHqvVnmA==@vger.kernel.org, AJvYcCWzQmEsks6gGXeEBN3/xrNYin0mT2C2JmxUYLu1DJo6CAnUVK0L0dC4e6l5UeWkwMFu7oDsbK2P+5Fz@vger.kernel.org, AJvYcCXbKqO0Nj5w5SbEMTnI+WcQvEMpQFgV
 GlPYFBS0N/B9fuoys5bKe/fiLoKaic69WNIiRb9miyPo5C/F@vger.kernel.org
X-Gm-Message-State: AOJu0YwGK6k9K8KaaZ2bs445ksmiQSY2km5+SKM9K3DeoTyb74Qqm3OV
	t82PA10igC8c3nezB25h98gg9d76ThKfi9vHdODT/Drn31vJHYjYaDEfJQXOzk2ueq7wTLrCW5O
	p7EdoWfxlqkvxRtsA9HrblkiHDt4=
X-Google-Smtp-Source: AGHT+IE7sSyqDVHOJ/jdGq64MHZ+33bDq+P02VTEX3r+LWDoPL8/lqvTrSpBYuxjao1IdyrL/sL8NYhH1E5VS7+KILg=
X-Received: by 2002:a25:2611:0:b0:e2b:ade5:b925 with SMTP id
 3f1490d57ef6-e3087becb3amr4891484276.43.1730101362407; Mon, 28 Oct 2024
 00:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-7-tmyu0@nuvoton.com>
 <CAH-L+nPGGhgDFge0Ov4rX_7vUyLN8uu51cks80=kt38h22N7zQ@mail.gmail.com>
 <62ea5a91-816f-4600-bfec-8f70798051db@roeck-us.net> <CAOoeyxX=A5o5PhxpniPwPgMCBv1VwMstt=wXCxHiGPF59gm5wQ@mail.gmail.com>
 <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
In-Reply-To: <817d24e1-6fdd-4ce2-9408-eccc94134559@roeck-us.net>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 15:42:31 +0800
Message-ID: <CAOoeyxXiihVEbCri5=0xdQ2EWO=NJv2Y5a-nRLFEez391Lnmbg@mail.gmail.com>
Subject: Re: [PATCH v1 6/9] hwmon: Add Nuvoton NCT6694 HWMON support
To: Guenter Roeck <linux@roeck-us.net>
Cc: Kalesh Anakkur Purayil <kalesh-anakkur.purayil@broadcom.com>, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood,
Thank you.

Best regards,
Ming

Guenter Roeck <linux@roeck-us.net> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=8811:44=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 10/25/24 08:22, Ming Yu wrote:
> [ ... ]
>
> >>>> +static int nct6694_fan_write(struct device *dev, u32 attr, int chan=
nel,
> >>>> +                            long val)
> >>>> +{
> >>>> +       struct nct6694_hwmon_data *data =3D dev_get_drvdata(dev);
> >>>> +       unsigned char enable_buf[REQUEST_HWMON_CMD0_LEN] =3D {0};
> >>> [Kalesh] Please try to maintain RCT order for variable declaration
> >>
> >> Ok, but that is already the case here ?
> >
> > [Ming] Is there anything that needs to be changed?
> >
>
> I don't think so, If two lines have the same length, the order is up
> to the developer to decide.
>
> Question though is if the buffer needs to be initialized. You should drop
> the initialization if it is not necessary. In that case the second line
> would be shorter anyway, and the order question would not arise.
>
> Thanks,
> Guenter
>

