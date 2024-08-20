Return-Path: <linux-i2c+bounces-5578-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8606D958153
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 10:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40525285B79
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Aug 2024 08:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22915189F3F;
	Tue, 20 Aug 2024 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1u5GWxB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E67518E35E;
	Tue, 20 Aug 2024 08:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724143700; cv=none; b=OObgkIZ/Udu3tdAOw2VTpSWxeIqjUGM7DB0qC79WLvbAsDvIKw6+SOckGHGsj0tnXR7HmRWWRpTSsPoL8TdHPwyn5+3NW4GJ92Fn2QSkXz+FEhQHaE/GyBuI/hjXx0MD6FsOKrHYl3Z2oT5rMd1lGofvokv8tnjyWhqVdl5ZjTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724143700; c=relaxed/simple;
	bh=UeY2RtMbM0Ha5Jv8cKfkR+w5vcxxTRVl6lU+spRFEC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ho1e81tTk8/k2kZpavcMyRBwlvngzjaXMxRpq9cjHtXcCnJ/CQTR3SD14VC56mxwchl513XLdYF5P8yP1bLRYezXf9HuJaEjA/QB0FaPwkBVcGQWHU+aVu2tDIv19rVlWdFAZNESf12QgO1AwRDoR0WtVLBt3o3obFGw6gyI1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1u5GWxB; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2d3c05dc63eso3845374a91.0;
        Tue, 20 Aug 2024 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724143699; x=1724748499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t/uNXXnv03CIiAzfZ7u4tK+ugMMRPPralmCSVLDeJRM=;
        b=h1u5GWxBGsrQK1ZbUfUZEtoIjceNsEQl4aixKurfHC+Ojhluk1tRa7FkCFlhPLrNYx
         hBqXcUKp2s/i6/LD/hmgqnnfx5HIFbgv7S3lHMSdOD4RusewG+94jY28aYT7b/+43q2E
         Me9Faa0jkgRCK3pGcIKePWRGalNSUNXIuYVr5SYUxQx8Yhg65mQHOXtxsLxkdxuKEM5w
         +ozhgokKO23YGa5dO3+/vKYmAXSWgVBNu3k01iQpCDV3yymMqieRekBI69AqsRNXi1I3
         QMPGo2B7D6nVt1h5ZSu6s2bwhD6kpJZ0pe4w1y/gkAreIm47aN6g2Pv60xgsybrUwEcN
         18iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724143699; x=1724748499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/uNXXnv03CIiAzfZ7u4tK+ugMMRPPralmCSVLDeJRM=;
        b=OwZVDNBRNtUfP9AdRU5Cin3GUlt2KEsa7yPiDo2yGCme0TOSboZHYNtkPHillo0hEz
         aK1rMZi8GRJbpSDXIzEc7Cf/D5T+Q/Lp3EMkJRtSvDYnvXN5AiOZ2ZzNGSnddSf51bS6
         SPX35X84ioaCFzot715rDifxs0Wf9bNcf9rm6zlifITYVQEXKKi18BQauwFiskD0moqT
         gPohwMbUvFnM5UEZH0kNBBCd1LuK/UcCLpqXQEqb3IVwP7t8maW9vH7Ut2OdzFIRT1G3
         zAG2ES2c5xxJeI/QcwZNCOtMJsRH5SL0A+gaCVYDT3IvliNqsLr3Eed1dQK6i4hDTCEF
         UGrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsKRxWwR7itnoOOKaAOdR7XleYjYEfxLtMGHAk2yBYofkCBa4wgcT5RxOxX4gtkFFvpXaNHvLp3CHml2vUgQWCtte13/ed/Q9nEARjyRmS+t55btQJiRHTlTwr5EhQMMPXiWETZ4AU
X-Gm-Message-State: AOJu0YxEdyJ9hnWygT6mSMIKklEH8uXogRVwAFzR2Y03kqwUzzfVP525
	I5En4s8leKJN1V4teqYx//el6n5DbIoov7qKY+24BrTpxquAlW+yJ0tR8WcgFK9BMM5WdrYZGwx
	pre43RE/XVrhFvy36zh7M35cpXb4=
