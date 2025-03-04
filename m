Return-Path: <linux-i2c+bounces-9714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD8AA4D9BD
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 11:04:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFAA17A6907
	for <lists+linux-i2c@lfdr.de>; Tue,  4 Mar 2025 10:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585BB1FDE35;
	Tue,  4 Mar 2025 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJ903UqR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A20C1FDA7C;
	Tue,  4 Mar 2025 10:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741082641; cv=none; b=oFbULqQNiDm8kXN5UZRf1zSTrEzg+s13XBPT0O4LBSsfMXcVW8ibNLX9KoOg5MMVZRYau+2gKK9/qe6bn/3JHrmDLWgDvEj5RfB3e6WJf92zbREkTgsyYqxfaJjJVXinh944Xk8RRHSlhDL+CpT1UPShlzM3iL9goaVeTrVWUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741082641; c=relaxed/simple;
	bh=EEoVps4h5tDDYvwVshOVe6vYhOA3s71sUDozsHFBm2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TirqfJtKSm+CJ+kBUGGw6nikbeMQDdMgb0XcaiwgtAk5OaCXVdicQXXJZFzBlpyiM0Tn4h9VwCOs8qoQQ2cnUjw+FT7BWVSKeJ1l6RzlT4gGHvw3hIQ1Qw5HZaozO/GOdFo9FiwZCKUWKT9VKzc8fyODeS17ynVZwXVOaGstAjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJ903UqR; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5236fe026c7so1191070e0c.0;
        Tue, 04 Mar 2025 02:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741082638; x=1741687438; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1UM+2AzGhKxEchtRqXdhiw092ln3vlwIusfEmYsPMk=;
        b=bJ903UqR8waIcJVnZkwBBPYzY5rOTRDUWhDMYrqdWrbdWHRhqHiQ+KR7+FVQES2Enq
         AnTHhKxw47maXVHTUQAS058S26+mDAm2l0fuXVVZ60fjFyIu/1p4vNzw4zrDAUIuooRt
         vwX+gOuOdkshtRQMQlmrssQFIRKTkkG4Pp/cEh3aDbTt9B/OTN8sO9pps+faIy/6ymdx
         3FgL8zXt8sijVmjr1wVqHxxy5YmN7WCxULne8NRv5plyTY0xNJneAa0paqjde4HlqJIo
         IHFGn7wDXBlYWz6BD8WTvoyaEA/E0hHi/g3C8CoODikBKyHABKIRmsEAsFE26OSFQ4xY
         p/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741082638; x=1741687438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1UM+2AzGhKxEchtRqXdhiw092ln3vlwIusfEmYsPMk=;
        b=Ht6p7B+CXgzBOlSpEG6PIMks3rT/Fe9qONiuP9xkXeBsiAjVjjyhkXqsTJ8FGebwer
         BmBJh6JZHhrGq6g51bozG3r4hzdhWiuAKYXlzE/1H3ViTMcKtRKy4fBEEXZEjlTY9+eY
         qGeY9BtDYtK4Etb534llqZ7lEHnh3yBf+jB1+Y5TGZ/y3gI40Ap1pYYbzkLDLz2H6yp3
         jLZevK5yhym50jM9d9m8a62QVnSsHb8fna54vY3LsOW7kDlk3+vmVNNhQXsSKVMQUMOr
         vxHSCgY/WMd6gVIH8O1XaDTnNV4iWwrXkpMrRqDyv+DawvrlFljH8yjTXgXoilzMHjcv
         r06Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVp9CwHqSDd4lYYHmMAOV1YpPMtge0wbMqB1pFGSA1KzDjzzUopQAWX0MR3p5rUUETGWAtc3uRF3rvWqASFzgiDBA=@vger.kernel.org, AJvYcCXMc2KLgTJ8+TO5E5CFATj17BX9COhH6o9Bd77Kd0Q87Ybci4m/W9BCjj/kh0e1r4sCX7ThqKBQW6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz36udxeOtFVN8OzH2a7haVgQmli+D7MiS1pPq/dJXwrzIZPpUa
	0ITfXIeh23Hc5O0rae3NzJGjfSg4N26zda6KyWvn8rIYiPFpnM3nDOI+BhJYB3z7pQBD8HUY2tt
	d7QyWf6fRO7mvqKZSrBZpampLVKuonN+7
X-Gm-Gg: ASbGncvPzte3ukh+8PFzCGG3ANJ6bEGGba6llrFRTy4ZnKFhvFoAfBaS2/Fe7xaWF+q
	s/R/F0KR6Dy/lH9e+mIn7T7SAvbviEKWqIXtbO2y68JjRwbyb/p6C6/KB1mHho7Sb6SLodMWqbz
	t28z1imwZhwiUjz1b7j+vRHOMJuAr4ZvYSJlOKou+9yOx/LEcOM36gsFfj7Ho=
X-Google-Smtp-Source: AGHT+IF3KuZEkwCFIMslhDXRcGIMkZcGHCR0aMvdS3B1dDdc6t9nAG2qKDqCfb7dSbWEGzrpY4FxdjKYX2l7pTWnak8=
X-Received: by 2002:a05:6122:8293:b0:520:3536:feb5 with SMTP id
 71dfb90a1353d-5235b8ebb2bmr9091534e0c.11.1741082638273; Tue, 04 Mar 2025
 02:03:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203143511.629140-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8uesAcYB4Be1Df9w+K3NbWZBDTq1mXz2KBPVkXBk754YQ@mail.gmail.com>
In-Reply-To: <CA+V-a8uesAcYB4Be1Df9w+K3NbWZBDTq1mXz2KBPVkXBk754YQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 4 Mar 2025 10:03:32 +0000
X-Gm-Features: AQ5f1JqeF-gj48rC-vHpMOPrchsBkvRQBDUnpXfUyHPOnfenhFrEkaPUYa8rJio
Message-ID: <CA+V-a8sJvx9b78tHG26t4fjXu=U+Z66_QqO+ObkrTb-TtwJZTg@mail.gmail.com>
Subject: Re: [PATCH v7] i2c: riic: Implement bus recovery
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andi Shyti <andi.shyti@kernel.org>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram

On Tue, Feb 18, 2025 at 9:07=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Wolfram,
>
> On Mon, Feb 3, 2025 at 2:35=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Implement bus recovery by reinitializing the hardware to reset the bus
> > state and generating 9 clock cycles (and a stop condition) to release
> > the SDA line.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > ---
> > Resending this patch which was part of v6 [0] series.
> >
> > [0] https://lore.kernel.org/lkml/Z4ZCJYPgvS0Ke39g@shikoro/T/
> >
> > Hi Wolfram,
> >
> > Ive replied to your comments on v2 here [1] as to why the generic
> > recovery algorithm was not used.
> >
> > [1] https://lore.kernel.org/all/CA+V-a8s4-g9vxyfYMgnKMK=3DOej9kDBwWsWeh=
WLYTkxw-06w-2g@mail.gmail.com/
> >
> > Cheers,
> > Prabhakar
> >
> > v6->v7
> > - None
> >
> > v2->v6
> > - Included RB and TB from Claudiu.
> >
> > v1->v2
> > - Used single register read to check SDA/SCL lines
> > ---
> >  drivers/i2c/busses/i2c-riic.c | 100 ++++++++++++++++++++++++++++++----
> >  1 file changed, 90 insertions(+), 10 deletions(-)
> >
Gentle ping.

Cheers,
Prabhakar

