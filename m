Return-Path: <linux-i2c+bounces-5489-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06889566CD
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 11:21:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EBFF1F223EE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 09:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173CD15C15F;
	Mon, 19 Aug 2024 09:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDsUADbw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A44915C132;
	Mon, 19 Aug 2024 09:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724059292; cv=none; b=ftZYrm09l1WT5awMiqYMqNC3Rd698Lx4Y7IF0tSizDoNjVONzBGk+yDKLgzvVThGIf0iS62vtLDtxpeOaDV7UQtQPrHi0KrsMP5Smy59pU+xBYPini3XD9oMSrX1p+fTGtuAg2UoIXDOWSmjVzq4j3icFP0M1N21hBbo7xaOWL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724059292; c=relaxed/simple;
	bh=3loUHa7rO2z5Ld3UlRlGQLb2V+yOVXLjmLWl44Zap0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obDg/I8n7jIYrTTAUxovnX/7hZrZk0f/Xyxk+uz0NsvQE8HjAblFilIxLXkiOzkshT3A2a9cg1vEKkamqbCwvyTbtbrnAg/1GYPBgqNBhIGUhBoshjzt6dwqQELQ7jItT+B8smoLsiHvAs9KwTHZAawH0PNkpUgWtP2aFFdc8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JDsUADbw; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso722037a12.2;
        Mon, 19 Aug 2024 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724059289; x=1724664089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3loUHa7rO2z5Ld3UlRlGQLb2V+yOVXLjmLWl44Zap0o=;
        b=JDsUADbwpxqEegKHeoSGS7pYE4ijcKZdHcUkbLQMfvrPaQIxn4BNFmOz7hsMmVXDLX
         otyYirxYlnTrvTFGzOGKGbW+Uu89bOOxLtuzpUoOZ2NdRsMjvCxb9WvPDjX23SEgJy1H
         SOkrOo/2zoNXFcM2ZbSLXWE3RVVB5FweYkX5reBFm3Px1begdAHrmF+9Kxq0LJXdii6Z
         8B2s8xuAmaea4QEV+AsHbf8V5H0XnmMJn7+Qsvzj2ZywGzL/Pwh1auq7Ka5/MCduBchK
         MzUJMquoSDOkOQH0j1B0a5pZvYdiBq2hRyxwxDXUHXUwuI6Klom2bM+crqzJnE/23dX2
         zhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724059289; x=1724664089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3loUHa7rO2z5Ld3UlRlGQLb2V+yOVXLjmLWl44Zap0o=;
        b=lcp+9pNi3PwtQNYI1O0KKPMuuT0rw/9mbRlczZ8RfNygKEgTHygiwwQGrOCyXIb9Ll
         JvWFoNvD5sEg6e6Y1tFEamQA48H+S1HilW8rAV1DevvA7Nlow0MnVhxtr3CP72s5AeQB
         3H1psrk0oBGr4xmrC+h6kEWYqHlRfIxgYAfLjkzV38X/eO+nEUKq/2ajpjlC25ovxMLv
         m3K2XhHJ1ZuIsUWnOqUpuNQ8kNx+dmKPqPcXWQtledp6CDV47rRdT62s9ZG4yJOVlOFy
         bYQiCRRi4N0G2xFkDBkHLHtp0uvQM5kLTRJI35FFoVtXYTQN2M/vPmgfgwg3eaKcDwPK
         1mUg==
X-Forwarded-Encrypted: i=1; AJvYcCU+b85VN+YxrGEBqDMtQweKXiihPD5cDhSYWz+jVp29vucEWiaoUg82PlNtiZVk5udHA2LNoWs95poXPniNGvYcSZp6dcRTnEoIPFOT1YCRbeOhhPx6eQSwwGx2+l/UjFUq9cFjvnCNINCP2/EoyVE8WpV4TqqGE7dbvzp2a20sIEEFfuY=
X-Gm-Message-State: AOJu0YzqbI4DuEqESgOBfVM+EnWy7EAwCIQ6CNHO4VpFUdjxUXWAZolm
	8hL53EfM6mGzOtkFkEGkMhFmbuhJo4lVyPe9u3llZwZ1tUjsxq7Q/m+RpsC9Lov/vQ3vHIb7GXu
	ONVGCc1ISmDb/f+aIui85nHHks8g=
