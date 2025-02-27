Return-Path: <linux-i2c+bounces-9629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07189A480F5
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 15:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57973A2915
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDB522C35C;
	Thu, 27 Feb 2025 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QSFYMRQo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99342AA1;
	Thu, 27 Feb 2025 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666087; cv=none; b=GHD+5y0ozGI3fDmWg1QdThZsBczw+QIuQv5FJXz482SnmkGcIFRzanDF1vMkr0nBKHP2RoFYl3KpZX08KDFpH7kzX0lEEfxxwlvmQyfty9NEmm36uwrM3vj92JhocveABzbzdtrtwqCawACkRZZKQxh+/c28jrpf03IvxJh4wG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666087; c=relaxed/simple;
	bh=gFa6GpKVLPwlHcDdDMyMTXz8bG022aq5QSyPy10QOa0=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k5fX5+Y6FYX9vDG3eGapSC+y12eGd7EzyzrzjO6WyYcnmCWc24N90U7D74EUYzs2Q/x8vyxv7bvUwMjcqfeL/lYIyEZWkI86u+zGciwJ4xDFQDgFiz2Ax1Yp2vu0RJhEp6uNpkLP6y2mSWzScC+lZ7Z4IyN/ZiIGwUJd6jpoFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QSFYMRQo; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51REKtYe1783638
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 08:20:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740666055;
	bh=lM/T3w7yUieqaJocZ0BLAs84QNCXgUrCL8lVLG4NWTs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=QSFYMRQocjgVFaCGWkMEyWi0F5TSes/NQaMaXjEAgo41xQLwoSAL/izLY3/DtIs/4
	 HQkLhm44q6rSarjxpah6TdlvZxplsTPSnYPGHnh6MYHDQsms4GSovJvcQVP/MgO8e1
	 YiG/ieHZ54+KkgQxOAAILN5QEVrgpZGRENbZjTSM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51REKt4m009869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Feb 2025 08:20:55 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Feb 2025 08:20:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Feb 2025 08:20:55 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51REKtcs097316;
	Thu, 27 Feb 2025 08:20:55 -0600
Date: Thu, 27 Feb 2025 08:20:55 -0600
From: Nishanth Menon <nm@ti.com>
To: Andreas Kemnade <andreas@kemnade.info>
CC: Andi Shyti <andi.shyti@kernel.org>, <vigneshr@ti.com>,
        <aaro.koskinen@iki.fi>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <jmkrzyszt@gmail.com>, <reidt@ti.com>,
        <wsa@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <stable@kernel.org>
Subject: Re: [PATCH] i2c: omap: fix IRQ storms
Message-ID: <20250227142055.ndzavzysaenoducj@murky>
References: <20250207185435.751878-1-andreas@kemnade.info>
 <c3bcusjbn23z5yd2a3xtm7swnfizkl7rb6ufhicdhn52epnjvb@5uqm3g6jcony>
 <20250220100745.05c0eff8@akair>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250220100745.05c0eff8@akair>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 10:08-20250220, Andreas Kemnade wrote:
> Am Wed, 19 Feb 2025 20:22:13 +0100
> schrieb Andi Shyti <andi.shyti@kernel.org>:
> 
> > Hi,
> > 
> > On Fri, Feb 07, 2025 at 07:54:35PM +0100, Andreas Kemnade wrote:
> > > On the GTA04A5 writing a reset command to the gyroscope causes IRQ
> > > storms because NACK IRQs are enabled and therefore triggered but not
> > > acked.
> > > 
> > > Sending a reset command to the gyroscope by
> > > i2cset 1 0x69 0x14 0xb6
> > > with an additional debug print in the ISR (not the thread) itself
> > > causes
> > > 
> > > [ 363.353515] i2c i2c-1: ioctl, cmd=0x720, arg=0xbe801b00
> > > [ 363.359039] omap_i2c 48072000.i2c: addr: 0x0069, len: 2, flags: 0x0, stop: 1
> > > [ 363.366180] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x1110)
> > > [ 363.371673] omap_i2c 48072000.i2c: IRQ (ISR = 0x0010)
> > > [ 363.376892] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > [ 363.382263] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > [ 363.387664] omap_i2c 48072000.i2c: IRQ LL (ISR = 0x0102)
> > > repeating till infinity
> > > [...]
> > > (0x2 = NACK, 0x100 = Bus free, which is not enabled)
> > > Apparently no other IRQ bit gets set, so this stalls.
> > > 
> > > Do not ignore enabled interrupts and make sure they are acked.
> > > If the NACK IRQ is not needed, it should simply not enabled, but
> > > according to the above log, caring about it is necessary unless
> > > the Bus free IRQ is enabled and handled. The assumption that is
> > > will always come with a ARDY IRQ, which was the idea behind
> > > ignoring it, proves wrong.
> > > It is true for simple reads from an unused address.
> > > 
> > > So revert
> > > commit c770657bd261 ("i2c: omap: Fix standard mode false ACK readings").
> > > 
> > > The offending commit was used to reduce the false detections in
> > > i2cdetect. i2cdetect warns for confusing the I2C bus, so having some
> > > rare false detections (I have never seen such on my systems) is the
> > > lesser devil than having basically the system hanging completely.
> > > 
> > > No more details came to light in the corresponding email thread since
> > > several months:
> > > https://lore.kernel.org/linux-omap/20230426194956.689756-1-reidt@ti.com/
> > > so no better fix to solve both problems can be developed right now.  
> > 
> > I need someone from TI or someone who can test to ack here.
> > 
> > Can someone help?
> >
> The original (IMHO minor) problem which should be fixed by c770657bd261
> is hard to test, I have never seen that on any system (and as a
> platform maintainer have a bunch of them) I have access to.
> There is not much description anywhere about the system in which the
> original system occured, and no reaction since several months from the
> author, so I do not see anything which can be done.
> Maybe it was just faulty hardware.
> 
> As said in the commit message, reverting it should be the lesser devil.
> And that state was tested for many years.

Can we not handle this slightly differently? leave the fix based on
compatible? we know that the i2c controller changed over time. the
i2cdetect bug fixed by c770657bd261 esp hard to find and fix.



-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

