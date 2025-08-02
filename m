Return-Path: <linux-i2c+bounces-12117-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC786B18E11
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 12:50:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E9337AE10E
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Aug 2025 10:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E920218AA0;
	Sat,  2 Aug 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="ZS8XKs7M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6002DA920;
	Sat,  2 Aug 2025 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754131808; cv=none; b=gZ77QYLWyEEAuejvhVdDKP/Iup/0p9aQlfC6KGpaQ20Ez1GGCHfQlVdm8yG5+gzy9okMUg5K6+L3ovywiu6i4FQsDkmldJMhxu3EWx6MDvu+3uaSya/sfjnrUq58XYOjLxqEcF8FExbfInwqZ0TEo+n7lwFg4Gdt8CIXB6FLZfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754131808; c=relaxed/simple;
	bh=YUUurxRGnIXQz3rjL/3WQEzUhPSVAVuFlF+NgvuRcs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dPNtW/ElxgU8nu279CC/HP1l4iY9xhXiyzUU+6JIdHlrvVuPypQP7v4YzfFtX6FLMvolG7Lz2BiIwHrG0n57t0oUUE8ROIDR3FP45A37keGHEDRuHAdygACb08CnlUMrxDIZMffcQf7ssV7WERcZ2T63SZ0/yyCAIHg3qFpOHlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=ZS8XKs7M; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754131803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1k0gDJLahhbU/2Jeb16TrYN9Lr3gc1KUY7T6EHQVKQQ=;
	b=ZS8XKs7MW0Y2GwzYOOMYnVupKRlQXBFAnF3uqaK0Qwj+S2Ill803wLzwo83wluhlursvb6
	PVi+QgS1u/EihO8Rg8CO9dbQLGueVi0zexhdzdg0Nmm805GuU9QTVN5cfg5gzkqdeTba3Z
	HlJXN/Lg68mgocgvufudVjrVgAHDg7I=
From: Sven Eckelmann <sven@narfation.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonas Jelonek <jelonek.jonas@gmail.com>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>, stable@vger.kernel.org
Subject:
 Re: [PATCH 3/4] i2c: rtl9300: Add missing count byte for SMBus Block Write
Date: Sat, 02 Aug 2025 12:50:01 +0200
Message-ID: <6287928.DvuYhMxLoT@sven-desktop>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-3-5f687e0098e2@narfation.org>
References:
 <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
 <20250802-i2c-rtl9300-multi-byte-v1-3-5f687e0098e2@narfation.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6558281.lOV4Wx5bFT";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart6558281.lOV4Wx5bFT
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sat, 02 Aug 2025 12:50:01 +0200
Message-ID: <6287928.DvuYhMxLoT@sven-desktop>
MIME-Version: 1.0

On Saturday, 2 August 2025 12:32:02 CEST Sven Eckelmann wrote:
[...]
> diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
> index a10e5e6e00075fabb8906d56f09f5b9141fbc06e..ed82e6c21aaf46000a263740123ffba833578cc2 100644
> --- a/drivers/i2c/busses/i2c-rtl9300.c
> +++ b/drivers/i2c/busses/i2c-rtl9300.c
> @@ -288,7 +288,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
>  		if (ret)
>  			goto out_unlock;
>  		if (read_write == I2C_SMBUS_WRITE) {
> -			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
> +			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
>  			if (ret)
>  				goto out_unlock;
>  		}
> 
> 

Yes, there is as always this "2 seconds" after the send "wtf. were did the 
line go" situation:

diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rtl9300.c
index a10e5e6e00075fabb8906d56f09f5b9141fbc06e..4d109ebd02f0cad86f50e4e148966b3fa68b0196 100644
--- a/drivers/i2c/busses/i2c-rtl9300.c
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -284,11 +284,11 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned s
 		ret = rtl9300_i2c_reg_addr_set(i2c, command, 1);
 		if (ret)
 			goto out_unlock;
-		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
+		ret = rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0] + 1);
 		if (ret)
 			goto out_unlock;
 		if (read_write == I2C_SMBUS_WRITE) {
-			ret = rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+			ret = rtl9300_i2c_write(i2c, &data->block[0], data->block[0] + 1);
 			if (ret)
 				goto out_unlock;
 		}

v2 will be send tomorrow. Sorry about the noise.

Kind regards,
	Sven
--nextPart6558281.lOV4Wx5bFT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaI3tWQAKCRBND3cr0xT1
y1yLAQDpHoACCNv9cmMdjqYAeo8BBjvDYrtvwry3IP9NcejEkwEAhCsZ0+C61yig
pr8UY3vGFdjWR0VZn7apffv2bWPVKgs=
=ndCS
-----END PGP SIGNATURE-----

--nextPart6558281.lOV4Wx5bFT--




