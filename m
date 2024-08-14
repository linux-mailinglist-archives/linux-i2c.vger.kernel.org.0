Return-Path: <linux-i2c+bounces-5409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C9B95223D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 944DB283075
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1891BBBD7;
	Wed, 14 Aug 2024 18:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dibLzDl9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3F4374FA
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 18:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661518; cv=none; b=Tr/C3RmJHlgEcbDe5jAogQ2lowBYrOpPRH2LJz5DDdJthza4OnUh//gWoGWXChe55IivEG6Y0Vnfc98AsLhhWlmzoIxVKEEow2TsF5EzJBlIiw6S0Cl5ue8CQSyfzSt87In/b45Qq/jsEGKHdb8/W0CCXJFpNzXaODc3v+uAcjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661518; c=relaxed/simple;
	bh=W/Exe6slL2UYr89MSFRig0N5xbmci3y33qQtzrkN4Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nfj25jRHZGw8ZTUcBZy2Tsft9qXbBAbd0BopgfU3Svqp9ktwc3DJZjN+vJO/ve5wk3oTncCTwtOEwt+lJQCCSuYj24pWXPxH10l2Hv0EP+DLaE19j189+uP/WnojA8e6KtzA9B+1I8lIewIrqBiOMtXCqGMPXIGvmacjl523U9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dibLzDl9; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=W/Ex
	e6slL2UYr89MSFRig0N5xbmci3y33qQtzrkN4Pc=; b=dibLzDl9xL+Ivl71Cu9h
	wuRqcelVnGhr3Wkfzn6RtU7Xi6Ifa+kc3AScj0ij6dqVcdggjlBYWUHSW+ilolh2
	RmiV4SDktOymWFXX2kw17sSo7wD1qS6JsDUyEajkgc9Qe7fNMlvUN+tzPQVPr4UQ
	k2H5+vuv6pAWa5+Mw2TID/prYqmFEtR8nSXK7HV/6SslzLF8iZzx+6533FQW9wyD
	AEyZIIbVjswZSP9++U5Fzff0IHvnjmhRp7lmmU4VhbOkMZLTASLtQL9bC46aa0jW
	IQwLvKG5xlOejfYpnpspyCZaZSivm/FIZxfs8MPQx7QY3caxPDsHlc0t7Q87kxJQ
	PA==
Received: (qmail 2071514 invoked from network); 14 Aug 2024 20:51:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Aug 2024 20:51:52 +0200
X-UD-Smtp-Session: l3s3148p1@h90sOKkfmNEgAQnoAHipAGJRnFk/ZdC8
Date: Wed, 14 Aug 2024 20:51:52 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zrz8yHYdACa2Hpuo@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
 <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
 <Zrz43Qb62EB6o39e@shikoro>
 <Zrz64Fo17mmekJIH@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0tOAWLhBKNt4Ekm0"
Content-Disposition: inline
In-Reply-To: <Zrz64Fo17mmekJIH@smile.fi.intel.com>


--0tOAWLhBKNt4Ekm0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Hmm... algo_data by the naming seems has to be related to the algorithm,
> but AFAIU here we have simply more than one _identical_ adapters. How
> is this semantically related?

You like the naming approach better?


--0tOAWLhBKNt4Ekm0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma8/MgACgkQFA3kzBSg
KbbjfxAAthh4dhDYjK3kT5LM6Hbiewv0djwJ/nEGQ3jwCHzahbTQMaa8z18X64gE
Cz/YOwNrWo5XFlIk188da08NQbA716K0BBQ4t5i9VUB/dPnBwZyVRe6VpX26oXPs
RT/NKZwviz2guDwde5ncfjTb3Wd/Q9D3GDzjpHylpkX3sYBQQB117MiYz9k1EvAt
/blyfeJHZn7IDFXJGcBXj4TPfQoYew4KaW68yNw22JaTQObm8o21l6k/LAJ7NFH3
V3At4JGq5EZMSte8VeANOdq/GEBwRPSSfpQdfXDro0aBnDlnZH8+FHliQf1B9seJ
ZpCOHg1UdYajDKaQ0Z3DeuMDL5RmD+cS1vppoCRjzKI6g3T4UBbFUH2bYNM7WvkU
Kye4o1CELPyuJthbb6kpllzkmXMLpT7Yl9viSqeJrUeT/FUPI4CTG/EvPJBmYaVV
g4xsnpcRvHNIwm84OQCIQkzHz7W36a2/cugbJ/XrLs1KgUQbl0cgKWubapOmtrv/
Z0nrOqRLGdiPkW5WTghNuurg4YKRDjWK29BSabkpjBJXFO9iAslotXYViCzSAApQ
+6jXGAWNBtsZdPrQHe/zOwxoLPxggBUP6V4s6YYaSqsUc3b39ow055nMXYBNOT0M
ab5dNMC7WfADlaCaRuQhuRIfK8tTM467ynXNOAj0TAXtol3G5I4=
=cyas
-----END PGP SIGNATURE-----

--0tOAWLhBKNt4Ekm0--

