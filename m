Return-Path: <linux-i2c+bounces-3717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ED68D540E
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 22:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E2F5286B9A
	for <lists+linux-i2c@lfdr.de>; Thu, 30 May 2024 20:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5C91802A3;
	Thu, 30 May 2024 20:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Cu8eZKLY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA7255880
	for <linux-i2c@vger.kernel.org>; Thu, 30 May 2024 20:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102485; cv=none; b=FyAbmERXADWUPQDQ1q2cLmtBDEj7Nik4xN4sv1oAbgZB4BZRSeqUXTieyhVi5zAgdQs6KYnUATouQbJq12a7fKdNRnRZg2Zek3KvXd74WTBo4ms2YItoClFb9TnHtRyIFjXXYK0UFq7hxvXY0wRPUg0tDSNbLtpHY6dinXN8+mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102485; c=relaxed/simple;
	bh=YdISeJc+gKsOYFLOufB1OgmETO2ak4MOS2dO2o0aICY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoCR4cAms/qENDmv3vwh8E68lRV42aWEFi8gbSTcaGPu9LPFK9QyOIgc/rqa8eMhNNyoTsjGENxAtkyoFRYryOFSkv0Now7cZy0/1vzsKlmzSi9yU1QhcHLUw55IxDOH5dSuEMdZ4ocNCdJEO+B50wbVejtDHO9JGNElOogl/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Cu8eZKLY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=YdIS
	eJc+gKsOYFLOufB1OgmETO2ak4MOS2dO2o0aICY=; b=Cu8eZKLYSvhCX8fZJAYF
	uGfCmabdZdiq9rIaacXLctq2zrqAjMQoTL5KctjQjU5E3lET5mF5o1RcQTWriv4j
	v0P3OR/3wsrSQWC1fTxi1LMHpGBzZvtXh9XedZJWxfU/fBnZ6NE/959KfDSixTrr
	KdDRFV/pNOvKTJyqK0D8AUzH2AJqHlBnncgCmFud3fznLoBOZGxeZRiYH30Hg1kG
	duutJp+GI8WGkx0sBzLAsVxfH0A+bHkZgFzsMYCMWRjb+N/EZirqskhvU++oeIDq
	VdczFM+UVdgbKmmyuXaliJWrqZp7Z+tP+E8lzDNLYywcAQYxhKLRsXMsDymbYH4Y
	wg==
Received: (qmail 968924 invoked from network); 30 May 2024 22:54:31 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 May 2024 22:54:31 +0200
X-UD-Smtp-Session: l3s3148p1@mHrXErIZEMlehhYR
Date: Thu, 30 May 2024 22:54:30 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.de>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: smbus: Log (LP)DDR5 type specific unimplemented
 message in `i2c_register_spd()`
Message-ID: <tdia472d4pow2osabef24y2ujkkquplfajxmmtk5pnxllsdxsz@wxzynz7llasr>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240530183444.9312-2-pmenzel@molgen.mpg.de>
 <66acde9a-b453-465d-8b44-2bfc2164cdbb@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67j7rj3pxgh57nby"
Content-Disposition: inline
In-Reply-To: <66acde9a-b453-465d-8b44-2bfc2164cdbb@t-8ch.de>


--67j7rj3pxgh57nby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> There is a SPD5118 driver coming up, which will handle DDR5 chips [0].
>=20
> [0] https://lore.kernel.org/lkml/20240529205204.81208-1-linux@roeck-us.ne=
t/

=3D=3D=3D Quote

Note: The driver introduced with this patch series does not currently
support accessing the SPD5118 EEPROM, or accessing SPD5118 compatible
chips in I3C mode.

=3D=3D=3D

Sadly, no cigar yet, we need the EEPROM support.


--67j7rj3pxgh57nby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZY54IACgkQFA3kzBSg
KbZTKA/+OOAaDbKtp9Khn/MLm4Izu3Jcz3vVp6MLknBl+2612bTmBim43tHd2FzB
814DJc5HIS/YF2gVbDaY/zmmL6yxSSwyAn0y8wzivO9zAD3n1rVHt+/xQsPkTbv/
WerChoDFA8YunAIziL/lzFdlK9fRTZZQEjSNe62/Uhyeltn8k8gzlMv4HhYiNg5Y
KHYBns+peHMtp6o5jaiBgDG06oFt1GcbUeK1vFnXMtRyaCB5J8oAKI6649Y98eF+
VEsjYDT7yqV0aP2z6SRqa9/t0HmcVmFDyZIeZVpx84X+X5hNBd2oveypzUnmO4ES
OzOyyZAyU+U53EaSiNSyxwwjLKmUlQlN6mnqynR1PMHccAfYCW7kYg/zk1j33iBM
KuagBPOPYTwYENu5foNVyhftFARfcV6z6HNrzVI8Xy+mUpRQ61IqKCTgP2ob72Sc
KUFJI5ghy60UCeWHs6MrZ3QB4fhtQygboStEPM5N5hHmHH5TKKLrpr99xxrThRv1
lQCZssXdy+KmudVDiUSxBzto+L43GJagQoGjJETLHtoZFwc6Ma9txE2h5/yQkjEL
SzPGMXsr/fpCmHwYVF9fCZf9GcEKslDXpKYMJdgNcrNG7vqb/t9qK1BPIYorh1f5
9g4mrNE9cqAXxr5/BJSkfGNSZCpbdOSC6ZeQo4R05k4YB64goDM=
=9anB
-----END PGP SIGNATURE-----

--67j7rj3pxgh57nby--

