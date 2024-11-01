Return-Path: <linux-i2c+bounces-7701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE1E9B88CF
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 02:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE17E1C21AF0
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 01:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AAD13D53F;
	Fri,  1 Nov 2024 01:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZInS9aJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFD383CC1;
	Fri,  1 Nov 2024 01:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730425463; cv=none; b=Js5rS9Fuh//ch5Z5G8x81vgy2Wi1W98sR3Ze47AdlYVNOoIYmDfpKGarXFcsyV9YtSnZzz59G1znx46UqSPRzgX9jidO4NzR+RCigiIsl1mekF73KcHPoKQuxWD/0zbiVq29uZbTKq6Dt6B8wEUEVkwocSQDJnFwJlmgufZ++vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730425463; c=relaxed/simple;
	bh=szAhQGFkG/EkKlR/UIr5w2khUSd3/LQQIfpepEXaFGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HttUaRf2sJqYW1FO/KqkRQHEkHf78OiDv7+ugWMMkO2dstmjnyV5j1EeXEvid0EIkrLPmSN2vOzM8pl4BWJTwNjkshXVbWcCXCr5d4mAd3sE0lViA4vp5wIFkzyc1qqLgAEV+BFssx/h/Mg4OiNpgWD+2yC+FiEDKQJKwpYVE54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZInS9aJ; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e291cbbf05bso1563459276.2;
        Thu, 31 Oct 2024 18:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730425457; x=1731030257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DC+LuRUPcxT9PORM0hQQfRilr8yvtpO96Lfj230+w40=;
        b=SZInS9aJgXCP/5dgwECdKgtSHhyLwJs72hMogZYk8r5mV3pujhYXFNqViDuCjgFadf
         wyXcE/RC66HpYoqna+DUvs/4RrVQy0FgUp3A4eZv/KaJmoqBfE+6Pj8eSjsfjebKUjwI
         F2oZeHjBWKhd7VIHja4/6QgoTwJTxxY3vF7QVu24sE2UFbPlwvC0Kcx9gkuft7X2lhvF
         PDMZuk0u9G4Ao/vF964ItbBrpszIktgCb/5mQNQlUprAGKgTo9C0ZRv6LXqSbAOgOrWj
         D1RkLhDsMgmIMAi83wstKKim0Afxexmzp/soB6xgjVThDo/+FjjDSPYalzYAn7CSNnly
         8G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730425457; x=1731030257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DC+LuRUPcxT9PORM0hQQfRilr8yvtpO96Lfj230+w40=;
        b=CmtKQB12A7Belk5lMadl+tQrI5Yn4IXXcWJQ4MHaZntYvRr3KGZAtvtc2wbc27yt6b
         kupHzgyWVe3ooQozFiAmwkAngsMSjBw4LmgkjKIlOYvJ96g221i69ZQmmfRMF7IZacns
         RjAJEYcliFsU73bmwtL4lWmJgLgv0tl/oMFQ3nxzrvZvmjT167k8OSh2BvNh2g0gYA/q
         yQrEOjiR3YKTuRpVuPe6qTlYQUU2MFBnK078t9XulwmL2n5i/atvKBX7us6k4DJghxTD
         mBnE9KopehpKXzRapTsNHh9FbBgFDHS4LtQvJtc80VT+e5E08s3wA02jVagHUvPFNWxU
         s1tg==
