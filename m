Return-Path: <linux-i2c+bounces-10909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D66FAB09CA
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 07:39:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5074E7B85B8
	for <lists+linux-i2c@lfdr.de>; Fri,  9 May 2025 05:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980552698AC;
	Fri,  9 May 2025 05:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj/KbpJq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B668D2686B1;
	Fri,  9 May 2025 05:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746769164; cv=none; b=ASR0L6Nk6HTbE9RvRVbq7CftF1NnQTNBov4EEvr3gQ9lhBsmtnNfmRYsIczt4ltQ8jk6v/3zN7tCesfdAOUukdB/MplPhhHh2gRStRwe5n40w0l/j7pg9qLQ6UJqNwIVHc/2u08i8CZ6CFkxmXK6wSglhps0pnUV0qjQgFxApNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746769164; c=relaxed/simple;
	bh=Wt6qmQ7sZcDANvo0BmQAwd3idypT0K8m5njPmRPNL7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pCLtOW02hISDHknPWLWNqF7xzTTtnfi+MMi5rALRgCfExOvW5aaiuti2zPpZdNRZn8TDtrB16jirZdaLcdXlfFEsbJx2vh9w0cpXjMwnHRo4t85yM0iMTcKwBhQBT7RSpn6W9UC3D5NSNPEoFJCR11BqhKI4/Ft1sg4WekP6WIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj/KbpJq; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ff4faf858cso12491067b3.2;
        Thu, 08 May 2025 22:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746769161; x=1747373961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wt6qmQ7sZcDANvo0BmQAwd3idypT0K8m5njPmRPNL7A=;
        b=Dj/KbpJq4XJSW8XL5syhdB8Tx0o6SSEWchYnDow660MmAku+CJoDsB3EfXUgmiIKrw
         GAgqywluCwCRoat1sQwsUfJ0JxIj0R5V8IVPK+nUDDoTsq2o1h5f4i5v6kqMWO2F/kPH
         r9gET+kRZ+mza7bE/1tHhoVQiJDr0LCZ9uiV+oA/Fig4M2qfwPpdtwnI+5n3JdyrMgC/
         o7Fy14HrPXcx9PHAr5b2YKy7lcuhY5SdYr0MQ8SEMvuDz4imcJgmt9sCZkdwQlVpFIdU
         on9BnIKNs7y6ppmQFq9W1lShkekMzyt7L+UnCd+YzdDQJAPZBNrnxK+ZMuBUm/M0oyyj
         llPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746769161; x=1747373961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wt6qmQ7sZcDANvo0BmQAwd3idypT0K8m5njPmRPNL7A=;
        b=GZ4O1VK42wybB0a9+1sCrZb4fWB4pSQ0gkpbQBJVl4OVqU8zgtupAACXQKa2FWGVHo
         EurS3owNtXEjvLrPFiB/WnuaM+R7JoJNgjKxrtlOG4pxoojvddAm6QmdvdaSkY6a5vmL
         glYahook0AgbrMIWlZMeObVVopYViXbu8Eq8dyiqcbcmmAU2ny7OdBmkVmn/Cz/vGJfB
         gQElygMFYFXqcCMBIq/wD+n95WqzbM155Tgcs4UNeSe87is22C2wor5nRXgeb+y3EHOR
         VUBQoZSSGYYkSyFCBVmRgBf6zVvmMyggGhRRMuvE298tZvnMGZokYfUbkeFF2Yylv28v
         iGfA==
X-Forwarded-Encrypted: i=1; AJvYcCUYyYc94fDGmZGwjKG/Q6GwMF+yZnCwPPQFWdJPCCK/oyFI+5UkIZT5ZiGtdvIfB4U8YsTopbRA@vger.kernel.org, AJvYcCVD1erA0h8+/NRj3AGq2WxlQ+AwKhrBl0Beq3BwA/VoWvssIu06lB05Q7SJqb3SYwhMX54Z5oYHE+qZg0A5UfE=@vger.kernel.org, AJvYcCWGZMRGecWsz3Hgi6sKo9VdFlCEuwnBfBP2mGCMIIHkKl1lOGZG9flo0sbh3iDucOo/OLVzbn7IoY+e0A==@vger.kernel.org, AJvYcCWTzRYXjFZNQSHn5J8r/3hV3qXxT1PivWBYWLPPt/n71O9YFrq1csEI0IAiNctSNQ+T1bCn8WbhKujhEJ0B@vger.kernel.org, AJvYcCWYl3l6ZOJXpUH9H8KnLa0b6OHJwKN/6sHzUGL53c5k2l50vMQz8WiQc7e6Vw0DJ/ku8bY/kuXW05AK@vger.kernel.org, AJvYcCWhQMp+jsrdRQL8xW8D6UKGOBYKQjtrHj9kx2EjyajnUTSRnl8vsqXANPhjO8qpjb9QMVpKCLyg5Zw=@vger.kernel.org, AJvYcCWqS74aICIgZYC5Un43hf0RqlBW7hbYHRKOsUnfIiW6t9FiOes/uDYzrg8IwyVe9UUCZOrE4RfaADJKEdg=@vger.kernel.org, AJvYcCXD28b2VU5/dXuaajsz6A9f4fBd3zTnb85EPGVwqnxG11b0BKxfW46WDO2erbJAhQKJDOmknxePY3Yl@vger.kernel.org, AJvYcCXmxNoAWYQnuzMbwMndeLLPEqWaDoyZd9/HNfD7GZxNCZzp1RuB0hE7/qx5pAyWObFlIshPnmBtyUyc@vger.kernel.org
X-Gm-Message-State: AOJu0YyB34ibkp1AnH6q9+CrlF2BpYYUI5wzE6A79O9OaEB1+c4GtQa3
	mdhw/C2Uqp9ycL6fTYa6dS/haiWN6bW4Rfi9wR2QEhvrCI9kjIipZNgi7kUob6UgD+u7/R21rlz
	BiR/jL1adrYaShe/57U1b3paKXgw=
