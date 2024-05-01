Return-Path: <linux-i2c+bounces-3357-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D57A08B8612
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 09:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EAB81F22D6C
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 07:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E6B4CE09;
	Wed,  1 May 2024 07:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="VRNh6w6T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D8C4AEF0
	for <linux-i2c@vger.kernel.org>; Wed,  1 May 2024 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714548472; cv=none; b=qtJ3RTZQgMmmCzCjcTkfR2pLDSlk8g286M3D1rY1QZHpaJTWCJymycabtgVueqDCudWGjGixAiTiY46+NHA4G3Rb3HC/eP6cgrE9rJKJzYZZPnQ9QtTyt1LIxPD87vYV/dNswCIWIk3HVIx3uIjI5bWBmi7NYj986mhv2UMOXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714548472; c=relaxed/simple;
	bh=CbmnI0ixFU/UnH5GwPrDfwF3OFJuaiKTaWu3NEzh3fo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9CKiXCvbXqV4H60Kuti4NOMSA0a72Fxd+IoaW81HKAFR7dJWSU6qkJ2Uxk/Mb/dcCNI3yBkoYPJd4N/94jm3pVkQRLM8fGSwDZ4fRqe9DeDbCZPO1oahP24I7c7oa2aB0uZHeIShBXPCOsq/AVq5W25kaIqk8AXi2XYFY/uk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=VRNh6w6T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=eFUG
	sqLXKowvxfkkojJ7LTLfmxYmD0KYjv2UmQgqrSk=; b=VRNh6w6THAl5uYgAhAyK
	UZSKHgt6zWevqTgJjmmXZGzsvkR1ugOSv+M34y7VcExy/iJs80Fp90neLuIeHLsG
	hvxflTjB2MqNR0JXepBkUkV2kS9b1juGQdVRirJf4gHcjy3V+/HGFLnAA2pGp/Xx
	IdE4TRl9jHFHQ9poLnuV24i0YqzuTiNOvamesiEsLmg0NNc096CvwP67VT1nkKMY
	lVAUo55ngz+pVlJoTb95kegggTgvehZ0+8yeGCw28ctHlfXU0qP9e9nJ/5gy5fUT
	w5kViDoK8wL7i4oZ2bM880PH3ajAtYDTrv+1MbUhu5k/QsO2FpJAGyZGskr+t22e
	KA==
Received: (qmail 2867333 invoked from network); 1 May 2024 09:27:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2024 09:27:44 +0200
X-UD-Smtp-Session: l3s3148p1@jI8rbF8XgOdehhrb
Date: Wed, 1 May 2024 09:27:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, ruirui.yang@linux.dev,
	Wolfram Sang <wsa@kernel.org>
Subject: Re: [Regression] dmesg warnings after "i2c: smbus: Support up to 8
 SPD EEPROMs"
Message-ID: <20240501072744.2xm4v3idjjsehwkq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, ruirui.yang@linux.dev,
	Wolfram Sang <wsa@kernel.org>
References: <53582ef1-6d05-4379-a445-5f879cd676b8@o2.pl>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5bhcmolquvvegtpf"
Content-Disposition: inline
In-Reply-To: <53582ef1-6d05-4379-a445-5f879cd676b8@o2.pl>


--5bhcmolquvvegtpf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Adding Heiner...

On Tue, Apr 30, 2024 at 09:39:03PM +0200, Mateusz Jo=C5=84czyk wrote:
> Hello,
>=20
> I have received a regression report on
> commit 13e3a512a29001c ("i2c: smbus: Support up to 8 SPD EEPROMs")
> as I was subscribed to some kernel Bugzilla thread and I'm posting it here
> to make you aware of it.
>=20
> This thread was
>=20
> Bug 213345 - i801_smbus: Timeout waiting for interrupt, driver can't acce=
ss SMBus=20
>=20
> ruirui.yang@linux.dev on 2024-04-19 08:22:57 UTC wrote:
> > I got similar issue on thinkpad X1 gen9 with latest 6.9.0-rc4+
> > Git bisect the first bad commit is "13e3a512a29001c  i2c: smbus: Suppor=
t up to 8 SPD EEPROMs
> > "
> >=20
> > modprobe without param:
> > [ 1290.401393] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> > [ 1290.401486] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> > [ 1290.403340] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403383] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403410] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403437] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403465] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403492] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403519] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1290.403546] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> >=20
> > with param=20
> > [ 1314.568785] i801_smbus 0000:00:1f.4: Interrupt disabled by user
> > [ 1314.568837] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> > [ 1314.568894] i801_smbus 0000:00:1f.4: SMBus using po*lling
> > [ 1314.570230] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570257] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570283] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570310] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570336] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570362] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570389] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
> > [ 1314.570415] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D213345
>=20
> The param mentioned was i2c-i801.disable_features=3D0x10, which disables =
interrupt usage
> of this driver.
>=20
> Please decide if this is serious enough to warrant a revert.
>=20
> Greetings,
> Mateusz
>=20
>=20

--5bhcmolquvvegtpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYx7uwACgkQFA3kzBSg
KbY56hAApyd18s1XTbNkvQKTxaD25o149Usj9rZ5GmAG8BpkmHq4pDny2dTrFO9z
SRnofnKId9t/uAkVQdWBK8RI4IuRKKk5ER3xJ/6DFECkWA6b1ZSYRzLsi8h7b2BR
EmgCAM2Tiq1VsHnD6PAU4WSb8TUuypr/psD4a0C5vVi8exqAIx/sFeK+ps94iM0k
qgJWNx8vF8xAmWLmjswHDkIyjeUKGi3MI6z8hc2NXoyR7B4vXisszVivMtlB7N0E
TWb+tBmGaQ0kswQK8UtTt/++GZQh3fSNky17Wh1xByBjfrFQOh48sJWViniwBE2m
gdeCmXjJPht+DHnL7HBjwUpExXgReU+Ej6f12T5ek103qEyH9pn38zNZqJW9PqzT
PhmndNX4LHYpVE/AhLZ+mWLteBF0MmK1ZI/QBFUtM0pZzsU1zx1Qm2UzM6df8DWI
83Qo9SlLEIhVJipzFPXT5JxvVf9j7XmT92uLR9Va47MK7iwzwkvFwKtZqCLvHQUZ
JJp0T946Zk2pNl3K7QjDyn/ZuQo6LEKYw/K0XE46xvHprmWcxDCYeFxcF6Lo2RSS
s8vsTwj3HZP1FLdA/WsCb9SxMHkNlIrMi/b3Nqg7nWjId1rxwwN6qlPWZUs+bTFi
LEtq5OK2b0wjOifZZKFIrM5OP6aEIxmgS2s1k4xmvFtb/qrI+gM=
=XhB/
-----END PGP SIGNATURE-----

--5bhcmolquvvegtpf--

