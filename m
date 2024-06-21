Return-Path: <linux-i2c+bounces-4219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA413912752
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DC21C25E97
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 924D217BD9;
	Fri, 21 Jun 2024 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tptKVN5T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B084134BC;
	Fri, 21 Jun 2024 14:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979264; cv=none; b=Mpp5RWLmG8XG8X7YSJSPJ6yS4hXKSERohPYHUt0M92NGHOnCDwS+RF6z2JjSEnyMDpHzukBHGXnkZMKQaqu0xmmYueg9iBD6sw5EtUtwUChSsF/YIGdDg+Tt98dqESsebYgDH7gEjoeRA1YicF7wCf3lM1p0dF70yn4AgYHPBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979264; c=relaxed/simple;
	bh=1PXHlcy1RPLlp/k1X4kBVrzLnL0LJH/jIPGrJe+uGCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h42P33rFe+MYPMqAEDFiBSGGuUDHoOlzAwe2L176SGDpB0JScXy0o/S4Vvs9n1CsmjsEjXQZz1aeaig2Ddhdw3tKut0rcU+29fqjzPxSL7d4qhCm3Vj8SzABh8oWfadfZ26R7ZrA8L8LAct4UVejaDqLIeCY8jvMDx+7pu7XI+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tptKVN5T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26B1BC2BBFC;
	Fri, 21 Jun 2024 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718979263;
	bh=1PXHlcy1RPLlp/k1X4kBVrzLnL0LJH/jIPGrJe+uGCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tptKVN5TL80GOp2HQwmHzHcoUan/wUy5DdrCaE2AFQuBdaqqNbGajN52llmjsyPb6
	 MlYuoLb1odXWQd9nFyreq6XLZnsNdi2fZ+tYgqiZaD3F9wKHZ/zHmRL9LcKsu9oJGE
	 zYGegGNCJADdAWxF+ZsUEWl6K7hwPoZRNCoWqW9WayRZyQ4W4KVKb8F3PPR/xkmOpk
	 1zV3bhQoSNGw5CwwNgt4WaUc4+CWoDD5l4+/qc0K6f4AlFcOUlQ6BzMmKHqhLbH2GN
	 2Wf/zqiYjvxrIM3Y5AEd7rQv5DoEUjBqThF+ZVS8zCUK6ck2EBLBzaAhdBdY9SnntG
	 l1M072XTcUMCw==
Date: Fri, 21 Jun 2024 15:14:19 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Message-ID: <20240621-ripeness-elitism-36650131a6f0@spud>
References: <20240621121340.114486-1-andrei.simion@microchip.com>
 <20240621121340.114486-4-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZAdZyBNQiOGLtnaj"
Content-Disposition: inline
In-Reply-To: <20240621121340.114486-4-andrei.simion@microchip.com>


--ZAdZyBNQiOGLtnaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 03:13:40PM +0300, Andrei Simion wrote:
> Update regex check and add pattern to match both EEPROMs.
>=20
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--ZAdZyBNQiOGLtnaj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnWKugAKCRB4tDGHoIJi
0sUWAQDm6B3+IjZHb/IU+aV0iPSwE3ZySN7RptGN8U5nkdcW/QEA61ogSy1tOvwH
CqWDd1CfaO4EFORbmAx+4uipZbJOKQY=
=97VR
-----END PGP SIGNATURE-----

--ZAdZyBNQiOGLtnaj--