X-Google-Smtp-Source: AGHT+IGl20eaG1MSKchcVc8w+aDbhG9xyfJEjgu/4Qv0nlMLVTGvqcOObec3KUVkSVYqX1Txnb+mTysBBu0CbTONrHM=
X-Received: by 2002:a17:90b:1910:b0:2d3:d0b7:da4 with SMTP id
 98e67ed59e1d1-2d5c0dd48eamr1622384a91.19.1724143698501; Tue, 20 Aug 2024
 01:48:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240814184731.1310988-1-mstrodl@csh.rit.edu> <8d8b1967-1d41-44d9-9791-d7809bed269c@bootlin.com>
In-Reply-To: <8d8b1967-1d41-44d9-9791-d7809bed269c@bootlin.com>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Tue, 20 Aug 2024 10:48:06 +0200
Message-ID: <CAH9NwWfZQ5G798vYOw3gVa4WBsBSmcjLKONG3u9SiAtwf5wdNg@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add support for Congatec CGEB BIOS interface
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Mary Strodl <mstrodl@csh.rit.edu>, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org, 
	linux-mm@kvack.org, lee@kernel.org, andi.shyti@kernel.org, 
	linux-i2c@vger.kernel.org, s.hauer@pengutronix.de, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

Hi Thomas!

>
> On 8/14/24 20:47, Mary Strodl wrote:
> > The following series adds support for the Congatec CGEB interface
> > found on some Congatec x86 boards. The CGEB interface is a BIOS
> > interface which provides access to onboard peripherals like I2C
> > busses and watchdogs. It works by mapping BIOS code and searching
> > for magic values which specify the entry points to the CGEB call.
> > The CGEB call is an API provided by the BIOS which provides access
> > to the functions in an ioctl like fashion.
> >
> > At the request of some folks the first time I sent this series out,
> > CGEB has a userspace component which runs the x86 blob (rather than
> > running it directly in the kernel), which sends requests back and
> > forth using the cn_netlink API.
> >
> > You can find a reference implementation of the userspace helper here:
> > https://github.com/Mstrodl/cgeb-helper
> >
> > I didn't get an answer when I asked where the userspace component
> > should live, so I didn't put a ton of work into getting the helper
> > up to snuff since similar userspace helpers (like v86d) are not
> > in-tree. If folks would like the helper in-tree, that's fine too.
>
> Hello Mary !!
>
> It was by pure luck that I found your series.
>
> It seems we are working on the same thing, the Congatec Board Controller.
>
> I sent a first version of my series few weeks ago [1].
> My implementation is very different.
> There is an MFD which maps the needed IO regions and declares cells
> (gpio, watchdog, i2c). It also contains all the code to communicate with
> the Board Controller (using ioread and iowrite).
> The DMI table is used to detect if the board is supported, so the driver
> can be probed (or not).
> Other drivers (gpio, i2c and watchdog for now) use the API provided by
> the MFD to communicate with the Board Controller.
> With this approach, I don't need a userspace component.
>
> For this work I used the Congatec driver (that Thomas Gleixner pointed
> you) as reference. But as mentioned by Thomas the driver is not well
> written at all.
> By the way their latest version is available in their yocto metalayer
> (please find the link in my series).
>

I'm glad to see that Congatec has taken a different approach with
their driver and
is no longer relying on the BIOS blob method. Years ago, I shared my
frustrations
with them over this outdated solution through numerous phone calls,
but the company
I worked for was simply too small to have any real influence.

> For now I did the job for the conga-SA7 board (which has a 5th
> generation Board Controller).
> So if you have hardware which has the same generation of the Board
> Controller, you can easily test the series. You only need to add the DMI
> entry of your board in the MFD driver.
>
> For other generations, I had a quick look. The sequences seem very
> similar, with minor differences. It could be easily implemented in the
> future, and only the MFD will be modified.
>

Fantastic news - looks like all the pain with this board controller
under Linux is gone soon.

-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy

