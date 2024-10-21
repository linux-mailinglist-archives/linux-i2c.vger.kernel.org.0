Return-Path: <linux-i2c+bounces-7496-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 304A39A7276
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 20:36:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3BEEB2293D
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 18:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ABD1F9AB1;
	Mon, 21 Oct 2024 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nxWWrwgf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471331FAF18
	for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2024 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535756; cv=none; b=stvAEhiQ9TsLC0/dz5qtD5cdoK5SjHn3iQlFpd6/igIzQ2dg9M2xnvLpox+CphBVOGq+AgRRlV+WrihzWUhKGrmL7aHGtb4sIujvlZFRrLuaS5H4J1S2+oVG1GrL/i9QgOB2LjlRucWO9bmn67LAd9+MgTc3zcfzQJQw8p7QRUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535756; c=relaxed/simple;
	bh=19d9JqmERy8wz0g+70NGm4OlEs22Ls54XZkTeYTEsQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qA87l7y53ixs7kLjK0V5lwifflfbYFsNa2l73k0oMOtiJblGj+h0dLjOHgTo7q0E1UY3jBoEjBh991mI1qyHsKy30dwYz/ol+GAVABuQt05B/3YSM38S8XjZKB7pJCWrHUACJ5GNjU5G6XTKpi6N4cPgMEd1WpKkiX8CBYG4MVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nxWWrwgf; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539eb97f26aso5474752e87.2
        for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2024 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729535752; x=1730140552; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19d9JqmERy8wz0g+70NGm4OlEs22Ls54XZkTeYTEsQM=;
        b=nxWWrwgfdio7To4XBomon9+kpUNw6gl74Kd22iZcxzMd6XcT41bi9d5dyULlLpnF2I
         dsKsD0PYtjctUJAal7oV5cDK1Vdmqh3bJ9YNC8hd9h7hQa/aHUdhew3e3Z83/ZMSDIoi
         ZYKGtzSWhLkWwrml6iwnnTJQ/W2HTvAm+6xeO2PfjgppWhnlH9suPc7jhm2pzOLIurOC
         MVJ0yDz0dm2bXSyBCMKTnuU+VX/P/fUE7/Gd8NrutqkizsYcJB5lkdrtV36TjKb15gUO
         6TSeALqU1N2EdR00kIgRQotzNHtUWHt8fu3AH29gIpglWYhEenGtxJi0O4TU+SSvGD0r
         p3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535752; x=1730140552;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=19d9JqmERy8wz0g+70NGm4OlEs22Ls54XZkTeYTEsQM=;
        b=jM4IMU0+V5KIFPWM680DCcq5G8jJK5eNt7Du00ej+ydF38LavCzL0Kh4irMVNftL1H
         1a7FaYgkl1OuP1KUpgVHwJRT1CLqXrhUmfdgCWmtssv4znqsL8XETdIa83ZVYpaKmDed
         J/rpT4ac5DuUTjc/5PfuBrS0WTHsCSu3qwwKt3lQi6aFnksBCsXKE/RXzKkggDCz9tXf
         GbqvGIwzzdxGvQ8ZdxYjBffakLJ6bGaK47zi4OfgsmE/MtH+5BwGrIebz3XDp8NPpnZ/
         o+SEIgBk3W5Af1th0VYEn361vUT54htkHpoEEycnu8AuDomeRDaUtYnzW2drQupiN9Ne
         OEYw==
X-Forwarded-Encrypted: i=1; AJvYcCX/Ix/h9ZGpYKtK5+UqO8uzOURAuCimU+xFJd7MipJ9bxpMfUp5SGiF+KPxYbUut13cuCvOEOPiWQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwztxPjvnYJxmcs76ums4YjbaErN1IpP73ckz87kPttzpSkR3S+
	zB3CxXKMkeMho6i3gYrEgazcoZBf6bz8HGOphyC4I94RRqv++nNJPbLDVdJhUCFhjdi3NG3hAi/
	8qf+Lc8Iv8OmekHu9nZaOS7Hb0HnaThDAx8TsEA==
X-Google-Smtp-Source: AGHT+IF+gDubjuYScG6wFMFgZ5bkhRmoA1cKGx4Ztvc02tP1/+UZZMZSZhT0kfcI60gxwVyM+mdOxaqOsJVzpsn4ZmM=
X-Received: by 2002:a05:6512:108a:b0:539:f922:bd4e with SMTP id
 2adb3069b0e04-53b12bfe281mr597447e87.23.1729535751946; Mon, 21 Oct 2024
 11:35:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241017184152.128395-1-marex@denx.de> <20241018132754.GA54765-robh@kernel.org>
 <3aa9e2f4-b1ad-46bf-a8c3-0d57cd3a7075@denx.de> <20241021181413.GA816269-robh@kernel.org>
In-Reply-To: <20241021181413.GA816269-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 21 Oct 2024 20:35:41 +0200
Message-ID: <CAMRc=McJ2_tT+iaLL3TMYPcMhSCLAWq-kOEvGzovuJfD+3MWFw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: at24: add ST M24256E Additional Write
 lockable page support
To: Rob Herring <robh@kernel.org>
Cc: Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Christoph Niedermaier <cniedermaier@dh-electronics.com>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 8:14=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Oct 20, 2024 at 06:29:13AM +0200, Marek Vasut wrote:
> > On 10/18/24 3:27 PM, Rob Herring wrote:
> > > On Thu, Oct 17, 2024 at 08:41:25PM +0200, Marek Vasut wrote:
> > > > The ST M24256E behaves as a regular M24C256, except for the E varia=
nt
> > > > which uses up another I2C address for Additional Write lockable pag=
e.
> > > > This page is 64 Bytes long and can contain additional data. Add ent=
ry
> > > > for it, so users can describe that page in DT. Note that users stil=
l
> > > > have to describe the main M24C256 area separately as that is on sep=
arate
> > > > I2C address from this page.
> > >
> > > I think this should be modelled as 1 node having 2 addresses, not 2
> > > nodes.
> > We had the exact same discussion regarding M24C32D, see:
> >
> > https://lore.kernel.org/all/CAMRc=3DMdTu1gagX-L4_cHmN9aUCoKhN-b5i7yEesz=
KSdr+BuROg@mail.gmail.com/
>
> Seems like kernel implementation details dictating the binding to me.

Yeah, that's on me. I would have known better today but 8 years ago
the DT situation was much more volatile.

> Won't be a problem until there are shared resources on "both" devices.
>

Fortunately, that could be addressed with the power sequencing subsystem. :=
)

Bart

