Return-Path: <linux-i2c+bounces-8853-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 415C99FF74D
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 10:10:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F2C63A24A9
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jan 2025 09:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E693D194C77;
	Thu,  2 Jan 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh/fFgPy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6543ABD;
	Thu,  2 Jan 2025 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735809026; cv=none; b=Z0Ei4vUogFcbrUgJ6jOmOXP5LpF0E5sULIJPykKVIVTH7rloyP8btDFQOFG4dHBcfAeclAeDK/ZB+kXqJDqG/0zZY7rcEJ5csgu0DFuaO80EUQ1Xg7lbFymfQsYgYao4g84MGiTJXOgvoreorlYPMIsr8g81aG6lqw8YRkLqzWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735809026; c=relaxed/simple;
	bh=OUEz2uUsMB/Yqd7Xu8eGC/kK329xyhSO55BOYpMJlNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSuP/Jz82e08s/o9zbUCR9AP4T5uVHhnLyMm7MRnYqxvvND8cS21e2mRQC/gGwQuI7REXgwS4gB6UWHowVB5f7p4KuURWzZGeNhjp7XuVjjDS8MU3TEUqa3zsoVsMqtRRC2XZjHhqG5nRpEYGIaeg+3pwWL+RcwoyH7vceNg0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh/fFgPy; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85b8c94a6b4so2244672241.0;
        Thu, 02 Jan 2025 01:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735809024; x=1736413824; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8fo6vCeCMUSGwKDYtGFLlRSsnHD13BMvVQ1p/wRjEo=;
        b=Yh/fFgPylbst08iBn9uEgykc2OPNPTgTmagNA7ZFW3DacCWvZR5a2XtyMZGLWxy31f
         j+hF2AKyDJysJByX5Cnqc9GqGoniyy3Qfuah4p6dGwXUn7IobEXmf7EYUgm9snDy3hQJ
         HL/kf57zpdqwXUEHd4B9VvW8IVBI30BJN+9CGWvlZhM/m4p+O/fg4WHRVmewSdRiJoej
         kY2RSzZZQck2lJZJKcnZd9JLS2+Mrsjq9wkY84R6EWGvmFvnVCJy0LQj94X0YBe8LxMz
         ZDrMTC6SBSFFsi0BYO/inKN0RA1sRcPV1yfqiTHuHZMB1dslwGC3Yu0JqfAWteCwaokB
         yp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735809024; x=1736413824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8fo6vCeCMUSGwKDYtGFLlRSsnHD13BMvVQ1p/wRjEo=;
        b=hKu6KoE4JHG3fyu9ovgGqtBdT34z6syCEqefKmDxR2GCSbSWMs/vI4LuIG8AdIxPDW
         XtppxdpsuR6MTwMTDUrtgVGyabemw5zz+9Ia63qcLRC8/61HOWFMT7I7jdWt5tzsnbs1
         nIC2kY/w9PsyX8dKbiQNPefZocp/bZpEv8wpIEV81dizJw2tuo9CV1gHJvau/QD63QXE
         ZEI82g76n7w4bMPf8ns8mXkJD+nPJ+k4gifmwT7fOqcfniOIJCqnDGApH69NLJrnlZqn
         YdPv47Ib/YAqPkRUkwqn3yg2qF6tH2ir51zC/WBzd8odir5yc/m9RAUXhN81TfloZrcv
         7xsA==
X-Forwarded-Encrypted: i=1; AJvYcCV/L62jBPlVkHD7mHTt3dkHhnfLIlMupDrUMYxGIGG79LhTuFDBP+LMKt4VninVDW4ncXIRv8E/zBY=@vger.kernel.org, AJvYcCVj0dINA+xNME2OkMpkTnjUeFR0tpK6KGg2PHtYleCokTS1V8XIa2Xnyt3lne74VrXobR8fpqeTSfycswjh@vger.kernel.org, AJvYcCVj2OzYfRWv6pzCaTINpkwqnXET0R41u2YK09vjb7x6Dl0Pgk/Olgl0Jepd7ZPEFAZGZnITq+bV1ZsaGpC1+nnJVGI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6NsX36ma31L9cT4Hgbo8wdY7m5++MM5RPcx/eufXTFMqU5GI/
	sWw2PLBJc+AcPrEsWMLbfx7Q8/hS7CKKXIrdKA5vbfY6/U1IlM0I1T8Uuj+YY5MsUKnFaMDPhhq
	0wG6xAu7IQb+PpvI1xuW6gfkcuHI=
X-Gm-Gg: ASbGncs5K9wBj9ILpF1fwKwK54gOmqsPsaDk9OGj5rK+6/RkTXpTbmMbwAzwhVkRfHU
	zBUbH0SUeMEsw1g7jrIepKxDARJ32ftfl2ZmT0wtR5KNTIcCzO1zmsf3Qh4u1oJdKgRIiFA==
X-Google-Smtp-Source: AGHT+IHAlplLUNEdlYHGiIKY2wsE30XIZ88L31P99GAi+j1l5FKE7EtFqhVHNAUBwtQJeo6zaL1bGAM4699CwiAvWhQ=
X-Received: by 2002:a05:6122:210e:b0:516:24c4:963d with SMTP id
 71dfb90a1353d-51b75c302dbmr34518363e0c.2.1735809024197; Thu, 02 Jan 2025
 01:10:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <Z3CLYs1ZP3GuSO_T@surfacebook.localdomain>
In-Reply-To: <Z3CLYs1ZP3GuSO_T@surfacebook.localdomain>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jan 2025 09:09:58 +0000
Message-ID: <CA+V-a8uL-4pK0qsHX6epxKFujYssBVsS+P+=tzXZ55g+GDur5g@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] i2c: riic: Use GENMASK() macro for bitmask definitions
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

On Sat, Dec 28, 2024 at 11:36=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> Fri, Dec 27, 2024 at 11:51:50AM +0000, Prabhakar kirjoitti:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> > driver to improve readability and maintain consistency.
>
> ...
>
> > -#define ICBR_RESERVED        0xe0 /* Should be 1 on writes */
> > +#define ICBR_RESERVED        GENMASK(7, 5) /* Should be 1 on writes */
>
> I don't understand the comment. Does it mean the value should be 0x20?
>
Bit's 5-7 are marked as reserved and these should always be set to `1`
on write operation.

Cheers,
Prabhakar

