Return-Path: <linux-i2c+bounces-3463-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1624F8BFF54
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 15:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4767C1C2025F
	for <lists+linux-i2c@lfdr.de>; Wed,  8 May 2024 13:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059857D088;
	Wed,  8 May 2024 13:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhNgJ0Cu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA1182CC;
	Wed,  8 May 2024 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715176040; cv=none; b=e+Lnqnu4B7Bk3mKUPvUNRX1rvqBlGlqqiM9d8PnJe8aXBUC57q/TenufrwXwF9UY6RqQd8PTXHAr1SroQu5pWxV3NsHAyos5wCX79HpZtryx4iYrPM8QQldI4FQSKpy8G3nSMo0chnm51k2RUMo2yaPmJ4nfXTsHIUqd1uOC8sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715176040; c=relaxed/simple;
	bh=UJoC/0p60SVk+M5ckNWwXHQLVKtSVLLfbm9KWYn/b20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krveNA0+rWZ0w+1tLmgY/Ip/qg51Txcr0Hut8sv7/5Ovsww4ILaIvF7JmLZ3b4EMpAsP/nFc/tSwAlZpdaG/lpUg/FtJGKcJH7qvBQ1ozNK/qXFqDNtFOEWW+g0c+kqp9AOAyrtFIZ3tDKaawYTi0oLKyRbbQq9a6Y55vKMs+38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhNgJ0Cu; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a59a0e4b773so1059441566b.2;
        Wed, 08 May 2024 06:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715176037; x=1715780837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wteB/wo3Zzx+FC62Ax47MWkRwTrlGJK2z3q3lgZSSCU=;
        b=WhNgJ0Cu39Mft0lkpmyyx7Vn5k+vwVmlMLWNFBZAE8q3IEBn643ppF9IMd7mamX5ey
         xj4CXzfPZ17+74Hm52BFSnTzee1loz5sXaKN+TJPTbbPq6tmPjj8nyByj0WZCgrbpyix
         b/uNGFhmitFFuuYwEVLvvUIPc94aYuUxvCLrM2ryDnLohrUDpnpIvvxZpp/CrKOFHvAg
         XlVNVOv7GENpgQXJKQSkYVkYIOX2427lkwMPvhnh6Rf8yhBw96XbLgfbPSzjcI6BUFMv
         m8bZqBaBuxyWK/hoQgIYUlLp1oSzFyR3GlngRD9RSaZsOSCMylogoR4YF6GQ+WepzsuO
         RfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715176037; x=1715780837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wteB/wo3Zzx+FC62Ax47MWkRwTrlGJK2z3q3lgZSSCU=;
        b=GjD5ojRdT3BV37Vnm0wAj8n5HJdmDCEfCBRP4uTJcGPWYRtxqNd/xT3c0pGgUc37fQ
         o0bbd2WVU7/zwWsYVsRmF43oniTggoODXIEbnmd625WPNoO8oMIiAoFRQD5kUsSmhrlf
         d1HY9kM/nnis5bYGgkfajF7PwgGHjFOOKiR2U1vHmxrtwwwF3KrUpvQuywf5Y5jmlnKc
         z1km0Hbcg2nLe9gfQRFs1soY1h0g+len7Ft8wnuqHLuec31Vu74eyvehtit5tsFjppRh
         Mjjya1fDBYV/hoLhgmgWSYBFO05yRZ6OB0AYgfixfsviSuStGUDphSbJqkWcKoKLp8A6
         vsIA==
X-Forwarded-Encrypted: i=1; AJvYcCViBgTdl+VYDFbFdqcXtVWld1POmTP2yOkwyXMzjropCHiCcVjNNXmbPDhwyBcEBty4M3ydnCQQvYte5V3H3vHe1YKI6pfg4jeJ/EiysNOeOcLz8CNYTmv6OeG2HoYL/sLUyEx2I8nY
X-Gm-Message-State: AOJu0YwxFGMW4nyYu1UvF6QNef49hFcVmvauGobeqByRwRYSUR5A7lgx
	4q9YxXPrIO7nxcURwTdvmxuC8DX5UXXJlDISzS6crmKQ3Extuef6hseBpKd0DQZF3+NQ7MHKdaM
	Ogx7eGiQWKcJ68wulyJoS04lhwtA=
