Return-Path: <linux-i2c+bounces-9030-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDEA0AA02
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 15:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671B51652A2
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2025 14:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA2B1B81B8;
	Sun, 12 Jan 2025 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXfPxNyH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019791B6CF9;
	Sun, 12 Jan 2025 14:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736691966; cv=none; b=iQN1y2qHXvw1gNRWotsxU8qy0NLY/KTGMCOqJkaoH0wnEL9xUQ/NEkZVp3UZQ+aQUG5jl6hzs8P1TTVcEZsKtqNRfRCDpuT7jVQDed2Jfydwuis0l0eOYWlgEFPVkWq5qhY11EXfsoYdTDIjouL6vuoxAtpLGzzIShnCdsPbK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736691966; c=relaxed/simple;
	bh=H5bMDX8q19uef4bYaJh6I2X1vbdsTGXD6Hqw3SfElNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HufoaSMP4rP5P+N4TVmpBHPgrfhcJ7IO7m7wau9yW1tOjo/0GFPXDuujyJ9BgjSu6eiNcxQlYvEVmvjtU4iNG0g9M+qNc3MZm8ziaVYgvi29NiRU7NiXQO/KVRFd0bbM6Xm79BfDcNKoyMlBy/cvnT1XfKBBv7W5FQqreLsugKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXfPxNyH; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaec111762bso638407466b.2;
        Sun, 12 Jan 2025 06:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736691963; x=1737296763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5bMDX8q19uef4bYaJh6I2X1vbdsTGXD6Hqw3SfElNE=;
        b=BXfPxNyHBiJyAMCamduT8zMRvhHncfmSyY5cjRuz9FVLNPPrKKZlSIsHBYCRWUW2K4
         O8lK30dNyd5sHG7mcfB0wJ8NwGbwMSi96Rj+sTS13R4sUWhUEUXXun3LH/KA3KiuKFvE
         tQOGawthaCz2Kw9MLGcmk3YywG2H4yuWfyEEx9m1bSCMPccTn09+/bUdqq+ngMpbK43L
         A59zQ/B5zqPQKhA2ArWp61rHJF0NzllmU/SgiJhNFyCQUlk4UNlcd5IKM4gMNVnyGuVz
         3SPOwiwByYdMeBocosGpqrihfVgSoa1bHRr3IpJioaaMl0w3ekSxxbHtub91ibjpeDB9
         iCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736691963; x=1737296763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5bMDX8q19uef4bYaJh6I2X1vbdsTGXD6Hqw3SfElNE=;
        b=IfhciedG8EEPqin1F3b8eUl4vNcGodK3HDW4bb5c2mQIPyxF9LUWUqEE2kqYTB9Zaw
         CdC5mXlktmhXE2diiWrTy7/KvJQfvEciolmvBrC8cQMWGp66AIVFerT2FbgRVQTxL4Rp
         Z83b7twe8I3LKC55bb8gLoB3QiFus0OK9PRDQYspGqb9e5WplHNAua5qiBOM5hiekwm5
         meR//ZIje+unvmoLMpC+zx3+CP1QHjHlg2BT6DQILCF0QwYLi9+J79vWiSU8GWliH0aa
         Jj6gPjZt6+KopWDANDuPLKvoHzvkuLzcG0cqB3Ii2JCu+X9qWXP2+5LDUdSBBwZgIFDj
         1NWA==
X-Forwarded-Encrypted: i=1; AJvYcCUnXt/U5vY0iEaGiAokCV/kg4jTSbR5W3wQ8ZhTS2wwFPQd7JmSPC4R2dltvt96aL75Gz3i3mqLmPvdAfYxzrWEEPQ=@vger.kernel.org, AJvYcCWnxIuCBa5OoYAidcFZTYE5P0kqld+xorWjQlRYBtgqx0KPhIkLgd0ImPWLCpQY7BA/fPezDoiycpo=@vger.kernel.org, AJvYcCXa97X9pLcCqSXyaXCWt+JppZ+nL3zTgFAVb5z4+Pi0Oykc6p/N5CoIKEsDsVGgnJaSQkNhLKfBJGD8I1Nz@vger.kernel.org
X-Gm-Message-State: AOJu0YxAfn28M0ttF2ne3Gyx6pgwDsCMMuopVNK3+IZsM94TkWRLyQMY
	dtAzeDpf3gY9IvFCUoGBADPzo4toLYogG8FC17g/RHwC03L1jhzQ4onTmnB6wqxdXdU/nk2D2EB
	w8tku+AovF0a6gHLy3FRGWQCLdKIhTqm4
X-Gm-Gg: ASbGnctXMDHXcJU27B0i9WMP9AzdaJvQ6T/SS3fnDvGXbD/R1KFVfw6ml3ufXjo44kF
	16e+7TQ9WGPAm2GAJOZOz+xKh2YYPeLGAr5JxnQ==
X-Google-Smtp-Source: AGHT+IHbo/90Wso/3AlBA0aAMsc0fHXlAFU/aZUOSdZ10hlUPH9Gwx+/vfci6AMq0Lc1fWNnwnYttODb/FlF6O1nUGk=
X-Received: by 2002:a17:906:7311:b0:aa6:bcc2:4da1 with SMTP id
 a640c23a62f3a-ab2ab6a84c8mr1420433766b.7.1736691963254; Sun, 12 Jan 2025
 06:26:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103091900.428729-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250103091900.428729-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250103091900.428729-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 12 Jan 2025 16:25:27 +0200
X-Gm-Features: AbW1kva-Ec5KBYUZOQENkqE_-SX8z39kscjsKiukxPWnXSMFptR2u60pIC4qZyI
Message-ID: <CAHp75VcQ34VzMt6c-MDRQKtiPTgN9DE1ZkC-rOa8GM6kAp4nYg@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] i2c: riic: Use GENMASK() macro for bitmask definitions
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 3, 2025 at 11:19=E2=80=AFAM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.

...

> +#include <linux/bits.h>

This will be part of the previous patch.

--=20
With Best Regards,
Andy Shevchenko

