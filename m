Return-Path: <linux-i2c+bounces-6308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E98996ED01
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 10:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B7BD1C22B02
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 08:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070CC14BF8F;
	Fri,  6 Sep 2024 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAgYB4qw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C8F1A28C;
	Fri,  6 Sep 2024 08:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725609694; cv=none; b=Qyz20WbXjiwHIYoV2OfP03jfTNt5hbFypC9ilhl4igIZGHJfocxpwGcGSqw3KocQQOQDOiGdn/Q+xmIoI2OiqG64xUmGbT6MWG8/pJO/f81txdBPa7slVQJC6ifly6CP6bAgRUoxWjpF8nxhyBmAq0LMWYS8akZGzjOQpuab8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725609694; c=relaxed/simple;
	bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOUlS/Uwa/zQwBw314HS42V6K1uX7Bn5ol1qlwqGaYMTUS3t59/wNtH2w5w3y+jZdwDZk3TtYWmCOrpCZ//U4xIgvmHz5n5eCsYjuI507iuq/8W3M6EqHV5iWsSfij69767KD9hCHd9d0AHYkxbiYcjGbybPpiBqp2e4Jexa8zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZAgYB4qw; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c3d209db94so1417590a12.3;
        Fri, 06 Sep 2024 01:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725609691; x=1726214491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
        b=ZAgYB4qwvU6BGQeSONaKU7ko8Y2Fl0NaHzOq6sOJCSEVm3G5HtM4z3cNlVy55WhtPe
         lPeEnZEs1IPOp0xppuqGdJciTcQA0pcnf1JCkgU1Gr3j2Qu/GgLSs2c4ng0sxOY4CS8P
         +EgXnwwJTdXuN4r+YNPBCUmHSqzfycuhmst2/h0ygJG2l2JPG2oQM+twipIkrgyU8Ewz
         R13YrDSc9oPSM06Ti+nunaZ3uJwBApg6KKFaST0Bay4AFFhANLiJ99aoBWUFjVPnKFj5
         bJXNye+R+hVW7m+Hl++MznQdnyYyBPXnFT5gpU5IHyiNzFNfEf8TlcjVH1b4Bj1dn1W1
         Qx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725609691; x=1726214491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2utWfBFe4M/uAhG/mbeNIzfoaB38VL0KOKjTpL2+30M=;
        b=oIq/kTA54vWvWeTkqasIqRlWHHiRIoSZS72xbAM7CrnvuTaEI3ymoiucRDnJHIb+1f
         8Tj1rd4R3xGLUJ5RYsmhQbguDsFsSSIdoKQX6aHqYLID1HF371ixl2DAw8iawpmTIhdx
         flWGcuF354yD93ff8LStv9vrV7tjaY0EnGXUf/7Vazyl8dYrYWpDM4qILlHAoWtVSY/A
         iZ7pLsNSml74BNhEob7vwU2Mksy4KnfofClxfwkyc55wiLyH+2F0ML4RXDiH2uPtErXm
         WWXa9mA8gLJI1KbmqvwDdnFbzr+bUVTARacKJmpfnj5jc1Sw35IU3wten3dBOs5QViOg
         vnyQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/JDD7eXZbfhBlUbTN1MaZMrSe+mzz8pgWhOKjM6j75oFvYPszv8sjGs4J5YJviUA+vR+MB+cw1Ts=@vger.kernel.org, AJvYcCXLHkbPJxQTMN9a/KM+AvA8ysrqlo+NfsESIUB/swmvE5lZ0SKs/PMLntlemwG8Ph53jrC+I4b55jhiUG/q@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkibd23eDDhH1Ul+SjOxqI+dLnkF8pRkV1KBejCLCLsS3p3Ma6
	MxMsXdHirR+5vyAo7YV+MjyYmMFYBCip7aqyUdChGVNu6XORGbbYezUuMwkfGpAj5JigRT26ycy
	12YAFLwB4g3AQwvAAE8lzGY00YMHjuTU=
X-Google-Smtp-Source: AGHT+IFaK/Sc02N/SttRJy/FczDOr34Kkr47PNs58c54+IJo3F577WuXb4byWkb9fTG1oIEjYSvR2h0idCrwUKGTwcE=
X-Received: by 2002:a17:907:2d8e:b0:a7a:b73f:7584 with SMTP id
 a640c23a62f3a-a897f92014bmr1930227866b.34.1725609690498; Fri, 06 Sep 2024
 01:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830034640.7049-1-kfting@nuvoton.com> <20240830034640.7049-2-kfting@nuvoton.com>
 <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
In-Reply-To: <6tyecc6mf6fnfhwydac2e6ncme52qtj6pyhqhcbbo654xgtibq@txvlihb52dxn>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 6 Sep 2024 16:01:18 +0800
Message-ID: <CACD3sJZBqzQg+5gKiDQEpDst0OKPERkF0z6vnfQSHEAhVpPtEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] i2c: npcm: restore slave addresses array length
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	andriy.shevchenko@linux.intel.com, wsa@kernel.org, rand.sec96@gmail.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your prompt response and help.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B49=E6=9C=886=E6=97=
=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:05=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Fri, Aug 30, 2024 at 11:46:34AM GMT, Tyrone Ting wrote:
> > The smatch check warning is "buffer overflow 'npcm_i2caddr' 2 <=3D 9".
> > The original design supports 10 slave addresses although only 2
> > addresses are required for current implementation.
> >
> > Restore the npcm_i2caddr array length to fix the smatch warning.
> >
> > Fixes: 47d506d1a28f ("i2c: npcm: Remove own slave addresses 2:10")
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> with the changes we agreed, I merged just this first patch in
> i2c/i2c-host.
>
> Thanks,
> Andi

Have a nice day.

Regards,
Tyrone

