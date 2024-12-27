Return-Path: <linux-i2c+bounces-8774-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 813219FD7E9
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 23:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA241885163
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 22:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C87155A4E;
	Fri, 27 Dec 2024 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uy3UpnGl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680038C0B;
	Fri, 27 Dec 2024 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735337162; cv=none; b=mowi+u5a+0Q8z2e2L9208y1m+f61ukk5PMTNqnJkN1rNCPGIZyLrZVwoiwf4KwgKFbAAkHNsOwa81sIZVmI2xvXm+dqAb+g3uoh8LyHa+my/5n5rLB7g0mit768Hqdx88zWryMlFotdPpMCQKnL2Z5kAbIGKcHYhMqzyP4xbdm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735337162; c=relaxed/simple;
	bh=j27bZNmQWq0IV0zaXwGFhtrXnDTg6Cq0eUpKNlUL2Ok=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pULg4nwvGvbgV2UN1O33zmzVKhU/h9OdGEsws8vnmSQ2its6DeQJkbmMadx6SDx8ZWuZT/1gMAxbMM+7pUiVazyJoNx4KL0ATnOBmMprYpdf11GwBljMKQSDSurM3Jrt9yEme7FMX1+jrQGDe110rVHji6XhGX0oboD7FHFcRjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uy3UpnGl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B5C0C4CED0;
	Fri, 27 Dec 2024 22:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735337161;
	bh=j27bZNmQWq0IV0zaXwGFhtrXnDTg6Cq0eUpKNlUL2Ok=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=Uy3UpnGlmOa2/2tAacegh3O2T+oU/WAogZZgHpAPMQV169Y8yXYy8Nm/0U3bcbPJz
	 GNhwh+CkfSTmPNrAEXUkXxrSQ5ZkcDGSEUjnKWAGPE45qFhTxNlW51MQqVsko0I1I8
	 vJT4IpRsgTbQeUQFSMEwDIlI1lz77imekXK/wWYfg4FRFREivf7UflIQ/8klEoMcG6
	 kyh0nxUuo+UiwNJ3/5vkahKWCnaT1JyYo8e+t9oBsOXwYBFplFslumgOtCe3ihQV1j
	 H+hShCCtUQxF/Gu9k/tviIrwqZhguG7m6LoSOHHbQ8M4QPbjUZyROmoEz+yzCcbMFI
	 GMcfyRGGR/4VQ==
Date: Fri, 27 Dec 2024 23:05:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Chris Brandt <chris.brandt@renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <ghgvphxopt4wvwtauahbnte3jzivyof3nujylx3b2utxi25iql@7sc2d3pb2fv4>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
 <CA+V-a8s+tY6dnVHFhjyOZ43L+roLfqPr-_28FS1KyADwyTH2+w@mail.gmail.com>
 <cnwphrjjrakaafm7zp725mickh63xw5qm6mlh6q43745ljgxfe@33y2z234oauu>
 <Z26PKpEJi-nLcSlL@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z26PKpEJi-nLcSlL@shikoro>

Hi Wolfram,

On Fri, Dec 27, 2024 at 12:27:38PM +0100, Wolfram Sang wrote:
> > I'd like to merge this once all the hardware questions are
> > answered.
> 
> Maybe we can apply patches 1-8 already, so they don't reappear on the
> list? IMHO they make sense independently of the bus recovery patch.

yes, this is what I already suggested as well in 0/8. Indeed
Prabhakar sent already patch 1-8 that I just checked and applied
(locally, still).

Thanks for your reviews and test here and thanks Prabhakar for
following on the reviews.

Andi

