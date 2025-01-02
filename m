Return-Path: <linux-i2c+bounces-8849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C29FF655
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 06:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DDE93A2F15
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 05:41:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84160191494;
	Thu,  2 Jan 2025 05:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e60WxBbY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C548D54F8C;
	Thu,  2 Jan 2025 05:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735796467; cv=none; b=b1BcidgEz+zSmzli++nh7ScNinjOodkTzYFC9oW2GE0ldqhiSqZv+FHwMR/B61D1JT7wTBQmDYrAk2ai1VBpx3WKI7UURlsn6SOFVAb2mntP3DNlaEe3S7+SHxxWNAklVCF9hGNX4C/+5LDEy/nkHAyClf7zHgwBb8R7Fqu4x2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735796467; c=relaxed/simple;
	bh=x0GqOPflz3JU1F/JYbbkfOfzkYbLKZumeQJnrDyofl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE3f6hQWZP7CiB4A8639kWR0j/9hwG0FAhXhyQEXMJUmZzLV3mQsUq7DsLfrem2Wp8fr3HTQvZnMMcbO3MAYBH0dsY2H1n38/ykPK93leGehLIcyn0F1X+hXmi/R7hpQqbn8N4Tqy8QiyvdXfVLlx07J7EuwLWhn5nw8ogmRzd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e60WxBbY; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3f78f5fc07so11327449276.2;
        Wed, 01 Jan 2025 21:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735796465; x=1736401265; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASYw2YvvCKSoHOSnhWWZWXnYT66q6f5Arwrbz5nE6n0=;
        b=e60WxBbY2J/XD/sTMG+GUy13XQ5pFmkdpOY+OpllbgZ81S48CdnttZzjED37XjlxNn
         pxBEa7psZ/mMwIq49UMmV4n8sq86cMbSv6dDe2Gl2iVFhkeAxzfRxsPMaqkvVT3OOUXI
         eQ3szalg4n5qZETB0eFhm5yKaJe6EdDWg71CZytvy2rJ4vFEx5V0mwmswVkQb7ySfugp
         89L+qPCmadAqYnWO9z3VTYH8qVmO0EvwMWxu88CyPA/PK6HLENMWH931dGovWWABrsxP
         8BgV7g5D/FuuK2lPaVA9zBCHriE80XTVy0qAeEce+L54iV2bUbOEhak0uLZHHiV6GxK2
         O+dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735796465; x=1736401265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASYw2YvvCKSoHOSnhWWZWXnYT66q6f5Arwrbz5nE6n0=;
        b=VTlpjWSmCWoHjbqqd8zB3ajM8Cj9wxXUK+Dp4tDkEOTJdYvn42cDoCWSth2/3NDw1t
         IbGDe/glviKd/JjALafYj6WTSL7MwXIL2rsb6gkGbCQK3UtOsEEkOwNS1WVkzv3jnIC3
         1z1Uul20hYlec/5Nf9KRv6gWcPO1tpedKgLuv80eyJQbzJp91/NsSBBWpXgD3tM+oeZH
         Dim2QAoSbPwFpc7xCiOiW09ecFwGnv80siQsfQ+czq/LtO95nVsjNOkmBQgLQSbkheYk
         kkyFFPDjcWEGwbSJHPf8j6m5EZ74u78ktvSVKxEW5zw53TPTcwV4fS9XwZT8v6xwbGYY
         OKQg==
