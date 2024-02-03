Return-Path: <linux-i2c+bounces-1621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1B8488BF
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 21:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B5236B220F5
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Feb 2024 20:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1662012B7D;
	Sat,  3 Feb 2024 20:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uAvlptMw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464E12B60;
	Sat,  3 Feb 2024 20:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706993084; cv=none; b=OQwhIWVDk+UVOPpbTW9XH8Z1ZPttCVsqbo5poO3jJhfI4fphQjgTsOXomlwJ5q93VcWhoO+LAUg7LswaepwODtto2yTDdWEh1FItd7G+1EfK4dnlEhpnf/xdkOvhPjh45jdIo3vH6Meq0HzYIRtVa6CaYEwInC6mo2D9+kyVxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706993084; c=relaxed/simple;
	bh=x/oqty0khXvRPmeM2qld9ejEfXUIdA5TFFykrWN2wRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpuP/3bPxYF4ScGx2YnjUcMLgbbKkMVuVbDSszmqpYpBmIvDtgMge0MJnZqoU7ZF5X587ouFv2tnFQWrFyXrvM+9XWp1ZjVXsu/VJKWkkaf5KGPlIuw4zey8q0N2W7syKjtnTC+zkBF5J7RUUFBUbsYc6CD9TevjNHePD26IEj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uAvlptMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1CB5C433C7;
	Sat,  3 Feb 2024 20:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706993084;
	bh=x/oqty0khXvRPmeM2qld9ejEfXUIdA5TFFykrWN2wRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uAvlptMwBN8IRS1KUwxHSKLksiK2lRlKumrYzNBRolXCz4OPWO2JWGwRIlZSwLJa4
	 CYgCsVYcaqNFTJtfPOHut6MdQjq0Ww6C/aPKmk395M2e7xKPYmFGWlOClv5LuwWNKA
	 1eUL5MTDJVi+S7/3zVRlb/JQ7Syo7Cr2BkjjuhAii985cdnoRaU4KL4+koQuMR+dAZ
	 fPlo/yrNQ9qJ+mtrioHuOS/MHE1MLBLbhlIo7UQp32ol4Ft+yf9GB3XyYvDuMZD3/O
	 wU/+rF+PftYAu3oRasyvGDmNEJNxILk10SEIoCuzUDkcBquvKlKsm0OA0zagKyE0Jx
	 gChlHBhYngANg==
Date: Sat, 3 Feb 2024 21:44:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Tali Perry <tali.perry1@gmail.com>, Rand Deeb <rand.sec96@gmail.com>,
	lvc-project@linuxtesting.org, voskresenski.stanislav@confident.ru,
	Benjamin Fair <benjaminfair@google.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
	linux-i2c@vger.kernel.org, deeb.rand@confident.ru,
	Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference in
 npcm_i2c_reg_slave
Message-ID: <Zb6luAVHcnX2fXz3@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Fedor Pchelkin <pchelkin@ispras.ru>,
	Tali Perry <tali.perry1@gmail.com>,
	Rand Deeb <rand.sec96@gmail.com>, lvc-project@linuxtesting.org,
	voskresenski.stanislav@confident.ru,
	Benjamin Fair <benjaminfair@google.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, Nancy Yuen <yuenn@google.com>,
	linux-i2c@vger.kernel.org, deeb.rand@confident.ru,
	Tomer Maimon <tmaimon77@gmail.com>
References: <20240109145121.8850-1-rand.sec96@gmail.com>
 <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4qMMyxx03EcHjoHW"
Content-Disposition: inline
In-Reply-To: <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru>


--4qMMyxx03EcHjoHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> If I'm not missing something, npcm_i2c_reg_slave() is called via a
> function pointer ->reg_slave here [1]. And seems `client` can't be NULL
> there. Other drivers implementing ->reg_slave function don't check its
> argument.

Correct, we trust ourselves here.

> Maybe we should just drop `if (!bus->slave)` check?

Yes.


--4qMMyxx03EcHjoHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmW+pbgACgkQFA3kzBSg
KbZ35BAAnKpAXvpH6l/0FPmAfClZMt4L47HMb59BDAJvcvRxKNRo+RZD9Q2Z42BD
Agz8OGyuvPVs29cZEmza509ZzTnBJRjfqHQssdFJpK8i+t0APRiLxAYDwsT1IdWb
s1zUCno2d8vlIQMRpP9558NcWCdQxGgBES4wqVtsYNMx54XuLIO3P4Hm1h4MU7fb
BQCmVccAIDmLAk8KTpHio7y6/00kfeqTAclqF0yVD8/71JAXR1bR6isDdKLMDMTs
xrEInejo4tj1FkJdCZV+nBk2bweVGRiW909UB/9hqMaKY54I7MKp4qludDsKEhTJ
8LWe2OlIsqvHYGOHGPHDA/HVQV4T3HcGGrVSdyQrbSTPBRsTg/EXNJ1s7mr18aB7
g+0QVQ32NO+Pi3otwTXvnu7tg7u9Xae4v18fOdFiK/ezzFnxISZT7p+khMQdkcKv
y2ymfN0UD+JqVOs0dhielqZI8bt98MAy3ngZqTX3vKBejfmsgYO7kkJJiApr6h4B
n1KGg6tMb87K7S6lUlh4E0IFRtLzQDvDFnEDAH8uhjIcWVe8mLvVvdnYYYIpFP6N
KrYZEUCBfgmlHyuBYW1vtFMwy28oKhND0v4aCbk9DChb6H+b4WwQE9teTXdQKTfy
07gyCLvRK0eLCbYJFSQHvnK5q9Giv7Moy+h8Z77VRMypA56VwfU=
=oFAy
-----END PGP SIGNATURE-----

--4qMMyxx03EcHjoHW--

