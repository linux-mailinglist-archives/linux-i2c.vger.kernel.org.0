Return-Path: <linux-i2c+bounces-6937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DA97EDD4
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 17:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187CE281F74
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 15:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1857C19EEC4;
	Mon, 23 Sep 2024 15:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVXxiMb4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C761219C571;
	Mon, 23 Sep 2024 15:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727104213; cv=none; b=oX/Z4U9wIBKHKrkZcKk9QwjHT6KQ3lJwLwd9RGi9HeP4QSXoZnkJgy7tC++C9vOh1flqOaMICvP+7BWwZm79ssNR63+hyJyrJWsrKa00pgrLT28XIHOjIH10W77Wp7PFoRZ2zwIfO3lODKkCWbarr0a+P7nEnH5PqX2HMBIbwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727104213; c=relaxed/simple;
	bh=7IbJ9X8jlsiu83Vo3Odh/vec0KfgUjxs76ByJvX40F0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJ5GF3IP9d2SEmg1MQ20y4BA45IaGozvilPN82AE4t1l4G2tptirkOeSde/ojZu0Yvq8LArjhGPvYXLmJlvz14LjYAgmdFyatjWXEV9UUQscznMINr7BAx/EQjWsdMlmsYPpoZe2ljlCkRie56oyH3pcMiq31oRjDkXO7TbkJuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVXxiMb4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477F6C4CEC4;
	Mon, 23 Sep 2024 15:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727104213;
	bh=7IbJ9X8jlsiu83Vo3Odh/vec0KfgUjxs76ByJvX40F0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qVXxiMb4PaRjS1l3/arjX2jOfUWEN2yIU5IiQouFhj0pjgCFbCBRiG9CfSbb4IDjr
	 GFmMxv8c/gV9aC9cppDOvOL+OGJUC8G/pqABMdFsvRL14Z2Fqn6ucUxzn1q9wNEVL+
	 ccZs0OTG7vh3Cg/X2H3aGq+qF+5OAi4q2rmSVQgyOmeq28f1tONPI9NFHvRVx/jSCJ
	 XHapbysHMqF1BKhPeeAXxcyuVWFThQAXhsOpnZNF52sq9tRIIP/y7FElZJFAT5+aeo
	 FE/nZ1gdCtv3Mw1BhkbyC/vuV2tHMIOPSOOHYL1SINJnddpijqvv82dFaKQxxbeccp
	 Z/zJHjMxi7L6g==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5366fd6fdf1so368225e87.0;
        Mon, 23 Sep 2024 08:10:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVX1+t7wFcUubNN8jGDVLR4Hr0aFzMZ5ixL8cVPEg7GKtEjvfm6QDTMsMunVpO0iTStQv+vWM3uvXo=@vger.kernel.org, AJvYcCXnbpxgCGmX3TZQafWyJ/Ycpt0uqnA3IyCVi3ER4lQDO4CGlemkgGjj64KlnPo1OcKuJridnVvB@vger.kernel.org
X-Gm-Message-State: AOJu0YzMgOrzJeJ5ZBMUGL0ARXTjeYB/s+5EO8+ovdJTAHYDXpepm1QS
	ofs745rJPsiLD078VjS4DFEHs7BSjFLVp8GKR3d3jc+79/vWygFsdzsKQFuabSANnCnNWbsJ65h
	G320cDZNmXihtKk3dZ0pXXPcC7Fw=
X-Google-Smtp-Source: AGHT+IE5neW3typpBkpgHcLxCN0BxMOXymMuWGOe6oO7KDaWQjK5Q5O+mCotgtKvyqMfcG0mUBs4dVla8CkNi9nEcuc=
X-Received: by 2002:a05:6512:b29:b0:530:ab86:3 with SMTP id
 2adb3069b0e04-536acf6b6b0mr5581347e87.1.1727104211668; Mon, 23 Sep 2024
 08:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912104630.1868285-2-ardb+git@google.com> <dmwsrw6mwt3zsksxxb35qokhtf3setobeybhd34w52typxx4ld@zbjvamsqwfxt>
In-Reply-To: <dmwsrw6mwt3zsksxxb35qokhtf3setobeybhd34w52typxx4ld@zbjvamsqwfxt>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 23 Sep 2024 17:10:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFiYC_h_qmnOf0Vp76-hvfKcG8Z62tx-bhTKB2mj2ULaA@mail.gmail.com>
Message-ID: <CAMj1kXFiYC_h_qmnOf0Vp76-hvfKcG8Z62tx-bhTKB2mj2ULaA@mail.gmail.com>
Subject: Re: [PATCH] i2c/synquacer: Deal with optional PCLK correctly
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-i2c@vger.kernel.org, stable@vger.kernel.org, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"

On Fri, 20 Sept 2024 at 11:03, Andi Shyti <andi.shyti@kernel.org> wrote:
>
> Hi Ard,
>
> On Thu, Sep 12, 2024 at 12:46:31PM GMT, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > ACPI boot does not provide clocks and regulators, but instead, provides
> > the PCLK rate directly, and enables the clock in firmware. So deal
> > gracefully with this.
> >
> > Fixes: 55750148e559 ("i2c: synquacer: Fix an error handling path in synquacer_i2c_probe()")
> > Cc: <stable@vger.kernel.org>
> > Cc: Andi Shyti <andi.shyti@kernel.org>
> > Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>
> I'm sorry for the delay, but I needed to wait for the previous
> batch of fixes to be merged.
>
> Merged to i2c/i2c-host-next.
>

Thanks. No need to treat it with urgency on my behalf.

