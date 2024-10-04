Return-Path: <linux-i2c+bounces-7211-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B7698FC00
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 03:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ADE02B21706
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 01:45:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD3C367;
	Fri,  4 Oct 2024 01:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4DnvG0y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5521757D;
	Fri,  4 Oct 2024 01:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728006309; cv=none; b=kjiYQbW4YYWsTD9uRwzkNgbXapsV109u2s1A7ti6qA2QeDf1HoiQrzHStwGkHSwfqQhdMBQieuVuLQK7i2sqLYDDTRc2T5U17j53uEDW8G6+1fcDcvyqvqcF0xByg7weeJrIfFM/0scqCnNMIBIkn2RfiNEfsB87Z60msz2Fbyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728006309; c=relaxed/simple;
	bh=bhWpw/q+/0aDuo4hZ4IKGKOW9jc1RJXLxqpsmWbQoSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hi6yFZjryaWZ7TXw5qVpEKBpF7RPL84v5cq/CywTYWmR+1P8qbrFMN4JrAi6jglBtN/J/sP1/9X3wUrX3qAuQJMMS35spO1uqKtP7s91utWEBekr25mN8inPdwOchzdskZJBqAfEZ8cYh3XlJPAv1zbPcY6EtjFcxM5zqKbd3ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4DnvG0y; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c5bca6603aso1930605a12.1;
        Thu, 03 Oct 2024 18:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728006306; x=1728611106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dRI2Il62UAfyDHeebNL7M6bB8VH+L673JhKSjWxVXHw=;
        b=K4DnvG0yCItdMUQhF0fhGscgM05rK+1s9yGrozrYq34eCpI/NtBY/TIzK7+K5PRRaw
         6Nif4hnStK23FEA+dDiOJCJlgGSLJOde+pCmoNX0akz+YGUcgu21OJetAUZBr3568ISU
         BvWYINcOpoWpMd2MBsfFnHMbznRWH71IwX95enTgCw5vAMQW1vhTAq33ZzKRK13AjRji
         Q25V7Wmz/bMbnF+qinc7q0LzrjILOJHglJJ+JbSCAOgcagKDJnqkrhAN8JBxAY5Mfed/
         rjUrvL/m/ro8C1e/09vpcBahoRx1P62j5gG+8Tjvwhrfx7gb/Hg7Q0GGkJ1JM9RNsCqC
         rDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728006306; x=1728611106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dRI2Il62UAfyDHeebNL7M6bB8VH+L673JhKSjWxVXHw=;
        b=VblfdZmClc7pxU2fwJRB6c0VtbxZV3avjC3XO/s12tqzfSmhbwapIM3pRukD/vaAR+
         /SSsUFks81BHIS9y1YXkLoe64LwGfVzVmfi5InUCwUZkFLNhRVcZm22cJGZYJezUP21T
         XNrq7AvxKCBZvaZPeI0yKt4GChNKEuGQakgwjA4mP9DyX72nOHo4adhgsFvqUYpv+YWz
         jxQaSZCWK95ZF76WfaeD+inzIdqSvuFfFQHXUuN8A8vzDi6zGuVAle/PGgAg42xMInLD
         ZiTT29pAMWeBJlq/IMUJkIgnwIeaMV9bEMDjDW22byyCyL2uNr401a2FDf+0w9VNcAJb
         77qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbjAcvhHq79wO9HGmP1GHrHYpf9agTRhQ+QA5rG41v55zYUec4TWnfnwhMS1orqfQJ/F5gTrPrHshLj8Ky@vger.kernel.org, AJvYcCVZ4PI4OdbA3i224uB66n3mFJisupTyTOsEZXMoSWoHR50/xZZCERN8Q74ZKRRphMMTGv46R/CB7aY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV19afJTrzCykhUGt1UlG/XSOL56Qz96XPx4oK5DA4+9jx0yrI
	t3G3fOBM3QV+Uf5aIXvKpRbDe/25UHyyotJaR5oE4VPbR7zaC0Lqy8OVAwiuB/FX95c51dTIKYv
	PrRYBMPhsNZk3SKuqlQAen3uUpg==
X-Google-Smtp-Source: AGHT+IFSm2nBg9gUUpBfHWVXeRjIe0yYzQSwipt/YKlvygbTx8qK062Iy8NDRPf5361rguU97G4YSoWKWU9ShduSQ0c=
X-Received: by 2002:a17:907:e2ea:b0:a8d:5f69:c854 with SMTP id
 a640c23a62f3a-a991bd44726mr89559966b.24.1728006305584; Thu, 03 Oct 2024
 18:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241001062855.6928-1-kfting@nuvoton.com> <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
In-Reply-To: <k5ifxaqtm76aorvxur6kl7j3pnfc7qmvua7mq64pobg3tiabvu@h2ygjs7ieidh>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Fri, 4 Oct 2024 09:44:54 +0800
Message-ID: <CACD3sJZEqt0i6nz2gwQOwVADTaJtTc9MTQqAUFcP1kwOWWyQTg@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] i2c: npcm: read/write operation, checkpatch
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

Thank you for your support.

Andi Shyti <andi.shyti@kernel.org> =E6=96=BC 2024=E5=B9=B410=E6=9C=882=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=884:34=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi Tyrone,
>
> > Tyrone Ting (5):
> >   i2c: npcm: correct the read/write operation procedure
> >   i2c: npcm: use a software flag to indicate a BER condition
>
> I merged just these two patches to i2c/i2c-host.
>
> Thanks,
> Andi
>
> >   i2c: npcm: Modify timeout evaluation mechanism
> >   i2c: npcm: Modify the client address assignment
> >   i2c: npcm: use i2c frequency table

Have a nice day.

Regards,
Tyrone

