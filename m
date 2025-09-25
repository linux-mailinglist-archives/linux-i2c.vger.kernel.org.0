Return-Path: <linux-i2c+bounces-13177-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 905D1BA1663
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C77AE624ADA
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5402320CA5;
	Thu, 25 Sep 2025 20:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YFtaQZPU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A15C320A10
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 20:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832995; cv=none; b=TEV4Wkr63FSLObqquF20k05Lar3NMHlyOB2iWdNcwBsqm63BHi2f7EnmupJTph5koa4InjfHEVmxFpJ1EVzrfz+/qmKLr1x4XSYfASnQWHNTSaPXtxnlPoahd4ZGovOWq/JGmOomz4CEzciMl39uwl0Dxx4e1AKkDmkRiFlkEI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832995; c=relaxed/simple;
	bh=kXwl5IWMx7+Bm4ARkVYI3M2VpC5vvkonCbpo4u9mKWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdLjKGZWg92U+AckGEKzkwj5iurUNxpOrgPRM8VAy0stAZERnCMrSuYgqKcCaSJXqjjrIR4d2B8314LC2r9d3S8y56g7NyVYDWuVVDuPE5HGcfAQFfEPLWlGYWZ81A0H2Skzh11zYdwDlIpXeVIZjU/1xUFdNmqpsvVvj/INskA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YFtaQZPU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=kXwl
	5IWMx7+Bm4ARkVYI3M2VpC5vvkonCbpo4u9mKWM=; b=YFtaQZPUSgxzW4jzbc3o
	T2mKXt+bWXVaZs3eIQR/OSx1jOG7Qqi4ouV1ylpxCi69y28sk/9JQtynZxU6jlAj
	xo6bM7UsWKt635pZ1T5xNWzLm2Hk1xqPoukUXvpfCjIV3cytRaAItMcNllUB1a3R
	xRVCWsLiLw/cth5rFbMlrzgpXXCIEDK0uZuhZJamF0VoPHtQChGmSM3doyj/vnT9
	z7RLSX+1h1d+oasJkRfqW2pJU0g5UdDbWjPadas0BWlqokc2V4CacV1NC4EyW/uM
	f5PDX/8qwS2IWiY6ak78WU7GZw5IUBPtRrHDEIlLqH5RaXgzN7rSwGkTZmGKg1N/
	ZQ==
Received: (qmail 2011217 invoked from network); 25 Sep 2025 22:43:11 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 22:43:11 +0200
X-UD-Smtp-Session: l3s3148p1@/YiqN6Y/VOAujntx
Date: Thu, 25 Sep 2025 22:43:11 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: core: Use fwnode_for_each_child_node_scoped()
Message-ID: <aNWpX4nVf-9Uhe37@shikoro>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-3-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="haTu1nwtvcbSwdb7"
Content-Disposition: inline
In-Reply-To: <20250902190443.3252-3-jefflessard3@gmail.com>


--haTu1nwtvcbSwdb7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 03:04:40PM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> Replace the manual __free(fwnode_handle) iterator declaration with the
> new scoped iterator macro for cleaner, less error-prone code.
>=20
> This eliminates the need for explicit iterator variable declaration with
> the cleanup attribute, making the code more consistent with other scoped
> iterator usage patterns in the kernel.
>=20
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>

Applied to for-next, thanks!


--haTu1nwtvcbSwdb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVqV8ACgkQFA3kzBSg
KbYflg//bhZmPCj8GQxambFr3kPhrvv9zyRN9wIIZSM9w8Vecub0bB6y6AqC/OgA
SkCBlbbafuk42GNAvzI0PHx6AT/z+6WA9QYHOG/eXVdNQ++gWQ5A8a6dG/FSJufh
GMRAdJj01LIwbOSgmrpIwlx79inAjQ9fqD2xlmsvWGXLwtcfF4D4LQlW/ZVOT/Cg
JTimrt1skB826nBR+hYxXeDRBRBZfZj7dxzhdpgmw+flYJCWaM78iUEHai3pmy6N
z86imyobwbJPVrZnVBX1uIa6mjrSPW+rb8TkXL2CMNrc9H4shVxMq42hBi+MI9vX
jp/NjqFjyxnRDQBCadO0jBsW9ftOo0Tfvb0DhREqquv3EtVtlnEDgJEY+sPI04Jz
hpVPvKexQaY8fVUFa+8LWDgeljacJoIKtpWO035UV2i0s76CLIepIYU7aOyubvcJ
9H+Vec9oYlqq8R6HoIVv/NLagSbyuQLyi332hg84vElBu16BZfjLClMtgIS0q95k
ITXBKmHVoRJFJeKwlB845IEuUB+jnxthZFRGsLxF5LIGb8PxZbxU6+GYcbvtxIKW
ug0dDAdC/VLVnfieGdGqJHdCMGQ9a+83yLe5VHuPzoFrDjhQXO4M0hQj35oYHcTL
3WweafH0NDqT5Y3xbI38qElXOOHM0wm5N9foCTEtNvVdKLmQSi8=
=JiWZ
-----END PGP SIGNATURE-----

--haTu1nwtvcbSwdb7--

