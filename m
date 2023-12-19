Return-Path: <linux-i2c+bounces-865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA97281874E
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 13:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EA2E1F24A0C
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 12:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1F01862A;
	Tue, 19 Dec 2023 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzdXXPSs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B196C18641
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 12:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90502C433C8;
	Tue, 19 Dec 2023 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702988514;
	bh=uWwoGx6BSf0sx3lwgE1mNoor+NzDx9o7uDvaSK1T8bI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GzdXXPSsK0hiixAhqNs+7imikO+MVIDZaFFHk3ZvBhMTdDvYNgNsgjMjZxRpz/CPC
	 8hF4EvwD59QKRDBfakhFzDxZjE9K2fSAQ4UHAFv9vUZEQsokGnNtruc2mBtjjd+AqP
	 UZDPNTf6I3dDsv3JUgbnCazUQ+t19CW0rLIrtLr4JpFcLkAHkS65h/Dbz9MXq8Xbnx
	 KZ2rhg6Lec10aG6bRShM09AOBrlWrtSbkyKQHlQPcj5rTJG4G1CyfJMNkDsxjZ+KPc
	 Hnr5LNc4OIrdJEGA1Grk3oQ9ez1DgPkg0JQNMwTJa8lFQ7t9IMGbJ+2TY+U6AJEVxi
	 3oCyghSAQrKJg==
Date: Tue, 19 Dec 2023 13:21:50 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/pm: Remove I2C_CLASS_SPD support
Message-ID: <ZYGK3s0ciA3I1Vnd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
	"open list:AMD KFD" <dri-devel@lists.freedesktop.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eKnS0Rr6oV1VXCD6"
Content-Disposition: inline
In-Reply-To: <839c0546-9bad-4b5a-9216-d5e3bab32370@gmail.com>


--eKnS0Rr6oV1VXCD6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 12:37:15PM +0100, Heiner Kallweit wrote:
> I2C_CLASS_SPD was used to expose the EEPROM content to user space,
> via the legacy eeprom driver. Now that this driver has been removed,
> we can remove I2C_CLASS_SPD support. at24 driver with explicit
> instantiation should be used instead.
>=20
> If in doubt this patch could be applied via the i2c tree.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--eKnS0Rr6oV1VXCD6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBit4ACgkQFA3kzBSg
Kba03xAAirEpADqK4nRslNqocGuQh0p92d4JR85d/0ZNNz9mmwluGCKn9YClAb1X
BI//Xi9OGWsH8WUPF54/jCnGKJZjTAl8oxEvGcTiLAw03PJrLi8Qz2945avrkn51
ipLZX9R3U4CT8jSRqwfWc5/FCOCwfnSIQ3uvNz1i+yiSl2b5ABL2/AIQxAMNSiSV
dEhzkPSrdS/N2gYNt0DMsSjIuzgg54BqbNyW/dft2Bg0WFy1sg4Vr1aBx+Rf46Hm
iaqMyHjVPegQ3PIVtNpt18mVId8q0HB+XR/0xI/JFXTBJT5z17SWZH8dufjbt8wf
Hf1A3+/WAIF24/JEL6jkdDXfTv/sOr2YDotEpSa6D+vQVT7n7oV8xnfeh/oKt4Ou
Kx3Ax5Igh7Bo8c0G0S15NVSx+z6YcM/Y4PbRShQ0MkhMZlHPodjnGwmixxDMOslX
uykOQuVyyYM18DCQeRpZMLxNZBY0k50Ue53b3/oBXYaKuuYKRKt9Sb9e2oZKXehz
zdp1bTtYWPzLq3Ar/QBn59k/7MejsGRWS4x41EVGswIg5UG1EgNb6B/GsLCUJjLH
+PTgE9J6WmdmqByc1iHiuJsLv0LeRoGo4uE/vEgxnl+3KhkNj215VVOutiF+Xi/U
F168k8/sWnxZC1z8Z8PJ4pQmBUEMAq3h8rKqdR8EE5XZdg2BSZ0=
=ufJA
-----END PGP SIGNATURE-----

--eKnS0Rr6oV1VXCD6--

