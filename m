Return-Path: <linux-i2c+bounces-10008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FC5A6EC6B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 10:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88473B0235
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Mar 2025 09:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F99A253F2A;
	Tue, 25 Mar 2025 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AojUUF2w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481EA253B79
	for <linux-i2c@vger.kernel.org>; Tue, 25 Mar 2025 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894706; cv=none; b=iJDKYZjKgfmoULl1XDw/7SvQnEXY06sOr9X+MMfP0sKgjPPiVyuGRQWcB7ljwS1mUGH0uxS31oqJuRiu2tMOjN8VkmtJujoTkVkykjZCATcrnyi++yuhk0o9YQRrFtrUFil4Ml13dguZ+fRmqbPCL8PBUec2Jf1YLaA4iunV1wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894706; c=relaxed/simple;
	bh=KFiN/jUv3e9UqZlTiFtYxFqL3M/Lq+dxrzzZWbGTpWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGnuVmjs3V5L4wQN0ToHj7WVD+hZNsFGgbQpN6gVzfx4i578qTDZrms+ZSrrFJVhBYqlC4dibpfUWomq0yv0YPqHYdLbTYD5ykJAKff/BpyEmn+JGb0guQgiIr12pHWIerM8LAfgcD3X6JTbPion6AW7iqBz+UKo1qqvAZ/F+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AojUUF2w; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KFiN
	/jUv3e9UqZlTiFtYxFqL3M/Lq+dxrzzZWbGTpWs=; b=AojUUF2wqEK7NXjWTMap
	3m22ts+5stiU8d/ZYSfyJ7X69hHdLeAq1F/654+g+EbWYJzw67MyntfbzcS/aPHb
	uZ/LRb2baUFBNh8ctkq7roy8n78tKOXmvIuHgKFH1CnE58CcX1V4ZGGvVQ2CKcwW
	K2zDM60JUtA6TKDO99oSCskRYnA1gcItbMbuYZjPL2L8T2QYMu1Csu3/mySzP3R/
	DpW+jmoqR/s1erUwYvWk+koV7mewdzhehvbs2HcIIxy1a+kJ5/e8LTJ2NkPsd1J4
	4Hq75CRbDJD8/9w0Xgyb1053SgTpKrH20E6Et04JnHO2KB7YkcuaKeJk9X2ffJTA
	Iw==
Received: (qmail 2972136 invoked from network); 25 Mar 2025 10:25:02 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2025 10:25:02 +0100
X-UD-Smtp-Session: l3s3148p1@jSyUSycxDNQgAwDPXyTHAJp038nK7dx+
Date: Tue, 25 Mar 2025 10:25:01 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: tglx@linutronix.de, maz@kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 45/57] irqdomain: i2c: Switch to irq_find_mapping()
Message-ID: <Z-J2baboKnPmuJMW@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, tglx@linutronix.de,
	maz@kernel.org, linux-kernel@vger.kernel.org,
	Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org
References: <20250319092951.37667-1-jirislaby@kernel.org>
 <20250319092951.37667-46-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eLfLyp+w1hNRRidz"
Content-Disposition: inline
In-Reply-To: <20250319092951.37667-46-jirislaby@kernel.org>


--eLfLyp+w1hNRRidz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 10:29:38AM +0100, Jiri Slaby (SUSE) wrote:
> irq_linear_revmap() is deprecated, so remove all its uses and supersede
> them by an identical call to irq_find_mapping().
>=20
> Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: linux-i2c@vger.kernel.org

I can apply this independently of the other I2C change which needs a v3,
right?


--eLfLyp+w1hNRRidz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfidm0ACgkQFA3kzBSg
KbacBg//QrgKzHdb+qOv9ylc66EwRZl/SleWrp9rPHe4LAsWAu6VQjIMZTEtsJfc
+una07JQYUD3eyhMAX9Lgv2L+MK6kDqHphkp62B1dXjNxct64R3kfybOi7qsIxmG
qDpdoq/PyQnEsQWkYL8EwlS/76Mk31yFDxmoaVijlO2NKFYOw3F994KGcdiF9J72
ufVfE+onKzfWLy1Ca1MkA6ZwhJJd5m3iUaxdxXMkhKUf8cGveIjF+j+mgY+jbhXU
OXZbUeuXmAQ4iosGjLUIF8MxVGMkAOeJP3GoiliCFgqbV8WOhYtzzm+Wyvcnjl9S
phGLSs3rzSYvW1Wurn66WZ2+qbl/Vjy6yLlyVwmtuMTXa1icdocV3bPh0sO0XIPM
J7iEpfAOjqWyy6gCv1ziR09tZMQxcZEIrffCrGDnc9ZEJXshdsGob01YyPLcZ6Hp
4y0cPeYtO+Qio7y8NNjv17N48OvZ4rYHkD8ZaAB7xfW3xNl+rtzuXTzfoyNOTZtE
RyqA0j9K071bl2M62Qg4oHyZpWC3UkJBcr/AbiYak7g+W01FLscZCkWBWr7CTYIO
TTC4u6W/8fzxCvvwgogsXm+wy0mKdAinLbw1BuYRQ0+9IImQKjpEevYChGROrFgS
DoZkpEFErlv8smGLAu1a0O0qOCpGBnVGaA3LxRPcPzusXt6SmQU=
=b+6A
-----END PGP SIGNATURE-----

--eLfLyp+w1hNRRidz--

