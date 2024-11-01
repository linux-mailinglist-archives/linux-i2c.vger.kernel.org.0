Return-Path: <linux-i2c+bounces-7733-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48A9B99B9
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 21:57:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C2EC1C2282B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 20:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088141E25FB;
	Fri,  1 Nov 2024 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="V55gFlo0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E341E1C32
	for <linux-i2c@vger.kernel.org>; Fri,  1 Nov 2024 20:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730494634; cv=none; b=H4bgBRTEuWG637AnJ8vR6swLNCLhFGkRa3wE2FJ7vyTQjG9UGFpBJRXuQaibpafqj2GijubJdXtQx7cb7X4qAwnIDYjZumxN6t64AT17IqSd81GV88b3JA58PXUb2Mt5Om/x3Xt30dTf+VgZFcQwyafS8FcGnETrJUHBYEvE2IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730494634; c=relaxed/simple;
	bh=xtr6i5HBJ/s+ZrkJxCoctoMtBhNAQ+GNz5Bj0JbRpWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amo16OEP9wLElWylnb6qlDXMSy+YjedmG0X2vx9PCeJllIEqDD205ypmueix3PcTSeNJLiquNc4tun9IAkrGkK3q7/1mU+oF05F2CE0yclKgO14mPc6IESf9R9so/OuDZ2s0qLj5aQnYvA1/HOrPzKgtAb/8T+cjKB9eaJpMKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=V55gFlo0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HiZI
	oyHN/qH25cZlFuTCHbjhR1z5RgZ+bPsLl95Mqm8=; b=V55gFlo08xOjbC3yob+L
	AvVt4A+2oGYofMvmeZnwzX/5YBHgkpAboy+RL+rhFTOscNs5QSvmA9/yKhGja6bB
	PYU3HBFczlC60zpVY0BOH2+1f8Rytv7GAdBZH/JHQ117xrqwpf8pSwxNkuYRRQ/z
	Iuh2VuZLEyTJwB2KzQpiv5OKr2dX0qgGjFBBUZM+Hec3S9PYpQpdo4uTC/03n+jJ
	Ls5jxO0yLvXtiAX+bu02qeDoWcVoMUaxSNlMzxXLkQWsjef8wiOm0c8W+CGSPf6k
	r90ga+cpdilzNRdmLpamIBmpK30YYHlcomhogyv7Ci+H9RM8ecjmWqJ/TzN6myPJ
	jA==
Received: (qmail 3849639 invoked from network); 1 Nov 2024 21:57:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Nov 2024 21:57:08 +0100
X-UD-Smtp-Session: l3s3148p1@J9+TLeAl4N9tzMgm
Date: Fri, 1 Nov 2024 22:57:07 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <ZyVAo8eT-FjsI1gF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <d52c2722-5f2e-4224-a8b3-7c9d0cb431d0@gmail.com>
 <ZySE7OqlvRRvtyLc@shikoro>
 <228c7822-92bf-4939-abda-a2a21c74c18e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ox1TBlMr5gZo7dmQ"
Content-Disposition: inline
In-Reply-To: <228c7822-92bf-4939-abda-a2a21c74c18e@gmail.com>


--ox1TBlMr5gZo7dmQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I think this is right. However we may have the same issue already,
> w/o my patches. In i2c_del_adapter() the following isn't protected:
> device_for_each_child(&adap->dev, NULL, __unregister_client);

The drivers have been removed already at that time. By a block of code
which got removed in your patch:

1761         mutex_lock(&core_lock);
1762         bus_for_each_drv(&i2c_bus_type, NULL, adap,
1763                                __process_removed_adapter);
1764         mutex_unlock(&core_lock);


--ox1TBlMr5gZo7dmQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmclQJ0ACgkQFA3kzBSg
KbZ73A/9Hg24jZ9opxvPd+17tzAU66hO6bSWgvOeo/52ogIEL7MsR99yJoskHy+7
6PGqkPotGddR2yk+9QFKq2YJ5mfv7hln93bcLTMcBTBClU8sVnM2yBrh7XGYOlj0
Kg8G/hWThpoc+gxrQctdFs2m3utSIgesUgUPCxD7i6Jx2jSuTPHRZdT5qEd0k9v8
aZ0v26aBX/SNlv3P5vHRoQWq5j/BzMQFs0+SWsCE18kIB15bK8KME++depWf1m9Y
6g4F2GDrR/BY6KY/2eaTwwAWl2/DBMB4+S5WNtI9eLiGnmCz2mQstZ7v30FVge+9
sY34YYh4AWj8tvxK8Ugy+oS4oh1KmGiQfMR5vak+lq+dvKou6DNo+YeupA3P5keL
FId7kVwmMeP7rp3ICwtq21klhX1Sxney0LoXEUy4ykbtjq37s59zjjCODI6Vy72A
0ZWlXj9NFNb6cE1rgCMkXdTIlpZbYd3rt+vM2/zKuyTiIqdqt8KJQ49MS40g2sJ+
cWfmHMwswfsnqmhy1lG8zBRU6AVIivp4oJsD+Pn+zk/qUv+g8rUq9mUa/VtrXIaB
gqOkjHGNBcoVdyE3ImjWbfyGia+366nWjj4FvWt+NE3ZFpgkPIfdZ9IRlUPb+Wcz
zXCFod5iIUAH3CzaYngWRuevjeVSb8BH6zAGp0r7Kk5WP3zehk0=
=1JUu
-----END PGP SIGNATURE-----

--ox1TBlMr5gZo7dmQ--

