Return-Path: <linux-i2c+bounces-1891-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 633EA85D81B
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 13:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E280283CEF
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 12:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C84311E4B2;
	Wed, 21 Feb 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udW5p5Kc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF5069318
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 12:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708519483; cv=none; b=LWPQYPJI8F4CKjNcdQ+LBbXkZxE2bjW2jfY/oAu8yaicMx3nCvKU5pEjBeiwKIjqkO3Lors/owXEzfEWQpOx8RsZMveiBFhc8Z18JOVI9DmxLiRJFcqCnEq25OKSRoYLYAykRL1D3hTGfKCLo7Jy+KvFqWJNS8Xsfqfa9hHaO5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708519483; c=relaxed/simple;
	bh=YlbpMMXzK6suoKp1eF/yfmrwYBPVi0VfyNwz93yrMM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYEs/t2bP/x5OYOAePSYvt3ouiJ1XDgIEym14XvWiytg+IQW79FyHFtnZLm+cVWA3ZG0ZwFWERB1Mf09AfaRZ/TxmX/LciZsh6nyb2vQM09td2k6vHvq9mHdAqtsWbPqRZn7Se3JGwiCk1AWd9uqW4oXc0zG1ojIxsLxq7WJeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udW5p5Kc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46BAC433F1;
	Wed, 21 Feb 2024 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708519483;
	bh=YlbpMMXzK6suoKp1eF/yfmrwYBPVi0VfyNwz93yrMM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udW5p5KcSOzx81/vC/TXfQktaieP3b207lIVQ4Dnnq4f6BYRSiAygjLsHxMjxiTze
	 9coNfZvOoyBIGFO1yFcrhNpiBGLsXu91bW2ltK2B6ctbajs1rIDlujJvhvgmb81QFY
	 Ia4IeDvVLUExn9togYaTS3JLeDQWoSBWmQ1uMlFxlZ69exej4aBAClnf4LivF+QONg
	 cViuMtQbK3MR1RzQm0OauEm6KAukakIJE0Zpu/DfnUs3d/jtgSNDZkqLIoDqM9ZkHX
	 pMdkbyw9IMyymPz32eNm6g+UNPf92I4qWS7BDOHPoObf+UQXJgKfrxu800HnIWvad+
	 tCEPeKglSTxbQ==
Date: Wed, 21 Feb 2024 13:44:40 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Hans Hu <hanshu-oc@zhaoxin.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
Subject: Re: [PATCH v7 6/6] i2c: add zhaoxin i2c controller driver
Message-ID: <ZdXwOEC-4BqJ31OU@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Hans Hu <hanshu-oc@zhaoxin.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, cobechen@zhaoxin.com
References: <cover.1704440251.git.hanshu-oc@zhaoxin.com>
 <9b5882c7ef2462710903b7f10252ec85c4292104.1704440251.git.hanshu-oc@zhaoxin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bTCAmp1pBWyl9dde"
Content-Disposition: inline
In-Reply-To: <9b5882c7ef2462710903b7f10252ec85c4292104.1704440251.git.hanshu-oc@zhaoxin.com>


--bTCAmp1pBWyl9dde
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -67,6 +68,9 @@ struct viai2c {
>  	ktime_t			t1;
>  	ktime_t			t2;
>  	int			platform;
> +	u8			hrv;
> +	u16			tr;
> +	u16			mcr;

Hmm, since this is zhaoxin specific, what about adding

	void			*pltfm_priv;

and put 'hrv', 'tr', and 'mcr' to a struct 'viai2c_zhaoxin' local to
i2c-viai2c-zhaoxin.c and populate pltfm_priv with it?

Rest looks good so far...


--bTCAmp1pBWyl9dde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXV8DQACgkQFA3kzBSg
KbZ+kQ//aq9afLz+Xhy+zAGKHItEDmroKELcz0nJq2H4YH0OTXH6VKnZmjuP2UlS
uCqXT5fHA0xpMcYdewGS+NoT0Fmgaos1QfUItoI8185IS/sEQuBOFkq1VnNc6hRb
lp5qYnnMdXnoFNxAgICOJG+Z/E9DXpVmy0Ibz8DG3upIAPPtKpAjxVAjEiasO/2p
Cx+EgjC/G2LWJJ5WK8MWCOFSmAZDNieHlyvWUTQGFIHNUgXW6JutA+HlUDwIhE5F
zw/Qj1+bt7cyoA4ij2ievZrT7IVNZUXdXiwVEALQouBDlSKy3/nYwvdw2bhH2Dwa
YFUlxSFLntphRhI0z+Ga7wJkOMqYR4rcoEQ1Hl9LHUZOXq2QPg3Yv7z/3YC0hWpG
JyKonUX0JYSpF5dFvsa1qETWlasLGNtai+AHiHYq34mMg4/Yuew4f6O3lTxwJgnk
dSRZCMiniJ8F9rUX6YC9R8JnwrSPgLcgN/gvplLfugGWnEceETzdoL6V8ra49UCO
Volz+XJCYoA4KYBFP9Hy9ZcdbW2IopfSJCoH4tnMLHXjLf/Z9ZzT8Crj6Erm3HTd
7QOgfXZm9QDIysuHGkHFaGFnWSIwnmM+56AdktbIiPgmPNDVlvdVF+dayTqch+6I
Il027K+PSopU7fhb/8laElT2Oqwj9SFzDXA/17tfRWggxGfs5uk=
=hFE8
-----END PGP SIGNATURE-----

--bTCAmp1pBWyl9dde--

