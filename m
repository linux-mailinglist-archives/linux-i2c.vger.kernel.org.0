Return-Path: <linux-i2c+bounces-11801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 63412AF6CF1
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 10:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7AB97AC55B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19CEE2D0C72;
	Thu,  3 Jul 2025 08:31:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA442DE6E8
	for <linux-i2c@vger.kernel.org>; Thu,  3 Jul 2025 08:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531500; cv=none; b=gAD8CsMAtx7G1e61BsONg2bYkjEsb04oEIDQgQnJ72j4BMj1xvp+FpSx/+giuSGJ1drYais2+II1zGKVO/KmX4riWJRGgyB0HSRs4Ym6peh90AjNqNh/WWqRIq9MHcO9JNRW+lT0jCVYMo60/C6eh6+cMlkWOgqYxBnSANSRh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531500; c=relaxed/simple;
	bh=/7pQrBULX82eRAQiAoBVqcEsotF1YuJcYS3E+/6Oc5s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mIDtL1v7mayQCB8AWrfIW+WPGDbCh9BMxOcy4OYv17aN8uwgq5868mdnuBDrpcOGc3tF1QSI6d3QdoPhUJ5nAHybLuzXdOs/0CvXaeliFZwfOaJenVf3l53MWoNkcY7VGf2W77oX58yPMIcrt6iFDN04iWBZ1OoYZdBx+0zgiG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXFLq-0004el-KC; Thu, 03 Jul 2025 10:31:26 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXFLp-006ZQf-2V;
	Thu, 03 Jul 2025 10:31:25 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXFLp-0002j4-2E;
	Thu, 03 Jul 2025 10:31:25 +0200
Message-ID: <14af238d2106544147dfb1c7824787d6d54f1885.camel@pengutronix.de>
Subject: Re: [PATCH v5 1/3] i2c: tegra: Fix reset error handling with ACPI
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Akhil R <akhilrajeev@nvidia.com>, andriy.shevchenko@linux.intel.com
Cc: andi.shyti@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
 digetx@gmail.com, jonathanh@nvidia.com, krzk+dt@kernel.org,
 ldewangan@nvidia.com,  linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-tegra@vger.kernel.org,
 robh@kernel.org, thierry.reding@gmail.com
Date: Thu, 03 Jul 2025 10:31:25 +0200
In-Reply-To: <20250702171036.1892-1-akhilrajeev@nvidia.com>
References: <aGVMr87HLrYGEw98@smile.fi.intel.com>
	 <20250702171036.1892-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Akhil,

On Mi, 2025-07-02 at 22:40 +0530, Akhil R wrote:
> On Wed, 2 Jul 2025 18:13:51 +0300, Andy Shevchenko wrote:
> > > > +static int tegra_i2c_reset(struct tegra_i2c_dev *i2c_dev)
> > > > +{
> > > > +	acpi_handle handle =3D ACPI_HANDLE(i2c_dev->dev);
> > > > +	int err;
> > > > +
> > > > +	if (handle) {
> > > > +		err =3D acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > > > +		if (ACPI_FAILURE(err))
> > > > +			return -EIO;
> > > > +
> > > > +		return 0;
> > > > +	}
> > > > +
> > > > +	return reset_control_reset(i2c_dev->rst);
> > >=20
> > > It's better to be written other way around:
> > >=20
> > > 	acpi_handle handle;
> > > 	int err;
> > >=20
> > > 	handle =3D ACPI_HANDLE(i2c_dev->dev);
> > > 	if (!handle)
> > > 		return reset_control_reset(i2c_dev->rst);
> > >=20
> > > 	err =3D acpi_evaluate_object(handle, "_RST", NULL, NULL);
> > > 	if (ACPI_FAILURE(err))
> > > 		return -EIO;
> > >=20
> > > 	return 0;
> > >=20
> > > > +}
> > >=20
> > > Other than that, LGTM,
> > >=20
> > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >=20
> > Actually I have to withdraw the tag. The above function is repetition o=
f
> > the device_reset() / device_reset_optional(). Please use that instead.
>=20
> I did check that. But device_reset_optional() returns '0' if reset is
> not available or when the reset succeeds. Then there is no option to
> conditionally trigger the internal reset when the reset is not available.
>=20
> Other option was to do the internal reset unconditionally. But then the
> devices that do not have an internal reset will have to skip the reset
> silently if the reset property is absent in the device tree (or _RST
> method is absent in the ACPI table).
>=20
> Though device_reset() returns error when reset is absent, it looks to
> be not so straight-forward to detect from the return value that if there
> is an actual error during reset or if the reset is absent.

device_reset() should return -ENOENT if the reset is absent (as opposed
to present but somehow broken). If there is any code path where this
isn't the case, we should probably fix this.

In the ACPI case, -ENOENT is returned by __device_reset() if the "_RST"
method is not found.

In the OF case, -ENOENT is returned by __of_reset_control_get() if the
requested id can't be found in a "reset-names" property, or if
of_parse_phandle_with_args() returns -ENOENT for the "resets" (or
"reset-gpios") property - that is, when this property doesn't exist or
the entry indicated by the reset id is empty.


regards
Philipp

