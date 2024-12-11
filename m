Return-Path: <linux-i2c+bounces-8455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9489ED05A
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 16:50:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9A1E188BB33
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Dec 2024 15:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 714331D63D3;
	Wed, 11 Dec 2024 15:47:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A381DED66;
	Wed, 11 Dec 2024 15:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733932021; cv=none; b=s+8ZwNvSnIuZiNj3RZgzci4a6KxpbhAfxwOEkMPZHdOSk3pjwJqtT+yvYAmbAbIYWZ0gm7vTyylr2EHBWiqPOsUSZRFL/uI22tCywV1mqpHVtaHocWmlRowUbieln6EXNL8F9Dwif2hhWX3+l5vJ5fArl2JSLiT9uZLRw8TJr0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733932021; c=relaxed/simple;
	bh=ALxKN5fZOTqws9Y4Q3rpW7StWyBrWTOyURrFP/RXICU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dOJ4TYXHa7itVNMabpv9i+Pxs0h2hEICGrvSuNXQarddXskrbgamMwVAhSpGXr2ghRlYSzfqYUN+B+jjYH5beuSjbkURJbT8AdVpndY0RVPOI+BIUQHDPj4iTGZG43FVBzy0mtW7YzsbRjm4XNyOnsbOc1Tpb+DnbIgvOaO4XoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-85b0a934a17so444609241.1;
        Wed, 11 Dec 2024 07:46:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733932017; x=1734536817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJ4+yzd/rKneDbDIB2IBsKpDzvBEuivplDoyftb/YzY=;
        b=WoYxmuCBj4Izq79TO87B+qENWSy4yHzP7FV6lCCeO9P0InHqgC9NcrbWTSUnb6n3E3
         YIpnfniZBk9WTFo7Au3jMHy45pUbyT9CPlNpzVSMSi8UjFEzGuO+yBmVT1I41TsLpteI
         MkWtDp5xs5LLJizsz5q6+n40K2TUIu+D6GZ2EEy6KykXsL8GskqA/yAvl8y9u/O3xdSs
         2gavRw4734Uz3I2jkJ34X2b7cQH8q5Y0a2jRN2pvIRbCbncj6Q0FjHrLabeN+Zq/BO0Z
         qHjEmprB6Hs6FtXVWFwcq8ZSmLitqb8NcCCtX19qe6xxyF1+AfG7Ty56riL35hqzUGOE
         GuDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUH+e/3eKsqnoequkpce+g+X3mWaMnEicTFeCdtWV94zG19c4GF4P+3XZAP9SF9oWw76A34kWPEgw=@vger.kernel.org, AJvYcCWjY1xMPO4Fr1iDB2OqFmH9S9834urAWMe7YYs8VyCOpWJxk1IwHpr1xizTAX/mBMx98CY9G0Z8Dz5OWn2IWFiXVI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDRM7f5qG0lXQKznABmZF1GwCTnLieILv79trQJz3TeB5iYoV9
	8Dl8dS1kzkSwYuUZXeYHU+MqMR8+Xf3CsJz82b7541cAPt2zDNtZXGIIZ21O
X-Gm-Gg: ASbGncuZddzBZYwALk7dbRqfbFulWtO00EVAmC47iy+DBRMza21QeZWCDSVi3dVmBar
	nzQD21U1kl56dMZ0IW1GxElmqsjq3iIF8MuDF/cUK/5j6NHrmic5O37GiLZ7+lUM4UL3nvzCv8N
	JTtShw+mTo6PmjBe3UTGJxLQSCY3eDGGnqxvoa00EZnn6owrvN9rTAhkZrFWmcjfCNKE5mqHI1V
	ADhnVNcvTLCp6o4LWn9ugTWZ/Ryn8V10wXiRjq/+NOYnvS1Fcfxl3vhv6MidS+HSOkMBE37Bszl
	MaoP2cCGK50V1y/h
X-Google-Smtp-Source: AGHT+IHR+7yVhlzix3fvjz/EqYXu3JmsOsGZs+2yOi3HU2uwuG1PJfHgeFZAkjC+9ujmk2Q9u3lGsw==
X-Received: by 2002:a05:6122:a15:b0:515:20e6:7861 with SMTP id 71dfb90a1353d-518a58ff2bbmr2571650e0c.2.1733932017384;
        Wed, 11 Dec 2024 07:46:57 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-515eaf32e2fsm1243023e0c.40.2024.12.11.07.46.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 07:46:57 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so488274241.1;
        Wed, 11 Dec 2024 07:46:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUozLI+Qf/TL5jcKuUtYs5eBofKPoMNMe/2Tto+nATWf0TyaxC7d6SZx7/llmw2F2upDYtz0jL59Ho=@vger.kernel.org, AJvYcCVCF1xSYm9xp3wH/y98+SvsfcIt0c6tLsmHiaZY756htnISEr4AUdZNptTaCxfVH8zcDXDUkm8QrkSDYI7cUJ8O/+s=@vger.kernel.org
X-Received: by 2002:a05:6102:1895:b0:4af:d48d:5142 with SMTP id
 ada2fe7eead31-4b1c21862eemr2090162137.3.1733932017022; Wed, 11 Dec 2024
 07:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c59aea77998dfea1b4456c4b33b55ab216fcbf5e.1732284746.git.geert+renesas@glider.be>
 <ljyho2ftsxmjkyi44hgc5zavxv3ytbvi2iuoht3gjetr3b4jq3@mjuvcrwm4klt>
 <CAMuHMdWc63Q47=4Z5_zDLy3BfGaaV8RyQRAcQbhC8PFvtz4z7A@mail.gmail.com> <nlk3esdnddvnfxj3peuldcblxnbninnmhpfu7n26tbyq2swqzp@z456toyekd6z>
In-Reply-To: <nlk3esdnddvnfxj3peuldcblxnbninnmhpfu7n26tbyq2swqzp@z456toyekd6z>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Dec 2024 16:46:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWYt3AsDq9wiXiZS__nnd2QXSPBvu0vT5dQLeJsyV9b6w@mail.gmail.com>
Message-ID: <CAMuHMdWYt3AsDq9wiXiZS__nnd2QXSPBvu0vT5dQLeJsyV9b6w@mail.gmail.com>
Subject: Re: [PATCH] i2c: riic: Always round-up when calculating bus period
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Adam Ford <aford173@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Wed, Dec 11, 2024 at 4:43=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> =
wrote:
> > > It's a pity that all this description is lost. I love long
> > > explanations especially when they come from test results.
> > >
> > > Can I add it in the commit log?
> >
> > What about starting to add Link: tags pointing to lore to I2C commits,
> > like most other subsystems do?
> > That way people can easily reach any background information (if
> > available), and find the corresponding email thread where to report
> > issues or follow-up information?
>
> To be honest, I'm not a big fan of putting links in commit logs
> (not even 'Closes:') and was happy not to see any here. If the
> domain changes for some reason (which always happens sooner or
> later), we'd just end up with a bunch of broken links in our
> commits.
>
> If others want to have the Link added I can definitely add them.

In general, we assume kernel.org will survive...

> > [1] https://elixir.bootlin.com/linux/v6.12.4/source/Documentation/maint=
ainer/configure-git.rst#L33
>
> b4 can add the link, as well.
>
> If you prefer, then, I will take this patch as it is.

Please do so; thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

