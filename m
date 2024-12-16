Return-Path: <linux-i2c+bounces-8544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 042879F3918
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 19:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB58218868DF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Dec 2024 18:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655CA205E11;
	Mon, 16 Dec 2024 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug/gCQku"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BC843AA9;
	Mon, 16 Dec 2024 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374215; cv=none; b=VurMTOcDsXsXrJSm/iHqy0bEQIav2WCNVWq1pelR/ixMsX2Pofq17/nPL1c0wf3zeT3QojBdVK9sMCHcvBpJa3FGwn4p/bSEls4Xltc71WJVfUsw3gEX2tdDpovnX8JnV7F7zr5FZ84GHYFstPGZIwZZ/iLTsV9GakSbdp0JH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374215; c=relaxed/simple;
	bh=68Z2hTebw69WnIGxyWqWMosjiVTaG3HsDLzhK+XpHhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNsyh7JYoTgeZlkKBmUJfcSVRJz/4yCUhTLFLrgJN/XaXDBJEp8IqHAe8BMIcothkYiNIb027LQ6j4nQjUaLsHD8LLsHMG7Onoo+Fw7L2sGXra07WtLiHBKQZOxrERGyjtSOAmVvoNplqtFzi+Qn4VrPlvbsQQOcsOSFBMSMNcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ug/gCQku; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DC6C4CED0;
	Mon, 16 Dec 2024 18:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734374214;
	bh=68Z2hTebw69WnIGxyWqWMosjiVTaG3HsDLzhK+XpHhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ug/gCQkuPFovCO9IE+3WdoHZ0jensqwqrLb3cPUpMSxBVQVsvTgc0WEHuW9KPlf05
	 jXB/IXUgfVll9IwmW9gbNDkSfrxVtLvERjSclq/m342SrHl9cYbBdqwvnqfpYd9k6Z
	 zitlfHU/0LbiYQg9KS+E9W7CdZq6/o6RDI3ECbpLEBaMGZLMKMj6/UjZPItvGPdW+8
	 vUX6cfYgA3q6Vm0cnNXYQ3I3liMZGwaE5FwnZfl0T0QT9LvqnTLb1etByjLl/lgioc
	 /CCNHqacebs1Js/F5Qfw0VZKzl7XlfhtUsTU7nj1ovycwuMbfwaN2oGOfTw+nTufmq
	 xy7CwtaTU9qvQ==
Date: Mon, 16 Dec 2024 18:36:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: i2c: renesas,riic: Document the
 R9A09G047 support
Message-ID: <20241216-earthworm-visibly-dc75496705e5@spud>
References: <20241216120029.143944-1-biju.das.jz@bp.renesas.com>
 <20241216120029.143944-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L840yKvpjDanjEqJ"
Content-Disposition: inline
In-Reply-To: <20241216120029.143944-2-biju.das.jz@bp.renesas.com>


--L840yKvpjDanjEqJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 12:00:23PM +0000, Biju Das wrote:
> Document support for the I2C Bus Interface (RIIC) found in the Renesas
> RZ/G3E (R9A09G047) SoC. This IP is compatible with Renesas RZ/V2H
> (R9A09G057) RIIC IP.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--L840yKvpjDanjEqJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2BzQQAKCRB4tDGHoIJi
0qQWAP9NtFwRHJwPxfEcJbLVhtp+JhfGY1DJoHDVjfgynlgf9gD/VHuUOPhLSJGU
Te7/BcepNB1xTBRzu6OOcGH0M+gqGw8=
=Ga0q
-----END PGP SIGNATURE-----

--L840yKvpjDanjEqJ--

