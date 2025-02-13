Return-Path: <linux-i2c+bounces-9451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F196A35167
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 23:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1D9F3ACF6B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 22:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41FA26E156;
	Thu, 13 Feb 2025 22:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODO1fwji"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEFE2661B9;
	Thu, 13 Feb 2025 22:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739486486; cv=none; b=S2+jlBO7rFSKEgO/7clGGy+YyDEewvUBaQXPOcSyZQB9lGINpfIudPQdcBx23QGmRmRXLXTO/wxTfwRkfKGJh1l+A4vGvL7BdZ94PA7v+prPuWJnxj8G5GOvsTxC/fhzIzfd7W9mdkaycw0L9mrEEv/smTYkEsRpF7sBofBz1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739486486; c=relaxed/simple;
	bh=CAUs6/nDNjcTwNdHYChXbiqiDRrypj8AA18+T0T5af4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7JNykx8M9Mf3eVB9WMY61e6sTjTznqWxprB/spFSnOWbP/t9AyTXB/mM1K6VrR/PPwEjRmJhQtgx3nXzswk9mfdI0pNJJREmv9JP0GvUAPVwElUfKDStKmlfM8GACqut2S8iO7mIwH68QnJTJXYcwDm/1W1HWOugPDsUuRaozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODO1fwji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7856EC4CED1;
	Thu, 13 Feb 2025 22:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739486485;
	bh=CAUs6/nDNjcTwNdHYChXbiqiDRrypj8AA18+T0T5af4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ODO1fwjiA4au/KUL3n4jxyKJl8PNOod+scC0fQbLvGK84PNz5zukCpL4Cq/HJcTti
	 2rsvAMFqqkotzEIXWF9oYxp8kGLTeXIMaQBtORe+jQ/ULXQnhep1BZXJINtsHTKsGU
	 7I+N0QOySIACYzzp7NyZkFX/Aj9Tv9yoGXNL5JGQz9cSZFAjSBv76Ve96m+av4+yIR
	 RE/2PCyQzFiqvE5c1G3NGFswOplVTDhOgOYysKL2dvserTbwEAi5+3QAVnhnbZlQ7G
	 hYU/lstAjeqfG6j2J9cj0RhvAtgWflgIBt/5X7FTlDS2bvSltTVc3KMuBuvj4Dl42B
	 SWBkVDwwo5Znw==
Date: Thu, 13 Feb 2025 23:41:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Krzysztof Adamski <krzysztof.adamski@nokia.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Stefan Roese <sr@denx.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Gregory CLEMENT <gregory.clement@bootlin.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v1 1/8] i2c: Introduce i2c_10bit_addr_from_msg()
Message-ID: <65f5eiy6kh6nhdjgpylrdjpw35jbae4s454u7qeqamh5hny7ms@ip4btvgxlaq4>
References: <20250212163359.2407327-1-andriy.shevchenko@linux.intel.com>
 <20250212163359.2407327-2-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1wxQ0cddeE72D+Sii4HkT4bJfeTWX4-8FfHiFr+=3DA@mail.gmail.com>

Hi Geert,

> > @@ -952,6 +952,16 @@ static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
> >         return (msg->addr << 1) | (msg->flags & I2C_M_RD);
> >  }
> >
> > +static inline u8 i2c_10bit_addr_from_msg(const struct i2c_msg *msg)
> 
> Having never used 10-bit addressing myself, or even looked into it,
> it took me a while to understand what this helper really does...
> So this returns the high byte of the artificial 16-bit address that
> must be used to address a target that uses 10-bit addressing?
> Hence I think this should be renamed, to better match its purpose.

It's coherent with i2c_8bit_addr_from_msg(), right?

Andi

