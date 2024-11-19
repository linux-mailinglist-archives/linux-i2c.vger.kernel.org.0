Return-Path: <linux-i2c+bounces-8034-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CAE9D2465
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 12:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08866B2591B
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2024 11:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876BF1A9B24;
	Tue, 19 Nov 2024 11:02:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4ED14AD24;
	Tue, 19 Nov 2024 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732014133; cv=none; b=pMWeme+M9F1/TcdOLzBuUF+eCG27KNJQjaKSNKjerq1nz5eDt/YfgLtMYRJj7RddgycxsQ2KyEfVXZgzlBoUexJ3wEz5Orax1dg/O7Wmg4p5JGwAPmAuDtxWIT7Y5o7pp/n01/Yc8DOBOTTf87z1MLVbaM5bLtiG9BoPchxNeNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732014133; c=relaxed/simple;
	bh=2iAzxDhgwSiKo/RBGqrWFJPKE/F5q23kxhWMRgJzcbI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnHymoXLajx5bQ8bx4mRdTuI7arNwP7y9kJcxpFzymiwVB7oq9z7r/ajIe5Fyd4AKebNenSv/yI4z9C3fvIawGSZHiJd6YqzyYEOGsyjCrqq1/CC05HWfpJIXuPWAPkLwN7XKhzfYpx8Td8R5m/NQ4O9KxP3yjrzD0UpUqJiteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e387e50d98eso635035276.2;
        Tue, 19 Nov 2024 03:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732014129; x=1732618929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83oIsWHooG4a3RF2V7+k5Vqtjc9Bg+CfOLZz7ZZo6JE=;
        b=Jib7vJDIxVtXcIGJ5x7mlcPx8c3ljjhNwekF8ZrVcSzvLF9D8alB8aF9uSX/ZGPGtw
         Sid+hctQEVaJSzCFzVhL0he/WAHV5Qj6kysub18GbgU07+khvag9uj5brKow2vvlompI
         /+uctAv5sDR3ds2sNnV/H9fP0TzHG0Y6bUvdeAXyajZJgoAjKvvQhAHqVW3bvd3G5ZjD
         ZeqmlzK96pVrmyOvh1e2mM0TcUK1oFiUXZAf3JOK+6MbyH82Sk1STF/k4XtcwZLaNIcZ
         vloZJTlsTl7ynuNNwnb/Mjv3c3CcjnqUbt7JQkvfK7st8Oil7H0tSMpEfAJD9InxnVcX
         AYTA==
X-Forwarded-Encrypted: i=1; AJvYcCV1NTF/pCe8vebGzQLUTTYWzX0BfIBkOf9ZRwC2QGo/WVnqprTCqGd8QjuIqHI46J03jjVGGB9wL/sw@vger.kernel.org, AJvYcCV6gWZc+fPJVDVV366mo/2eaiOTNpjVDUAowy1d8un/guujGqlqwl1rwmtTk4KNSzs9v8Q26sxebNuS@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ySjKXVHoILQ1kWnPD7J8Cwr5oR4i3DSwLt1icnVk6gHyZDpM
	VD0kWEMmr63Wv/xTKkYzDV53LIf0Qikr0DO8c550+lWlEUpLx4Y2Epl70XNx
X-Google-Smtp-Source: AGHT+IFopfBYSTpCG08Ea+EdkVxDmKpXd/q4WNSlj/ivGLQUBURR/an2iSS41W7b+l/hFKZzmRkZzA==
X-Received: by 2002:a05:6902:1007:b0:e38:1dbd:5765 with SMTP id 3f1490d57ef6-e38263f1246mr11992850276.45.1732014129437;
        Tue, 19 Nov 2024 03:02:09 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e387e754792sm2403775276.26.2024.11.19.03.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 03:02:07 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e3873c7c9b4so793102276.3;
        Tue, 19 Nov 2024 03:02:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYgse6hELsIFhv6I8m96KdXofizteC03FSeJbAANBZM+Bfzq253LPAGm25m2CoB+By/hXEPf0UpTa3@vger.kernel.org, AJvYcCWv5gCSJHZxErAjYzU8pxxdJWCjJWJwqQ1TplaoB4vki3Yb2IhVia4sX/xHkbDKv8dzZB+gzDzZM9U8@vger.kernel.org
X-Received: by 2002:a05:690c:490e:b0:652:5838:54ef with SMTP id
 00721157ae682-6ee55cff0c8mr181442647b3.37.1732014127189; Tue, 19 Nov 2024
 03:02:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017184152.128395-1-marex@denx.de> <20241018132754.GA54765-robh@kernel.org>
 <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de> <20241021181413.GA816269-robh@kernel.org>
 <CAMRc=McJ2_tT+iaLL3TMYPcMhSCLAWq-kOEvGzovuJfD+3MWFw@mail.gmail.com>
In-Reply-To: <CAMRc=McJ2_tT+iaLL3TMYPcMhSCLAWq-kOEvGzovuJfD+3MWFw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Nov 2024 12:01:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXEWsx3YBewPC1s1Q-yZp1S9erpK5TgWzNxFH_JyM=R-Q@mail.gmail.com>
Message-ID: <CAMuHMdXEWsx3YBewPC1s1Q-yZp1S9erpK5TgWzNxFH_JyM=R-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Rob Herring <robh@kernel.org>, Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Mon, Oct 21, 2024 at 8:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
> On Mon, Oct 21, 2024 at 8:14=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > On Sun, Oct 20, 2024 at 06:29:13AM +0200, Marek Vasut wrote:
> > > On 10/18/24 3:27 PM, Rob Herring wrote:
> > > > On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
> > > > > The ST M24256E behaves as a regular M24C256, except for the E var=
iant
> > > > > which uses up another I2C address for Additional Write lockable p=
age.
> > > > > This page is 64 Bytes long and can contain additional data. Add e=
ntry
> > > > > for it, so users can describe that page in DT. Note that users st=
ill
> > > > > have to describe the main M24C256 area separately as that is on s=
eparate
> > > > > I2C address from this page.
> > > >
> > > > I think this should be modelled as 1 node having 2 addresses, not 2
> > > > nodes.
> > > We had the exact same discussion regarding M24C32D, see:
> > >
> > > https://lore.kernel.org/all/CAMRc=3DMdTu1gagX-L4_cHmN9aUCoKhN-b5i7yEe=
szKSdr+BuROg@mail.gmail.com/
> >
> > Seems like kernel implementation details dictating the binding to me.
>
> Yeah, that's on me. I would have known better today but 8 years ago
> the DT situation was much more volatile.

And there's no way we can fix that for new devices?  Perhaps even
for old devices, by counting the number of entries in the "reg"
compatible value?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

