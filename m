Return-Path: <linux-i2c+bounces-9456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9FFA359E2
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06E4E7A2611
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Feb 2025 09:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5226C22DFB0;
	Fri, 14 Feb 2025 09:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bkw6o3jj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8622D7BB
	for <linux-i2c@vger.kernel.org>; Fri, 14 Feb 2025 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524235; cv=none; b=QtCl0sdqgNS9sH/UvQ/uhLgW4ElLFSVGvPYDoyt4sDc9Hqe8XIOLshqt2iLzeM9fhtpVYVrOYgKIFWRnIwJy+wxvYUyGQQ4hXHZlr58Hpl1pt8ICTpTT/6TMh3jicWFBUT6/T/AWOACz0J0Jyr+3wHvvs3wcc8lT4c7HnbMRMno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524235; c=relaxed/simple;
	bh=l7XQn06UKH6z6aX2lgLTdUGl1oX7PeNZbACW+APz/8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i65RFHO+6eYca41bNxzO9HPcQzVd56Rrjy2ZV5rXoS4OjzGyWQ/SxJpHzxgFavLjmPHpBbHJZjXrJ49O/CD3GQeEG942Cl/YCm+xsrnz/UMtykWhJQMW45uIDdbg1liSU9VfgUhVHjxnTfzyW0ZIX89EKKX5hsmg20i2FAczFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bkw6o3jj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=p8cH
	yiLvglep8gCoV5lWx+z+f4lN7jvFWIlgVLg9rw0=; b=bkw6o3jjrCJKBZ/7dOUz
	oHo0fwuC4AhdPv0Ht4HN4FVHrEqHvOZxqA+lPjQP8b/rQgae+8rnChX6DqIq52dk
	aFTZAuC3iWyvuWGEhMrOUslfafOReFOD+2dVdgi+Uld1u9sJrS5bO43kgshGED2d
	LXQ38OHUFd9Sr6IvwGSS35ar44cjgXnYGhmYsvMw5vFuq/CzVlUPfEUwgAnhVJO0
	XAIdldZ0eP8IsvpVcLu8LSM/QlglOBRTg+6pNMZ+lpoEaz6hQ3guS8EjWAxoRKCG
	iaxujdzpPZ3yfaoSAeHJosEuBEkXlzq6hNUpYsB4FjXk0yslLBY+T3GcoOvbjIqs
	+w==
Received: (qmail 2318358 invoked from network); 14 Feb 2025 10:10:27 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Feb 2025 10:10:27 +0100
X-UD-Smtp-Session: l3s3148p1@epilixYuKtxehh9k
Date: Fri, 14 Feb 2025 10:10:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] i2c: octeon: Add block-mode r/w
Message-ID: <Z68Ig1ckLoULA08E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Markus Elfring <Markus.Elfring@web.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
 <seom4yspcjnmdxxwn6wuyiqdy2ywpna6nw4rn36tsqinlncbca@jdehzfnznlsg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iIHNQfzo6ZOCO/mt"
Content-Disposition: inline
In-Reply-To: <seom4yspcjnmdxxwn6wuyiqdy2ywpna6nw4rn36tsqinlncbca@jdehzfnznlsg>


--iIHNQfzo6ZOCO/mt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:19:19PM +0100, Andi Shyti wrote:
> Hi Aryan,
>=20
> > Aryan Srivastava (2):
> >   i2c: octeon: refactor common i2c operations
> >   i2c: octeon: Add block-mode i2c operations
>=20
> merged to i2c/i2c-host.

Andy had comments to v10.


--iIHNQfzo6ZOCO/mt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmevCH8ACgkQFA3kzBSg
KbZzeg/9FBEtVPGBjuPUF0uWmm3p2BCJl8snOIYSARxXsSOoLdi1L0iANLPXid7M
v7dGKeD4J4s15ESU1H9eaDkY6LRQklUHTQ3F+tFYBSiaax9umKx80veZQQfYdZjJ
TCo01F2aqpgUEqrmCSDlzyBmVG1qPPkT8J/ehHVYC3vdxefgmb+Bc4fdnPD+RGjW
JALR410nPxyFHfZfrd+Y+iH9/FGLPY54lG+CjA729xnH7PgnwvEcHXf3WjW9tm2B
i0o9/7i+m8BgIJItypTqftphlkn0fsR4j2o0cOLHZKD6lp1BcRqhFSwsWkjh1IXi
hactywwCmQVlAQ+eN0Lb7C1sRkfY+jhh0Db4r7CHTNGy7VYNr3/hOLCnmy5fH0yA
JM/4NVvGtnc+G296C48Lv+JrDhNX4/l+vmfLpTPVrbjc54Tdryb/u7Pf1wnR6Fie
UchgJ1amCcoQu+6m8w5pk3038m4pkEwXHEcJ1EQRNZj0XB/Uz9FedgD03Tk8FnsV
RCd/4rwkZZ5sEthhdZ65Q9AYL5YAAeH/WfHSLokJMXcUk91WS2ZQlL4dzDP/HBxI
q1MS/mFrCaVAnvcA9LGN2NwxW6U2yk3khQsglpXUwonh0xSuunAzxl5wBkmjO0vG
TXjvTWxx5qGPPnicscCX3nq1CBeCcmaWckrOvywM/DSH7iU3xig=
=8hZV
-----END PGP SIGNATURE-----

--iIHNQfzo6ZOCO/mt--

