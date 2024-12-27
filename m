Return-Path: <linux-i2c+bounces-8737-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AF69FD060
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 06:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ACD5188379F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 05:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A0A5336D;
	Fri, 27 Dec 2024 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N2QCoUGq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DDAD21;
	Fri, 27 Dec 2024 05:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735276194; cv=none; b=ZeyhEJboIgDqy4+jtz4s7GhP9Ps5IzAEJ3y5I5CgnFgvB5U05K23ZuMuJldvvVAqu5iosd/VtRG5WI6H6GYZXYq2IpDImGOVPPsWwCnRtvURATWpv9KP0td+9thqXE0powNrxr0t05z3edSaVq2xh9iC1EUdfNx4JHOQ2McfS6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735276194; c=relaxed/simple;
	bh=74R5ljaA6t3VeyB6+LwfTdbd4e5LCdLyVqJyvaURsvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KgWcQvKA5i5hI9rIdbLTXopVpuAKBAxA1TFnJYWsoojrqxFY+KIirOc59eNPfxW7YlJ7/Cfj/G6VNP4MJSXbR03cMPcxjeiIZxtR9DA2QxH8Gjg+6rW1ttH0kxvHouR9e9juOcovvFHIi5lK2XNUGkebJegP96cVKvyIp4DaVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N2QCoUGq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so232236366b.3;
        Thu, 26 Dec 2024 21:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735276191; x=1735880991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jkA6lA8RReLTwKfbsn0vhV1ONgCxkz1Sn0d6TO7kAbs=;
        b=N2QCoUGq6IwwNJk1oVKoFseIropi5SdDOr6nPvzdE35Ftt6QyqXz2YNyVfJ/wHEeNk
         AWhTLI4SGaRi3cAVXTANAfSNvRdBxGBenkA2nrUN4BuVB7HvePStw/AdA5mD2VK3efFr
         1ZiJCZvBf+b4pqcBaV+RQ8dqW9EXyv/6ropWQgoiAxyYt6C1FyZsCyJbt/zZYD0HET1X
         McqcT9YSWnJOYw3Z9gkXx6ehq5L9pXkAGIm6jX6RCuv/AL8sfVN0r87scNUnQ03l0vyt
         6OKDiiCzMHFptHCriArBsxDAFsWRUjTK4Z2xHif+925Dluw7ulTprg/+ci6Itb+NWP7K
         UODw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735276191; x=1735880991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jkA6lA8RReLTwKfbsn0vhV1ONgCxkz1Sn0d6TO7kAbs=;
        b=baPDr7YMd9AOEeWcQzoTD7Fn/k/hiFlBu7Sbvpb6GBg45UWW59YPOyMb70MQlDEmrj
         PBQayx30LZ9X46/Wq9k36X6gCL1iWMxOBEfAW0xdHgHN0x0K+RLPXHZnlR9EfmzC2OWh
         kOw3vIn3kyF8/PdAfEJ8NnzS2bXoRz78lWttw70FQ51O4SsZXYZwSVLpli21AtbL2RcI
         O71x+Uevq5dbnlv3Vcifp5GXJcacnQDoABMW+c6/zohErtjVAStV+4FbGOFfRVQOjscp
         YUgSi0omZQeiQ0f3hF49zGMLlAtxUcsQ4LQ+pAw5CHIsgQbSZKYK25K1jil4RTCazsHX
         UrdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjpKiXF6FG3hr4xhqeoz/bW2XPW4oH/Yw8gpFZATnj1MOP8gdWolFDCcg2Kx/OSJlVXdXrn1j2jKs=@vger.kernel.org, AJvYcCV8dz2dDAdnEI/gJ7gro/iddq3gFjgsihiH/YfsipSCCm7s2ZZ640tFe6ezAJVEApXckieF3nu1DaS+jstN@vger.kernel.org
X-Gm-Message-State: AOJu0YxNDg8XKkbVp2Le/FI3RU2eV8MTWkjX3Qt55NnpG+95j1aoIXln
	lfXq7FDthRZkGoNjqIEKZ/VbdvbWEHnQHuwDolKghPbThhNEAsBS6zm9PCHlMNLaUmqRlAoP6zC
	ae2PiGoMOcN1jb8u+Wj4NmzjNsQ==
X-Gm-Gg: ASbGnctNw6+5U4eH3UZgeJlcFsGZ2cY/AIvu2S9iolc1ZyK2/AOCiAW4xtauwYLt8ex
	haBBa9++hFirfCHqsPR0EHA/q4v8yXG44cvlUxlvgxTdOWasgvpyIKwaqQX/DhkW9UOqixw==
X-Google-Smtp-Source: AGHT+IEds2dZaHEPeu/D6ebVHi4huNz1VbBxEqE4a5w9T8VrokPShR30889qGxR9zDyTpipR+RaXcVthIWLNtZjlceY=
X-Received: by 2002:a17:907:2ce6:b0:aae:c9bf:41b3 with SMTP id
 a640c23a62f3a-aaec9bf461emr1262225466b.37.1735276190748; Thu, 26 Dec 2024
 21:09:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219090859.18722-1-kfting@nuvoton.com> <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
In-Reply-To: <kixnc5uo5yryn5zszx3khqx77cfieeq6fnamebrw2sne3kxnwd@4cc3zfajrpo6>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 27 Dec 2024 13:09:39 +0800
Message-ID: <CACD3sJYDbxoZtV2-mjU15sPWyWnwifEDsUKfBZ9bTF8AWhgnTA@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] i2c: npcm: read/write operation, checkpatch
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

Thanks for the help and guidance from you and other reviewers alone the way=
.

Thank you again.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B412=E6=9C=8826=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=888:52=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> > Charles Boyer (1):
> >   i2c: npcm: Enable slave in eob interrupt
> >
> > Tyrone Ting (3):
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Assign client address earlier for `i2c_recover_bus()`
> >   i2c: npcm: use i2c frequency table
>
> merged to i2c/i2c-host.
>
> Thanks,
> Andi

Thank you.

Regards,
Tyrone