X-Gm-Gg: ASbGncvmF63es7mY//qPXv8Qdzsa2nIbV9sayYMrB6bafWBrNNdtvDQIkEvMuoHbSn3
	k8Cj/Tys45/JXCB/n0kuaFChjCTylhMp/rUXev6NhDNXTs1WAQZHtf85cTISfrPwCGpy6o4aQeq
	9MVnB8XM+3b6be10TfFHE/7/zIYDjvHnDeLwKDN7HCIjmSXWCqwaEWK8A=
X-Google-Smtp-Source: AGHT+IFk5bB/kSQCQvPokaz/k9WbjeiZWx0KoBAXjKrwliCu6xp8xGoktdaerVMzGTy2Apz2buaGKEb4MTQ0qSgkw5M=
X-Received: by 2002:a05:690c:368e:b0:702:627d:c86 with SMTP id
 00721157ae682-70a3f9ec80amr26501877b3.5.1746769161576; Thu, 08 May 2025
 22:39:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423094058.1656204-1-tmyu0@nuvoton.com> <20250423094058.1656204-5-tmyu0@nuvoton.com>
 <20250503-fulmar-of-sexy-upgrade-1184a7-mkl@pengutronix.de>
 <CAOoeyxWbr6jfZjPvYFD+vHKMZ9CpM6SLt+2xo-4E-NnhGinfvg@mail.gmail.com> <20250508-prudent-festive-puffin-83f666-mkl@pengutronix.de>
In-Reply-To: <20250508-prudent-festive-puffin-83f666-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 9 May 2025 13:39:10 +0800
X-Gm-Features: AX0GCFt636wiv16YtC2YyaNfP9KFULTYiEBXmwaP8u-ShxBEnE2ClP4UKWJVyys
Message-ID: <CAOoeyxWTsrR+boq_afxVTnouq=A7LMTp=9ihDOHUUONaPnVUcA@mail.gmail.com>
Subject: Re: [PATCH v10 4/7] can: Add Nuvoton NCT6694 CANFD support
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
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

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B45=E6=9C=888=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=8811:08=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > > > This driver supports Socket CANFD functionality for NCT6694 MFD
> > > > device based on USB interface.
> > > >
> > > > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > >
> > > The destroy functions nct6694_canfd_close() and nct6694_canfd_remove(=
)
> > > are not the exact inverse of their init functions. Se comments inline=
.
> > >
> > > Please fix and add:
> > >
> > > Reviewed-by: Marc Kleine-Budde <mkl@pengutronix.de>
> > >
> > > Feel free to mainline this patch as part of the series outside of the
> > > linux-can-next tree. Better ask the netdev maintainers for their OK, =
too.
> > >
> > > What about transceiver delay compensation for higher CAN-FD bitrates?
> > > How does you device handle these?
> > >
> >
> > In the CAN CMD0's DBTP field, bit 23 is the TDC flag, I will add
> > support for enabling tdc, and firmware will automatically configure
> > tdco. Do you think this approach is appropriate?
>
> Can you configure the TDC manually via USB?
>

Currently, it only supports enabling or disabling TDC.

> If the firmware does automatic TDCO configuration, does it take care of
> not enabling TCDO if the Data-BRP is > 2?
>

No, the firmware does not handle it. Do you think it would be
appropriate for the driver to handle the case where DBRP is > 2, for
example by disabling TDC?
(The firmware sets TDCO to (Total bit TQs / 2) when configuring DBTP.)

> BTW: What's the CAN clock of the device? I want to add it to the
> can-utils' bitrate calculation tool.
>

The CAN clock is running at 96Mhz.


Thanks,
Ming

