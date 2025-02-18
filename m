Return-Path: <linux-i2c+bounces-9482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D1A39B78
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 12:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671EC174C06
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Feb 2025 11:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABA323ED7E;
	Tue, 18 Feb 2025 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IU9Y90Y8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E49F239563;
	Tue, 18 Feb 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879545; cv=none; b=FBNCbe7KBvbZhsRdRCu+M719pVqLwaBkIklDVOWwSdQeMOWu8KQM/Bw7Y8DGGHUzGnr1BQeBCdG1jVYW/tkzi76FNWRXB2KjcNRvfwh97RpiydNtVg4Cz59Bw8GsS/wsi4kTjhfvsI8w2EwSJR5eUzmZ8crj7KGHwzydKmYgZ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879545; c=relaxed/simple;
	bh=LMbdQ722oF2bBggs0mcqOmuW06AT9TNi78b/Vj3zpG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DH0B+1Z50U6y/zDzpX7C0XqVN7d7vezkijCAZVbVUNAcxoicQJRAwvMnOSwdg+PEX42aFN6uijBLX9acYSQMq1E/B6lJxyEOGMKUR97lIa5i2lByvHyinszr2NGwIRHN47Hh7FwWuDefwm5vGkRXer7E855sabtgYUZ4/g+7i6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IU9Y90Y8; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e0505275b7so3832802a12.3;
        Tue, 18 Feb 2025 03:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879542; x=1740484342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfV/B2dEJudDb23dydC4glueP1Q/G17UcuWW05BY26w=;
        b=IU9Y90Y8c0mK2FaVzKpsF/SDYslW9eUAZQIjGCkGOs9nrzk4Y0UCL8LyzeKYhwMsCo
         bff8SwLb+lJjh2v7P+RG/FD7OT+aea9iwgsakdnGxs44duI8cbZTe86tyuDXRJP4CADl
         XXWUR8lNAZN/88iOfqWkoiGPLFGbwWxCXtjfRn/sBUMg5ckC4Hfp9yPuZIoxVYRQfk4c
         DJNaAxY/SU2B6pBjGGP4j8n78eQ2jtAc5uJ28hSQIRl6C96/DVDJZSwYo9R+bdY7Rdbw
         4TPmAPAQrTKEgMwjMPzDzVsaeAc3QjiCIw+yVv54c8ykNrrhjMde0ZAhkQDWTlEsUgZZ
         dYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879542; x=1740484342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfV/B2dEJudDb23dydC4glueP1Q/G17UcuWW05BY26w=;
        b=tLYYchVFGpB2eMiIeVYZsBwtD5MYfvEu0tZEfgvpLNYdFNyJwZPZeO9a019O8yBexQ
         w1Dz2uVanZeHfLO9zFvC2rBJnHF30+j8iY1jN68CVFqqgJIjRVjAruoRmQWtZSIGMg6O
         LbLgMXzk0W5F7Paomt8MosuV3STfy3lSngkgolWLHx76b3R00U9LkukDB7ulIzHfcidl
         L5FW2rsgFDMSdgcjIq06YXzhRAh9SX47hUsLlJIxyFa4N23mY66hY/Y5vS+XIbmz4ZHv
         AmfMVoTftT1q3o9bz8SPlpdL19JvTPbYEoBUf73CsjqzAVlUiyXYNdw2HJee7oxI2in0
         vrcA==
X-Forwarded-Encrypted: i=1; AJvYcCUwmXW63mRkKA8MrPS8wPlsRTzUcpBAqp5pAnE1ix6EIduSpPX+2dPtloTkQunEFldrshqMHGT7@vger.kernel.org, AJvYcCW4IhYIlyKbTW1Pdm5X7zSpYOoXzfx3uZcz8y7p39Us7vKqzNJm49V+sVoMtFM6StaGUZbJTd+nymk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvre+p29xT7XAUM+bP2xzIMMya41ZkkEYs1SyeogDyfJ8Bodyo
	E5WwHChnrmMpB10Q83MKsA1hDPESS3yhSopN2kIevsE4uOVz4hC8PYXkiIOEopLsm1Jv6/3yJLC
	hTcBqD7y9cagKCZhmLmTzoctBY0Q=
X-Gm-Gg: ASbGncshK2wSZqe+CpfOpbhaNpue1kjWDNqWrvKz9PxurTILrZDczQZ0AuxHJsi/f1n
	2/TaeJuHYj/ze3WrOz/Wb+kk7dwO3UWEWLcrzXc7Q4LyL/dUFCz+wFVGUEQH9MpkV/yD5OFO7UQ
	==
X-Google-Smtp-Source: AGHT+IE+3aDBOwQVKDSZ+vM1pc4gav67Z+fWw+dHKzW8xuLIWRTTRe+hxMk5TL69LpCk+67wiznaMJio1qQeCI6/+XU=
X-Received: by 2002:a05:6402:2753:b0:5cf:e9d6:cc8a with SMTP id
 4fb4d7f45d1cf-5e036216f84mr13165127a12.20.1739879542302; Tue, 18 Feb 2025
 03:52:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218111133.3058590-1-zhoubinbin@loongson.cn> <Z7Rv-s4agg0vVO5P@smile.fi.intel.com>
In-Reply-To: <Z7Rv-s4agg0vVO5P@smile.fi.intel.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 18 Feb 2025 19:52:10 +0800
X-Gm-Features: AWEUYZk81laEh0hbWEMPPVQmqph0hfw1fN8MU2NMd50fcvvaeZ3Q_RGIHLuFcZo
Message-ID: <CAMpQs4JgCBF4=woNgMaLbr=e6CHY=ChzW9ev9d2GSL+ORcydcA@mail.gmail.com>
Subject: Re: [PATCH] i2c: ls2x: Fix frequency division register access
To: Andy Shevchenko <andy@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	stable@vger.kernel.org, Hongliang Wang <wanghongliang@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thanks for your reply.

On Tue, Feb 18, 2025 at 7:34=E2=80=AFPM Andy Shevchenko <andy@kernel.org> w=
rote:
>
> On Tue, Feb 18, 2025 at 07:11:33PM +0800, Binbin Zhou wrote:
> > According to the chip manual, the I2C register access type of
> > Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> > form (readb/writeb).
> >
> > Although Loongson-2K0500/Loongson-2K1000 do not have similar
> > constraints, register accesses in byte form also behave correctly.
> >
> > Also, in hardware, the frequency division registers are defined as two
> > separate registers (high 8-bit and low 8-bit), so we just access them
> > directly as bytes.
>
> ...
>
> >       /* Calculate and set i2c frequency. */
> > -     writew(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> > -            priv->base + I2C_LS2X_PRER);
> > +     val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> > +     writeb(FIELD_GET(GENMASK(7, 0), val), priv->base + I2C_LS2X_PRER_=
LO);
> > +     writeb(FIELD_GET(GENMASK(15, 8), val), priv->base + I2C_LS2X_PRER=
_HI);
>
> Now this needs a comment to prevent from appearing a patch that basically
> changes that back to 16-bit write.

I will add a commit here.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>

--=20
Thanks.
Binbin

