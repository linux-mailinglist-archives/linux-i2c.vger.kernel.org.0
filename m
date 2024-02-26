Return-Path: <linux-i2c+bounces-1973-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C04867260
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 11:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EECFB25627
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 10:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1891D433B9;
	Mon, 26 Feb 2024 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jHEhwHPL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8513F9D4
	for <linux-i2c@vger.kernel.org>; Mon, 26 Feb 2024 10:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943567; cv=none; b=Zyd1tfqYhEOB6MKfnh4Cvm9tz/4+Ulys7n2v9rgsy/aVE6RpjJfpoHha7+3q456/E5rrwoFFtYd9cFEgGjvMVDWK13tY7RTMuP6l2nnks/uU4/UXP13afV/jY2dd2NC0vpwby/8FVll8Q03A5ffiKabkxSBZoaI3vZytPKjTeFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943567; c=relaxed/simple;
	bh=bDrqtyb3BV+2Crc5Z0i4EwudpVuJgcOQ6zwb0euxN8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq9ihFp6+B/OqQ7wAggegkhe7ZF9MGJxbZgcnG0s3lwcgZMHQcn5CC3DVmXYwk82/M37EE/j5Imm7vc+2KyYGOkJxglyp7w1S/MsJzL08bE7Olui9GEAufzIZATzRABUIdJWH8iRlAIL9wu78fDSlv9xHEU+ruBQZWtuQYs/rDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jHEhwHPL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB6AEC433C7;
	Mon, 26 Feb 2024 10:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708943567;
	bh=bDrqtyb3BV+2Crc5Z0i4EwudpVuJgcOQ6zwb0euxN8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jHEhwHPLIITmEmiv7gV9jh8aY5s9KoNJ6GJ+4maKoS31+lRcWPspEUwl1/qj6jzQU
	 IcEDjky3lkkphXa1KwiHRoF9ghBm0tFs4vsSzAne7OzO8hF46e3QYC5G7ynOWrWMW7
	 w1fsegGyAmvMviDP/w8z408G6nU4Dck/5I0yaPJATIfw8sn/dw8VAr+k+wg+Z8nq43
	 A2kCKM3gDKqaaOyiNUpZvX1xObVjYIAmvKsDFPkXLn0UTlPvPn40YeTDB1+LqyQdqa
	 CSAnA9gqgeXE5mPsBQy8lEGnYV+dsZVTe/cID4zuC72j76ZRa+1IzqQ2Jc/QB4RkO6
	 qeAu5SnxUoEkg==
Date: Mon, 26 Feb 2024 11:32:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC 1/2] i2c: smbus: Prepare i2c_register_spd for usage
 on muxed segments
Message-ID: <ZdxoVALRR8rz23Z5@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <db378364-018e-4e6b-8e41-8cdd21ce2afd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GIyYfZ65luN+ULWT"
Content-Disposition: inline
In-Reply-To: <db378364-018e-4e6b-8e41-8cdd21ce2afd@gmail.com>


--GIyYfZ65luN+ULWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

> +	/* Check whether we're a child adapter on a muxed segment */

The comment describes the 'if' but not 'then'. How about sth like "If we
are a child on a muxed segment then limit slots to..."?

> +	if (i2c_parent_is_i2c_adapter(adap)) {
> +		slot_count = 8;

I don't know much about DMI. I just noticed that there are no printouts
in this code path. Will there be one for the parent?

> +	} else {
> +		if (slot_count > 8) {
> +			dev_err(&adap->dev,
> +				"More than 8 memory slots on a single bus, mux config missing?\n");

With this error message, I as a user would think I need to setup a mux
config somewhere. But it is missing from DMI, or? Then, we should
probably use even FW_BUG in the message?

Happy hacking,

   Wolfram


--GIyYfZ65luN+ULWT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXcaMsACgkQFA3kzBSg
KbaZ+A/+JiUDFBI9hxFLo9rQkeUmZxFEEjojEeCzC85Q1gJP1YVRp0NHt/Nalov2
VmdjyESJWelmpZwcRYzAQ6CSU+VUBAoD0qhnVCpdY8DarYp6UA+pMPrGjxI49tBn
796UGrZ5Pq2100gOFCDwFs6AGCMDp8+2xTZLRE9yYaiHx/SltzHNJJ4M4hKuR0d3
kBmixg1pzsvbg+CS42WtZPD70AALhcZKW3H0yC1e8u7VZsO7u8Iuwzf+so6WVr/X
C525XrmM6GuSOV8I8QHs0naC5MkPsdMjxL+A4zkyorYwgSndWJU0AvdmDLH9OUR1
nF9Gb0+dhcCGBtlSQ2pkJTcXC3WPPsGUenhGxMwISFtJJr0CnFPKWp5p9YvN2QFd
1n0aohX0AGeIj0r6bpnjqqu2ODBSFml/FPx05lMeX0ZG3Wy8ke0gVt8OEoMWydJm
jWSTcMz7mTYjGb0JPgzaPO3/BynA2ZV5+DPaXjjDlfowNKr5zGnkxrX7tDSILnSM
jLAS+mCw1958fpzQNVWd8i2axa2scb6hXG86byWjLpfMcGCzNfjVOdLM/438Ow3e
Q9EAIbTb3deBLKPTGgttvvpNtyAMwjgyJeKjKB9X0qO7F/U6FbnPvPpAXgm4u9Qj
Yzzd7J7i5AhXM+3El0XWo8J/LdPlM/W/w8UW0IlZBjPBBul1JB8=
=WhEM
-----END PGP SIGNATURE-----

--GIyYfZ65luN+ULWT--

