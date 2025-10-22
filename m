Return-Path: <linux-i2c+bounces-13729-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA17BFDBE5
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 19:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43D441A61919
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Oct 2025 17:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F852E62D9;
	Wed, 22 Oct 2025 17:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qo7Q1I4F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E212E2EF1;
	Wed, 22 Oct 2025 17:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761155900; cv=none; b=AiE5q9YpyHbSrhJjM17vrvIcGAbT01MNn6IoMuaErSc6ucE2EOu3GPzss4/elAgxYSFYowrEfv1LP7CE6bXfnWPbihDMbL/6D01eh6IRcSrBO9URdjjbjcX0ZXYWiveROdQfUlrZxucb9uR6eLYPk8YyTqWDtnXVcZVVE2buwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761155900; c=relaxed/simple;
	bh=ccO/t/BtCHXvn4ZRBxoKZibXBq2KpTEqZXudSnpgJmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmjA9+drUCY70swS5RWdrA38zqp5pCuaOkJjuk6ha9yXDTE8nUciesKYzWBz+GTuQZMRefGRUWUMnnK/w61JEPZODjuwhjO7RILLDPkDDNiCrlTW/OuBWxNeA7pJAEUMIUYVkl6PoM1wh0U8XR2rcYesMRDQWpr0Ui8t3waOj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qo7Q1I4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F244C4CEE7;
	Wed, 22 Oct 2025 17:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761155900;
	bh=ccO/t/BtCHXvn4ZRBxoKZibXBq2KpTEqZXudSnpgJmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo7Q1I4FLhMu2+TeUtzSwzNw5nuaWtQU8vmBaH557lkvL193SZuZBA41zf8fivwgP
	 HtiGRgm1lRm77MTbmA/m9TgBTBwr0n+IP5XewxwuleX5L9rMasn2K6x9aw8OBQj0BL
	 b90d/KGeQ7iCAPniFm/FMSdDfypWNlmV6YvJYRLuveyMhMVXeeKAp8aCBl4vcaACjS
	 eD5tjJaMmPlTT9BOj2HIpNABtgi+COzAaivx7mGerScffl91NOlZ1PMPhgYzlQr3oi
	 XHRq/ksQHXW7/hG0NL/0/qJGxe2L0G/CnwO0ngC7eGtIU7mFD6B0HCyRcwCwEWR/Ut
	 VZfg6mljRc86g==
Date: Wed, 22 Oct 2025 18:58:16 +0100
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-rk3x: Add compatible string for
 RK3506
Message-ID: <20251022-cathedral-radiantly-eeb2b291e149@spud>
References: <20251021222853.193224-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GPMty0wyvpr3P0oy"
Content-Disposition: inline
In-Reply-To: <20251021222853.193224-1-heiko@sntech.de>


--GPMty0wyvpr3P0oy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 12:28:53AM +0200, Heiko Stuebner wrote:
> The i2c controller in the RK3506 is compatible to the variant first found
> in the RK3399 SoC, so add the RK3506 to that variant list.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--GPMty0wyvpr3P0oy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPkbOAAKCRB4tDGHoIJi
0uRjAQCnlRdeNOobAiqzp5bycfsrdIiBO/pmTWkV+MPDBieUoQD7BBBSwxDDgdqt
BBIHWUU3mXYojkFeBziXRveyq9LJcAw=
=LC/v
-----END PGP SIGNATURE-----

--GPMty0wyvpr3P0oy--

