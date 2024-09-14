Return-Path: <linux-i2c+bounces-6749-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F349792BD
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 19:56:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FC0F1F222EB
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Sep 2024 17:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D11E1D12FF;
	Sat, 14 Sep 2024 17:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BCKnMStk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAA6522F;
	Sat, 14 Sep 2024 17:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726336574; cv=none; b=WtgyLB5XCKpA7ioEWVtxsCz3uPfxQKhRBY4JBVWudomC3ChKl9b5C35x0D/SGn1QdHl2r0pA+uwwnjfFewNuVUEe2X2mECOO2kDEtj85QLm73XDEpyclUvD5tlKnh2Gs3/Gh7DuMJrhu0wgjITNxticNFDn69mSItbtBFkMVsOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726336574; c=relaxed/simple;
	bh=usg5zuvL6dMiMtReqxAmcXPlYBF1AWzxevclY567A/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGPxkqOOeL2frg0ZxgqulD244E4Pn3cRqlgLHYfr5DlwhmK1eAXyi2ScBrvMhgaHNfN6+Bn8MX1c33+kQSZXNuGbynbL7n6v+bacrvua2YQSoIFMZLSfG8eiZxup+bUZq/kpSwzgEWD56dCsu32TGYxjlDro0ArzPuMq4QtE03c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BCKnMStk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78388C4CEC0;
	Sat, 14 Sep 2024 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726336573;
	bh=usg5zuvL6dMiMtReqxAmcXPlYBF1AWzxevclY567A/4=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=BCKnMStk0KD+KF5iLNc2XB3G3YDXTC7IF5zt1upbDpbkyTewGa+L+bN3T+QCIm+/Y
	 dcUP4wpxJ5OVej1SrXlGVNH6rMQsZ8gFAsxwg3lKkaE7rzFkVGFbcQIkMnzvhVM6Kr
	 M5RTY7BxqmGcL3I30T4qtMRxT9JvvK30B023vO8c=
Date: Sat, 14 Sep 2024 19:56:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Arturs Artamonovs <Arturs.Artamonovs@analog.com>,
	Greg Malysa <greg.malysa@timesys.com>,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	soc@kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Olof Johansson <olof@lixom.net>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, adsp-linux@analog.com
Subject: Re: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
Message-ID: <2024091459-company-diabolic-a9ed@gregkh>
References: <20240912-test-v1-1-458fa57c8ccf@analog.com>
 <b6af2603-7f72-47d7-98b9-6dc2761dfb74@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b6af2603-7f72-47d7-98b9-6dc2761dfb74@web.de>

On Sat, Sep 14, 2024 at 07:15:08PM +0200, Markus Elfring wrote:
> …
> > +++ b/drivers/soc/adi/system.c
> > @@ -0,0 +1,257 @@
> …
> > +static void adi_system_config_remove(struct platform_device *pdev)
> +{
> > +	struct adi_system_config *config = platform_get_drvdata(pdev);
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&adi_system_config_lock, flags);
> > +	list_del(&config->list);
> > +	spin_unlock_irqrestore(&adi_system_config_lock, flags);
> > +}
> …
> 
> Under which circumstances would you become interested to apply a statement
> like “guard(spinlock_irqsave)(&adi_system_config_lock);”?
> https://elixir.bootlin.com/linux/v6.11-rc7/source/include/linux/spinlock.h#L572
> 
> Regards,
> Markus
> 


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