X-Forwarded-Encrypted: i=1; AJvYcCUJQyEU4snbIVEk1KEK9Nw+h4rEQrXtcSxYQkjr3KF1xavKSRrEju8rBgRzn9Zy2/+kSoTx3HwnW2Q8Tw==@vger.kernel.org, AJvYcCUPplk9C6on+5MtOlvdjLn6Ynlo9bsfPqIbndfcmgG/m0Y5mzVDjhtbcyfIX6c1sUvSbcv3WLCm/hKoW7s=@vger.kernel.org, AJvYcCUd5i+IB6aI10OefpRc+K0MRdc8VQ43qY6xzYfzpztwQOgZnHvBNUcrH1KopQluY91Tun8sH/oJSsuVZKzcU+Q=@vger.kernel.org, AJvYcCVmy1+Qob+GA+QFS/WzeZ5b+GtpUP1gM3rF74GJOaJ4twc7GtiYy/6DO226xVI2feHBlcluNMlfjMg=@vger.kernel.org, AJvYcCW6Z+N6gZ8CeiTxlFi/YaWRwm6EPaIksyDi0mL5UsxNW8t8/JwEizwd9dJsrMh8r6xEt8vJhv9WGWGP@vger.kernel.org, AJvYcCWuqS5G6rgypeJoCtxMmeVVkndBQmDe+FUStQKDZ0EKx1gObT6yO/fOB+H0qXR081J6GV3Suwwn@vger.kernel.org, AJvYcCXPl24bJwendWlV+6pBKor5cUDA8tm9hXgN7axmK/nL/71yAJfjrHGebsWk6dzmV4xlO2R3qzbur6ES@vger.kernel.org
X-Gm-Message-State: AOJu0YzW76Qpdioc070fz2MUL47nTW/qsfpWb6bU0IuOxCpmQa2WbH+H
	fHTWZ3NwmQus9Kry8C4NmeduJZkZNOOgwmD4oxqHY7uABQvFgaEi75H249bdl3cJdnlG6rTElzk
	Q0DY6cEx4beRnjjZnuf9ZcbPatdA=
X-Gm-Gg: ASbGnctnZqDXeMIA8sDbBoWnMqMkLDKsVcjOzjjMCUVxLnksLOetTHOcRqFIbr2PG2K
	t3iAAQp9FlISyDaBn6pyAk0ff+AuoZK4CShPz7PXxMuzauy4pygqKyYMxq2KfpRRGJyWGnmpM
X-Google-Smtp-Source: AGHT+IH4op97zYxM0yElb80n1mWB5vje2idEq4j1aO+EgRYFQsMF+lHBsn3B3CF0kwlTajDY4BtnNpv7SKTe7hWMtDQ=
X-Received: by 2002:a05:690c:3502:b0:6ef:799c:955b with SMTP id
 00721157ae682-6f3f8242796mr265511177b3.41.1735796464603; Wed, 01 Jan 2025
 21:41:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com>
 <20241227095727.2401257-5-a0282524688@gmail.com> <41f77d39-bce3-4e3b-98c8-f248b723a24c@wanadoo.fr>
In-Reply-To: <41f77d39-bce3-4e3b-98c8-f248b723a24c@wanadoo.fr>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 2 Jan 2025 13:40:53 +0800
Message-ID: <CAOoeyxU0ex9_-a-uWda9hFbQa3MkFtNdAFan8C-899Z2pGYy7g@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] can: Add Nuvoton NCT6694 CAN support
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Vincent,

Thank you for your comments,

Vincent Mailhol <mailhol.vincent@wanadoo.fr> =E6=96=BC 2024=E5=B9=B412=E6=
=9C=8830=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=881:56=E5=AF=AB=E9=81=
=93=EF=BC=9A
>
> > +config CAN_NCT6694
> > +     tristate "Nuvoton NCT6694 Socket CANfd support"
> > +     depends on MFD_NCT6694
>
> I think it would be better to do a
>
>         select MFD_NCT6694
>
> here.
>
> Then, make MFD_NCT6694 an hidden configuration in a similar fashion as
> MFD_CORE. Alone, CONFIG_MFD_NCT6694 does nothing, so better to hide it
> from the end user.
>
> The comment also applies to the other patches.
>

I understand, but I noticed that in the Kconfig files of other
modules, the dependency is written in the form:
config CAN_NCT6694
        tristate "Nuvoton NCT6694 Socket CANfd support"
        depends on MFD_NCT6694
(e.g. CAN_JANZ_ICAN3, GPIO_DLN2, ...)
Do you think changing it to select MFD_NCT6694 would be better?

Best regards,
Ming

