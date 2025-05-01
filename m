Return-Path: <linux-i2c+bounces-10719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB02AA5C72
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 11:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D74924C3019
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 09:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C8B221F09;
	Thu,  1 May 2025 09:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3P/nP0f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442D288DA;
	Thu,  1 May 2025 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090168; cv=none; b=hemAGjDWvXV+SRspAgcT7zfx2ZQgf7YASGK3xrV74KgYN8KJiqU5oZ1gLRSz+ZCmwPsluupyuZRvvnNTKP5n18XBrl5yuzwrK/HC3ackYLZI/MCGydDUO/kjf1FvOIvfL5B8Gilz2jPD1qe22/nPfSOktQSVoneFF0fAsCwgrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090168; c=relaxed/simple;
	bh=Z0djQjxdkhG4vVVS1uhIzDAJWy/7M3SViprXNnH/Dtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=T8dL2WtdQuFXcgu0j+lxMPVS3vbb01V3G39rdmaWK0s+tOfhiVPblwTBrrmojJR3RqZ0zNx64nfRbOcY0X57W4PTgOwcxMM/t5eGvsU7WEcooazBH5bzTUdS93r+QezQ4l55w1Yb+OWFXqTQXQZTMFXW1N/nc71JqrKlXbj4I9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3P/nP0f; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso420845f8f.2;
        Thu, 01 May 2025 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746090164; x=1746694964; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0djQjxdkhG4vVVS1uhIzDAJWy/7M3SViprXNnH/Dtw=;
        b=i3P/nP0ffK0xEj8um2mqVWkM2fSw2OnjYzfxpu8+fn4Qus1tpYLlqMVntsk4GyDw7f
         xy6oNEG2bCVWPx/de274vex7FzUaxm900jwlBPleOh8eHB00UBL80gA0RxR0rZhr/5xI
         +Lqt9vqayQFk8EgAEBZ0FmMA3+OVscz3xqtd1Ex6Hwwo2ZWRBOvCTrvrPswaM5wrNz0M
         o5RGZ0HAV3Hd7wk9WviB3u3gp14Jk2Q3/n0McPMLpkuHNooL4m8l4DGgnXTzpqQaJtXV
         Gcg3n9sUhDpbX0os32fjq3ZJYzA2p4g/Vg87AcdpJVUQaL/vaBnjdevcXFlskfpnaBZ3
         OgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746090164; x=1746694964;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z0djQjxdkhG4vVVS1uhIzDAJWy/7M3SViprXNnH/Dtw=;
        b=GOh4Y9/4kFU07cMNrTe5/5W8/37wvO3t5UyXEMAk8P8sgmSSLUjA1yen/TBSz7Z2Z2
         fAjZz+G4bv8rviJxZJ5sTH2GpmdlYl2nEeiU9klJRfaCNw/BA4nWTc4i4NNdF4UCG+VX
         M8KJ1acTtSuLfGbN6XIW5d7LvcS919QJFIz9znX7ZL0OIwL4qENYRLshHRQZsq/wrgim
         P30aibMFhCFpiA59maT+MnmzlxDM8qzkgKsIl0pgb3mvEZDfKxMQW1YkTppBgbENxbFv
         SXw7cHcYvLTp3gH93D6CksKT55lGRqLwpKrXp+lJijC7EMnECOZvwjuPrHFLE7P+6FBZ
         rEJg==
X-Forwarded-Encrypted: i=1; AJvYcCUEtQPqU+bZvpi18w9iBouf6s/SBCfeAlnqAPNwn8NwZj7ykd7vrD1PTKs21PvwClZcZcCR2CkPTqC1gRpJ@vger.kernel.org, AJvYcCUlIy35e4G2YnIVvIwa06INgQSLqk75MKivfnwW1FmxpLjspuJKA7xYytoZC4Dq3EP54GNtvJwxmjmm7z/y5duHCaY=@vger.kernel.org, AJvYcCWaolWym1ygqOd3TEUYWpwLwkBMvgiJ3E3pZagy88b5UwTUWH2OTS0EcyZHAtZKrSEBgz5dJ6aaSUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMWoTNo1hgUkg8BjD41XDVe/Rr4UuQFigCZyF3eZQHg2LB3vkr
	9tREdO4XlqEvDsfeeOzcPtqbaUTMIzv62KYAjhZekmnYjFGclwZoJCwhDWVlTeKNkeNuU8UGaW8
	4E/LXp0vK4M+LdhuvfImioWh+c1xsD031iSI=
