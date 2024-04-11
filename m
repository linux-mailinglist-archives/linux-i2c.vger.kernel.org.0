Return-Path: <linux-i2c+bounces-2881-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A58DA8A08A9
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 08:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FAFE2869DC
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Apr 2024 06:44:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6E113D631;
	Thu, 11 Apr 2024 06:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gr8mr/BR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6043613CA96
	for <linux-i2c@vger.kernel.org>; Thu, 11 Apr 2024 06:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817877; cv=none; b=LX8Lp3d7S/9eSuzydtBU3Quh4xSfSTYl0gq9jdDai5HA4m710X4Hu3Uc7OZLf+iSGo5BfHQbHaTy7bDL7Lc2zlWDMIXO1OZnTStQDpzB3onjWA9lwwVbLw21XSNAuyQo03McudZN3vuA5ctdDvyo1lnHfz9rbKrqMNnyRGKRNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817877; c=relaxed/simple;
	bh=0xcn6NRobtvMN7qimsR6/wOIKpShBx/PPk8BpEXXqYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMqxAyR3+o3WugMpaqnJDo2pXjK90+0g5DCftLZUvS/52IJpdIayyR1Td/Ewkpe71SG/bh7a8ltVqpMEDNu5Edt+mRal64PIXFT3mdDEw0oigxTT+CY1fEUEK8XSp1M9qM78DRPSG4HkjVUuVOXb6PvK+g2EL4HapyytYePtHe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gr8mr/BR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0xcn
	6NRobtvMN7qimsR6/wOIKpShBx/PPk8BpEXXqYw=; b=gr8mr/BRw8al2jYnq50/
	6ZEcswHpTKLt9ThSeRmbAfsFm5GWI3Xm60rSBFyeO/BDhWxKp/TbxKkySIjWA0gO
	ka5rwfmf/WHR2YD2sjWDKdeVu9xmWhQ9bEvIwvsEawwcjoFxxcq17vl6KGlAa+AR
	HWqUV3x8gM7eRqx5LXm7n33BsDmnr6GQibUG+iNYnnWrVtA7/+ZCjZvTpbTIUYnk
	WSKytjmb9EqGtZssxV0q0WlASlwwdJ6dTzO3d5QtomOm7rmDT8bXeW3B3a0oN/D5
	URlgCTEOeh6Y9Byo7zHt2bgYbzyz0+pftEzsPZMc8p4mCsjOR71KFw1/J0W8kBKp
	2Q==
Received: (qmail 785184 invoked from network); 11 Apr 2024 08:44:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2024 08:44:27 +0200
X-UD-Smtp-Session: l3s3148p1@mCeIfMwVzG9tKPOV
Date: Thu, 11 Apr 2024 08:44:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: i801: Fix missing Kconfig dependency
Message-ID: <xfrxk4z4ibpaqjox7ghocoi3j7ocp2xuuuisrsdmxfq3v4pobt@jmvgdb2ifvvf>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qepfnnlty5pr7jn7"
Content-Disposition: inline
In-Reply-To: <5b43041f-4f97-41dc-87fb-c2da425e7654@gmail.com>


--qepfnnlty5pr7jn7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2024 at 10:09:50PM +0200, Heiner Kallweit wrote:
> The original change adds usage of i2c_root_adapter(), which is
> implemented in i2c-mux.c. Therefore we can't use the multiplexing
> if I2C_I801=3Dy and I2C_MUX=3Dm.
> Handling the dependencies in the code would become unnecessarily
> complex, therefore create a new config symbol.
>=20
> Fixes: 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child se=
gments")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202404042206.MjAQC32x-lkp@i=
ntel.com/
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--qepfnnlty5pr7jn7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYXhsYACgkQFA3kzBSg
KbZk4w/9H9vIo1GB7FkXMObTB/hw1StzMp+3KuEiyzNqLmp8oVkPkVkC2tkw061p
CBRnIveMIRJyamWIsaIc7pQsrH9cz5pZ3y6p5IT6hBYH+BwCFkF7e+BZG0dLu5UR
dvVQsmBbTVfqj1JLfvt1w803Y/crzpM/9VYvuFhLIspZ3rEVAJrcXxlY35aB3H0C
DbAUwXv6negaGbqQH58M7JOt6/UQFHy2crFq5BzO4ygybMYQ8/BPcRRFXfuC02TH
o5yf/5U7W+4Oi1uZK4pVex7Ha9eYeP9h1+gMAf9O2A5iVHcWmbJvzgpyKkgsdwlR
MLSd+dmr9ROaFtUSYWfdf6rFuQlgBvPXNRIdJsIfK6ZrTFX4pOI42cKYAcTt9aeo
Vw/7iBUcDy4nI1Gvnf5VZy+BHRwhh0bQKxTl9pgR60qyuFg58eYUX0n9xFxUBuc3
MjHn0BNvUse9juPSB7fCJA9YQOt0o9XJXdnnh4ADgx8BCagjnpIvV+gQAWVbIYRu
1C7DMYkrXUwd3lEIveSL3xPSXslNTCSwRo6znLz8N1OtnnA45xq8q2IewKPkluzF
PejFj7cxTa6x8ndXyU8LGl+gYxAItfeT+F9DgUKk+RRJdGzqZz2/oajZCxU1aiss
+AqqOgw4zqHOL9Jre5vK+2K0wb3W9sNQZ+op4vk75cV8J4b+tVg=
=cIJn
-----END PGP SIGNATURE-----

--qepfnnlty5pr7jn7--

