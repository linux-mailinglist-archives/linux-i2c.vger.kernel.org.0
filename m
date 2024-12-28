Return-Path: <linux-i2c+bounces-8802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 578599FDCEA
	for <lists+linux-i2c@lfdr.de>; Sun, 29 Dec 2024 00:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 734D17A13EB
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Dec 2024 23:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB5B1990D6;
	Sat, 28 Dec 2024 23:41:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB5B1991BE
	for <linux-i2c@vger.kernel.org>; Sat, 28 Dec 2024 23:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735429263; cv=none; b=Il7GHxnvGb6cLOBs1sah3jJKTX9Tr9xqGyFUsy/h3QVRmxXVddWeZuxTNhAG1ihw27NlWh6vWd4uz0o0n0ZBiMiK9ZVA7nT/boEG71zKr2hE+b99xjgcQL8WQ6Er4tXT4RL+OVEeWMIa4q8N23SVRLxi+CqFkhasnuYjKlHVK/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735429263; c=relaxed/simple;
	bh=GxT6OU5DMMOzXUdLwmBKpReesSqumSB7KsrSv8mTWmE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBZHo16enBVS5rEYu8nBhk2nkFrCXZehHCOAGVhhAkcrz4JY2Arxr9Tp7e0X5VPQLhpmiJCF7HkHreD0o/AZuLUG2y0v/EyuQK6+gyE+V4svWieNlNfyfZkrWOmA8tiwqK3fxxZJtjJDI2IsIbRa67uQ5lvjxwAPNZQUkNRIyAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-143.elisa-laajakaista.fi [88.113.25.143])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 2e11aa48-c575-11ef-8899-005056bdd08f;
	Sun, 29 Dec 2024 01:40:54 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 29 Dec 2024 01:40:54 +0200
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 0/8] i2c: riic: driver cleanup and improvements
Message-ID: <Z3CMhhEyVpQjgpun@surfacebook.localdomain>
References: <20241227115154.56154-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <huhbfedblerrw6koztkiij3hgdrty2oihmacug53734wctq34a@aqlgw63zj3ad>

Fri, Dec 27, 2024 at 11:10:22PM +0100, Andi Shyti kirjoitti:

...

> >   i2c: riic: Use dev_err_probe in probe and riic_init_hw functions
> >   i2c: riic: Use local `dev` pointer in `dev_err_probe()`
> >   i2c: riic: Use BIT macro consistently
> >   i2c: riic: Use GENMASK() macro for bitmask definitions
> >   i2c: riic: Make use of devres helper to request deasserted reset line
> >   i2c: riic: Mark riic_irqs array as const
> >   i2c: riic: Use predefined macro and simplify clock tick calculation
> >   i2c: riic: Add `riic_bus_barrier()` to check bus availability
> 
> merged to i2c/i2c-host.

There are some comments, up to you how to proceed, they seem not to be any
critical.

-- 
With Best Regards,
Andy Shevchenko



