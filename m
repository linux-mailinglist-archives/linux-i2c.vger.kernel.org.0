Return-Path: <linux-i2c+bounces-4240-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 314259132B2
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 10:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E37B284759
	for <lists+linux-i2c@lfdr.de>; Sat, 22 Jun 2024 08:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9B014C585;
	Sat, 22 Jun 2024 08:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dwaTHKAq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980C5B657
	for <linux-i2c@vger.kernel.org>; Sat, 22 Jun 2024 08:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719044080; cv=none; b=jWp+41jL13hRlfatu5gQSsddUq5KZHhtbhxFILU7SihMT8ZEex/NlzP1Cp2oMlaio9gF14Uf4ToYMwqIO/jYOM7d+UVmrphxUAm+5Hq6Xy7pN2hyWk/RJsr1rBhPwpRENIpbvRz9B/4WfmMN3j7i8u4wzQE98QaNFz2Q6xdVsZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719044080; c=relaxed/simple;
	bh=0vN4VqSqY2yIO4rqQrhMgscL4uynIoX5uJ8p8GrAF64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCjobbVPFQW81kcMSrZh8pAWkSY+eWa/CnLMVP78bXay8552V/pAl6kELMZSqOceRzI0wvkYRVBTwFr3CI+YH/KqFMqCWjdYZsinZesV550TD7CdkkimJmuryYzHduyIlLrQAG3rMmbT5fTLjubnimF7pmP23V7ryofvv/KvoLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dwaTHKAq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2TM0
	2Ogtd16G4f/QZ+sgVy6161D7/cZ0UnFhZrs1Pb0=; b=dwaTHKAqa9w5I3cBdqO3
	WbJ+hSLufNjrZWsqvihRWhOiqWKvEPmSb2zbiMwhJG3VSqPfDUUCpXT9RchEQHeu
	VbABZXuTnOzIHAlrEMHIsu5KWRm7GwNUFKSbV+5TIzkZN3torvuDJg/40KlPsaZM
	dzFjLaf1Y6oEHwcgpbMfsFZQE9dRW0fAkJQLKU/8t49bc9LQgil4vDgApE8ob/t4
	mL9HNy4by42yf1HhcB4tPogwk6djjUYLzkfCNhzFgRNkReXcNvhcvNvjaAA4zd1h
	RWUt2bXR7pXOjfjqM0vQZ8RBuk0PXwypJ/Rq7eVZMNQEmRuyaQoDNA6uFSMp6DQq
	sQ==
Received: (qmail 1599843 invoked from network); 22 Jun 2024 10:14:27 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2024 10:14:27 +0200
X-UD-Smtp-Session: l3s3148p1@i6r5InYbaOpehh9j
Date: Sat, 22 Jun 2024 10:14:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 0/6] docs: i2c: summary: update and use inclusive
 wording
Message-ID: <2tbpptvm7725cuk4vfz4wnnouuo3mj67zkyakdu4txu45tpgpw@htwfymahrthh>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, linux-i2c@vger.kernel.org
References: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qwxgszlq6ponbw54"
Content-Disposition: inline
In-Reply-To: <20240621073015.5443-1-wsa+renesas@sang-engineering.com>


--qwxgszlq6ponbw54
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 09:30:07AM GMT, Wolfram Sang wrote:
> The main motivation for this series is patch 4: switching to
> "controller/master" when defining the I2C terminology. This sets the
> base for further improvements to inclusive language within the Linux
> Kernel. The other patches are improvements found on the way.
>=20
> Changes since v3:
> * reword "Synonyms" paragraph in patch 6 to be more clear
>=20
>=20
> Wolfram Sang (6):
>   docs: i2c: summary: start sentences consistently.
>   docs: i2c: summary: update I2C specification link
>   docs: i2c: summary: update speed mode description
>   docs: i2c: summary: document use of inclusive language
>   docs: i2c: summary: document 'local' and 'remote' targets
>   docs: i2c: summary: be clearer with 'controller/target' and
>     'adapter/client' pairs
>=20

Applied to for-current, thanks!


--qwxgszlq6ponbw54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ2h94ACgkQFA3kzBSg
Kbai8RAAposR/qv0aJkXFIkqzPojSPnVq3TTwOly20E/T3t/YmBsa8Hz216F9SOT
3MAvGVu55LS519WYHD0rJ4eh0olJ8krUtw8WwFnBL5UupbELjCSUn9KtWXd0azUt
DW4stM1fWnKTPhAmiACdC3ilKV5vMi7fKF2LGurO/RhPkVonQmV8l1fc3l9GRnXw
1Z3fVCHYZO5llBUs/zGqm9Pj6471FkkztGl0W50Jj4h/17+BbgjV5Ojp4KvhGArk
gL82lMK2daaMB8uNYKqZEvFqX5lYitmwjYfxmfmmIdKd07vPFpa77g7TXHqLCQmV
0J6pPwJGPoGiH1sb3Liwh0PkdaH3JeBKxMEZRmUbFXxsm6CUtLX9Ie1MCh4Z+rnN
1Xx8rhJGZ2+TxRESkBuFOEy8taTvmVCs6CGxs6dc9ua8NZPaU5sAn6Zo6LX+J7qD
SUADsMC8UnW6k9T7tempAqSuBX1N8Qg6I01/uaq1BM/dJCvyJlI+AlhyzAu+e2JI
qnyUxPkDGTvtDgwbSEEuL/3XfyXRwc698kIfYfRjFl8+dfnbGKxKVug573LPrT/O
mB/AUWDu9L2gRUedSM44Ea0ipFtIrO8cauvMmOkAOV68Nt+UDTolF6zdx6024c//
bTC97G3wauaGmdf7M9zAqLx4l6tMKya+S/pRq0BhJx5mQ3g8AJY=
=h4Ke
-----END PGP SIGNATURE-----

--qwxgszlq6ponbw54--

