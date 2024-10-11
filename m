Return-Path: <linux-i2c+bounces-7345-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD0599A603
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 16:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A4D7B268C6
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Oct 2024 14:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721E821D182;
	Fri, 11 Oct 2024 14:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRRSdftS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151E21D187;
	Fri, 11 Oct 2024 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655859; cv=none; b=jkXC744UAbs3Nh/3XmPM4swv40/QjKQec5NHcSCmo8HhmMhvqGDUh8F4ngBB5Jq6hScuF/GHQxyMcQGIALUC8Zip2KxzKHOEuEPVaRY5ZKmj/fK6HMrXekKkEQ3baPAAML45XBYtkfEs9o+qGVZ4V7CXkkLXwde8djuXSQQThhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655859; c=relaxed/simple;
	bh=GPjgRl0dDccu/pNWWwulBtG8/TZjOyjqQie32ZkTW3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ffo1Hsa7+5JQoUmmYeVRC+VLX5cR+spz6MekWPDqDFORswD/uRAWFSclldQq0woUZasoVJP30uGEQDorOjK/jdNr15KU3QTgjV+RmjR1WrHLkxkezq/WceXkoyrDB6nExKBm7heXoVHbFDQmI6xHMVswXxMSXJpeNpct0kEItX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRRSdftS; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a998a5ca499so294394266b.0;
        Fri, 11 Oct 2024 07:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728655856; x=1729260656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXo0pIJugni3PGreyejzU+9DDRAp+EZRDdgwqzItr5Y=;
        b=iRRSdftS2Y+4TSckWrLM+TGc3K1G9PRSmqaXbCJ0a31NN3mRpqKLjZBsKxQzN5cBJz
         S9IZs5YCQsefi5pcUKs+1m6RbdICkYCNLnuydM4kTFXi7cdD0pSaSXJxhzKzh+5onmY6
         3U3NTZwBD35uMm4KA42xIYaA8OhcXSiy4jmMhyVXT6dK1YeKHTjeOO1qNNgzoEI9tj+E
         se1GPvFDIMNT4mFA2A9/MR/58GDPJfGOYPnifAJ2CcuT5YR7gp9QMMk1jvHfhIp8VTy1
         FAMUrzk0gwhTuEjcfB2AuHu9cokLQTHl/AcUSMaE8Suzv4oAx54c7zY6Ojo1+oGuQqbG
         QGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728655856; x=1729260656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXo0pIJugni3PGreyejzU+9DDRAp+EZRDdgwqzItr5Y=;
        b=sRnCqmkQpWlxkKRdsJSczqcBq0b3T48lgLH9iBZSsgmEPXC8Ab/XuYoVnz8zjgHl39
         MAoowiKv9SkPbjCsGqExoRN3lmlLNwVkpv3iKGtptb5dpEEIkTqmjt9snqcrAHN+s8xo
         8j8Z7/k7M6MEF5YWSwc5SZ9W0nM2PPslDYdwiW/gcNj6PayU+Sst1hbjb1SQ0I5Om1n5
         tApfBbCAXzEJRZ4TPVMGrLP8kLATtCn/UvFnzd5ozbwePu1zKnbPEHYcLzAdcfJ9+nKE
         2Hlehisg1/+az2nGEwu5j6VlLpROdo3Aak7OohcuhNp/qRbKM/furT2alnmmREEvXk9M
         Q6hA==
X-Forwarded-Encrypted: i=1; AJvYcCVH5Pl7puWbagh64ANEo2QZTizR5E/PyVeVxfw6a+Q1VkBntu5epUn7UN3MUwbUHdiBsjYteLG5E/A=@vger.kernel.org, AJvYcCVnVGQsw1Bh1M2kpjLFWXKvCbObsev6jN9WcTuJTUC/vTcoXfBOcr4RRSb2sdpmYh5ruS9y0u4fSVa7dekV@vger.kernel.org
X-Gm-Message-State: AOJu0YwvkaMhV52QM2Ry42ZjZirDkghda4qJhi3VGTTibom4raSaeXY+
	XEa2Khbd6rsuvRaqpcN6OF/LhD1+Tmsl2i8NBUheem+W9gDI/XL5T0Graa49zmeSAr5lgs8F4z2
	fkjP/PuRfWW470hGDlGzKf855oQ==
X-Google-Smtp-Source: AGHT+IEGhgxhknhFM8Bp/09aaqR8LI8wYEzwSlOZYTef32VMBfIrkXYcXxlYMuSyrISu+q7c2LNU502hPZSgM7rAVh0=
X-Received: by 2002:a17:907:d3e7:b0:a88:b90a:ff30 with SMTP id
 a640c23a62f3a-a99b9583146mr234695166b.50.1728655855881; Fri, 11 Oct 2024
 07:10:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241011055231.9826-1-kfting@nuvoton.com> <20241011055231.9826-3-kfting@nuvoton.com>
 <ZwkFWVC3_5xr6OQW@smile.fi.intel.com> <CACD3sJY_79_VTe1EHPdh-1+FCBwb2KCW_N19==TMHAsrFL-rzg@mail.gmail.com>
 <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
In-Reply-To: <ZwkvBFHS1m3N2yoW@smile.fi.intel.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 11 Oct 2024 22:10:45 +0800
Message-ID: <CACD3sJaNe71Jr9isRdBp1Svgg6ULfgVfUFGkw2i=mELmNQTr+w@mail.gmail.com>
Subject: Re: [PATCH v6 2/4] i2c: npcm: Modify the client address assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andi.shyti@kernel.org, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy:

Thank you for your feedback.

Andy Shevchenko <andriy.shevchenko@linux.intel.com> =E6=96=BC 2024=E5=B9=B4=
10=E6=9C=8811=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=889:58=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On Fri, Oct 11, 2024 at 09:44:42PM +0800, Tyrone Ting wrote:
> > > On Fri, Oct 11, 2024 at 01:52:29PM +0800, Tyrone Ting wrote:
>
> ...
>
> > > > +             if (bus->dest_addr & I2C_M_RD)
> > >
> > > Redundant.
> >
> > Just to double check. Is the code "if (bus->dest_addr & I2C_M_RD)" redu=
ndant?
>
> Yes.
>
> > > > +                     bus->dest_addr &=3D ~I2C_M_RD;
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Have a nice day.

Regards,
Tyrone

