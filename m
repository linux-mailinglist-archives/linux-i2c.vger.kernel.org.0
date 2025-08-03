Return-Path: <linux-i2c+bounces-12132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E230B19527
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:39:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47EAD3B4009
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 20:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988721F560B;
	Sun,  3 Aug 2025 20:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="B6QLDIoL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9AA19258E
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 20:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253586; cv=none; b=V7dxaVCzZz3zR4w5h2y7h/aYMX9oP87TwFeHZhSOJ4kEbr6gc2BuMh2vmZwY5JkubTgJDjT4jWiRYGPwe1mRh7fx1TKjJzLp/IgTuRaSViPZXVsaBsaz+blYc58CYqLYF0jiz9bGPU/n1ujye2b13ZelvcnyqruVlsOLufVyGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253586; c=relaxed/simple;
	bh=/V2Z+npwgBOy7ELDvke0PVLYyAic3BukFbB7ezf7YEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYG3zT6zMUIzt8xGjkqKGlZOXvSrWLPcc4BHSHtboE5kmauThrID8UW5moB/oatO3B1wrvMnlvw7F3w03rZFfPBBO/TsUAMYNt4aoyre60Ak2gRfCj3LXHTeYmyxIF4uDXg9ZUt4M1+UBejK2Ob1w8WHCX5Or7A9Oza/xVMifcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=B6QLDIoL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xBGj
	UNBVOVmmIAZVRsis37AwiFXDOkn54l2Kq5vvR/8=; b=B6QLDIoL+H5+orw29XFr
	Mw5dDjkTqjKT4GeJVJFmmcFkr0n0LKWBea5/Y5RNXEFTO2eFX4FdbXWyUCh1sps+
	t4Be/lN80O7P6L/pCyx4msWeAx3Z+YxXtfz88nHVxGXI0cBAxpH4C2qDDXFvdCAz
	zWkcNHuEqwF7gNxqtf8XaO/OskoqtvpUvZ9AZn0jYGKJKIZMSq7U9BSclD9T7abq
	DJDxOwLLhcTZFpGwCv2HeVFO7RbmEeQIR5BsGu68q8SMH0rQn9HZ+mLeYM/vxGYF
	Nl/2DapGbH6qekLZMKfnXGJlSEyTB/eyqsEwfhwdBVcutiAX/aOdQeOFwz2RTZYn
	tQ==
Received: (qmail 1644826 invoked from network); 3 Aug 2025 22:39:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 22:39:42 +0200
X-UD-Smtp-Session: l3s3148p1@WlKc/Xs74tEujntd
Date: Sun, 3 Aug 2025 22:39:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "fangzhong.zhou" <myth5@myth5.com>
Cc: linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, westeri@kernel.org
Subject: Re: [PATCH v1] i2c: Force DLL0945 touchpad i2c freq to 100khz
Message-ID: <aI_JDslnEsGEOz0W@shikoro>
References: <20250801145405.11445-1-myth5@myth5.com>
 <20250802231554.9920-1-myth5@myth5.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M2alkwaavH87HfJT"
Content-Disposition: inline
In-Reply-To: <20250802231554.9920-1-myth5@myth5.com>


--M2alkwaavH87HfJT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 03, 2025 at 07:15:54AM +0800, fangzhong.zhou wrote:
> This patch fixes an issue where the touchpad cursor movement becomes
> slow on the Dell Precision 5560. Force the touchpad freq to 100khz
> as a workaround.
>=20
> Tested on Dell Precision 5560 with 6.14 to 6.14.6. Cursor movement
> is now smooth and responsive.
>=20
> Changes in v1:
> 	- No code changes from first commit.

The "Changes" section should go below "---". I fixed it.

>=20
> Signed-off-by: fangzhong.zhou <myth5@myth5.com>
> ---
>  drivers/i2c/i2c-core-acpi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index d2499f302..5b424637b 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -371,6 +371,7 @@ static const struct acpi_device_id i2c_acpi_force_100=
khz_device_ids[] =3D {
>  	 * a 400KHz frequency. The root cause of the issue is not known.
>  	 */
>  	{ "ELAN06FA", 0 },
> +	{ "DLL0945", 0 },

I moved it up to keep alphabetical sorting.

With these changes:

Applied to for-next (for 6.17 mergewindow), thanks!


--M2alkwaavH87HfJT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmiPyQ0ACgkQFA3kzBSg
KbZsDw//XNt9KdGjODlkU5C0lt8kboqAs0LgbslaENEm52h4YSTBr6f+l8WlvkUX
c4ho3aZpm+mfrOQ9k1x7F3Xw5AH1OZ9cMy9WONrA1fT7AtbKMTdDqz4/Ya7yfgF1
VFyivHRIEgpzY8CQyjovkYJeIJ94MbiL7DESP60AQJ06obx9Nr+RLFshztIobPrc
PfdvzYlhyjev2jo21i8MV61FSA0g5iR1iH9NBPzcBU+APvJEwDFX7P7Rj6pfeCtk
yfnfta/lBsq2JoiXRLCm54IL3t+f75+hqc4Y8k30uEHetHBm0tYAubwyZhb+MOHl
LNEFD8Y3A1tbfOxjP8XyosKkqLBgJcCyHO8BKxpo5sAabqWXRNdRBXK2u//iV36n
11tjL2A8Q4zF+AfBwpR7BujEfgQ4IiivXDn/6j1vtz0fS7y4KoPYy6MyRVn/vyrN
/d7TuSx2XCcpyXe6tMXt8Wl/IRhmjIjfJkAk7WKajqs+P/uaJD0KN5bn2T+AQmNI
722ZF2Ovw+YPMSx8PzMea5UwR9c+fpq+s3FMX7wX3tCNrowzVldTYqAs8yF5faTZ
IJ0NvnPs3ngvbUe3KhUVHXQaun8elz1M57GSPjNCc0YRw93GSKryn+bc5uCqOYz/
AZxy0ujmhDttFTTYfUL/QIUj/oJ/RzxNPCC6QBh6e0QDEXBzwCg=
=O3sl
-----END PGP SIGNATURE-----

--M2alkwaavH87HfJT--