X-Forwarded-Encrypted: i=1; AJvYcCUGj1CCChNRl63ld6TpnXG/Oa+c8alqhKP7qVSu3BGsUuKs3XDsxTa6bfAto1cag2Iss1UT5b3CtItaBdal@vger.kernel.org, AJvYcCUJu4TKIqz6GToauEKWwRHqv9opuL25magurLCxKSVTfbuj/sKCE3oxvI2Yan0gvNkeZP6se8vslofCVw==@vger.kernel.org, AJvYcCUT4Pwz71uWwa7B0eTJP3WAk08r2TrF8feSH2zPLhioRk611nDXF2yKqwYWledONru3Lml4kZg+F8Qf@vger.kernel.org, AJvYcCUk+g9DtaOdoxTU4rpeJn6r727PeUxZANag8ennRhbL5hzd5uD2LASujHk54Su17DGiBFyXJLMpTqaI6zg=@vger.kernel.org, AJvYcCV8og7I3e00pe5M2kKqIZkL/0hYt7104rEqtjcLThcC0ovfVBA5+d8qvzV7odTnmwT0kmzX+nkAjlsE@vger.kernel.org, AJvYcCVfTNm2thZIWcO2bk/8Po6g6u+Cys43NIiV3oevZMLaBhKge60axFfb5x5qG54u3RjRuk/XocgyPDE=@vger.kernel.org, AJvYcCWdtS+KKghmGD/V2RTJIyqyYvOgrV853g3Vr0c6cZfMOrXN0b96jOWFgSxjgGLneP8MmlDi5dJoN7Rj@vger.kernel.org, AJvYcCX7RY3ICl/gXACT25wVgMKcu+2eUHXy4+16ExTwBim65qt3jsA5twqdeeGgDCAQUFOYGuHdPEQfxx92@vger.kernel.org, AJvYcCXtsPQR8eYy0sj+RyJU0pZv9rl7UDKolPhiZ5mJoe+o7k9px3PzrUud3gQpX21PjVub7WpXxPujrKgMGXLWqMs=@vger.kernel.org, AJvYcCXyBjMzvi2nSHCd0e7Dcynb9SeC
 ARxUFhsgERSwZJ+/8FqeDWYPRXZzkUM7lzmdp9rb6f5T6EMW@vger.kernel.org
X-Gm-Message-State: AOJu0YzVJSSZfLwYDF8kOThI4NhnXIfFUIse0H4TZulEItGOInpnT1Qh
	Myq0CkguxRFfRyKH78s/d7uNF0cSUmn9UHWypQKprFvo9egB3UsIZW64HUQa6P9VibdhW3l0luT
	dYTMbWECK8ZvTAeaj2qZZHMHxH9E=
X-Google-Smtp-Source: AGHT+IG9FANvNfzOWFakcqI9k6DkZ1PgSjsTX0lBUX57Oga19FBFGDCpY0tL5mAhGGCovl5a16zXw3Pcdsnl+hJRh0M=
X-Received: by 2002:a05:6902:2504:b0:e2b:d610:9d59 with SMTP id
 3f1490d57ef6-e30e5b2491amr5145627276.43.1730425457068; Thu, 31 Oct 2024
 18:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-5-tmyu0@nuvoton.com>
 <20241024-poetic-offbeat-alligator-d6b9fe-mkl@pengutronix.de> <20241024-cryptic-giga-mole-54e2b5-mkl@pengutronix.de>
In-Reply-To: <20241024-cryptic-giga-mole-54e2b5-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 1 Nov 2024 09:44:05 +0800
Message-ID: <CAOoeyxU6d=tgW-=mYG4Aw=SORyXLPgfipYYcwVhv8s=0O--7Sw@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> |   CC [M]  drivers/net/can/nct6694_canfd.o
> | drivers/net/can/nct6694_canfd.c: In function =E2=80=98nct6694_canfd_sta=
rt_xmit=E2=80=99:
> | drivers/net/can/nct6694_canfd.c:282:22: error: variable =E2=80=98echo_b=
yte=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
> |   282 |         unsigned int echo_byte;
> |       |                      ^~~~~~~~~
> | drivers/net/can/nct6694_canfd.c: In function =E2=80=98nct6694_canfd_rx_=
work=E2=80=99:
> | drivers/net/can/nct6694_canfd.c:677:34: error: variable =E2=80=98stats=
=E2=80=99 set but not used [-Werror=3Dunused-but-set-variable]
> |   677 |         struct net_device_stats *stats;
> |       |                                  ^~~~~
> | cc1: all warnings being treated as errors
>
> If compiling with C=3D1, sparse throws the following errors:
>
> | drivers/net/can/nct6694_canfd.c:417:14: warning: cast to restricted __l=
e32
> | drivers/net/can/nct6694_canfd.c:750:9: warning: cast to restricted __le=
32
> | drivers/net/can/nct6694_canfd.c:777:32: warning: cast to restricted __l=
e32
>
> Marc
>

Okay! I will delete these unnecessary variables and correct the error in
the next patch.

Thanks,
Ming

