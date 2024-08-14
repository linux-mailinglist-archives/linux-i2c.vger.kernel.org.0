Return-Path: <linux-i2c+bounces-5381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B954951C03
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 15:40:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AE471C210A3
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 13:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429DD1B1405;
	Wed, 14 Aug 2024 13:40:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569BC1AE031;
	Wed, 14 Aug 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723642834; cv=none; b=KWL2b0WOvU+7X7l4zWB4qwOBaa4zMWOsuXrpSM6HqDVV7fp+/u69IjQtHi+eek/bM7hQ1J/9cH8hKElNodL5Vu5uZsr3TqMgex/cV/6i3ijAWzmRCvojBWK6CNczhsjL/0hyMOrPWFVJ6YW0s6SHQHg4i+cBWTY6MxbLF2Zhk9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723642834; c=relaxed/simple;
	bh=OF+5roG2XR0AnG5rwzzhSa8RYuRbguWPK7v7qCsDHA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q6gmLtWEALJfpp0ZckARvk3keRA2J6Yv5e8N0qwhD+cIvGNxdJFz8CHOX3FJQ/j52o/nypBewl4gQwi0wnCb3nU4bnf6tTHzFTtbquEWx6/GTuI16w7xTTADIfyBhXsL/KXE1Y0hQMblyA5m2BZChRh0pVMk0cxMpspDic1JSWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f15e48f35bso66310071fa.0;
        Wed, 14 Aug 2024 06:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723642830; x=1724247630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DceD3bC3bhVPlvpzxDF7BFEfUKClk7sJV1xP1ejwJIA=;
        b=DbRAOOyoApHOuClrZvvP3rlDxmVBocsxSpeEUUXXFme+7mMfqESmVsFT8raztLUixe
         wSIHihqar7dAXYVRc/HRaFiMbuyKbupxXrGYQzmEx9CxgC0rzLTaagXsl9qGRWtj2Z+G
         V3uRi64cmFyVopQyYRkZ5O6uNQkZ3g5qgXTOd4ZwNWWm7/A6YNbW9Y1jnfu3pJWLvI74
         g5XHQuc40UonTomUBSHOekfyDdin5S0/0/lcXyvcT40zKY074WXx886IePeInlw2PjnI
         q/tasla0ygnmQ6nM6Lr5bxa1TtHygxVG/pMSrCp43ChmzskirJhRNQ49mwBiLY8uPyLc
         63VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMYeXSl5J5UCTwK8KqCLwJqfLoKu/WkqRd71Ci9sKpNDoh22A9ddmlP8ZuRnQHhVTQ5tAehusI0GaG/L/vzBH+vA9kwRdNmbfG9xDdjpkKeuzGxY3l4+E7H4psQS4M0xM8jkcJKfL2FoMauUb+aiKkCE+aJm1dzJWDabqNWFkPepG24Po=
X-Gm-Message-State: AOJu0YyHxp0MsAXLYCvVIexUCshQ6z5xOpe9SRT4Oy3tyLrf3mAWNZcO
	803dYfnVPhHF1kz2Aq61IdPYSGX9spiCQTP+m9FxGqXgvhvbG4Q8
X-Google-Smtp-Source: AGHT+IGJ8jImNPZGot03z9mnFcBF4yB4Hp9oIBkAtcB4csqaVkpQHEfF3UZV4DewNQ+K7P3NtM8GFw==
X-Received: by 2002:a2e:9942:0:b0:2ef:2e59:11dc with SMTP id 38308e7fff4ca-2f3aa1ca28bmr18039971fa.25.1723642829875;
        Wed, 14 Aug 2024 06:40:29 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-009.fbsv.net. [2a03:2880:30ff:9::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd196a5a0asm3892294a12.42.2024.08.14.06.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 06:40:29 -0700 (PDT)
Date: Wed, 14 Aug 2024 06:40:27 -0700
From: Breno Leitao <leitao@debian.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <Zryzy9hpT1wyZdLZ@gmail.com>
References: <20240813161254.3509409-1-leitao@debian.org>
 <ry4kzh4vr573ymutpjz5sgzmhosn3ekm3jatjy4yfyfm32eqit@cmp376je7viy>
 <ZrxvOr6O8weK5cB6@gmail.com>
 <7cudtahr26xrfn5uccmvtiv3ngyccu3wcrky4evxdstubz34hf@wtxzjv4z4g4w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cudtahr26xrfn5uccmvtiv3ngyccu3wcrky4evxdstubz34hf@wtxzjv4z4g4w>

On Wed, Aug 14, 2024 at 12:02:57PM +0100, Andi Shyti wrote:
> Hi Breno,
> 
> On Wed, Aug 14, 2024 at 01:47:54AM GMT, Breno Leitao wrote:
> > On Tue, Aug 13, 2024 at 11:53:17PM +0100, Andi Shyti wrote:
> > > You don't need to resend the patch. Because the changes are only
> > > in the commit log, I can take care of them.
> > 
> > In fact, the changes are in the code itself, see the changelog:
> > 
> >   * Replaced ACPI_HANDLE() by has_acpi_companion() (Andy Shevchenko)
> >   * Expanded the comment before the change (Andy Shevchenko)
> 
> I meant no need to send a v3.
> 
> > > Besides, you also need:
> > > 
> > > Fixes: ede2299f7101 ("i2c: tegra: Support atomic transfers")
> > > Cc: <stable@vger.kernel.org> # v5.6+
> > > 
> > > Can you please check whether this is right?
> > 
> > I would say that we probably want to blame the support for ACPI device,
> > which came later than ede2299f7101 ("i2c: tegra: Support atomic
> > transfers").
> > 
> > I'd suggest the following:
> > 
> >  Fixes: bd2fdedbf2ba ("i2c: tegra: Add the ACPI support")
> >  CC: <stable@vger.kernel.org> # v5.17+
> 
> Makes sense.
> 
> > I am not planning to submit a new patch with these changes, please let
> > me know if you need action on my side.
> 
> Not for now, you might need to still support the backports to
> stable as there might be some differences and I can already see
> that it doesn't apply that far back (from 6.1, basically).

Sure, count me on, if you need backports to stable.

Thanks for getting this fixed
--breno

