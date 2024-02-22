Return-Path: <linux-i2c+bounces-1915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5A385F48F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 10:37:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCBEEB2445A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4D12BD1C;
	Thu, 22 Feb 2024 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM6OI7Qv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E431799E
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708594628; cv=none; b=Ia/BSxU43ayEynU158Pe0fxZR6OE4WREZ0Qws305sU04pvuR73JPpJl3JwNGxWaT5C5UDlftumOYt2+xlptLT9/kyWFbCj506oacE4q0NRbCoZg26FagBTb2Yav9SzDqZ7VsMKzAQs08JZJ8qQc5lQwP45vaPmQDygqjLEfcI0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708594628; c=relaxed/simple;
	bh=YS/dxPsC//E5e9xGP0tJmUKujkHptm7EZpl+Siap5xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl7OLJUfQOKZyfQfWaOFCd1x9wJ+rGqWhQLrk3w7eH/V307SS8C1yBfP5wXbkHTNry4gmIZLu7PYBUVRpiztDL48xT4FNhDaz8up+2hrFtO8WWnWsSHqHZMQvg5y/xNnsmkusXpseKp+bBnuUDyGwvmd5tQ0qhqJSp4eb2YYge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM6OI7Qv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7181EC433F1;
	Thu, 22 Feb 2024 09:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708594627;
	bh=YS/dxPsC//E5e9xGP0tJmUKujkHptm7EZpl+Siap5xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZM6OI7Qv7W0N47Xjm/F7TZKVnSHxn2TfKlFaUGh6mqsDzFkZ2x9hslj3CUmlPQbKA
	 RNRhyeo3zlZyhiblaq8tF+WSiig5RXR9JAtFU9GAUZdy4XJS5rbefSIuldXpe06y8P
	 tqwHCo66IezprNGGSatya/jn/UoRNDaaQmPGrv5NCGn4NwT9nWwatQcLRetAixUy97
	 RwdKUJiPw4o/YlU85DuM0AwJsSVG5fpx/CY20lDyUQeEuQ+pxiPp208tmashrnvQlT
	 nKTwX2+D4LwPqbeJnlRYxqbqtLqDj73JI3hLdYCT3ksXcalqhgsZ5Bk91tTpbhQqVJ
	 uBFbiycj7ak5g==
Date: Thu, 22 Feb 2024 10:37:04 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <HansHu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 4/6] i2c: wmt: fix a bug when thread blocked
Message-ID: <ZdcVwJ6iOTEGWYz7@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <HansHu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <f56773092681736140447f47962aa2f6c3df3773.1704440251.git.hanshu-oc@zhaoxin.com>
 <ZdXunlc5KQ5JlCA7@ninjato>
 <439eb65d-88de-4e7f-9138-000aefc1c1e4@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CVAuqAutzgWbb1p2"
Content-Disposition: inline
In-Reply-To: <439eb65d-88de-4e7f-9138-000aefc1c1e4@zhaoxin.com>


--CVAuqAutzgWbb1p2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for your suggestion, the purpose of this approach is to
> reduce the clock stretching caused by the system. Therefore,
> I try to put almost all of the processing in the interrupt context.

Well, I think per-msg handling in interrupt context is enough. The
transfer (consisting of multiple messages) handling is usually best left
in process context.


--CVAuqAutzgWbb1p2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXXFbwACgkQFA3kzBSg
Kbb5mA//eZyrhczU7CgAu/fwqE3y/EkJ8k0oVjlQDc6bypOfUOUULYWJgRZEmAIx
uHa0GtioEOt0OnxZWOAlobw2knaiNxBT8s0WjAOL3B673DPVyKHF+UIubaLB4j0q
TeDXuzc0Wu00yE/o+zb4QxBm3dj0qdDWkw4bMsmFScxYUsa/L3wn1nr5RJOp5hmo
xG9UVYnZ5g1uw5fie0ZY7G/JrlYQnAiiMjMhlquvxAg1TkqF00lo8q9umzSFNyoB
Syg6xW9pbGPkndRPfqhKVV3ZyZSSaqwGemObaEeaEXUqslmI0ytU0HGph16821cf
qP1e8ouwRm3Tc0n+I89Jf9FM+5PZBcu7VojQmbujYTXxZBr5BviMTu1aH3cPlL96
5orrSQhD2xmvVJhctgypNJV82Y+dQZCg/unInGel5DAn3MMZUjvoAb2X0MT+VVs1
AuaqAaOLrTdIOTmYFrjjG3KvvihA7ei3+npXUTvxvdVoItViDsGhw+Npz1dQ7dKg
wk++oNyz/WEFBWEZt7Wsm/yBX6u4tXbSMH+5J/efwVxi9wIkfZgtq2+dY3vLgymO
vYefVqlAlBjjyyQ5JeVUlDIvEiWpTbxsfsdt7uWkrOjNBnsnbAEvqrAbc2qZ7Fkg
Dtrc82l39KeP670vyOmpQC8NOktXf92D++5Fq+I+KjHDukcJjuw=
=XtQU
-----END PGP SIGNATURE-----

--CVAuqAutzgWbb1p2--

