Return-Path: <linux-i2c+bounces-11843-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7876AF9B6C
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 22:01:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C148A54687A
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 20:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACA7233736;
	Fri,  4 Jul 2025 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hTjESYOR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1771E1C36
	for <linux-i2c@vger.kernel.org>; Fri,  4 Jul 2025 20:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751659250; cv=none; b=sPi4fBU7tOIYSACA65VUlGPFtYjeX30MX6iOolJhOGxcsiijq9olDwXhMx/83SapX1gJcITNJZ2XW5lKiE/FPfKtzPZI4C2cGtHqU2MGs4Gic2sBh6rEJL505MHiJk3LX8FBsuNzZIzrQ2u6rVjEhswIhv/32zhqNKpMsH5UiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751659250; c=relaxed/simple;
	bh=aeB4oXRcQ8OAUIyfIF7uQHmd/L4CEVP+RnGStMaB3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SQR3D5V47PMECiqha3gnm0RY9JrUXM1GERAN8OsvTRqhW15wccpRCpkdH6m/ca94zN83uSoKWWKoOLqfAlKSrwOvq9GyWhwtiXnjLrnlysFQXBnynDErX+viBmqIcsFaXzvWBxhscIBh3wJ8AX2AMzod0wlXBEynrkhsyjRTuCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hTjESYOR; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=p07v
	3z9Zd86AhBvzQSDg2PZ0BEIdAQ9soxmB8U1OvxM=; b=hTjESYORW3CClSzVaoMJ
	7ba5ISXy/Q3Qdmn5qy+3jnBk6PwLi5iNc6mnTg5Qe99AkLHzzTLDqLxli5cWmhZY
	r+JHJEWVSq/oJ2jTf+TaJb7Rf6yOo7D7KsVRHgYQVSfSCp9s3PWa3cO2pKXqomzB
	KtWVu4qcWIu4o7EB3hoa+dk0wfqBQIQ5p/Me236pZl1DOQUQdrKbzi2ihcmT6lHa
	WiIDjJnVQJ0Ba1F59d81uxmbOpW84gbO1qmQ+zIOPZbD+K9HqmiM12wsU34TZzYs
	PhH1zCBhtuGVPVZ8WXP1FNU60gLlbU57JtZCU+Bc4sDcpVa/ypUjI/WfLhtR8LTU
	rg==
Received: (qmail 255534 invoked from network); 4 Jul 2025 22:00:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Jul 2025 22:00:38 +0200
X-UD-Smtp-Session: l3s3148p1@sOOn8h85+okujnsj
Date: Fri, 4 Jul 2025 22:00:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Claudiu <claudiu.beznea@tuxon.dev>, linux@armlinux.org.uk,
	gregkh@linuxfoundation.org, david.m.ertman@intel.com,
	ira.weiny@intel.com, leon@kernel.org, dakr@kernel.org,
	len.brown@intel.com, pavel@kernel.org, andersson@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	mathieu.poirier@linaro.org, vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	broonie@kernel.org, robh@kernel.org, jirislaby@kernel.org,
	saravanak@google.com, jic23@kernel.org, dmitry.torokhov@gmail.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	bhelgaas@google.com, geert@linux-m68k.org,
	linux-iio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	fabrizio.castro.jz@renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 0/3] PM: domains: Detach on device_unbind_cleanup()
Message-ID: <aGgy5cLWiGcYaEYp@shikoro>
References: <20250703112708.1621607-1-claudiu.beznea.uj@bp.renesas.com>
 <CAPDyKFoznqfdX7Dvu3VPa5Me10VHGphnRRHrU17w-fie7HrQ5g@mail.gmail.com>
 <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fH5YvR5XnWRLoSCZ"
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gH9ZAK9br58KB0VEtG+4VdwO7vEKtrKbpcYOKnZPf7bg@mail.gmail.com>


--fH5YvR5XnWRLoSCZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The series looks good to me, please add:
> > Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> >
> > Rafael, do you intend to pick this via your tree?
>=20
> I do in general, but I haven't looked at this version yet.  I'll get
> to it early next week.

For the I2C part:

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--fH5YvR5XnWRLoSCZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmhoMuEACgkQFA3kzBSg
KbaGFBAAm10gs13N1AdPHST1j6hXR+tNypeS5BKbZ+zmyASGICTNP4lWWXPPeQSe
DTyN4qJTJbTF4AgWp7EMST8L7TsxVTgx1Od6gb85sgGujMuKQ+veduuh7jLPl8Mm
bwaP6BdkuodLNT9jNSGxG+2R2Z9jbKKL450e7VO8AXSiF3/H2CsGY9Awatdc0Msw
i6cfmK0BXy7gyumKnAjISaGGIQxALwdbwAH0QeclCsHCtnjxB8u83FAMx/R22WDT
Mn60COq6xMPYmZNCeCy2BxxoBo2skLpLw7ksgBp+cSsJBNIRq+G4iiux1RtTPKqT
Db3aGgAdWyYy0Fxbd8avkZzQ2+Khtp18vKvSQYCxSCPxeZz/xyatLwYUUFO/kfzX
5iUk0hrrQ4VRUfTAewY0/7NDtwp042Lfo2pWclyXW43UqNl93xwSXfYCQg7aKA9s
B2iL0H8OAJIWTQhw9b7M4fXCgUaGlXrSzD8Ro8iuEKe6zyDWHBF1PufExTYq7w62
GUgYeaLYg4Cg58h23Ar0iLvjvZ6eEcieHHd5VNFH4l3mDVrrjZnVI65YBjIsveXf
7EBpNBKXISI6B94Rzcaz/dUin3ghl0tPkix/xFbweInSRxgajfnGiKk4RZ+3UtaL
WO7fI/30J3na+ki82GylH26E4ftVwez5QXv103slsdXZRwY/DdA=
=f5Md
-----END PGP SIGNATURE-----

--fH5YvR5XnWRLoSCZ--

