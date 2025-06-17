Return-Path: <linux-i2c+bounces-11501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66450ADC87E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 12:36:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C06AF1795EB
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jun 2025 10:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CAA2BEFF3;
	Tue, 17 Jun 2025 10:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MI9emjxK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9747C293C58
	for <linux-i2c@vger.kernel.org>; Tue, 17 Jun 2025 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750156578; cv=none; b=dl/1JT6UKnIsXU3d7bz5eYbWw/r0Ql+jGt1LnZLKD6fFXYDCFzkQVmbaODzBQQyFC+YLNNlDp3X5w5wlOJZY2Iv0XgESpJGVrjC5JTlZyBlDLP2apK8nEwjwrS5NkKFfEKEWlMqV2kuq9DAP/d2AUv1mo0sZ6AF3NcrqrzIl7GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750156578; c=relaxed/simple;
	bh=FliwTJtvVKtpFJoL19ZDyrHjDwdBZkgsGFSnrPqHsgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUHojnB7+IBJEkcO3DHL526la0kBjMLpYefjKfTALQjqBTTwW4pflQpqjVffgk2n5ulCRX6mkN8fyRzv4Y6GVQfZNHjaI5wr75/7zS8GBZT/R8G/wUkObrCDEvpalikjkySjlevRat8HT4MXs6COM1wxGE6Lt0BKEiXqTX+Ce9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MI9emjxK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WR+y
	GA3QOuuCLXDTtWxRTnyvke0vfwA5ofKcR4PEDyQ=; b=MI9emjxK4t5EXmAfEu+y
	BEtHy3+eVwqUzFX+tmjVHAdAGt8D9yr1ynJlj9nQ1jX5txgm/qixvS10N+wV0TmM
	pZPne0JY7ftwQEJ8qEanaVswbsoGw2q7K+jsu8UN9b8hwYJcNW0oJwVxCnyppSDO
	ERAWxKPT3bASG8FnE9LTFxBvaREajUw1C4xInJP0r865c/ytR/nby8Wbp7N2QBzx
	cYOGm07jS9EPQTkfr1s2gtHb9G+Yr1TiCZvfG1PjAJ4mJacrc/hud6XapLZwSqi6
	UZIgfu0/Ofea9xd11lAY1VOV9KejMtrBFgUC6LEVT3Dht/9x4lpTzhve1youexlD
	qA==
Received: (qmail 1615502 invoked from network); 17 Jun 2025 12:36:13 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jun 2025 12:36:13 +0200
X-UD-Smtp-Session: l3s3148p1@8s/WFMI3oq4gAwDPXy2/ACpZfVCNKldR
Date: Tue, 17 Jun 2025 12:36:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: lkml <linux-kernel@vger.kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.16-rc2
Message-ID: <aFFFHIlDqvbAJKFq@shikoro>
References: <sihm5iy2rnldcrk3zyh73kp55r7zywvraycgijtihh27yu5uny@zaj4w54t5ywc>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nzUylVGjxIl1ks7N"
Content-Disposition: inline
In-Reply-To: <sihm5iy2rnldcrk3zyh73kp55r7zywvraycgijtihh27yu5uny@zaj4w54t5ywc>


--nzUylVGjxIl1ks7N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> I'm just back from a short break (from the mailing lists).
> This week there's a fix for a previous binding conversion to
> yaml.

Thanks, pulled!

I was swamped by other things last week, so I'll send this for rc3
instead. Should still be fine. I will also push my naming conversion
patch then. I assume you would have protested by now if you don't want
me to push it further ;)

All the best and happy hacking,

   Wolfram


--nzUylVGjxIl1ks7N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhRRRkACgkQFA3kzBSg
KbZ6kA//VOI24df63N6N4Kfd7HrNRHEHL+k6PMRZkRrnUJ5pN74NR+1l87fgIW6W
Rj+efML9eoXE5iLOg69G6bS6Q3a39ebeUAmoZUhqZtEyzy2wTpXVjiIGmOZi/JF7
fctQVl2CqxlTNWAMmoFmqAOCf0Wa+aFWWwKR2CLhbXB7nlQOaNxoNJ/GuD6WzK7h
RrssMV84wNcHJhj5g9SXaAVdQDssykEnseObhSaDRkslhRIrYmYZ9V1E9I+Eiblj
4pTU1dicUpiZuKgho4f+iSmLEIoeCAFzXI8CPCE3seqVIWk+nF/Xy9U0V+i5WVfR
RP1KXgCDIWJFG/mZOoFKnDnEFSgyXG2m4DGj8nvcdGofe+D1CwOjD8oDXXYp4ReU
uBKoi62fuSv7JqNKeBsd62f+DFmOU/iKqJoCx508V0PWP+cWLkLXzWsShezhxFtP
nStbuoo+kUnS2zsRwl69eVJHeN4Ea1ibtU5XbIBLSLteNK1WGgbHVxlCGRHwKZsQ
P5nqRXlIkaaKNiym51JYnUZCGXIBtLUt3j4mgO1nCZON+pf+nnsT4cTMDjjvReP/
jz2rIJpontO5jXrofWmoIgJdeix5p2sQZP8+JhjCekLtHC6RF8uDkV5tr35n6lAX
0//5GkRDRv745KFcKPSlPJCsEHc4ai91A7DTSOb4I85PzKmkVac=
=VUYO
-----END PGP SIGNATURE-----

--nzUylVGjxIl1ks7N--

