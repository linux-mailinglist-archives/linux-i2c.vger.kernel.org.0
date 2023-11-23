Return-Path: <linux-i2c+bounces-428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3157F688E
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 21:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800691C20A1F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 20:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB43A14F7B;
	Thu, 23 Nov 2023 20:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7fCdQUN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCF14F65
	for <linux-i2c@vger.kernel.org>; Thu, 23 Nov 2023 20:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82159C433C7;
	Thu, 23 Nov 2023 20:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700773074;
	bh=+3F4s+IAUYLwhXgtInkbimzrIFWoEU7zQccek18Zy3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7fCdQUNE6iXFi5rUMFGIONqSAXdmjBYMvTV4OTq4dVLVJB605IC0r5WVjKJ8SMND
	 xQXcgfjxhcKBovUi7STS+qs4JxkEhG26uj86hlczVAJUEwwUtYDdHnkgzkZSg80mQM
	 Sc6y2/elaZmvXejymAT+e99PTijCgKJJouBhtMliWTdPZcmQpXiBiHXnrdV0064mxG
	 V/ctFTUd1MP/4Xd4waS030cZlqDC2yNeTvk3jraFI6frvMIoIbLSeSSOUQTOC6Wxjw
	 7XYCXdBAmDdSt4W8Hwu5g1eTUgfg1tpntsZIs+3oEEO6ENlu27Y/uGw3OQjHyw/BvQ
	 604hvtq88RDtQ==
Date: Thu, 23 Nov 2023 21:57:51 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] drivers/i2c/busses: Don't let i2c adapters declare
 I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
Message-ID: <ZV+8z7zloE/gn/4p@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
References: <20231118180504.1785-1-hkallweit1@gmail.com>
 <20231118180504.1785-2-hkallweit1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PwSR3A6iQFvsAk3P"
Content-Disposition: inline
In-Reply-To: <20231118180504.1785-2-hkallweit1@gmail.com>


--PwSR3A6iQFvsAk3P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Series was created supported by Coccinelle and its splitpatch.

I don't know splitpatch. However, I don't understand its result. Why
isn't there one patch for all in drivers/i2c/busses? Also, the subject
prefix should be plain "i2c: <do x for all drivers>" or something.


--PwSR3A6iQFvsAk3P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVfvM4ACgkQFA3kzBSg
Kba1zQ//Z444dzSXhxkRbiruyduTqb0PHEYHZPC3jFzSinHhmDiiaFjCkPnpDOdD
d926o1TOTxX8YxpGPWy7xeBDmSsuPWbQnHY04rMu9hNmVjp0ozL8DWvcy8IUoMbf
DaFZ0oXwYpwisa9b0ve8T61sZIrIoPdkXuOQcUlGYo/wG3qCWgtEoHn+GF2va0B3
Daw193ttJqHnhQYoBankeFbd3ncb8EUpQieLDmR/yEnAEAsucBlpG2Qkvv66gDXt
ZWK35R8PV+M0hwbOyYoH6EK3Jo5LTk05++rUbHNVrhrrfvlnjPeiiEplRxTgk7wa
tX0uzRVJVBqEw7BKtFZ/3uuPWpqzd3axiXZwEz9LTbfreyJ5tvVP32X0XnMujVbk
ID6uHWkXtsSIYs2eYRl9fcAcbrENY6BXi7QzMjGtZ+xRGClZtIaldges3LWRklQB
+g7u4e4kgXb8DGK4hKDp7NYyQyIvsq18xTu9nDiP92VYrsAe0d6qNqqYvL2CLzob
hilEtRoWHeMF7a9UKUYqqEXb84rhpXRtF70UXY6eSxfz6bYPsgklv3hq31OrPja7
GKQER/ism0ML7SrovX3dXqLMQJSFTbXmrQuvmr5Myix3O/0xp7sPuxKOv1B0ayU2
LeALdfCRXLGkAeIgpZvGWNupLtORRYYR8zTd9FcPGWWdHUPVkFw=
=SUMv
-----END PGP SIGNATURE-----

--PwSR3A6iQFvsAk3P--

