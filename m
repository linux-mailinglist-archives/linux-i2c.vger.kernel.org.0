Return-Path: <linux-i2c+bounces-8852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DBB9FF745
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 10:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46D571881E88
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 09:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 286FD1A0B08;
	Thu,  2 Jan 2025 09:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGZ1kTFJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33E19F131;
	Thu,  2 Jan 2025 09:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808889; cv=none; b=Lv+Q26g6OuMlAFe2uF+gkg/R7atkmO9cclIlTMQZzeTfIc1NKsqHX38ItNsEYmaKLZHYUTbnr3ctSwmuVMPPtRV4sRAWKf+57K6/WiXJfTE9JPjRCQqmGz0u5L94q9gg0FXcUAgRtfqIemRbukz5Yv7SQAqJLVXtFiO8h8BW5go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808889; c=relaxed/simple;
	bh=uD4CO4d8sSEMudavVABRg9fS1Qg7gQH2KJgG4hZ4p5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fIM1k8RC3wFXn49H4emiHM5ru4tdapTOrQ36XYml2ejnhvueH8kMQOdpOTfkXVp6YS9ZtKPt1WAj0Wsg+TgQjXX/fqN/a6zzuzPehVsbPIJRehlSbZfXQnwy1VGUTdVpvFzLoEwAaZt17nY3Vr7sScovGpxnRc1KgNW0j6/ndg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGZ1kTFJ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso3742127e0c.2;
        Thu, 02 Jan 2025 01:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735808887; x=1736413687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3kjFkMThqqF9jZd5rM6+2gpq1qFGIEa2maQToMre4Y=;
        b=mGZ1kTFJUTLn1li3LoSSK0Xgo6NOd0hbpnE7UJmTq0wb7kpbdlesggQXyaztDmK5Ie
         Fw4pqKiCz2aiNDxAPmS8AgLJJOmwpiP6MegVv7hcQvjIea8wR9pmIXFfI51tA7sOW1C1
         ldw5eHhUE1pXUgihx+yeKQC6wbQWMqOfcNqzJT58TmNuZWZ3yqR7nwj1CP/2mOTE22t0
         29U97lUqkG2EdZbKxRRrbA0y8jldn5bKWeCtakGQ/oBL4mB3ZYarZiJlbDN8SAYWctFh
         zM8QFGqckq22bxS9Y4TXKnHuXp3yQNIPu7S8DqICt2d42cghQmVqfxU0tumV1TsBc9zE
         nZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735808887; x=1736413687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B3kjFkMThqqF9jZd5rM6+2gpq1qFGIEa2maQToMre4Y=;
        b=vHlqPvSCQ9jLu1o/rS2a8/pXCzFjur8v8MJ/3fzGOUmmZe2BjLiNlUhnZMxPRVPJC5
         5uvk1U5AUOxDasr+zg7mcRrk471NTou5hH1YOjGcIkzBDOlKgeBAsWHAiM/99j444DPi
         lyqiSB8HMTSztASmPHRlTPe0XoS+sYLdCRMEgaDVgs0uaDQiHs63poz2Wdt+GzoTe9yz
         oIQi5qBYIDt+tmnWHrRuoA6cqlF9kdhebjKAC51s+Nz1bM9GsN9VqiPwYO9SRN4o8F7S
         Oyt70ytoULWRgetN4PMq0Rd6iRcpzsOERorN+DcaSDx+VhmzEYcCZO0zWjqA4UQiJZ5N
         IDPg==
X-Forwarded-Encrypted: i=1; AJvYcCUb4ZNB09l6U9LWxgNx7LCzFNyeduDe2MpHh+nue2NFdnnUrTQvKgOkG7k9oGKBJIumcG0lR4SsJsQ=@vger.kernel.org, AJvYcCUcxCmoX6HgnaevVXA/ZLDKMa7Q5EvCHajDvHbnyhVSGB6ka1lpL29IW2+IUqrkC35AxTf6j9/RufC7P7uw0ez/S2Y=@vger.kernel.org, AJvYcCXPddoK4nDpHNymbmFiIe1pK5P08VKNk5olbv9JnasrO48FQWdeQRZzSFOYtcszBqhfuFks+JYv2Rg89jb9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8mHktDg4jCAF7aUisZAnVe292vW+E4eNDM36dHgQLlQItlQUX
	aZpgIIPMb1kgLSHHE3BNUesvlPKFX3XqI5T6Ks2ima6IRx3YOiCImQbyDsyLAzE2auscLzTu0Oa
	we2/TC+nGG/ojz+cge+YNySG+nSA=
X-Gm-Gg: ASbGncuQ1SFH7YTpHMoKAFMr+/vWJ5NOE6A6DyXR9MEAp1evf2VqMs8yLLsoe1qzDkG
	tkgap2cuukCAPcPvaXLDTHsjeTSpxEmMBEBjG5UsijQj084NTJB1dQKNZ+ErU/9jaKKaRXg==
X-Google-Smtp-Source: AGHT+IHlMv6zSiQSlJBSztx0UfC99eieXYzMjFEtoc8nn3ixhVeV7kmBUORjW6EY+f6FeK5sdu5REAUpL2s9hi2gn1o=
X-Received: by 2002:a05:6122:8c18:b0:516:1bd5:67da with SMTP id
 71dfb90a1353d-51b75d384aamr30829575e0c.8.1735808887176; Thu, 02 Jan 2025
 01:08:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3CLInVi43HW2Gmj@surfacebook.localdomain>
In-Reply-To: <Z3CLInVi43HW2Gmj@surfacebook.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 09:07:41 +0000
Message-ID: <CA+V-a8tXBc-01DW4SLGVvh-cDySeiw5EhBNphNeW_zmd+5SVhQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] i2c: riic: Use BIT macro consistently
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

Thank you for the review.

On Sat, Dec 28, 2024 at 11:35=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Fri, Dec 27, 2024 at 11:51:49AM +0000, Prabhakar kirjoitti:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Easier to read and ensures proper types.
>
> ...
>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset.h>
>
> Does it include bits.h or equivalent (bitops.h, bitmap.h)?
>
No, I'll include bits.h so that even patch 4/8 can benefit from it.

Cheers,
Prabhakar

