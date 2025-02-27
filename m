Return-Path: <linux-i2c+bounces-9601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEE8A47200
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 03:13:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFFB164918
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 02:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B991487F6;
	Thu, 27 Feb 2025 02:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXazGrrx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228111482E7;
	Thu, 27 Feb 2025 02:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740622374; cv=none; b=klu9bHCWZ7Vqd9mm9ibzfJgSOuRwCMwPJ29j8vvbKSk2lq8C7CVAAabxmm0NkKU+5FXkmU8VX9APWl4cvVYFcemclwwtjZRR2nwXEu5AaAosTfngfTJedvWKlbkjfWhzwKuKTK7sLvFoqczbDY+R28IBb67yNyD4NuA4e1O+DJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740622374; c=relaxed/simple;
	bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pxKoZkXVIDU6Metl42AmdBBuGEHpTUyFrOQhZ1NfSDIy0WzexMxxcX6EtPJBLMjPIP349LbsiI3rX8SnP9E3QeXdEg7YnkJydskP7G7iN3/dCRfCpN/nFXIlkDFx3jiCg8uF+Z5gW8qIDRog++gqn/szf516XjcQ5vm2qi6kBuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXazGrrx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abb79af88afso78095866b.1;
        Wed, 26 Feb 2025 18:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740622371; x=1741227171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
        b=RXazGrrxNPSrU8oPeq4jdL3hb8vAoUCQzJBgGCsscQF+b6od9DdNg97GgQgtDmhUXL
         0/Fre9mLqieAD1h0lwDjJr84FPsPhn0zTrm3A3fDs8txlHQR/M7vGg6odEftMczHWpgb
         Fhdx3z692ny2Gfl0YdfaQIVzk2RTdAohtj37Fm0W+UlBEv/F5p7eXIWrP/WWH65r2sDT
         Oqku5nl0LV+FhH+Pz4bOfrd941r6WA8zRE4/zyUfb9Md7Ft8YlQ0/7kxZzpSmfr+y2yn
         epTo4ZOihRywlHkwcTXlcCWG5GPYqqPGPnnnydtQxRTWyvArNyqNeprU+za7gQxXQmYt
         eKOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740622371; x=1741227171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ji43QirnLWxUXnqatW9H8FRgicNepO9UGBb5s7EDnY0=;
        b=mliP/Treu7O8mZktEgloyIMVrjzIObnwEfjUJsCEkE+f+VfnDSZ9S+okJpX3kJJXqm
         O0rfTypy2WKDOewHl7bJwS5ZM6vl2/qU+CEjbKmgsDS9L9m38XTciCxf9sRGmH8nHQjY
         sekS6eEhC4quq6PvCPm3yYqHOybxzUCP3CeuTAbeZ2NyGcqcu55V1ZLBRjpZXTxDMY3l
         sdjVBjXIktJwCt3CIE/2W1dkgBN7vvH1zyMi2mqevsNxqnZzfWtL68/YinJj4h/qdRtW
         H9bsuoFVc1Uk23Qykqlz+XIvriFoRuBC/NXF/rPPwmcRqhQp6DckbpPCJyy56fKTkPLy
         bqlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPwXP5OjRriJAVGBmxnFu2G55pGmyUGx4UfoRwkgYMav9DSNUQk9AYUKhWF5IygqxQoigtuYKpuAQ=@vger.kernel.org, AJvYcCXnUSBxZsaEtJYLflbUqwwtR864KNR1qCpPQWLUX1bh7IwRhyuoWmYa9faXUQPgMA92lQQieaZYXq3c+fpV@vger.kernel.org
X-Gm-Message-State: AOJu0YyrOLNqzwr7vj5dlN4Iuo0PQnKqRPkVE7OJgulinGqTB76ACNWB
	+J/ZMxJFa2rsOtHaR+0UNqcw3Z8VajAzIF25UB1zgwyxEW/U6SpzteC58OcP3ViCHxldYKpa/2j
	e/NrGfT5Y+sP93SrTTYxZuYQIyA==
X-Gm-Gg: ASbGncvtb5nXvb8NovDRyv7CGtUZFKPhAKgNqQRQ682qHGo18lBBnCQp03dy48Vy15t
	m3GgfX1dbvspMxf2PemfwO/KmAkNWioxj51vjyncFlxXdJOb6fjUJaKxkfWGsie0i9GhrNitAF8
	wuuAHocYKnDSO6rEzPBsBuBx1FMSbkSD/+m9ysHMr2
X-Google-Smtp-Source: AGHT+IHT13vTR0kWj4ZrwhphGcwIOVy7CyAkUnvryXOEjJ/H2PVdPSrbH2xZfZk15WtnvnDCvp0Mkb5Lrcyb3LaVMd8=
X-Received: by 2002:a17:907:728a:b0:aba:608d:4a22 with SMTP id
 a640c23a62f3a-abc09a09707mr2626636966b.21.1740622371069; Wed, 26 Feb 2025
 18:12:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250220040029.27596-1-kfting@nuvoton.com> <20250220040029.27596-2-kfting@nuvoton.com>
 <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
In-Reply-To: <nantj66w7l7bmk2sz6i2akyaw7cievmeuuvpl3622wj5xmdmtm@g4rcuwxghxdp>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Thu, 27 Feb 2025 10:12:39 +0800
X-Gm-Features: AQ5f1JrZiTk_IXo8TxlPqW73GZxuhoBbuhyIROT0bdFgIPbl2r9cCmk--GAg3es
Message-ID: <CACD3sJYWC+=Q726rS+bVdyu2+1Oh7vXQfPn=8RWwJdT4G7VA3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] i2c: npcm: disable interrupt enable bit before devm_request_irq
To: Andi Shyti <andi.shyti@kernel.org>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, 
	venture@google.com, yuenn@google.com, benjaminfair@google.com, 
	wsa+renesas@sang-engineering.com, tali.perry@nuvoton.com, 
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
	JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi:

Thank you for your comments.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2025=E5=B9=B42=E6=9C=8827=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=886:18=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> On Thu, Feb 20, 2025 at 12:00:29PM +0800, Tyrone Ting wrote:
> > The customer reports that there is a soft lockup issue related to
> > the i2c driver. After checking, the i2c module was doing a tx transfer
> > and the bmc machine reboots in the middle of the i2c transaction, the i=
2c
> > module keeps the status without being reset.
>
> ...
>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> I guess we also need:
>
> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller drive=
r")
> Cc: <stable@vger.kernel.org> # v5.8+
>
> I'm now applying the patch to the i2c/i2c-host-fixes with these
> tags
>
> Please, let me know if you think that's not the case.
>

Thank you for your help on including these tags into the patch.

> Thanks,
> Andi

Regards,
Tyrone

