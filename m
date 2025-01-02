Return-Path: <linux-i2c+bounces-8856-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D9F9FF96E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 13:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767C43A328E
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 12:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE3C199234;
	Thu,  2 Jan 2025 12:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WicmtEKD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E3618FDB2
	for <linux-i2c@vger.kernel.org>; Thu,  2 Jan 2025 12:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735821865; cv=none; b=ePbVBJOx1Hja9TCOTSdOxJxQM9WhMxiKYMsid3FLB/l7jN9ReKtr5wTraBsZQKv5pmTbfc4JU6bMBbh8ViJADQrblhsSuK49Dsk6bMZ8UH9++O0AxPM06c3ndo/6lePRuKRH6I1zZbsnWDYHGvUdAMrgmDzMPvq9uxk0TtXaHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735821865; c=relaxed/simple;
	bh=K2dvsT7dhz/LmlWsIq7JyNaEasRXZuOQ87PujQkWaMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lkdboq2jHnSbAc6Aq3PYrhlFC7W5Mgzg8cv/CvPk3iuaop3IM7xyjZ+z5Tl+AC5SlwzQH6WOKRXNYWj0v177GDoypdiNhxDdL0ZfaMMf0tst6SIO1q5cjJhLGvtYkMxBIIbcfKPVU7PZpAB58fS8jdJUoYrFtrhVSoKTbCpOfeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WicmtEKD; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54263b52b5aso1127682e87.1
        for <linux-i2c@vger.kernel.org>; Thu, 02 Jan 2025 04:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1735821862; x=1736426662; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXTAfC+Euk2ZqORptfnn4DhQu7bG9q9vO1UaX0EloG4=;
        b=WicmtEKDKS3oXbVGkmZJTS6wRgGpVksRwcjPAqCn9cNIw+7Eau0a5lDNrQZ6fAKCBh
         qoLB0N50IGkP67CbmJt4mKXak/wzkglHwL08Lv5FjI2IJvbXQNypafoI9CHCv7exu2Hx
         qClXQCuZ6x8soJX5hBvcEdx718rpI7EBJYRkM4skgUgw6jznDiApkqPQXtfaZKD5nUT/
         dDmAOWyD+OtEKuTtc5b0igWE7oOsXU/xXT7nx+0nIC8V40QnVmDRDz9qg8YlqoIzM78R
         oD/SiUyB/Ntumjau9eIPnz+6dAPDVcbHLvkuVN06Mb/G8sw7RcldetUHHTxk2745jHQB
         DOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735821862; x=1736426662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXTAfC+Euk2ZqORptfnn4DhQu7bG9q9vO1UaX0EloG4=;
        b=EKotdtuXNGdCv2e1gVriaVcFuAz0St/9Tg7IYNah+aHih7dJ8Le0ejTQ+Y2ur0fX9z
         4HWKhv/e8V+PZY5bIlIa36NYC919uBQvdzRVrYB4KIb0j95buCHHx2Z/5FAgZADGVJA7
         rDJprUAYypJfU/b2XoHU3/JMTeCsD/xmuf5CuTPHRY+QibuoKvdt4w6DWfbpH1jeUlO3
         iSIn6wdOOmIlIVKHfjlIWUuw7bh3EV8nubriCZsfp4mrtzpeUH1Um/heliGmxas5EMqg
         oy7ZcPu6DzUBHsj+O4pidxowvAfOYdE1BgjaCzxUfyqzJUUXdoOekkAunaLhxvwR89Sa
         Eu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCmtthedPATS1gx9ZUJfEQ3HzZa4qrQ9UzgaCk2vHRkvgznxutmcGil6xBCS7eP36RYAJ257di4T8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4m7hi1PLoMmefUq0ZjvIq2AmB3il4gsiiXtg3qa+Gx8bbT2EI
	xd18qf/JL2O+SyETsiJim5DniT+4q4kM4KZbGsEkkz0chnUUTyP2ZsRF2TOZ70RPCM20EYnS/Rg
	gqykZRWo81NfnTpW1BdwdS4qNoJ6bZheMWQywoA==
X-Gm-Gg: ASbGncuAnshMyL87z2DW2VYz1WcbyWpdyL6s053nRJ0Bcmbie8PzIjWVQdhSRxgaZBf
	hwN4KeyjUAzUwCTKxoei23ptgA3yPN3Sq4KjVZFdJ5hD15Lx9f1YyvXrb5Q2XkjZ+ZocdHQ==
X-Google-Smtp-Source: AGHT+IFN+1+CuipJvqCLG4Vw4U/YbFqzg/NPb7q0hphJvRrX/+TBcZVtRLbOtGXDIiwzUKteo04vTtva7evlHbUMD1E=
X-Received: by 2002:a05:6512:15a2:b0:542:2929:63ea with SMTP id
 2adb3069b0e04-5422953998dmr15195603e87.24.1735821861896; Thu, 02 Jan 2025
 04:44:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211102337.37956-1-brgl@bgdev.pl> <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
In-Reply-To: <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 2 Jan 2025 13:44:10 +0100
Message-ID: <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 12:41=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org>=
 wrote:
>
> Hi Bartosz,
>
> ...
>
> >  struct davinci_i2c_dev {
> >       struct device           *dev;
> >       void __iomem            *base;
> > @@ -132,13 +133,10 @@ struct davinci_i2c_dev {
> >  #ifdef CONFIG_CPU_FREQ
> >       struct notifier_block   freq_transition;
> >  #endif
> > -     struct davinci_i2c_platform_data *pdata;
> > -};
> > -
> > -/* default platform data to use if not supplied in the platform_device=
 */
> > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_defa=
ult =3D {
> > -     .bus_freq       =3D 100,
> > -     .bus_delay      =3D 0,
>
> what happened to bus_delay?
>

bus_delay is not set by means other than platform data and it defaults
to 0 so it's safe to just remove it.

> ...
>
> > +     /* standard bus frequency (kHz) */
> > +     unsigned int            bus_freq;
> > +     /* Chip has a ICPFUNC register */
> > +     bool                    has_pfunc;
> >  };
>
> > -static struct i2c_bus_recovery_info davinci_i2c_gpio_recovery_info =3D=
 {
> > -     .recover_bus =3D i2c_generic_scl_recovery,
> > -     .prepare_recovery =3D davinci_i2c_prepare_recovery,
> > -     .unprepare_recovery =3D davinci_i2c_unprepare_recovery,
> > -};
> > -
>
> what happened to the gpio_recovery_info?
>

Similar story: it's only ever used if there's a pdata-provided
recovery GPIO line set but nobody does it anymore.

Bartosz

