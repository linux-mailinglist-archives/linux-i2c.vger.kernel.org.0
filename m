Return-Path: <linux-i2c+bounces-5977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 502519675A7
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 11:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89452B218EC
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Sep 2024 09:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81FE1419A9;
	Sun,  1 Sep 2024 09:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aDwOEJ+J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973EB219F6
	for <linux-i2c@vger.kernel.org>; Sun,  1 Sep 2024 09:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725181567; cv=none; b=pPtbDZLgv8RkcNDwU38+vejR0NW6+DCd2r6OpijeVLXafpXbLiz2/5IrBpR0299gu7ro4XQEjVia32v68sApYqy9ghHvQa7y9/DUF7AYZHgl4Gz4Uv/vItXf00C4sSK+6aEO/RUvWxmNtuV/sWecTeMMp72n7XFbEjSutW5UM+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725181567; c=relaxed/simple;
	bh=JbRj0S4cXJkTCuvLVUy+st0KE3v7mFsjwstlsAJ0DxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8JGt4uLw9ETkwT69Ioyk+nIn4kFuuOMQX9GEY4idTM7f1CRwyWa68z2WslDDWWAsh8I5vOyy0ztGcj+04Cumq3JvLnZXRNqeREAzG5EoQOe6xCMZy1qDajH0y7KzIyPiJs+wzkHDJm091BLawCS59wcRatjLfLZRLdbn18qznM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aDwOEJ+J; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0hRX
	rnbKF7M8PIk7KFSyn9LMF88mAbmDVThypvmr++k=; b=aDwOEJ+JynEF1tGADNLH
	fWC6n5Dvg021L8WdzXLkUJ8GzHNg97EEjipknyLGJ73Mu5wBBlT0KhKGVeDS5NCN
	X83EaPRz2nahvIKLl5EJg9/lkibDKKsoRztli8znxsEBJ4sTtJtx9FGw3UBgU0CU
	GrHN21CjSHmanEVHwSubOS8Y1Lxxur+Xs98CTdRnSH7fD+1/+81B5Y40T2vjiQlN
	BZBx12goC2EwLpyJsS4JvtANDc6Umpnxp5lyy2TrsLh6TMLYriIx4yPV8j+acy/6
	N4fyJOtdkyFvRmmdi5/2LvcPo1Eqh6G//97aIfbcLoZeM8hsuJBptCl24EShgk+G
	dQ==
Received: (qmail 3759561 invoked from network); 1 Sep 2024 11:06:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Sep 2024 11:06:00 +0200
X-UD-Smtp-Session: l3s3148p1@yQQWIgshBMtegkeE
Date: Sun, 1 Sep 2024 11:06:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: Remove I2C_COMPAT config symbol and related code
Message-ID: <ZtQueK8Y9x0FCWD1@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/loQt6fj1+N8j0uX"
Content-Disposition: inline
In-Reply-To: <80c4a898-5867-4162-ac85-bdf7c7c68746@gmail.com>


--/loQt6fj1+N8j0uX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Heiner,

On Wed, Aug 21, 2024 at 10:13:04PM +0200, Heiner Kallweit wrote:
> This code was added with 2bb5095affdb ("i2c: Provide compatibility links
> for i2c adapters"). Commit message stated: Provide compatibility links
> for [...] the time being. We will remove them after a long transition
> period.
> 15 years should have been a long enough transition period.

Well, in general, I totally agree.

It seems, however, that this slipped through the cracks. My Debian
kernelconfig has I2C_COMPAT still enabled, so I am reluctant to remove
it from one kernel release to the next.

I wonder if we need some printout that it is really going away for a few
kernel releases.

Opinions? Jean?

Happy hacking,

   Wolfram


--/loQt6fj1+N8j0uX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbULnQACgkQFA3kzBSg
KbbngQ/8CkSV9/ArMON8bwNo4mI1EW30UmJ1UrkfVrK08o6SCXtmWqZB5Hwcpdeb
WNxKCyYnU6/KP9z+oFGPq8HxevFxceeTdRQMxkWLlIn6nSQyArghVUD8rY7PcXHA
3B0bt2EhA8V5FE+g4VUtP1w+bcldhs0e1yvCuKgFw67LwEfdUQpOx/6YEoIOqcPH
8GgS5Uerk/d/jXN0/71oso9WqD+r18LS3+O8psRpSYeOkbFHLsfdOMyxzlodvpdU
MkBGlXnp1uNiQEC+K0ms2j7pUnPpFz6xViPwhpovgnLszMJi+oGAHI6bjNQgpTvE
JTGhspAaYnanmY78njRc/43WEMW1bqtst2Q6rhKIae4sMlky6lAYYodjX+lTruEu
u+GqLfT6WFvhkWI8OLwBuR7lYZI12O8nmMud5t7sv/Ziv1B8dvOjYpuSPsUAIrER
tUQACbEOLsN6Q1tptWpSQ5221cCQn2i6XxOV4HAtzHv++56x9ZI79lMekXiguH/N
6i2toZuh5AbwPPm9hTe/rMe1scSrShtpWVgrWUBTLqgjV7n9kpSakiPGPQRDay9j
VAv2BI3B/XevnqxryI5Bxzo9Q5Dwejc+k46bQgfGXdZbvoHajbOUVP0+r3nChS7D
gtwHQ2rwz5VUCt0QR1Sd8sjnq23GPcLoRijN5wMGhym61QJe/4A=
=36gi
-----END PGP SIGNATURE-----

--/loQt6fj1+N8j0uX--

