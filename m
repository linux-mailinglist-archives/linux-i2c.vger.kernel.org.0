Return-Path: <linux-i2c+bounces-5457-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC083954C94
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 889742887B9
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB181BCA1D;
	Fri, 16 Aug 2024 14:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OihBMHyc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6449F1A7074
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 14:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819144; cv=none; b=TCyShDv24UD0KAzsBNvU92qA/Xz7ee+MCoC41ptt59qpbbpKrqKfzPy4ALwrKXb1LyixRkPgWvlVsmBrzvVt83AbJMqtUQrOY7agjKieNYKwWJqBSgomzK0DvPdmKZ4AI0SGwKz1U7KYnTBIBHeXJSJ2GHZO9nolF02XqUJZm+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819144; c=relaxed/simple;
	bh=G+X7ItIBprB632k7lgo93Jf6esnNNu1S6FdIZkKRG6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAy0pnl344n/1LE0JPi/NegRd/5UlYoFxPRDlZ6PvScJAhdZ9rxtAYjeoTvFoIFq1unbITiLHL+TOIg1fFpt7uFYQnr1XWMJv2X3peT1fUPakG7rwtnzSe7690UZDGfVlMulVSfDthRIg4R4z3rWpMuUMy9rNuxVEd9fKQXfucw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OihBMHyc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=G+X7
	ItIBprB632k7lgo93Jf6esnNNu1S6FdIZkKRG6g=; b=OihBMHycumD4oyKX1Y6g
	YPzX/VkMGEiIjd79nYACpUzdIhW9fV0aWi3wuVJ7DCInCFEF5dBOreBtlccauJ0y
	YY97gJCbfGrYZrGPzM7Lbq2S8ze1IBAc49mEyuzfPTHMR5+jGrOmsuKDt1d6fXIk
	7m8ZYRGyVGMp2++lYVV45c3PS0pXe4xALMmYj7/fx/saCu8GrjreN07AZcxz/uR2
	lMJ518jKTK6C874Xsg+SsOnGa6fU8n9D6PEZp4ICpOibqBk+m58rh95U6i2BoFSI
	Hbwe+KeYPyoYsgk8vIgunnmNd/Icr7/cM9eD3el56cFQ19W4V9fbgwLpN9hYtuba
	jA==
Received: (qmail 2628222 invoked from network); 16 Aug 2024 16:39:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 16:39:00 +0200
X-UD-Smtp-Session: l3s3148p1@jJF/680fUrpehhrc
Date: Fri, 16 Aug 2024 16:38:59 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zr9kg1I_QZVivYp9@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmy4gmMHC7DUu2QS"
Content-Disposition: inline
In-Reply-To: <20240812203952.42804-3-hdegoede@redhat.com>


--rmy4gmMHC7DUu2QS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 10:39:48PM +0200, Hans de Goede wrote:
> On chipsets with a second 'Integrated Device Function' SMBus controller u=
se
> a different adapter-name for the second IDF adapter.
>=20
> This allows platform glue code which is looking for the primary i801
> adapter to manually instantiate i2c_clients on to differentiate
> between the 2.
>=20
> This allows such code to find the primary i801 adapter by name, without
> needing to duplicate the PCI-ids to feature-flags mapping from i2c-i801.c.
>=20
> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--rmy4gmMHC7DUu2QS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/ZIMACgkQFA3kzBSg
Kbar7Q//Zad040B4i6yXaWEnI0XULvXUOqWaEpIwb/M4Vvhm9Glyrnyr/bKmgauU
umjlLbzTqsK59j3DGlGSkcofIv2T0ZhtXgQ+qg7HO9m2Rb+5+M+8GA5/ySmm3Nmm
j9X9sxNpxbCWK7+KGUKGJXPlwiVU6u4aGaF5ugUK0XZoqNvAhj7ejtpkhExzsAj/
Nky2jJt+ja+uzSXhK2ElKMy/Y5uBpt7bUMl/d0OYh4n4dyEEtlzRHhZi3ZRm5UOO
dhQAtP+yxfBqzw+nJJ8JQNGzsx/byOCVj3fqZib/anQ3f/YtBQnWulmBGPAYdoXn
XYb3YZQVc+yp67FIXp6xgBrAe7tH9/+Q7PSonBC/SCvmrY+dFRgzVGfSlSPCBDoa
ygIva6duhXMkPGizmhpRK7erE1pYTm+JG0TWHlkunVSS7tKBousXM85DZaurivz+
mvvKeR53O/x/hmyDVtZwegez7dQEBNXXWJsV0fSPA/KqVyU+RUqqMxeHAcPc5eEx
9P7AhaiOvec01Q9ubZRk36xKl2Xl0mvg66tHGvsQODm9+5ZiMccqAFrBf9JNE1aM
/ZLRUyHuhZKpTgVeg4LVYnE4SWv8IRD3VSc8QwKgN9KwQ40cviDLJbDh+UXD/LhP
hgYQ1b+Ogycrk0VaDRHdu6vHC/ggwBktF1uf8ibnoPR//q6qLIQ=
=ybDD
-----END PGP SIGNATURE-----

--rmy4gmMHC7DUu2QS--

