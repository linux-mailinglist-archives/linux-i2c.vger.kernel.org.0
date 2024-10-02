Return-Path: <linux-i2c+bounces-7192-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A2E98DEE2
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 17:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CA03B25008
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 15:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91D241D1E7B;
	Wed,  2 Oct 2024 15:16:50 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE21D1E6F
	for <linux-i2c@vger.kernel.org>; Wed,  2 Oct 2024 15:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727882210; cv=none; b=QWb4REGAKwpi4LyBleI0lef708c3iU5hGwDsKf6wwkRZVk4hu7EZOL3j/K3KovyKRhJfakcflYfmHsW+4iRPRIEQrp5PwVGVIUkEbNOYzt0MZCAEdHqIYwx2KksyMi6HWiT01bz9xTxevJegc6Kesufr6b7HNoepG/ToGeKevZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727882210; c=relaxed/simple;
	bh=fGmtkd7g9s5SXG6Kr4XyB7uVRwVrdHYh0rFoeCfO7Ps=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dK8Wh6cGWbY03WPuwVqw0yFY/RKCdeoicJOkSVUM979yqZM2gbiGbouGyL2IjpfErz2udnux7CyTfGRidmyAfgPHMmsEvDk0xVmP262h8N9yQpn1HU2D2f8VeMRfdwFxpBLVLnnPeo8FifjfTCBmcMjRSK43tMMORfcrdY98Ftk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1sw15g-0007TV-Dr; Wed, 02 Oct 2024 17:16:36 +0200
Message-ID: <bcdd6cae28edd9dd05a71118f9979e7460688775.camel@pengutronix.de>
Subject: Re: [PATCH v4 1/4] i2c: imx: only poll for bus busy in multi master
 mode
From: Lucas Stach <l.stach@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 Frank.Li@nxp.com,  imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 linux-i2c@vger.kernel.org,  francesco.dolcini@toradex.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 02 Oct 2024 17:16:35 +0200
In-Reply-To: <Zv1fEAFKlzNpmHnD@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
	 <20241002112020.23913-2-eichest@gmail.com>
	 <6378933c8d30bec2c3084e41c83b9d129d0d40d1.camel@pengutronix.de>
	 <Zv1fEAFKlzNpmHnD@eichest-laptop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Am Mittwoch, dem 02.10.2024 um 16:56 +0200 schrieb Stefan Eichenberger:
> On Wed, Oct 02, 2024 at 04:40:32PM +0200, Lucas Stach wrote:
> > Am Mittwoch, dem 02.10.2024 um 13:19 +0200 schrieb Stefan Eichenberger:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > >=20
> > > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > > Generation of Start" it is only necessary to poll for bus busy and
> > > arbitration lost in multi master mode. This helps to avoid rescheduli=
ng
> > > while the i2c bus is busy and avoids SMBus devices to timeout.
> > >=20
> > This is a backward incompatible change, as far as I can see. Until now
> > the driver would properly handle a multi-mastered bus, without any
> > specific configuration. Now it requires the new multi-master DT
> > property to be set, which isn't even documented in the binding to be
> > understood by this driver.
> >=20
> > Are you sure that every single instance of a i.MX i2c bus is only
> > single mastered?
> >=20
> > If this is a worthwhile performance improvement I guess you need to
> > flip the logic around by adding a new single-master DT property (or
> > something along those lines), which should go through proper DT binding
> > review. You can then use this property for boards/busses to opt into
> > skipping the arbitration lost check.
>=20
> According to the discussion here the property documentation should not
> be added:
> https://lore.kernel.org/linux-i2c/2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2=
y4ig4iintkt@35btqkdv7sy3/
>=20
Ah, I wasn't aware of that.

> However, the point regarding single-master and multi-master is correct.
> We also discussed this internally and assumed the single-master use case
> is more likely to be the default and that this patch series would fix
> issues for other devices out there.
>=20
I agree that the vast majority of busses is single master only and I
can see why you did it this way.

However, I still think it's a risky change, as some boards/DTs may rely
on the fact that the driver implicitly handled multi-master until now
and we can't retroactively change DTs in the wild.

I just looked up the dtschema for i2c-controller and there is a
"single-master" property defined already. I think it would be good if
you used this instead to have boards opt in to this optimization.

Regards,
Lucas

>  However, your point is valid and if
> preferred I can change it to single-master with the next version.
>=20
> Francesco Dolcini <francesco.dolcini@toradex.com> I think you once had a
> discussion regarding multi master mode for i2c on i.MX devices? Maybe
> you can remember the details?
>=20
> Regards,
> Stefan


