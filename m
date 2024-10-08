Return-Path: <linux-i2c+bounces-7264-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080F994378
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 11:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E8DE284FE2
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 09:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E4F1DE2C7;
	Tue,  8 Oct 2024 09:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H5nzea4C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714EF1D3198
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378032; cv=none; b=Bc4t/4TNPsQNbgkvT1h2GGv8Yg0XyGnPQrwZggQyb+M2ICUtjRSUvbBgp13T4fifmApfszgt6XXEEO7l4LgzXcNlwB/8HMWWVbApdjirU/hqWGNKAK0Xv+8irrC5k1t9nHX9Yj8BELErJ8EXsBx7C14ubPa4B5vbhfp1HSSf/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378032; c=relaxed/simple;
	bh=VG5a+TpVAg8vvC05yEGkxQb0o8eOFV+HrzKmqWA9eOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7X25Q/SsCEe3uddWE5uXCj2XhqYos9tA7eBuk5kthGSYkddTCBgiOZxGEkqtTi6aHxSSH6bWj08ONzNT0d3E4e70CPt18AsIYEQ650nR8uJuaFDFzdlD3Ti/A/ebjvk3Fhbd4xsmJHErUFtmDya9OpFOHuT8aSoy2Oi4706IaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H5nzea4C; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=NCRZ
	ecqXyxHEylQovgvw2eLTreeyWqoBPd1Pc4jhw5c=; b=H5nzea4Cp/uGL5/YaloZ
	+xY1ubFc6h7Zl1rqJnhXYeViFlZ5U3BJjuoVZi63bVdLtCCv1wm/CvMhvJECR1lU
	4tETw8nDRE0SUpFl6fGE/B9xiWS0LyStEIrzmSidLLEKv5F0kTHmFdkgQiUUXGdE
	zwrQAe3cnqhMEOkbbRT6h/Waexrh6ukmAd6Z12P2/nbjgIUzCSeDTd6QhQ4vqOKm
	JBpfFwMCnPenywG6tgXbWW/33+m59cQ66BTd2p3yEtaHNZM/LB6xFnwYbZUtCwOt
	ew6NdIlwmeQX9wbzRuPYEVOjyrAF4gdmzc5aO1RmT01fi8Gw28FSh1jnwtdP2ExD
	Ig==
Received: (qmail 410477 invoked from network); 8 Oct 2024 11:00:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 8 Oct 2024 11:00:26 +0200
X-UD-Smtp-Session: l3s3148p1@vvxEXvMju01tKPHJ
Date: Tue, 8 Oct 2024 11:00:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] i2c: Replace list-based mechanism for handling
 userspace-created clients
Message-ID: <ZwT0qbD9RWXGGolZ@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <22997d09-4406-4c0b-8ed6-74dacc160acb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FXRvkYPTCvevagqH"
Content-Disposition: inline
In-Reply-To: <22997d09-4406-4c0b-8ed6-74dacc160acb@gmail.com>


--FXRvkYPTCvevagqH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> -	/* Remove devices instantiated from sysfs */
> -	mutex_lock_nested(&adap->userspace_clients_lock,
> -			  i2c_adapter_depth(adap));
> -	list_for_each_entry_safe(client, next, &adap->userspace_clients,
> -				 detected) {
> -		dev_dbg(&adap->dev, "Removing %s at 0x%x\n", client->name,
> -			client->addr);
> -		list_del(&client->detected);
> -		i2c_unregister_device(client);
> -	}
> -	mutex_unlock(&adap->userspace_clients_lock);

Same question as previous patch: why no removal when adapter gets
deleted?


--FXRvkYPTCvevagqH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcE9KYACgkQFA3kzBSg
Kbaidw/9HsW0TdLOu7192bqMP4PFwKPouN76kQTV54kMlcpqQ4j5KQyhv9+ZX7fb
RERI6wi75HXe84q1EDyr1NWcqbD8uCpgiSlhgrc7z8yhmobzKACHZ5BIxuNzVYaS
C03OMeC7tvMZkVU5DoWEtmEXKOGvxmfPB7BEHL7M3jwXBEGXSbwtP8GAYzeb85jo
IL6Wtd+XFrMcTo/RFO1ECQOj7MSz7EMl7bhU/QDjWL78Gex87SfpL8GrGLFSBlgC
6XjwXaxwsk5QDZfOOGo8+lNTo+zurcRwmSw+gszQADkqVyRjwokbOk5XAXjIWeGZ
9sOnArRcjWv4jrunVvpiW0pNtjhTJjuBpSclAz6Mj/t6uxeUQxkj+h7ttsIfBVdr
q3/q9erVdbR3VwGcwXOPcYFo0xAhO8ysuT1EZo8kf6X32lN72JcD6yHKDzHnUXEz
Kr3LRUs+wCfMP0lCUwJsa8bPTBVQN1tc+3KYWCtBnldIrWVrF4pJ9DZW6RBhR/C6
aguGTTbrARcsmXj4PurVSrXUq6ZN3+3h8ayhMcERxw1kXjlwnta0m8HVK7Kjeu75
CLsN7NYpCZHwTbHb4EsmRB792h863ZN1rH9mJFm15OgFWWRpgCAZdAod9fs+nY60
S4yKTKYigt9aYDCACQb6BJvOTgebS6iy1QS0G3sZ9/21S/c44Gk=
=Yfo2
-----END PGP SIGNATURE-----

--FXRvkYPTCvevagqH--