X-Google-Smtp-Source: AGHT+IEJ8Sbj82lcHcDcPC5wzaluIxWpYzOqvxsxRkkxTG1KBbfurCOFeOY3Dq31Mo0GSfHhJeQ8RwSc/X/ExRpeL3k=
X-Received: by 2002:a17:906:730a:b0:a6f:1036:98cf with SMTP id
 a640c23a62f3a-a8392a0393amr801123566b.54.1724059289070; Mon, 19 Aug 2024
 02:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240808121447.239278-1-leitao@debian.org> <ff4haeeknghdr5pgpp3va7opnrx5ivlpaw5ppboqrq75733iul@zy4c7mu3foma>
 <CAHp75VdbRexEx90ybaFsiPhg8O0CzvpkWT1ER31GnP-y8a1e+w@mail.gmail.com>
 <ZrtgfkzuCbNju3i9@gmail.com> <cf2d6ff5-dfea-4e25-8eee-e4e8c9cb1e7e@gmail.com>
 <CAHp75VdHT3g91AirBQGodw1sHbq7U=oKnJq3oSqDcNYS+OUOKQ@mail.gmail.com> <6c48f84c-f6da-4f4b-add5-71ec4ea6b963@gmail.com>
In-Reply-To: <6c48f84c-f6da-4f4b-add5-71ec4ea6b963@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 19 Aug 2024 12:20:52 +0300
Message-ID: <CAHp75Vffdia3n-FURNa5sB5SwOq+BW84jpTVEYeMCnL+1NZgRw@mail.gmail.com>
Subject: Re: [PATCH RESEND] Do not mark ACPI devices as irq safe
To: Dmitry Osipenko <digetx@gmail.com>, Tony Lindgren <tony@atomide.com>
Cc: Breno Leitao <leitao@debian.org>, dmitry.osipenko@collabora.com, 
	Andi Shyti <andi.shyti@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com, 
	Michael van der Westhuizen <rmikey@meta.com>, 
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+Cc: Tony

On Thu, Aug 15, 2024 at 5:48=E2=80=AFAM Dmitry Osipenko <digetx@gmail.com> =
wrote:
> 13.08.2024 18:52, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
> >>> but somewhere in the replies
> >>> here I would like to hear about roadmap to get rid of the
> >>> pm_runtime_irq_safe() in all Tegra related code.
> >>
> >> What is the problem with pm_runtime_irq_safe()?
> >
> > It's a hack. It has no reasons to stay in the kernel. It also prevents
> > PM from working properly (in some cases, not Tegra).
>
> Why is it a hack? Why it can't be made to work properly for all cases?

Because it messes up with the proper power transitions of the parent
devices. Refer to the initial commit c7b61de5b7b1 ("PM / Runtime: Add
synchronous runtime interface for interrupt handlers (v3)") that
pretty much explains the constraints of it. Also note, it was added
quite a while after the main PM machinery had been introduced.

What you have to use is device links to make sure the parent (PM
speaking) may not go away.
FWIW, if I am not mistaken the whole reconsideration of
pm_runtime_irq_safe() had been started with this [1] thread.

If you want to dive more into the history of this API, run `git log -S
pm_runtime_irq_safe`. It gives you also interesting facts of how it
was started being used and in many cases reverted or reworked for a
reason.

> >> There were multiple
> >> problems with RPM for this driver in the past, it wasn't trivial to ma=
ke
> >> it work for all Tegra HW generations. Don't expect anyone would want t=
o
> >> invest time into doing it all over again.
> >
> > You may always refer to the OMAP case, which used to have 12 (IIRC,
> > but definitely several) calls to this API and now 0. Taking the OMAP
> > case into consideration I believe it's quite possible to get rid of
> > this hack and retire the API completely. Yes, this may take months or
> > even years. But I would like to have this roadmap be documented.
>
> There should be alternative to the removed API. Otherwise drivers will
> have to have own hacks to work around the RPM limitation, re-invent own
> PM, or not do RPM at all.
>
> Looking at the i2c-omap.c, I see it's doing pm_runtime_get_sync() in the
> atomic transfer, which should cause a lockup without IRQ-safe RPM,
> AFAICT. The OMAP example doesn't look great so far.

Bugs may still appear, but it's not a point. I can easily find a
better example with a hint why it's bad to call that API [2][3][4] and
so on.

[1]: https://lore.kernel.org/all/20180515183409.78046-1-andriy.shevchenko@l=
inux.intel.com/T/#u
[2]: https://lore.kernel.org/all/20191114101718.20619-1-peter.ujfalusi@ti.c=
om/
[3]: https://lore.kernel.org/all/20180920193532.7714-1-tony@atomide.com/
[4]: https://lore.kernel.org/all/1463014396-4095-1-git-send-email-tony@atom=
ide.com/


--=20
With Best Regards,
Andy Shevchenko

