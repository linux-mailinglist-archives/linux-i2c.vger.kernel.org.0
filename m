Return-Path: <linux-i2c+bounces-12197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A585B1F8B4
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 09:02:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 527ED189A314
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 07:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2447E1E9B0B;
	Sun, 10 Aug 2025 07:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="V6b6ocb5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86E5566A;
	Sun, 10 Aug 2025 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754809317; cv=none; b=ERThBI1z4yog/6Rz7AibbHpKSdoQTEQ9jJDlrmsCq0ofdVrmC3ZbGcto0i22p1lBcpyhRczaAXqkoGCNZZKFYXZJ9Ovf+v51jnqe3lYPOFsEEW9Z/xQBfmi6fDkq7ZgC11f3Qo0QaXsJC4VAFGl28zm3i+DgJATm+wcpfNrGmH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754809317; c=relaxed/simple;
	bh=jcrn+VBHBVRuF2X9rlMWIy8O7/W+PKX3+qIuU/YzHCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dMRQ23Mqay1aT2nQL67bmsMQWi2xv5H5CFfslgatNQiBrqmrOjv4mDMlsZb6hwflNr7HxsJFDFGWwIeVi1CjKzlCUnby2/LhajYQurcXdtXKimLFfL6hzERaq/buQTj9Q8K8uBA83514ttDkqo3Yr07hCM2G7/Q+iiZoCdTGFQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=V6b6ocb5; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754809312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UTxcRIoRKKSNomMvw3b2nj7P65Cz7tc/XNzVDr/j4I0=;
	b=V6b6ocb5cIIMqvZ9lbQj0lhYVnR9tINZm4iPTHbHndg+0jlNNn8HYENuJpF9QTqEg5sC/e
	sXor0Bqd2r12Cd8OBMtDyZIB+Q0ciV57wL9kel1S8nNx5U/5uet8AgPH9Pe2UoRVGGFNxB
	k/2Q/QVgY0xwMBh7VXU1hb8gdktJ/cE=
From: Sven Eckelmann <sven@narfation.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Markus Stockhausen <markus.stockhausen@gmx.de>,
 Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v5 05/11] i2c: rtl9300: check if xfer length is valid
Date: Sun, 10 Aug 2025 09:01:49 +0200
Message-ID: <10704304.nUPlyArG6x@sven-desktop>
In-Reply-To: <aJgzUFOzxxdNDrQa@shikoro>
References:
 <20250809220713.1038947-1-jelonek.jonas@gmail.com>
 <20250809220713.1038947-6-jelonek.jonas@gmail.com> <aJgzUFOzxxdNDrQa@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2319299.iZASKD2KPV";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2319299.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 09:01:49 +0200
Message-ID: <10704304.nUPlyArG6x@sven-desktop>
In-Reply-To: <aJgzUFOzxxdNDrQa@shikoro>
MIME-Version: 1.0

On Sunday, 10 August 2025 07:51:12 CEST Wolfram Sang wrote:
> On Sat, Aug 09, 2025 at 10:07:06PM +0000, Jonas Jelonek wrote:
> > Add an explicit check for the xfer length to 'rtl9300_i2c_config_xfer'
> > to make sure a length < 1 or > 16 isn't accepted. While there shouldn't
> > be a length > 16 because this is specified in the i2c_adapter_quirks, a
> > length of 0 may be passed.
> 
> There is another quirk for this: I2C_AQ_NO_ZERO_LEN
> 
> With that, you shouldn't need the code here.

I am a little bit lost here. Let us assume that i2c_smbus_write_byte_data() is 
called - for example by an in-kernel driver. We would then have following call 
chain:

* i2c_smbus_write_byte_data
* i2c_smbus_xfer
* __i2c_smbus_xfer
* adapter->algo->smbus_xfer (aka rtl9300_i2c_smbus_xfer)

But the quirk is only checked in i2c_check_for_quirks - and then on 
`struct i2c_msg` and not `union i2c_smbus_data`. And this is only called by 
__i2c_transfer (which is called by i2c_transfer, i2c_smbus_xfer_emulated, 
...). But on first glance, it didn't look like it will be called when using 
i2c_smbus_write_byte_data - unless __i2c_smbus_xfer fails and must fall back 
to i2c_smbus_xfer_emulated. I most likely missed something when doing a quick 
check of the source code. Maybe you can point it out.

And I might have to point out that I am currently not next to the actual HW to 
check if my statement that adapter->algo->smbus_xfer == rtl9300_i2c_smbus_xfer 
is really true.

Kind regards,
	Sven
--nextPart2319299.iZASKD2KPV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJhD3QAKCRBND3cr0xT1
y5n4APsHIMoTBC0vlamQgH2LwXocWomzmEvz4sqCk1WX0DBHxwD+MGgmXPdlfMEJ
gwkQGvv7xV4MXVbfy9qsHbgnaAK7GAo=
=DchT
-----END PGP SIGNATURE-----

--nextPart2319299.iZASKD2KPV--




