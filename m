Return-Path: <linux-i2c+bounces-8716-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C320A9FC766
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 02:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EFD9162047
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Dec 2024 01:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D752E3EB;
	Thu, 26 Dec 2024 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DimRw8mE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E15D211C;
	Thu, 26 Dec 2024 01:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735176279; cv=none; b=tkajDV9vFCufYHS8GWwG2VnImDfpsvOr/38JR5rmrB8eXTRvWAKT2RSmut6Ipx779wrS2CSpTt4tTLlcegvzjVAS2eSZiL49Y6KtZ3fyBFldEdKMRcdiXQSk0jvRmaevuptsao1fnZgm/hIt8uAfMSDKFkGaiFh8krWvEgg1sAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735176279; c=relaxed/simple;
	bh=fc17CD9xkjetm5QN0C+hnzNVjeD55N/jGm9aYyO8C5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il7oLHXIF6b78mWmYmeEjIiNMHhiEaM4uFWFYP7J8sYbj9OF4QFZz2JEXsgzqjdK5o6umpQGx0Gk8rNaCL765CMlsYjebA0y07I9zTVRTgMioqtINzpJDPF84NBof9oyTg34omL9018+WW61SqbzmwbSHTVVX1YO3ReMR4in2BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DimRw8mE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D5FC4CECD;
	Thu, 26 Dec 2024 01:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735176279;
	bh=fc17CD9xkjetm5QN0C+hnzNVjeD55N/jGm9aYyO8C5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DimRw8mE835jMG24RwCURJeOEksUCcr/L0VT4TxFY3bErhuA6qOdnDZGP2Z3Cu8f/
	 aFoFcWGGHQ7oTHkbbFPrfN1t6tBrUknSgFJ5qbsMrsK6jRUO+pM2fjDRf0xnmk1Ldt
	 kpWnnPRqsJIFSfHZxHXpYxtYJvBkYohUMkBfffGEpfU09qfw+4pOl7NTTupoC3UEP/
	 RAvmROeuy0MYfGpL/WHNZOLyTKhCukrIGMZAW7Joaq88mD3C5SfcDtBlcEgsJEQanz
	 5apP89Q2Whm2HuKAGqnkBk6hvC7zVyHS9GTPGXv2/N4EgHJVgkra2omZJ5fJXi6vSs
	 iv7RSj4VvjHSg==
Date: Thu, 26 Dec 2024 02:24:34 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
Message-ID: <q5o4fo43zxcivpy5fs34xmshdezz6ccr66tejml7l5b4hlsmzv@avhxfanmlny4>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

> Lad Prabhakar (9):
>   i2c: riic: Replace dev_err with dev_err_probe in probe function
>   i2c: riic: Use local `dev` pointer in `dev_err_probe()`

just a change re-ordering here.

>   i2c: riic: Use BIT macro consistently
>   i2c: riic: Use GENMASK() macro for bitmask definitions

I'm OK with these two patches to be separate.

>   i2c: riic: Make use of devres helper to request deasserted reset line
>   i2c: riic: Mark riic_irqs array as const
>   i2c: riic: Use predefined macro and simplify clock tick calculation
>   i2c: riic: Add `riic_bus_barrier()` to check bus availability
>   i2c: riic: Implement bus recovery

There were a few comments on this patch '9' that are waiting for
a follow up.

If you want you can split the series and send patches 1-8 and I
can merge them in the meantime. Patch '9' can be taken once we
are sure about the change from a hardware perspective.

Thanks,
Andi

