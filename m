Return-Path: <linux-i2c+bounces-6407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F0971A50
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 15:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6697B1C220BD
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584551B81DC;
	Mon,  9 Sep 2024 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U3VJrk+m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145C1B81DD;
	Mon,  9 Sep 2024 13:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725887103; cv=none; b=ODqXkfhpM52eJ3pJLT+c+C5OyWdb8lpnGOBMGGKbP0brJCq4VWWkNXJZnmJM9WWeY5FmIg2I+WvhA4X6IKRBKvLClGRLEXxOqrM0uNb9pZPnt2nrXBhPdnxx/AcVHHNauvSb2sjlAuO4GhvJyiEbkI/UKxdDo7yItWejRO0ATbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725887103; c=relaxed/simple;
	bh=Y4vbui6vUEaFQJTah1XC7EIdYR+XbRCpzt0LslpcyA8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhiMAO7KPIqc5F3vNxmTh/fjyUITibm23h3iWaXJMEt7zvtRwxFK+wnow9NVIyDzxuB74aA4HqBYXFW4y5Z3btn+HmjB960SvAAmZc6Bxv3BXg7qpeYbeGKcmvSfw7UVXzO9NEvbuEwfL5mSZtpRzbt3sjRs4xFHKENhrBJATvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=U3VJrk+m; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1725887101; x=1757423101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y4vbui6vUEaFQJTah1XC7EIdYR+XbRCpzt0LslpcyA8=;
  b=U3VJrk+mif3osptOYoJY+5m+5SLBY0M+AQyZ2jyrv1OC56DMjowuGBoN
   0z6B/Iny/DALL8fFMF/fC3Av+V4frEAR6SvDtE+/+wDzlP1pPqVPp3zCu
   kHRuG1p+3TcQZpTDKWH6JpcPQzutx+fhZ82PLrrEjjQGEM2TYXEshpm37
   WmbSbHY0sUdmeHhg7b56oCLjCfNpk3+CzLJTij+5hhcshGRNy7Fhc3aaR
   CCla6Jn5KI1aDzuMCjP5F54Ic6L/pQoiZ54fGAxl+fenlGHWTEbV1CP6b
   uE7a9UcO5nZuHFABk1mtfdrCAqeAvmGFkCyRRr2Q7onn3uIeOdo7S/KYl
   g==;
X-CSE-ConnectionGUID: lpkNmxu6TAiBZiRkO477XQ==
X-CSE-MsgGUID: /6PLgnzTSmCqRK6aCJ8PLQ==
X-IronPort-AV: E=Sophos;i="6.10,214,1719903600"; 
   d="asc'?scan'208";a="262480614"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2024 06:05:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 9 Sep 2024 06:04:39 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 9 Sep 2024 06:04:38 -0700
Date: Mon, 9 Sep 2024 14:04:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jarkko Nikula
	<jarkko.nikula@linux.intel.com>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	<linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 7/7] i2c: designware: Group all DesignWare drivers
 under a single option
Message-ID: <20240909-sandpit-prideful-1d903230ac16@wendy>
References: <20240903142506.3444628-1-heikki.krogerus@linux.intel.com>
 <20240903142506.3444628-8-heikki.krogerus@linux.intel.com>
 <o4bks5pxn5olnvobln3z2axi6jx57vz5pq2kazyzxemptbp6fb@p7qsppr7ks55>
 <20240909-jugular-cucumber-b7d9bc614f74@wendy>
 <ushhe5isjiafpiovwfj3pnsnt7th6y2a6utblhb2gsspj5rj64@rahzahx447aj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z+wvNHNLkpGrdKKQ"
Content-Disposition: inline
In-Reply-To: <ushhe5isjiafpiovwfj3pnsnt7th6y2a6utblhb2gsspj5rj64@rahzahx447aj>

--z+wvNHNLkpGrdKKQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 09, 2024 at 02:21:32PM +0200, Andi Shyti wrote:
> Hi Conor,
>=20
> On Mon, Sep 09, 2024 at 12:22:22PM GMT, Conor Dooley wrote:
> > On Thu, Sep 05, 2024 at 10:46:02PM +0200, Andi Shyti wrote:
> > > Hi Heikki,
> > >=20
> > > On Tue, Sep 03, 2024 at 05:25:06PM GMT, Heikki Krogerus wrote:
> > > > There are quite a few drivers and options for the DesignWare
> > > > I2C adapter in the Kconfig. Grouping all of them under the
> > > > I2C_DESIGNWARE_CORE. That makes the menuconfig a bit more
> > > > easier to understand.
> > > >=20
> > > > Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > >=20
> > > Thanks for your patch, I can take this only after the other
> > > patches have been taken in.
> >=20
> > I assume then that you're expecting the prereqs to go through the
> > various arch trees? Is this not trivial enough that you could chuck it
> > on a dedicated branch in your tree and if, for some reason, there's a
> > non-trivial conflict the affected could pull it in?
>=20
> Thanks for your advice: considering that cross-domain patches are
> difficult to handle, I appreciate any suggestion on how to deal
> with them :-)

It's also helpful if the submitter of a series proposes what path
patches should take upstream. I find that people all look at something
like this and see "someone else's problem" written all over it, and
would be perfectly happy to accept a proposal from a submitter that it
all goes via I2C.

> Are you suggesting to set these up in a different branch and send
> a pull request out of that branch?

What I meant was put them in a dedicated branch (so probably on top of
-rc1 or similar) and merge that branch into your for-next branch. If
someone then was to run into a non-trivial conflict you could tag the
dedicated branch and they could pull it into their tree.

> I don't want here to step into other people branches if they
> don't ack or express any thought.

Sure, I wouldn't either, but it far from abnormal for driver subsystem
maintainer to take these sort of rename/dependency addition patches and
the normal path for 3 of the 5 architectures affected here is via Arnd
and I figure there's a low probability of the maintainers of those
architectures having their feels hurt.

Cheers,
Conor.

--z+wvNHNLkpGrdKKQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt7yRQAKCRB4tDGHoIJi
0l7mAP4j6RD0sa22II4b6qc4fqRAbkYt7W4zcByX+NqqAB25XgEA66sQQ0X5mH+y
ubXc193YpVlipeTttTISbLKeipx7SQs=
=rN36
-----END PGP SIGNATURE-----

--z+wvNHNLkpGrdKKQ--

