Return-Path: <linux-i2c+bounces-2914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E51D8A2C56
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 12:30:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C32BC1F22726
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 10:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8E62942D;
	Fri, 12 Apr 2024 10:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k8MQU6Vs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1103398E
	for <linux-i2c@vger.kernel.org>; Fri, 12 Apr 2024 10:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712917817; cv=none; b=O7UsUiZm3Eta9IrDSAwE9LvhCA4hmt0DlZwxua0iPsyB5XK+Ubv3efLBS7IzYqu75A5o2aI37voig/D60UfCjDUw7qn5ncrTPZ0erOHnhLi61uWonOzto99sKwW7svYJTQE/Y635yspyuXq0cALR/Y0hXp9yhGDiw2Psfb1/hD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712917817; c=relaxed/simple;
	bh=vBCxrjMMlMzvbLRNyFOQME6wBCAYeZK8dQ9PyDZFpgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQzurECvoLKIc0lVsU/S1Us6A/ibUEb7/DB1cuVo9PqosVqQlvNzG90Qlm20qLm/c6HebChT5PZYDHkYonFXqlWNy99RznnsLN8jDMNbrMUBbF8yuR4VpmVMpQKoTx8sqSYu+8WuxL11F0maj0p2KXgdbstbA9fHC8EM262kEdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k8MQU6Vs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=a3fv
	OzINAlgg+u5thxa11SBesqB47F0YHvYMZB1SITU=; b=k8MQU6VsBq8mo02dMVKb
	xkZ+Vlq0gqT2fNqCYPxxDxVvRE8ubf083FE4Z170G3WJEDeaADG/nwXzZ50yFDs3
	rKDvnLxhJUVSVgErZq17pI/7Xix+30M6GzTZ5dU/kwNSYPuctAxfcTcmm6TO5FWA
	07MY3IW1CPHoD1opHgCwVHvnDhmZC2lf3+EN2931japKn00xc1xmnAtfjg3GbPif
	x5AugfFGDorEmjqNJkvwN+tJT1mxeW1/JnhIXp2mg9yoWr64gvW65kOau+TwietV
	FYtTxtKijwLBOZn+PM877h2NoxFQED4rkuLlg7wntFovVJni81aO2IBqfBBxA1sj
	RQ==
Received: (qmail 1184457 invoked from network); 12 Apr 2024 12:30:07 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Apr 2024 12:30:07 +0200
X-UD-Smtp-Session: l3s3148p1@S45iweMVRp8tnPBj
Date: Fri, 12 Apr 2024 12:30:06 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: i801: Annotate apanel_addr as __ro_after_init
Message-ID: <egljtjmzcn25yqu4mkqahi2vcav6pd5vietiextxtocsjntcie@siyyjnjy43lc>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Andi Shyti <andi.shyti@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zfa5gh5enzj5buvn"
Content-Disposition: inline
In-Reply-To: <41efcfe2-7e05-4a11-bd02-40d9e525c415@gmail.com>


--zfa5gh5enzj5buvn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

>  #if defined CONFIG_X86 && defined CONFIG_DMI

Shouldn't that be on top of "[PATCH v2] i2c: i801: Fix missing Kconfig
dependency" which Andi already merged?


--zfa5gh5enzj5buvn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYZDSkACgkQFA3kzBSg
KbZ/CA/8DhI5hbhYKEL6ojQS2aclMts55IOS2mJOldQZaZg8ZuSocy1mjX3FLMyX
jWX4tZ0FX4oUm3LmilLymB4Kg3j+FZzgxehXHRuuUm3iIR2FIS+/NWvjORC50Ir7
HDsg9XhmczW4V2fH1k3j+Sv9pPt5zY8N8HhVv3QoGPsyfansoouIhl2nrQ9TE7k4
8/BeuCSE8opnYbTHIFK7B1lzmSsktY347SGg5/xN59v9dHEr21nXw9d1PmPQ5uZ+
pjMQE6gHn/FKLiILHSXDelBBFfnt7VyHH5vRbpdF0dhMQiV8OhWj2dFSw+aHUQI2
IGQ0c6bOnL74sodxt2Y3vCXoZf7+lhcV0HMa9VV6+t5qNJZC8dGZ9kaLCAXK5Xhw
RkGzhd5thEZ/YQ0X/AxFONVlwbxvQ5qpiDX05tAjINXovMpyTVpM6I8N3ShqNnnW
IA+AeWow26eXN/O3or0Coe97CUxy3F2FM0sXq7Epo++d6JfyM0Ql+k2CoGDCsysa
OLoGL8FfyjxilqGYX/VGfYuUzCx3qdJcpWsN1cfUAPQcWtG5hR373PnEYgKlZJH7
Yb47YeS/cxDyqUSOWArab8rONekEe0vvMwO+zNeaDpJbdCrTyMIZaSAomq4ln6Ce
g2a0o2VZlJI09DAZpjjfPbfFDxwQ3SnMjfe7OdM4RGDi9PLVFRc=
=b/yX
-----END PGP SIGNATURE-----

--zfa5gh5enzj5buvn--

