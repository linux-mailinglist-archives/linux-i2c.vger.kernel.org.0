Return-Path: <linux-i2c+bounces-8987-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A9A0715B
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:23:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD99D167645
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 09:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30DCD215182;
	Thu,  9 Jan 2025 09:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zk0H+5Gg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B1214A98
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 09:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736414626; cv=none; b=hwldZ18nbjZIFZ7vkI/IeYRv5RF3+TIY8F0e7PpDdPPKtfVlxPdkwX6mP9tv/ESk5PxkXPTm7JiJQt1VQOoZX4iOYQh/m6nInhZT4nVbwJRRTY+kYEUmfd+k3aiSS7NZJ++cyVDC/to1HRZaZLdyuICCtOmdBRcEgV33RiDDPVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736414626; c=relaxed/simple;
	bh=pVhawgNaSYa0/cslbgYeWY/ycUTHcgkNXuYbH+GNQoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0295PO592kmHowtUe5jy6cC+zCZd9HVHxWxicyFouTMGeA4RC+XgKXb/OdkxE72Jz+HDu6y48cD2sc9cr3chn1DzDEJv42mZbl+EpTEYv5tkpuOKo+DMCvx2pn/IlcyzZvudWmlLUn8s0zcZJN9k7BW/bxNFbZASG1stNHgRfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zk0H+5Gg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pVha
	wgNaSYa0/cslbgYeWY/ycUTHcgkNXuYbH+GNQoc=; b=Zk0H+5GgwjV2W5oNolMT
	NFh4x1ScFw5AwEMh59Fik1iYriVK00wHrLcdUGOFggEv6MAuUizhXiLhom6LbzJA
	AJ1FhLuSAfopEjWQn7QLEVrY9a+yk0NRTu/J4JFUhYyiZ29Ve4Kkbk9GhY1fHLk2
	CYC9mbJFXm0RQvrJ3Xj63mEquSnbSh3eA7iV/SN4jmGkegChIa1ufkOFoW3lZ41j
	ap1ut9cwpbOYUSxrIsJZ/Z0cqwXa6lmR7ZOaDq97Pr4jOqqK1pMmTPt+Dg1z8r9Q
	mQL/BsfahcS8ScW9GJ/Q7Yqa+yHdvJphVYc3d/+Fev19T1GjOyuK7icV3bUteHjk
	aA==
Received: (qmail 2850531 invoked from network); 9 Jan 2025 10:23:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 10:23:38 +0100
X-UD-Smtp-Session: l3s3148p1@A01/iEIrIpAgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 10:23:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: amd756: Fix endianness handling for word data
Message-ID: <Z3-VmirXK5L8o9oc@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Atharva Tiwari <evepolonium@gmail.com>,
	kernel test robot <lkp@intel.com>, Jean Delvare <jdelvare@suse.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250101103422.30523-1-evepolonium@gmail.com>
 <qj3ymbntblc26wnezki2pn2g26z5poc5njhsfbxzam3mpjy52p@px44dxiqhedt>
 <Z3hyr3ZVf4rBuV-N@shikoro>
 <eqjgc5a4fiz6csqmehyo66yduorxt3d3vnr62d5ijxy3wooheo@qabiaft2nri3>
 <Z3kOW11SxEVwqcw-@ninjato>
 <ovddzx2zitp6lqjdasinn2zaaefp35y4mspol3v3x5rk3tddgo@kgcwexuai2ir>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h5419xBSTIk/tCOP"
Content-Disposition: inline
In-Reply-To: <ovddzx2zitp6lqjdasinn2zaaefp35y4mspol3v3x5rk3tddgo@kgcwexuai2ir>


--h5419xBSTIk/tCOP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> On one hand, I want to give credit to Atharva for his effort; on
> the other hand, I think the real solution would be to just remove
> the comments altogether.

Yes. Atharva can still send a patch doing this.


--h5419xBSTIk/tCOP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/lZYACgkQFA3kzBSg
KbYCrg//b42SPGaqBIduruCnBJP/0ZYnJt48JS74YSwjCAH9PCPsd2QtM95whQvi
u2IJTO/A8YzOsu+FImgfqnoFn0sbOUlHb9mAaReZwpXJ5zbaa83/0CXv/neXdYUP
aDEenqKl/8Vf2xljNgqlHrDdyEWJ70hFNwYsv5KGwOWD8wrOEwU5ppdqfrwvD41r
lIou8ljVMlFd8qntbA3AdWhae6GE5g8S75LtFlL86Xg8Dlkm1lHR0L95EtEU+LBB
oHzi2O1l4EnnQHJtwNBFfps/i7d1TdlGlciM82fMTj8F1zuu7vrAX/17jLmDo+C6
UpqErpAZ2yJ4ER4kvbBxLgrJ3DAiIifiaasVCNVgqRweQ3p3TSnwwyENeTYXGoQF
V7+IoC3UTgl+zgRnceejcRHJoeS9lJSqFhjHeJlZW3syqaRFPSQkYvuuZ/BhtZg5
vMlbTD4+Vpu1zC9xsVpXVjA52o/1mD7vw5CKl33lNn/2JWbneyFGrNURmpDE8YyH
qqIbiF2p5eddII4uD+9LFCE3GxWpNfDa2iNi3DrbuoLNZGC1sH+JLAVjAbDJwsFe
iCpPqeOQ84mKh2pcUZKkuWGrAOKk3WcEq4mSfO3FyPKVoz9wAsVUH3AUrgUIDz21
yc74+rwVLckYbVkKpkbyh8IxMAt4sU6FHwWSr1EYbhn7BN/0jno=
=AncV
-----END PGP SIGNATURE-----

--h5419xBSTIk/tCOP--

