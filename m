Return-Path: <linux-i2c+bounces-10206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CFBA80374
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 13:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70268171BA5
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 11:53:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524F62673B7;
	Tue,  8 Apr 2025 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZYcRaR78"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4F22257E
	for <linux-i2c@vger.kernel.org>; Tue,  8 Apr 2025 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113210; cv=none; b=LSH8VH5A0rzeShEwMQMkotu7H5xZ0UuARnwMeUmp21PvtINy2E0AsT94RRW3FFPevlqXBx936B+FnDQj6l746Im5QY2KG3exeL7CLQxW5DF57mUIXnT1Zmgt+wOrvRYnYaRnDo+l28RSOcSpnvI/6xqFqFRDoow7jdiGbVOh14M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113210; c=relaxed/simple;
	bh=Dxq2GkqloFK2OJHr/1+VdKJQbRBQvGcH9zXZstwKy78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWGgKTao5120daqeiblFmSkauQmf1OVKWEe8PwNYlNuLR6rwGksNFSa8msEmiHCOKE4x6YN7sT+J+LNld4dPMjvTcHHNbWlVFlN3wUAb5bR0DES7gm0xgKU6wOuktxLwE4OeOOX4ZcJ4dAvo2kvbKkOxlmB/GD1t/vJjsMc/M+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZYcRaR78; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Dxq2
	GkqloFK2OJHr/1+VdKJQbRBQvGcH9zXZstwKy78=; b=ZYcRaR78i0b9XASP/cAj
	YvFstwp/0irVgkYQmZCWCUN9Wk4xIOSmOJ3HT5uyFx2SkJQ6+9j5k68xONGemKLj
	o9sownNV3JYibIJz2p1oBkLrICRJ9S21/q7SKsnrWsUFDT55gfcjJst8e3116tJ5
	saE1OOjhS3/Oar1lDISfZgnNij+SVq7Q7lX7ZxBY+n1/rDkSy9w2HrP9zIiMz5Wr
	uveaBYbixY1so3FBSGs069I5z2wxz9e2E04tf9egKMlr/tJLGikT/HN4ifmRrn1z
	3lBf2f1uQyKYnf1o1U7GRb2ZrGLF0xztxJOUPFSwevVyIfIqUAb1He2VdLm075GP
	QA==
Received: (qmail 4182589 invoked from network); 8 Apr 2025 13:53:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Apr 2025 13:53:19 +0200
X-UD-Smtp-Session: l3s3148p1@Suau/0Iy3qAujnsS
Date: Tue, 8 Apr 2025 13:53:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [RFC] Handle targets with different speed by the same I2C master
Message-ID: <Z_UOLq4OZsrliH5T@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <AS2PR09MB629642F8FF0F7CD6F3498E8C94B52@AS2PR09MB6296.eurprd09.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52BEGUaTx0aSGpAm"
Content-Disposition: inline
In-Reply-To: <AS2PR09MB629642F8FF0F7CD6F3498E8C94B52@AS2PR09MB6296.eurprd09.prod.outlook.com>


--52BEGUaTx0aSGpAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> We have a design where several I2C targets with different maximum speed capability
> connected to the same I2C bus managed by one I2C master.
> We want to communicate with each target with its speed. However there is no way to
> specify the bus speed for the I2C message.

Rightfully so. Devices with a lower max_freq may get confused and block
the bus if you operate at a higher freq. You have to live with the
lowest max_freq. Or put the slow devices to another adapter. Or behind a
mux. Something like this.


--52BEGUaTx0aSGpAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmf1DisACgkQFA3kzBSg
KbZgvxAAo+Er/ESjZbNVE3yZH4xd8bCTYovMdUUySX4KuorJHe/ZqNtcWaFwnj56
IUon+RrdrY9gcSmXt7SvvISs15E70y6SF+oX54Blaqz//Ny5CTYfsxB5M3fPj/Hy
xZK8z7KZbsTCHxBbI7nLSx413Ufx/ujY7Bqr5KBB55D1lkX+JRfloZ7gWuaoN5Nj
CP2OtMKvBAXoS/axOel6OF6ypuwmQyJP6WMXOonN9FJ6xbkU58n6LgxVYbELGytC
YwRLmAZkV53xKCTmL8qO+2t2rwVTUxo8qzF7hcLWiugfPt5kdKob1bSOO+aflmnN
LkIWcShjok+vkz4mhQUO29nxHzKS8FuPAOvhVIcVxbcXmZ6QbYeeqSd4zLVq12VJ
W+KsqPMTDCDJOyDEPZ5UmJ+8BM7KnzeQxD2ozZVAvrrbGMxAGyyLA1xZuu66Hfq2
7LMPv6+M7nzDrYBRY4bxz4hJTSKXy8D1o6KSLmCHXGyjorvBbV4lieGnTCUZ2VPa
tzqlBBPxD9ol1NPnwFddBU/jpSCKAQiTwd/q5DMhlyw2JPQGvq/60A4fC6LWQXwx
A4pOWfHfRrD8f7mvHFPNgsjhyXXgxQGDgXOFR9MxJ59jlLW1ytsPBvhRvRC3m9vP
hCPhfmcebNX3LUJHE0a6wEi0lSwqmwKlUo8xUuW8mfdY0X+AvGs=
=vnmS
-----END PGP SIGNATURE-----

--52BEGUaTx0aSGpAm--

