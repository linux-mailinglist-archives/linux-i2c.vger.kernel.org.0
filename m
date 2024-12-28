Return-Path: <linux-i2c+bounces-8797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D91B9FDCDA
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 155E8161CFB
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A56198A10;
	Sat, 28 Dec 2024 23:34:00 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ECD19884B
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735428840; cv=none; b=KPCJDZmzsIQ30qhhFZmEBTVcKOIWSeqtSB7I/yYm7AVa2G9vQ0+0NuL4lERN4CLgyVsEoSc8JACS1I4QHSld4WxPLGw9ke99ZqxGG3mMEz0cEAzLNHE3ty2CD3YMGlt7qc7K3nDWn9XXlCsn2Q+wfYNu637v836+TvVoTlDWTHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735428840; c=relaxed/simple;
	bh=ixRQk6kmLRJVJgXweZ3hWxKQjtxdyphRePNjPc46aig=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DvVmz+ZeQI1JVfd9EWvK05lIx7lUCzYh/DtxmnBtjbB5+nTxVmtyzFN5xjfAOaMPnBOgZeNp99umeyUgAoPGrWeTCuubsdpCX3ec26OmOTiPtQGmlC8x77aayN8dyd9K4VPaeN4sg79MyLYaOFRgXOVrBX2h4ixg8JEqOWwzysU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 0ad8e816-c574-11ef-8899-005056bdd08f;
	Sun, 29 Dec 2024 01:32:47 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:32:46 +0200
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v3 1/8] i2c: riic: Use dev_err_probe in probe and
 riic_init_hw functions
Message-ID: <Z3CKnu60lVuDBedn@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-2-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:47AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Refactor error handling in the riic_i2c_probe() and riic_init_hw()
> functions by replacing multiple dev_err() calls with dev_err_probe().
> 
> Additionally, update the riic_init_hw() function to use a local `dev`
> pointer instead of `riic->adapter.dev` for dev_err_probe(), as the I2C
> adapter is not initialized at this stage.

...

> +	if (brl > (0x1F + 3))
> +		return dev_err_probe(dev, -EINVAL, "invalid speed (%lu). Too slow.\n",
> +				     (unsigned long)t->bus_freq_hz);

There is nothing special about bus_freq_hz. Why casting?

...

>  		ret = devm_request_irq(dev, ret, riic_irqs[i].isr,

I hate code doing

		ret = foo(ret);

>  				       0, riic_irqs[i].name, riic);

> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to request irq %s\n",
> +					     riic_irqs[i].name);

While this following the original code, with the above change (introducing a
separate variable for IRQ) this might also print it.

-- 
With Best Regards,
Andy Shevchenko



