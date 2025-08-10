Return-Path: <linux-i2c+bounces-12196-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA055B1F88C
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 07:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85E893B8D88
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 05:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86091E834B;
	Sun, 10 Aug 2025 05:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="OXJ0mmdV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBE01917F4;
	Sun, 10 Aug 2025 05:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754805579; cv=none; b=kcviRJQ/zsf+HV1/eU0hIdwTNy9E7HLJxopT0Oxv0oxdXLqqI+aJ3DldK1WXoJQ22j7CNWJg3iCkGvYt1Dx2O6CgR7p+/9uvJf5v6mVum71lmI8CP7nSvyskfOzBejTNSMXmNRjhJiyHiAY4PvtWfz3Qmnv1eLsGgQTcsgF8l9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754805579; c=relaxed/simple;
	bh=7Qx0aH0iyxa+rSkF9K4dAk+7RXmuAkfQ9B1v/Q/39+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hbT2TUr4tibDJpbYDyHYbab5SqOVSimXhKS0OQYgNwjSFdMvLJDlhWKWwhmsyMcWMY1O1lR/iGMDXSffn8VF8IyqOPf6kWws/MPl6vGYJxdH/FHVyAuspHyaTS3rLDY63tWBm6HoL026ZmPyHyPDZapxC+nwdwdmxf74Gv8aatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=OXJ0mmdV; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754805569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BiZfMUBcEhN7heVDKvBNsEFOQ6zMhPZ0MtxsMkfDrqc=;
	b=OXJ0mmdV4Lww4HcHdY5eMw0CQHNLLs7pFiaCRn3KP/BGEQ1XD4k5OqMf9L6mwyfKkwh3+j
	tELPM0Z6Ka7H+gm/JDpYVaHyIyl6JETHacRfMcg0w9yhgy8WGgtwvKuuDPJdEOF+sjR30X
	vMq3q8Ei0GXiuUvgWx4chZDcqBMcprk=
From: Sven Eckelmann <sven@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>, Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>
Subject:
 Re: [PATCH i2c-host v4 5/5] i2c: rtl9300: Implement I2C block read and write
Date: Sun, 10 Aug 2025 07:59:25 +0200
Message-ID: <6183140.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <4e192acc-3364-4318-b31b-120a37af6a2f@gmail.com>
References:
 <20250809-i2c-rtl9300-multi-byte-v4-0-d71dd5eb6121@narfation.org>
 <20250809-i2c-rtl9300-multi-byte-v4-5-d71dd5eb6121@narfation.org>
 <4e192acc-3364-4318-b31b-120a37af6a2f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5032344.31r3eYUQgx";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5032344.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 07:59:25 +0200
Message-ID: <6183140.lOV4Wx5bFT@sven-desktop>
In-Reply-To: <4e192acc-3364-4318-b31b-120a37af6a2f@gmail.com>
MIME-Version: 1.0

On Sunday, 10 August 2025 00:11:20 CEST Jonas Jelonek wrote:
> Hi Sven,
> 
> On 09.08.2025 08:40, Sven Eckelmann wrote:
> > @@ -314,6 +343,7 @@ static u32 rtl9300_i2c_func(struct i2c_adapter *a)
> >  {
> >  	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
> >  	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
> > +	       I2C_FUNC_SMBUS_READ_I2C_BLOCK | 
I2C_FUNC_SMBUS_WRITE_I2C_BLOCK |
> >  	       I2C_FUNC_SMBUS_BLOCK_DATA;
> >  }
> >  
> 
> Is there a specific reason you explicitly use I2C_FUNC_SMBUS_READ_I2C_BLOCK 
and
> *_WRITE_* instead of I2C_FUNC_SMBUS_I2C_BLOCK ?

To be honest, I've just adopted this from the original version of the patch 
and didn't spend a second on thinking about a potential simplification.

So yes, thank you for pointing it out. I will integrate it in the patchset and 
most likely send out a new version addressing all the comments (until then)  
at ~8 pm (GMT+2). The preview can be found at 
https://git.open-mesh.org/linux-merge.git/log/?h=b4/i2c-rtl9300-multi-byte

Kind regards,
	Sven
--nextPart5032344.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJg1PQAKCRBND3cr0xT1
y5DsAQCumkrIwE2Io9F2kHajV4qlRgfoRnvCKsTCAjxfh8QteQD+INFPPzelib70
8f77Ybza+r9l2LDA4xTqsyEPV5U9CQ4=
=nIM4
-----END PGP SIGNATURE-----

--nextPart5032344.31r3eYUQgx--




