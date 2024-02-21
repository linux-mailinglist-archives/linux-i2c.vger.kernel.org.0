Return-Path: <linux-i2c+bounces-1886-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1252585D7B4
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:10:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8F781F23762
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2322B4EB2E;
	Wed, 21 Feb 2024 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWKZT6g9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B054E1DE
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708517424; cv=none; b=s4LcsPAmkxBX0ssro7LXSPBBJy3MrerJZf28h37tqrOA1NY5UnxcQe+XDhUzeo21icxbzXczgKd5dVm8tvYbXFHD9LgZIjVc0LgLv8a8fdcXjJ7yimM5CRVPo1OBny3AfAM/aJrT7BsZU9ol9qmNsaJ/I4I8KdYM8VM6xf3P7EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708517424; c=relaxed/simple;
	bh=YDTj7Bk93my02RJrAXYF1eILQrLh3br61up1fUOKHrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rhocy+5b6Wa9bUykrROW66Y75oWdv8ajm9xqyQgpwosf12vu38NahVg4PTCxMu8Iq2+o0uEUgCLR7G5hCK8CrIglTZgIhLHrKqIpIFX8jqUoOY302orXIzFw8Xv6SZ3qMCv09ZILaGoHgvLUt6JHvYc28HD4TYLl3YOUIgc2SoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWKZT6g9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE367C433F1;
	Wed, 21 Feb 2024 12:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708517424;
	bh=YDTj7Bk93my02RJrAXYF1eILQrLh3br61up1fUOKHrg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YWKZT6g9m5F1gndj+QPYh24qajtkKva8UAwqYE93/VZKgnLleDcS2CbUnzzL4CJ/y
	 7y8c0Ggwr5LKHWexcQB4c/AuiwWQCPaY317urXXT0i5VacEqGXZBLBMcpc1HpWEzhM
	 gSuKmGHpQNSSUjClsWKbemSwIFkkUGXj4brm5cFe+sJ8kxBXcsfQELEEtO3jQZuRZ8
	 B8y3pwXFkMyiM4xnrGM3Zh6THQbcrDhakohbQzhRc0ypF8yUU17xoOouMAGrP0TPe8
	 2ecOv3j6ec8D4ZMdgJLktiVBnWcfM0TbJuZ7HpVa13ZNL9LIUt9WHaxS/oYvOWAzaM
	 QM0V8Pit6L1Jw==
Date: Wed, 21 Feb 2024 13:10:21 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 1/6] i2c: wmt: create wmt_i2c_init for general init
Message-ID: <ZdXoLQEqkAXhH1Ya@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <eb2249f78697bd295d720c14501554a37ab65132.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MLp1H7bOkzsXGczu"
Content-Disposition: inline
In-Reply-To: <eb2249f78697bd295d720c14501554a37ab65132.1704440251.git.hanshu-oc@zhaoxin.com>


--MLp1H7bOkzsXGczu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 05, 2024 at 03:51:44PM +0800, Hans Hu wrote:
> v5->v7:
> 	nothing changed.
> v4->v5:
> 	add previous prototype 'static' for wmt_i2c_init().
> 	Link: https://lore.kernel.org/all/ZYx0VPVmyQhtG+B9@shikoro/1-a.txt
>=20
> Some common initialization actions are put in the function
> wmt_i2c_init(), which is convenient to share with zhaoxin.
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Hans Hu <hanshu-oc@zhaoxin.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--MLp1H7bOkzsXGczu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV6CkACgkQFA3kzBSg
KbYrJhAAsB2jYiFMwZCMsixrclrThj7DfF1dhFyBMSeCccZpQXlrKkqEs0bXW2zW
KPpD8h54NIififqQgnK+tbu1hpYKuKkvyKt5hjuO+sfslvbWgWpq4rVUaJB0YVHm
tVksX/P8s/jQQ4OODF6rcUImjsU3RD32AMf/s76p5JAzz0+pV60mkicMY+09XGkN
9JTLnLm7k2oaFbgfevp9a6s3Gka0wZxgJ6vntrHVqLPBTjx9jQE8Od06hRZ36PCQ
l7RdpaAwj554Cv1IpKugq9zKIoAmQnhKrzjiSUG9N/o5aKTuOsztZC3O9Seuj53H
wRNwjLpF9BQIvZdtBoeyUjnH/bwiaRq/4Ovy2+uE7GQNPNICEvEQLy1FJ6g+vK1E
ViwGtLUg4GQSqrTlCaq94cl9erFAZhN+8YKRFxK2Qys/SCU2X1tBJUpr9JWkc9T4
P+U+d9yq0Mr+DyK7/Xv8u8v4/Stic1UeGapEZLpITho2+/5z/JgltdmxUvOg+bo0
8EsTVa5mMZPXtrkX3udrIhlxw5p8tGjk3jmCoPtG2ZoR6re2hScr+JdAKb3nxl2i
Bxoxxr4ipRsqOCIuRe2rGHL3HS9162EwOFSv/zz3mNUbQ67Ou6OFBhU7L6pwTrR/
mhkQkEd9rkcYrzpp5EjTQHoFDbf0tUBoibSYyVTCYoftognZEC0=
=OA3S
-----END PGP SIGNATURE-----

--MLp1H7bOkzsXGczu--

