Return-Path: <linux-i2c+bounces-13912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5ADC21C82
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 19:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27F1A189BD5C
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Oct 2025 18:33:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3CD2F6915;
	Thu, 30 Oct 2025 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dChJkHGi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629E2277026;
	Thu, 30 Oct 2025 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761849163; cv=none; b=G2i3MpB7Bfr7c/+MwxrE13hLubLlsQXaLSsBvUmHxA1fcZ9sLfqcykRcx8YFfQBgHd37GCvyXZYMCRrYLCY9JNZ5PfPgmGz7lEFzJJ4/r9piwk++ZwFkUBByG0Wd+A2yu4LEFVErK5BSDSOKyPCkW0u2dRt6CShOH2r+04yEoG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761849163; c=relaxed/simple;
	bh=CyMqvVzmILxJbVYS3TwbJAWt9vwMiFU9moEhJwXvZoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oFnSuaiXvSDUjY3KfsA0I4I92ojsS4k/ZfyCP0Wmfh/JdRmF0GlyTgaK4f4Pljk/q0eogfae1hjPoqTg9KXSvl7IZA74ZTet7gvNIbXw29UuUbc0ojEmdLS9lNCeeguu9MAGnOXi10hJhZ60Bsx6c7JL1Gk3bDjMAcYDonxvIu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dChJkHGi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C0FCC4CEF8;
	Thu, 30 Oct 2025 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761849162;
	bh=CyMqvVzmILxJbVYS3TwbJAWt9vwMiFU9moEhJwXvZoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dChJkHGi9P0T/5JCYP6jMztthAdoYUB6mpdAM8dtp3GAzo0MLc3WKBwN9Z6Fuk6dU
	 JGx51adtuWLaIWm60DXn5JujV5qza2Ab8KQbzCGvIw4MGMYCSfmYwu0MWCb6YkfJKV
	 j/CW9bCrUam1iOCBIxLtDZlTPiBnwLABCp2B5g5nM29PUUWQpwAdHu7clPw6wGwWCB
	 wsufbohSRSjXhDpZz8e7V8KOaLbe6PiClajK1T1leU7RC9UIdwf++vr/aV4z2QmXhK
	 2V6OZBWMI5T0M3uxtOsX2oIG7j5i+RJmuvXh0V7uksjHDxeHY9/eDH51hwb+tsqlTr
	 tziFEGVj+RTpg==
Date: Thu, 30 Oct 2025 18:32:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: i2c: i2c-mt65xx: Add compatible for MT8189
 SoC
Message-ID: <20251030-profound-afloat-f3bd79b111d5@spud>
References: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="szHEQ6Sx+ZZv/65v"
Content-Disposition: inline
In-Reply-To: <20251030-mt8189-dt-bindings-i2c-v1-1-5b60914c6453@collabora.com>


--szHEQ6Sx+ZZv/65v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 08:56:29AM +0100, Louis-Alexis Eyraud wrote:
> Add compatible string for MT8189 SoC.
> Its multiple I2C controller instances are compatible with the ones
> found in the MT8188 SoC.
>=20
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

pw-bot: not-applicable
Acked-by: Conor Dooley <conor.dooley@microchip.com>

--szHEQ6Sx+ZZv/65v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQOvRgAKCRB4tDGHoIJi
0l/dAP9QPRUrWv16mVU4Ly4FWBzgIeEhsVfpsE4qCySvMSQ1RAEAnbotESMjb6UY
LD7A78dpT+4iygPrnuzENkZIUiF2Nwk=
=U++K
-----END PGP SIGNATURE-----

--szHEQ6Sx+ZZv/65v--

