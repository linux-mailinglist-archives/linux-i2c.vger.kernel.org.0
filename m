Return-Path: <linux-i2c+bounces-11252-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA5ACEB26
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 09:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B0253ABD39
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Jun 2025 07:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C741FE44A;
	Thu,  5 Jun 2025 07:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcJuM2IQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1631DC07D;
	Thu,  5 Jun 2025 07:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749109732; cv=none; b=C0f49bWLHM/8Mha/N5SnSTgUNjerdZHQ6Pf3wNuqWy1lgnAlWHh0j8srBv4GVoFYR4QoZXdkQ30Tdml6KOV/RfS6RXy57Lo+MYvRcRijVUHNb9DzO8c2YYozaAqNHyTNATouQdYwlwwQiCJtDUzOZqzwDZ9c98gWJQli8yOFHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749109732; c=relaxed/simple;
	bh=gfeSM9koI63hy3Q9WzqLK9sjfRJOxYN3nlNQHMrI1nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tdGZ5JCNTxTI7ZA7tqQ5wM4gcJdaHvuC2gntXgSaIY2faYOLwumytRMBbO6ogWpf8rycEBmAUQB7Yrwjfc5ibvyJrZT/wEhyT6r4pva5PtMl0D4sApRBDUV0VCC6hxkpHRIEF47IlEeu0L1pzt1+1MtQef7z8CJ/ntkxwdN3x8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcJuM2IQ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e8134dee405so733124276.1;
        Thu, 05 Jun 2025 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749109729; x=1749714529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=laFJFuPEsuG/sJVW71TD9LCLTDYigCTdW1g0CHwdTGM=;
        b=kcJuM2IQTIzwbDnL7jM34y2wnl+P15v0+eoAFHfKpCHKWnFLxiySaS0oTy3HmUeQsi
         4P5YPD2Q8+IGj/GGPsfzQLZ+YvfN6kjKXsFzfaPIOEYhmCENeIe8q9AuZ/Xk4u3DbdrB
         Hdhm7b4PKMpEAiH14zQEZsglPzV9HHHkFoSScNyGzGZyTsFQvWd0vbRI1b9w+qGVDiPv
         ZWVFpM3R0Y1u1vQ7DodvFyYq7KoSlZBm7jUdH0pfEQtyQVUM/XRGUuDDFuiygIL1hjm8
         FzmxkGalfJ++3PUMlhfbNN8NzRvC6WnxJ9/gi0zXefAJ4jnxX9xL+TutRUZCC7/NsTWf
         ek7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749109729; x=1749714529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=laFJFuPEsuG/sJVW71TD9LCLTDYigCTdW1g0CHwdTGM=;
        b=ZYHb9N9agOp+bi7lw2QNeg95fZXsxYlqza82gSmCsSlel/nHwAQaleYpDtUtF9IcOO
         52JW2W/BeBFAcctVmsgo8PVR2WxlgF2lRbmgS0WrEjxZQ/QW8QjuqRxHZ9HtOJx3Pn0T
         IEG9zE2e/yLrBvMjEJcAX+x8izByz2dOCoGTfDLWwucOxl1Ud9PHCSw8KNYKWNU+lV7U
         wpzerQcFHgzIQi0COhSvS4GpB1GC+yFQ++JGZeffsWAWUH3csCtw8rp51BR9g5SoTGTo
         gjTyHDbXG5pOq68Z4MJ+LjJD1mCERW6xi2WwG/KJMCjYPlLhGFablOg7nyLwLWDWwUGo
         +LkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIwVnI9qH2m+WY5u2Oyzi9xYBvMX9vZ0s2cwN6ERFn32xinZaT22+tS0B+RL7TAxF/yWa3RWY727uRMPqsTko=@vger.kernel.org, AJvYcCVCFnpehdmAHaXP8Z29fyxACdcX4CzDRU/a6DjZeohVwAmTGCiX1d7xTBVzGcPuwGXEzngR3Rlt@vger.kernel.org, AJvYcCVGtAskndKW38GDV79n2u9COF3f1Ai6HJtdZcSPriX7llZzP2qPZ/i9MmSSjFYO31N3R9PW1Oy92sM=@vger.kernel.org, AJvYcCVbU4Bwun5icz0jm3e2Bp5PcHy0ZEMYKfl2AUJgeayzKco+Knwev0xhoQhrggFeqx25oCbkAxHEPg5b@vger.kernel.org, AJvYcCVu3rlJj+X1lED64H44mR42ERF/8wKW/V7bBRvZDL50Eo+pPSYBzEKv8TzjgsgtbNeqn2qRnMpI9ymsUw==@vger.kernel.org, AJvYcCWSKaqvFJvZGsNK9zKxAZnhTCp0GzArP2+sfuLWEizXmzYGoBkVw+TgvkqhNTuk9utxlT5p2R3UU/25llk=@vger.kernel.org, AJvYcCWkrLivizjuXzlbH842WA9/PA9nhP+iFqsFdHzQJSt+vhz+LCjWq+PGbsZ9QzlRwZUofoDDUjMHaztY@vger.kernel.org, AJvYcCX8X0PEqMSSWMHVOyTttBndY/fKKnaDMW+DBm6zjw4E/C1hj1ExrKpc3KZs7A0dY0SArkW5I/vv2vNV88xT@vger.kernel.org, AJvYcCXvRX7zw12Gcxdm8iiwX+9dRO4z3U6sIJSg7fJw7POI8QmwkJjvhYoLmltQhkj6VLYhM6TbCnBrExOH@vger.kernel.org
