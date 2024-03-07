Return-Path: <linux-i2c+bounces-2244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3966874975
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 09:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592B21F2125E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Mar 2024 08:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384C63137;
	Thu,  7 Mar 2024 08:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="F3l77BMV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC376306D
	for <linux-i2c@vger.kernel.org>; Thu,  7 Mar 2024 08:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709799701; cv=none; b=DOagkMzimyYShQbCyvxSRQjzhcuH6yNT5mNQb6JRC37rZT8SJGpFrjHB3C1XE/I+H0H1MPLhvzKufKQQ87AZHyhVAyeIuqDk73eAE5OdqmBt+ii5QXR5C4K9wUCadYB75LfNb4jgJxzjCVroMQKYhb5nI4WJiVEN2nVGLP5An7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709799701; c=relaxed/simple;
	bh=cGrQCcSMkymYB5IZHpWOTvUUbwNUQssV/LLj9ZrMhWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI7GOIkyzuiK8XhkbFAvW7JfSRkcRSKA6lyn5GRDDJnJNd27OELLFINpNd+o+04iGaj2s17LEeHlbSuwpbXtDKQcgg4j10nUmp1DKjwbYMNPH9tbeGDLhQOkAIvnqgNE9WgM6w4S1sL+6L3VUFTnt53pe59yXa+4iCick7iivcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=F3l77BMV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cGrQ
	CcSMkymYB5IZHpWOTvUUbwNUQssV/LLj9ZrMhWY=; b=F3l77BMVaU6W2W2/uBza
	ULPf86P5AdnKm6XSAsTGzlarD7XBpxYMIyMj05Y4lU+qcn17VsAYyDtrBdmzaAC9
	uxzEmCfcqzyAyJKrn7rsBaPbDb7QuY5OLtsFQmuT2ikcJbYzCY+NtrFvMIouWuAT
	xGF2lGjhXcotsKRsgbXONML0J8cuMf6+2lvj2OuOpQtYFwQs9yMKi1UWhrxrpM8g
	yczcZUVq4CZiTajK69pCq0fJTqqZxs9joUYLJNs/1AJ8J/dkTC/ZI6al5q5azPWB
	D7FsejeqbYI9BgT0C/4cKXxmcF56TqncPAXq9NP8tkkfj/IKsVBtoDI+uS//ZC45
	Ig==
Received: (qmail 280653 invoked from network); 7 Mar 2024 09:21:30 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Mar 2024 09:21:30 +0100
X-UD-Smtp-Session: l3s3148p1@OAYqww0TjM0gAwDPXwugANQqZcJxr0oT
Date: Thu, 7 Mar 2024 09:21:29 +0100
From: "wsa-dev@sang-engineering.com" <wsa-dev@sang-engineering.com>
To: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
Cc: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>, "arnd@arndb.de" <arnd@arndb.de>,
	linux-i2c@vger.kernel.org
Subject: Re: [linux-next:master 11602/11963] ERROR: modpost:
 "acpi_device_notify_remove" [drivers/i2c/i2c-core.ko] undefined!
Message-ID: <Zel5CYKpg82mErNQ@shikoro>
Mail-Followup-To: "wsa-dev@sang-engineering.com" <wsa-dev@sang-engineering.com>,
	Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
	"mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"naresh.kamboju@linaro.org" <naresh.kamboju@linaro.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"lkp@intel.com" <lkp@intel.com>, "arnd@arndb.de" <arnd@arndb.de>,
	linux-i2c@vger.kernel.org
References: <202403052102.hlG8I44z-lkp@intel.com>
 <6da20a8cf84d358841068e7eff3323b6d61e014b.camel@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvx6EuOu55DTdTQp"
Content-Disposition: inline
In-Reply-To: <6da20a8cf84d358841068e7eff3323b6d61e014b.camel@alliedtelesis.co.nz>


--kvx6EuOu55DTdTQp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> My recent change introduced a build failure when building as a module.

I will revert this change to remove problems in linux-next. It does not
make sense to push a fix together with an incremental fix that late in
the cycle anyhow. Please resend the updated patch as a whole. I'll try
to get it into 6.8.


--kvx6EuOu55DTdTQp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXpeQYACgkQFA3kzBSg
KbZQ6A//f/YZHPQeFcSnwDqCMZ60p4rgYtyPSod5ClfwVmteGVKyajFEB/SobRXK
E/qU4V0j4UGmYsrqJxM8B9DJVJFXMorYGPDN+B7h8x4YFLCzYGBj7L0tRZGF7589
9ZUnS7qk6PK8XKZMQev/FBJahLzycXqf5jkEkza3Xjbwm9M4ZvbXE6NiiuWMV7xa
AxE6yV2iDkgurSL9b5wtJIOR50yLh9moDaHWExYGRshtLMZcLDDAuHHO3bKgEu2W
w85vNEymbDMiEpChZjgDjUhxGtm5b1212Gi6/DHDr9FIDq4hU7Eww16yxdDXwXoS
n4kocAq9lmgPaASmHS9TWPUbMvjJrM6bUh+ZAYKVuH1agWz5DIWX/k+OgAEr8MlM
zpFI0t2QyWEM+RqDWSqlA09xFWvwaQ0L57c6EmnYIK2NXnv4s7MX97JEzcyoah0F
+n9/gTgkvjK4psO9gZwc9amnM1RCtcOzr5IkWye0HMDVei+m/GTRDxsbdtghDBBw
TTWjB7QxXlVLhHHfTIJvjSXS2G4cQ66T9x4+Pn/TGK8Y1om574ZThqFKRwoAWVkz
jFeqlXWiYdsh00k4aRk4bqZ+l1+M8PvjG5WR8xsAQEEByVcDaa1YRVy9v0co/bhp
/kklX2OBJg/T6nD1mC/NvkzxL+1JR92KgY5lDR68pci8wzBZj9U=
=O/cA
-----END PGP SIGNATURE-----

--kvx6EuOu55DTdTQp--

