Return-Path: <linux-i2c+bounces-8800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D49FDCE2
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C54A1188159B
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2521146A6B;
	Sat, 28 Dec 2024 23:37:51 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B512744B
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429071; cv=none; b=j5L2GJd1Fop8O0hpal1D+R460LEJJ9QTnKN/njI00gYHERATIEXqHMnuUSHP9AVUL/tZUOVt5ctyPedHIGsMRUWTvvh2PhRnTbox+EN/I/Ln2dfJS3fv1z7DEnh889CBJ9s5gMLsO2rkBVEzxihI3Qh7e79MXflramOi/q5iQX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429071; c=relaxed/simple;
	bh=4P/JxsvWIy9nEkDkkdDgK8A7i6ezBs5pomUCP0e7j/I=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJWYyfjhgy+a0xhlPFjza3C37MeNrOgiurg5zQN7GOth9hYxEIdMam6Yct5R1+oIjej5/RNYTczrXy4+is1xRKvO/AzX+H2vxu3dtZlt1e3O5fpStvQymab4ANgIon4KaFUdYYXLAQJlNgmQAVPL/oBNNTtjEkHAytRp5LXwTts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id be12f6aa-c574-11ef-9c75-005056bd6ce9;
	Sun, 29 Dec 2024 01:37:46 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:37:46 +0200
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
Subject: Re: [PATCH v3 7/8] i2c: riic: Use predefined macro and simplify
 clock tick calculation
Message-ID: <Z3CLypNNqqlSsabo@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-8-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:53AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Replace the hardcoded `1000000000` with the predefined `NANO` macro for
> clarity. Simplify the code by introducing a `ns_per_tick` variable to
> store `NANO / rate`, reducing redundancy and improving readability.

...

> -	brl -= t->scl_fall_ns / (1000000000 / rate);
> -	brh -= t->scl_rise_ns / (1000000000 / rate);
> +	ns_per_tick = NANO / rate;

So, why NANO and not NSEC_PER_SEC?

> +	brl -= t->scl_fall_ns / ns_per_tick;
> +	brh -= t->scl_rise_ns / ns_per_tick;

-- 
With Best Regards,
Andy Shevchenko