X-Gm-Message-State: AOJu0YwwkmNWotHIq/u9sWgjT0hKq6GeBhCB3iBd02wTnojDPALDHXiv
	hZpp0wEjKlvMdkq4wSCzuboL8q6QwR5nSk9/zocCiVtl+yPVX0Cy3J5KsGGhQyNGiKuQk9Oo5gR
	yWkZDv1LgG477fRygeKmnAXvegjGBUZs=
X-Gm-Gg: ASbGncvl0vZysbBIhFwSil0igCPbzJBXx3UZmfEFdstJYqRjSqfxcQ1bZ/kwhDob5Z7
	ktIJSgEscLn5iduubFkwwI4AHxFdRAEdhvEWdvKRDNYx0wbWUY6iGdHPFUzPpe/L6DL9VVN94oX
	ONeU+J+RFTVnFmqvKd5USfGTE+QeHGEcn2kA3LMZiSF9S2gwtJdQIIhRMuRdJmyBKy6dk=
X-Google-Smtp-Source: AGHT+IHIVmZX96nE9u8yp+n5lk7LxNK9FTCayZ4PrsjWGO2btr//2eZ4+WivGNhUZIzZvZhqyODqpSltdOW6AvZizLM=
X-Received: by 2002:a05:6902:2b85:b0:e7d:b16f:f804 with SMTP id
 3f1490d57ef6-e8179c349a9mr7131699276.15.1749109729450; Thu, 05 Jun 2025
 00:48:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604041418.1188792-1-tmyu0@nuvoton.com> <20250604041418.1188792-2-tmyu0@nuvoton.com>
 <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com>
In-Reply-To: <b4c15a6b-0906-4fea-b218-4467afdd8345@suse.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Thu, 5 Jun 2025 15:48:38 +0800
X-Gm-Features: AX0GCFsDarHH9DuQaNq5zKQZ0HdR17wIgh9dOA3-2UA2UgIfsEX3Oo2Xza2mWFQ
Message-ID: <CAOoeyxU1-HWSfNGLrXQCgaE8gC=3Q=yF7=S_N=J=q_26Kmh5PQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Oliver Neukum <oneukum@suse.com>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Oliver,

Thank you for reviewing,

Oliver Neukum <oneukum@suse.com> =E6=96=BC 2025=E5=B9=B46=E6=9C=884=E6=97=
=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:11=E5=AF=AB=E9=81=93=EF=BC=9A
>
> > +static void usb_int_callback(struct urb *urb)
> > +{
> > +     struct nct6694 *nct6694 =3D urb->context;
> > +     unsigned int *int_status =3D urb->transfer_buffer;
> > +     int ret;
> > +
> > +     switch (urb->status) {
> > +     case 0:
> > +             break;
> > +     case -ECONNRESET:
> > +     case -ENOENT:
> > +     case -ESHUTDOWN:
> > +             return;
> > +     default:
> > +             goto resubmit;
> > +     }
> > +
> > +     while (*int_status) {
> > +             int irq =3D __ffs(*int_status);
> > +
> > +             generic_handle_irq_safe(irq_find_mapping(nct6694->domain,=
 irq));
> > +             *int_status &=3D ~BIT(irq);
> > +     }
>
> Does modifying the byte have any benefit?
>

I will update the code in the next patch to use __le32 for the
variable to ensure proper endianness handling across architectures.

> > +resubmit:
> > +     ret =3D usb_submit_urb(urb, GFP_ATOMIC);
> > +     if (ret)
> > +             dev_warn(nct6694->dev, "Failed to resubmit urb, status %p=
e",  ERR_PTR(ret));
> > +}
> > +
> > +static void nct6694_irq_lock(struct irq_data *data)
> > +{
> > +     struct nct6694 *nct6694 =3D irq_data_get_irq_chip_data(data);
> > +
> > +     mutex_lock(&nct6694->irq_lock);
> > +}
>
> Why? Does this do anything but make it _harder_ to tell that you
> cannot take the lock in interrupt?
>

I plan to remove nct6694_irq_lock() and nct6694_bus_sync_unlock(), and
instead add the spinlock directly inside the function like this:
static void nct6694_irq_enable(struct irq_data *data)
{
    ...
    spin_lock(&nct6694->irq_lock);
    nct6694->irq_enable |=3D BIT(hwirq);
    spin_unlock(&nct6694->irq_lock);
}

Do you think this approach is better?


Best regards,
Ming