X-Google-Smtp-Source: AGHT+IE5JFtWo9bv5vXjP6j99UVH5GVAS8+biVz3lUNc0nsLzBwhrFsERrL36KOrYWpA0PTfFNxIvjT2wgJwEyoH4eU=
X-Received: by 2002:a17:906:ad6:b0:a59:c367:560c with SMTP id
 a640c23a62f3a-a59fb9dc564mr151760366b.60.1715176037437; Wed, 08 May 2024
 06:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240506154520.3886867-1-marc.ferland@sonatest.com> <h6mggdcri53rq65jzi5ov6n7oqdvaldtpofh6eina6gos2wyyw@crjmnmfpynw4>
In-Reply-To: <h6mggdcri53rq65jzi5ov6n7oqdvaldtpofh6eina6gos2wyyw@crjmnmfpynw4>
From: Marc Ferland <marc.ferland@gmail.com>
Date: Wed, 8 May 2024 09:47:05 -0400
Message-ID: <CAMRMzCC2YwHeizCacEW6MVPpS-nP14ev_ZHUW0rWjJaJHeAO2g@mail.gmail.com>
Subject: Re: [PATCH] i2c: xiic: print error code when xiic_start_xfer fails
To: Andi Shyti <andi.shyti@kernel.org>
Cc: michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Marc Ferland <marc.ferland@sonatest.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 8, 2024 at 8:51=E2=80=AFAM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Marc,
>
> On Mon, May 06, 2024 at 11:45:20AM -0400, marc.ferland@gmail.com wrote:
> > From: Marc Ferland <marc.ferland@sonatest.com>
> >
> > xiic_start_xfer can fail for different reasons:
> >
> > - EBUSY: bus is busy or i2c messages still in tx_msg or rx_msg
> > - ETIMEDOUT: timed-out trying to clear the RX fifo
>
> Wolfram has recently removed all the error printouts caused by
> etimedout.
>
> > - EINVAL: wrong clock settings
> >
> > Printing the error code helps identifying the root cause.
> >
> > Signed-off-by: Marc Ferland <marc.ferland@sonatest.com>
> > ---
> >  drivers/i2c/busses/i2c-xiic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xii=
c.c
> > index 71391b590ada..73729f0180a1 100644
> > --- a/drivers/i2c/busses/i2c-xiic.c
> > +++ b/drivers/i2c/busses/i2c-xiic.c
> > @@ -1165,7 +1165,7 @@ static int xiic_xfer(struct i2c_adapter *adap, st=
ruct i2c_msg *msgs, int num)
> >
> >       err =3D xiic_start_xfer(i2c, msgs, num);
> >       if (err < 0) {
> > -             dev_err(adap->dev.parent, "Error xiic_start_xfer\n");
> > +             dev_err(adap->dev.parent, "Error xiic_start_xfer: %d\n", =
err);
>
> I don't see the end user being interested in having the error
> number printed in the dmesg. In fact, I doubt the end user is
> interested in this message at all.
>
> We could print the debug messages (or warnings) where the actual
> failure occurs. For example, in the setclk case, a warning is
> already being printed, and I don't see why we should also print
> an error here.
>
> Does that make sense?
>
Yeah, it makes sense. My goal here is to add a bit more context when
things go wrong.

I've been having these _very_ rare failures with this i2c adapter and
the only trace I am getting is this "Error xiic_start_xfer" message in
the kernel logs. So it seemed like a good idea to just print the error
code along with the message.

I'll resend a v2 with your suggestions.

Regards,

Marc

