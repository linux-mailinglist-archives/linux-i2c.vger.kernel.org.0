Return-Path: <linux-i2c+bounces-8798-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6945D9FDCE0
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 020F07A03E8
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E458D1991A5;
	Sat, 28 Dec 2024 23:36:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053CC26AEC
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735428971; cv=none; b=sDrQo0aV188VwS1buftgj+sUqgUcCC7Aaf05fmeO5RoNBptCN5vFtPdB1QGErKy4IGCJjunMyrmKAyhLMSZgKLLhbC3m2YD+4VnXXPyR4H08c4dBlBv/sS6xnnh5ywF+J1Gf07HWthrBr/9yfP/AMFbAkEPgs+3xLmup78b29X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735428971; c=relaxed/simple;
	bh=/JMLtOckqTevxOBnB08ZjbXhh60OjgqEhNLccrDKrfQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+9uzGtL+goF3zqxOg8lSJY3snkU4YRiM2PC7KD0icw2E7AiNrYTOLGjujzkfs7GiGm1i1U6xrPAI+MPFVjozQoDFj1jnOUbmxJqw8/0SZSAiU+UXVNsXOUteOQOMHjde+uiVo76fvtAv47Nm1Y+17phm0NcUqbg4cQ/auIjUaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id 804fb1d8-c574-11ef-9c75-005056bd6ce9;
	Sun, 29 Dec 2024 01:36:03 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:36:02 +0200
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
Subject: Re: [PATCH v3 4/8] i2c: riic: Use GENMASK() macro for bitmask
 definitions
Message-ID: <Z3CLYs1ZP3GuSO_T@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227115154.56154-5-prabhakar.mahadev-lad.rj@bp.renesas.com>

Fri, Dec 27, 2024 at 11:51:50AM +0000, Prabhakar kirjoitti:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Replace raw bitmask values with the `GENMASK()` macro in the `i2c-riic`
> driver to improve readability and maintain consistency.

...

> -#define ICBR_RESERVED	0xe0 /* Should be 1 on writes */
> +#define ICBR_RESERVED	GENMASK(7, 5) /* Should be 1 on writes */

I don't understand the comment. Does it mean the value should be 0x20?

-- 
With Best Regards,
Andy Shevchenko



