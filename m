Return-Path: <linux-i2c+bounces-13176-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F01BA164D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 22:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB2401C01B10
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 20:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FF131FEC2;
	Thu, 25 Sep 2025 20:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="je2Z0oNd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E4831E89F
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758832989; cv=none; b=Pa5mmbh0cKTIBEXcRw0Vpi8iV+LQWpaZ9i/Zy6viEMS+HcDsgZZzBsxPxcZZfnBJzIez+54iyRF52Q1BzW1nq8FT6WWpUFLXSVrFPJR5Ivy9zfKg2ydpWNlTgVLaZWixVcOZr4Yn5TKePqgg9cFMDoAZ4fo2yOcom1O1Tvzyyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758832989; c=relaxed/simple;
	bh=6kzCNLWrTiaARmvq6cXw0KJ0o1JY1CfEjLnXP8Z+X/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZpX3lLS8bnKjxgQi3q2KSn6E7bI16MSeLGPxG/2i88zi7LlRPFS7SYzo05mBgigaaTC7/myV/HHdZt2pjtUlaOf6o1MqyfdmvZhlwgJR6Z34qVPbPdvifh9ohPWNrkDakcFdnxQk9+NkiAm9g+cbWofJ/78AhVt0jZIE+50ToA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=je2Z0oNd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6kzC
	NLWrTiaARmvq6cXw0KJ0o1JY1CfEjLnXP8Z+X/Q=; b=je2Z0oNda9Png2txLUoj
	84l2Xy231FnxnFcw66V1sOz4CDD/bU+3NINiHOQbtHV8hhiqufGiv2eUHH/DZJ1U
	T8Sn3joij9jFEj/AYATRPVMn/muF5WWyXUDRAsERsL/SUnL3zjGLJe31Q6XiuwBR
	dAUvwlTA7JOK1Vuh7WHBY0cqqzuuNh+6y74pL/CQskM0jb+/8RM+Zatl77fW9KxQ
	fI2ALyNx8UhZUeATRnGrfy/XxQKVm5XmIW463rOWI8hbrj7R41+bgNOHV7CF1SDV
	sylNkfqV6t22tq77JQO0CBB5A32+QkvhQvoRSuyG67MQ7I/6YkqbDZ8Qnlqv5MM8
	HA==
Received: (qmail 2011159 invoked from network); 25 Sep 2025 22:43:05 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 22:43:05 +0200
X-UD-Smtp-Session: l3s3148p1@70BRN6Y/EMQujntx
Date: Thu, 25 Sep 2025 22:43:05 +0200
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
Subject: Re: [PATCH v4 1/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aNWpWdLJUJP-cdoq@shikoro>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <20250902190443.3252-2-jefflessard3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="T8qQ6vtOyRWjrwS0"
Content-Disposition: inline
In-Reply-To: <20250902190443.3252-2-jefflessard3@gmail.com>


--T8qQ6vtOyRWjrwS0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 03:04:39PM -0400, Jean-Fran=C3=A7ois Lessard wrote:
> Add scoped versions of fwnode child node iterators that automatically
> handle reference counting cleanup using the __free() attribute:
>=20
> - fwnode_for_each_child_node_scoped()
> - fwnode_for_each_available_child_node_scoped()
>=20
> These macros follow the same pattern as existing scoped iterators in the
> kernel, ensuring fwnode references are automatically released when the
> iterator variable goes out of scope. This prevents resource leaks and
> eliminates the need for manual cleanup in error paths.
>=20
> The implementation mirrors the non-scoped variants but uses
> __free(fwnode_handle) for automatic resource management, providing a
> safer and more convenient interface for drivers iterating over firmware
> node children.
>=20
> Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>

Applied to for-next, thanks!


--T8qQ6vtOyRWjrwS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVqVgACgkQFA3kzBSg
KbZ5mA//Vz14Pm+0ARFbDsM9JA7qGcL29lagsv35Er73S43+flNvWEbPXQjItE1I
6QQFFD2hXtdmz8CgoUUkgy9Akisemr0FTvRy5koLo47rsO40dQNe9zEKB7DdH5tE
2QxR9VQQa3FZL1qggHQRpJrRxjZ+TfJ6fgrzXHuUhi/HvjjatCd23fvqDWNZJUdi
ockc/MiR4sspxbyvw9vLrBXkbbTOvUp6NlqyAyU1lYE8oAtMjoiRiK96qGH2iMme
2KiSKbMqcknQoclXb5K0B+UE1bdxn5Bdfw4SuyjjmVbdBJNYPI5EIlZ+8/EmgT2i
Jm6pGQ9h+RmEvXbzZcRrDSojmVVZyp+qjpDJTyzGVZ2wS74m+gAGbnO3wmTc229H
bCAQPujXS2eJ1CePqfIUyykrumEwkhnUqKB8558XugRt4urm28KDCFRyH4yuf+rx
r270CYriVBzzGbbx9FeAWYctPygGzNkrIuY/XyPJYxkVfNohduqd9RriLS+QHk6t
p2TJh54VrWXIvrgoRB6QN5/hk2rPCjetabl826fAkIUmAtzmbBkX0/eWE0GchXzW
X+HyGHgEzkhy/ExxPASMQxw+ROgtfCW3TJ3lgCXZKIJ/RWNOkcIO5S24Lz5S2SPU
4PSesrGJDhZMNJBmzzlpgzkQWIpq3ec0LjgqoT/wqfNO4K8/4l8=
=DYRm
-----END PGP SIGNATURE-----

--T8qQ6vtOyRWjrwS0--

