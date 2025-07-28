Return-Path: <linux-i2c+bounces-12051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC76B136E0
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 10:41:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD211891583
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Jul 2025 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31D3422539D;
	Mon, 28 Jul 2025 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OcORWQrx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2B2E3715
	for <linux-i2c@vger.kernel.org>; Mon, 28 Jul 2025 08:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753692088; cv=none; b=An6M8A9Vf7yqo1trJMZCum2OG75IIxiMO5NcgPjTUB52fp250q/8ML3l8YKE+dtwhswWqmX5v7BEf2IU4uiXUb4Fm0sTMoffmw2+wqxW6ZCZ3IxydMSGwEFHTxaLPSTXLMIyPlo80vGfvvyIqxxGkZvWmUwz2qmmuzGwzOW+/4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753692088; c=relaxed/simple;
	bh=3Cv2BT8R+EEws7rcG/Tl9Yzn1snM3PolFSa8A6j6LmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AuoqNj+1P/ce5beFQdRS/0jLUL8bkLaiaMcfS9jPxexYXerI5jBnakrxyWciiU+E09gLGWnNCRihLhMXGn2m67Q5g1y+3T+LAYQNU3f2a5+jw7lBSZjMkZnaBVF9SOFSv8gkTAUgLcR6VZ3auH8/axqcel6bnrWx1QnZ03dKpps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OcORWQrx; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=3Cv2
	BT8R+EEws7rcG/Tl9Yzn1snM3PolFSa8A6j6LmE=; b=OcORWQrxuRzF2kzmWa6N
	o+F7v+GGhM3gKB7VXjqUCW7uJmKS+fWNPrka/PRfBVUp9bLorivk3WVTlIb09FL7
	qRMEG5s+8bSEvB2UZeyZkKkpJdflZrnJRF7i2yNqlHhqm1Ycn68JvPV3AsbR5jY8
	LnA2xfSC4DVry2hRDD/XZtPrmMCoa4hW6BtS31TAAQI4azdU2e86+CzF1aC1ZgSG
	cjcnjXsx9fN/EAICSSwm5DMXwftHxb31yt85X0ma+s4+DZFHQmNGBjYqbA7i4BdF
	4CQ/tReGtOfkzGfPRJAAmlfF/sNJ2h2upelnITvdZCChhpCQvIU/O248sbH8QHUU
	SQ==
Received: (qmail 3370429 invoked from network); 28 Jul 2025 10:41:24 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2025 10:41:24 +0200
X-UD-Smtp-Session: l3s3148p1@f0GyQfk6PIwgAwDPXyC3AG0QzsW8mHdp
Date: Mon, 28 Jul 2025 10:41:23 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hansg@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Fix double-free of fwnode in
 i2c_unregister_device()
Message-ID: <aIc3swA0sndwkdML@shikoro>
References: <20250719180104.66939-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I6leaFbbHY6qHaU5"
Content-Disposition: inline
In-Reply-To: <20250719180104.66939-1-hansg@kernel.org>


--I6leaFbbHY6qHaU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 08:01:04PM +0200, Hans de Goede wrote:
> Before commit df6d7277e552 ("i2c: core: Do not dereference fwnode in stru=
ct
> device"), i2c_unregister_device() only called fwnode_handle_put() on
> of_node-s in the form of calling of_node_put(client->dev.of_node).
>=20
> But after this commit the i2c_client's fwnode now unconditionally gets
> fwnode_handle_put() on it.
>=20
> When the i2c_client has no primary (ACPI / OF) fwnode but it does have
> a software fwnode, the software-node will be the primary node and
> fwnode_handle_put() will put() it.
>=20
> But for the software fwnode device_remove_software_node() will also put()
> it leading to a double free:
>=20

Applied to for-next, thanks!


--I6leaFbbHY6qHaU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiHN7MACgkQFA3kzBSg
KbaXTg//VGhn7FWnsV7e/DVjLyT2R/foepKZHvgC/S8rdl6cwdsPuv7fEK20iNHh
2MWFAcTxrIvOzJ9RBobikChUKE42JHG+dt+m2sHjjkf9EHXHSlsf47MXS93O+dCG
ZTwcTqXdQXFMN9PkD1rXTCI13s12RIqTHgt4aTD4FuKptO9upW7UpqSHfIal/RfL
v5PjMzSIqpNRoIHUOrhB8Dy+KN7+iDr/yQRm7RZ7oEQcYLyMPjssgP6qreg+IyA0
btcAe73WBgq/DJzg6wGzvQf/zEUBDi84ZZB0wa5a69W0PaEVF5Uy+G+oniJgvkNs
XZcT/W7BQO6kD6OxeQd74lufK9cNsJ37GRj3Vg0ngUcbV1fopiGEO+xCA81xRRep
A5/K8SeC4yD2qhHLZT0pP3LvC+v5ezPqozGc/83hTY7XqfWh0Bg64jZ8LYw+p5zI
+vQDYzZ3xeMIVRcH/cq2D5YQMlc0I+TuLrmHBQ6wNNdvVgHmNra0NT6UTMeNJ25N
2Yv5TQKbwdkdUT9qFlaCB+KAuNN7vwoTmKKea/hiOKoVLBO/6HKi8pjC9tX4ziDT
DEDHPUJC7xbzkIVpEaGETHc5KtEYEQD7MrsVNN+rnXG4WWRUu3E0SqYuq52IU4O+
X0+Vv5Cs38EG+Cd/EiynJ/TINUOvRMFV4b6uiJ3RZlCof/FI3+o=
=31ya
-----END PGP SIGNATURE-----

--I6leaFbbHY6qHaU5--

