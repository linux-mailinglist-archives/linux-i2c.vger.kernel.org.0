Return-Path: <linux-i2c+bounces-12204-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8ADB1F9AB
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 12:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3F471899231
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 10:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB80A23D2A0;
	Sun, 10 Aug 2025 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="c6O+3OdX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848591C4A13;
	Sun, 10 Aug 2025 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754822356; cv=none; b=FmARPolFx5uZS0DUDAQOPqeh1WToKDJSK9Sv4a0us89zwRQAoZMGip9qVMI7uMNbJrd8WfDYMGcDtutQTuG6eCrseBG7RBCFYL5rMyCZjheILij50O35g1xSgnCkTYL7nUkXL0NnwzUNd60NgyqF3507TeD2dHdqKHI2pMllnTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754822356; c=relaxed/simple;
	bh=Ur8ZN6WppBJ3rQO/fpOXDAk/Dsyij99LBvAPXolM2SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l1EO+vGgoThAXFsQmBL+w67bbOfNBWI/yyecmaz6zkRZJd+bzn8hyks8RwSt4UQbqo04CcT+hfWkrrjAyvWl5dT+irbqNzg7dXQ4MAx0POHye+uSSYi1TtwmPHl/b+nP9Fgb6SOSDnN0OMwM58hlC9cL4QTzjRGXE7e96vq1lwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=c6O+3OdX; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754822351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DG3sN56rxqKOMFmRnaKRglG8cxswKXU4xjbArzpWD3Y=;
	b=c6O+3OdXl8RKanSSM8cAM3jUKF7O5NGsSuH5+/skIi2RvWZSHrwQJr+/AqTkCPW2H+FZO8
	hbs3CWUuPjxtAfyF+zPULBsG8vbRr2gUSRBP3Xdh5vwrlKxI0hxwSmFCsKkIdAYOVrtw/V
	mWtrB7j85winhs8LjM7Sm0ZtgYHuBh0=
From: Sven Eckelmann <sven@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Markus Stockhausen <markus.stockhausen@gmx.de>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Jonas Jelonek <jelonek.jonas@gmail.com>
Subject:
 Re: [PATCH v5 11/11] i2c: rtl9300: add support for RTL9310 I2C controller
Date: Sun, 10 Aug 2025 12:39:08 +0200
Message-ID: <13823964.uLZWGnKmhe@ripper>
In-Reply-To: <20250809220713.1038947-12-jelonek.jonas@gmail.com>
References:
 <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-12-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3006162.e9J7NaK4W3";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3006162.e9J7NaK4W3
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 12:39:08 +0200
Message-ID: <13823964.uLZWGnKmhe@ripper>
In-Reply-To: <20250809220713.1038947-12-jelonek.jonas@gmail.com>
MIME-Version: 1.0

On Sunday, 10 August 2025 00:07:12 CEST Jonas Jelonek wrote:
> Add support for the internal I2C controllers of RTL9310 series based
> SoCs to the driver for RTL9300. Add register definitions, chip-specific
> functions and compatible strings for known RTL9310-based SoCs RTL9311,
> RTL9312 and RTL9313.
> 
> Make use of a new device tree property 'realtek,scl' which needs to be
> specified in case both or only the second master is used. This is
> required due how the register layout changed in contrast to RTL9300,
> which has SCL selection in a global register instead of a
> master-specific one.
> 
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>

Tested-by: Sven Eckelmann <sven@narfation.org>

Tested the patchset on an RTL9312 device with both SFP modules and an POE MCU 
which requires I2C Block transfers (but not SMBus).

Regards,
	Sven
--nextPart3006162.e9J7NaK4W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJh2zAAKCRBND3cr0xT1
y6rPAQC/BU2mCIX9Aeu/U8eQoLTcIxd8awoI1PYPtLo78O1PjAD9Eqv7NMyGcL+d
ltpkoAvmlxV3ahsYxhCuACEP/UQm8gk=
=7TNJ
-----END PGP SIGNATURE-----

--nextPart3006162.e9J7NaK4W3--