X-Gm-Gg: ASbGncuRBarN4kSn3zW0NI/DGU9qCpjKscr9k1g0CezOAK8maMw4/eeu7qv3MvMvcUM
	i8FYeMIzTzUOImw/m1K/Zr5zJzK1mKbG/9CovHTRJSWJB+nhVUZhMO2JvAtuZNtMNda63mMLldD
	3KNAeKx3k+jG7Bu2gwJP2oZg==
X-Google-Smtp-Source: AGHT+IHGb1/CXknd/+CZ+q+Dk1/Rttb+ctd1LTyGXsEcnkmKUPDn89n4e7eUzxUtBlCjXD3Uo9haKpMTwGLTmsoY4Dc=
X-Received: by 2002:a5d:64cd:0:b0:3a0:6ae3:a1a with SMTP id
 ffacd0b85a97d-3a09404cae6mr1195041f8f.23.1746090164111; Thu, 01 May 2025
 02:02:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430194647.332553-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430194647.332553-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aBKFWxIRaa4W7TDf@shikoro> <CA+V-a8v5qFC+uxzC8Qw4F3M1XSFnVq90MWxbvmiRks=ZbkzZjw@mail.gmail.com>
 <aBMpjKtQYYB-teNt@shikoro>
In-Reply-To: <aBMpjKtQYYB-teNt@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 1 May 2025 10:02:18 +0100
X-Gm-Features: ATxdqUG9Jh624LeCKraAtGmTg0blNv-HVvQoE3BTxD_xFYY0aFCLpbyOU3qV9tQ
Message-ID: <CA+V-a8t8AApJTgF8Zc3w+JjAu6yPvzUEgTo0g+1H+6GhvJUdbA@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] i2c: riic: Recover from arbitration loss
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Andy Shevchenko <andy@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, May 1, 2025 at 8:58=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Do you mean that upon detecting an arbitration loss, we simply clear
> > the arbitration bit and retry?
>
> Yes, after the bus is considered free again.
>
I'll give that a try but in my case the SDA line has gone low.

> > However, when observing the SDA line after recovery, it goes LOW again
> > during the transfer. I've attached a screenshot of this case: we
> > recovered from a bus hang, the I2C recovery algorithm brought the bus
> > to a STOP state, and then a START condition was issued. But after
> > initiating the transfer, we can see the SDA line being held LOW again.
>
> That looks weird. Why are there two SDA transitions around 30us? Why is
> SDA changed while SCL is high around 45us? Then, this small SCL spike
> around 55us... What device is this?
>
From 10=C2=B5s to 50=C2=B5s, the clock pulses are part of the recovery sequ=
ence.
The SDA line is likely being toggled by the slave around 30=C2=B5s, after
two clock pulses. At 45=C2=B5s, we are still within the recovery algorithm
-- SCL is set to 1, followed by SDA. The recovery algorithm then
checks if SCL is high and whether the bus is free (i.e., SDA is also
high). At that point, i2c_generic_scl_recovery() returns, assuming the
bus has been successfully recovered.
Around 55=C2=B5s, the transfer function starts attempting to send data
hence the clock pulse.

The slave device is versa clock geberator 5P35023 (exact part number
on SMARC RZ/G2L 5P35023B-629NLGI)
https://www.renesas.com/en/products/clocks-timing/clock-generation/programm=
able-clocks/5p35023-versaclock-3s-programmable-clock-generator?srsltid=3DAf=
mBOoqlLSt_ul3hLh7NHYlCShXsnH-QZf90uSdoxZXI_Pre5Qg7soD6#overview

Cheers,
Prabhaka

