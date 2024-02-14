Return-Path: <linux-i2c+bounces-1713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E9855206
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 19:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 977431C217C4
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Feb 2024 18:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B887127B74;
	Wed, 14 Feb 2024 18:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lI9Xlute"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6698684FC8
	for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 18:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707935103; cv=none; b=mrjeb41PL5cpiZSZlJs1teUp5+JnQgmgqgBiVP0T3sc1IeYCYP1+Oi6afOWWrLmEFtBSRgHRk7kVxttGhzBETdqW08/bOTxaUvcrMhZk0z6GdXyTT8eLa8jU9NS4uj/if7AzZMKkfRyT0yoqHNqXvZb/gdaGBUKVvOHjepF0XPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707935103; c=relaxed/simple;
	bh=YeHx6ZeD4TmOTlGBdmENGPCUN4vz0Z6ZCiMoHjK29vk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CR1KGH53sMkPgs2pA/V3fPDUShT/PteIMuTeOivPjoSnaJ5ipPCmqVw5RRHiXg2aPVWX5ISL5chx3bh51nw7du0OVYO7I4LV23ODPMRP5rC7sevWBm0dB48dI1WA6qGUhcHB4792WC8AZZ5Y40cbcXr9sSXoMVepp1PHSBAvHdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lI9Xlute; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-411f17700ffso235015e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 14 Feb 2024 10:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707935099; x=1708539899; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iHZIUXEkvuNvlpcH00SBC3RAWF8Jf1KzE0bVe3lJw1A=;
        b=lI9XluteDVqZIXwTdMsZtGNXhB8Xr4C/7OwWrLArC2EcBi5YbCbgov/EnVMPGdvZKC
         j1ye+PMpvATBRrL7QBv9MkVJHFkMVw7X8Of8rNvYbB8setrLZN4s3HOWcZ1SKgakvq1q
         2OkX+MbIO34LvlXLc1VtO3onavxtIpILD/fvmv833uk5Pl9xI0a3/ovUflP1khOAxyv0
         ogNYHw4jCE/2XhCPHJgHRWDhmMAyHHrqkGNr2aVCqgBmhfLI4nn0XsEBo+gDC+Kmi58c
         G3pPpxGqXSogtYmJLQOHM6L572pbXrjQtivNN0GHcJaVoKB6n6iupl1KP9khDRwvLczy
         k7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707935099; x=1708539899;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHZIUXEkvuNvlpcH00SBC3RAWF8Jf1KzE0bVe3lJw1A=;
        b=N5U4C6g3Uj5jdKGkw+r9zchonZfUULsOZ21PfIYQm5V7eWOf1eCWvik+J94ewvyVHy
         eNT3ypWroDMznRffQZqx8XMbogayPnPvzfSUVRi3iohP9Mj7uX+o2dklzBAUYUNKnRsP
         ZdBWckq2Xk/jvQwHH+we8I9EqEvGawKWQCylWHArj82wp2JljfhQB3+MLJy7uXMSK+Fj
         Rvrr1ehea9tMW90Fh98fTFeoiVeqiVT3m52HsbyS6QPOzJ5nUYB42W8yClHyX3p62MJo
         mcF2wkRvyt9LhqNuehS/duEB3BcMYmCPBpgCd/NGx29ZNr41NIRJm2iM8OfKG0qR14Tz
         /Tog==
X-Forwarded-Encrypted: i=1; AJvYcCVQvgp+L9Ka5WFWSwa+ttoxoJIa0uVFgZhExhi6DoNnJe2bg9CUgA36cFiLVOvGkpJs/og75JwhenOKCvz+POMfYJl5uVq3B4JO
X-Gm-Message-State: AOJu0YzmmONT1JWdrvqwUg6cRDQ+gAKyESwiEyjMYmVMSiiwmF5bD7ym
	yzDjj4VC/PH1KneQORFBlDYhMWn+0Q62E87QgmETReHAkfXB/Kxu
X-Google-Smtp-Source: AGHT+IEzSdYuto+UZkJtDJDhH+DznZG0eWU/gsVjVyF/L4/9jN/LKl+PPkm7JMIipHrUt865cylnVg==
X-Received: by 2002:a05:600c:1f91:b0:40f:f069:8d13 with SMTP id je17-20020a05600c1f9100b0040ff0698d13mr2726533wmb.9.1707935099601;
        Wed, 14 Feb 2024 10:24:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV/m8Vmpejogvnt0PxZriHpo9qqLmTfM9c7ECw4eMXnLZhcNQwIO70dEsqPSXt+Z7G5IN7820NYfYtuxKgwqiARhXpgPqGSjxqdh+/BE1rD5Ti69q9khXHqXsvdlH5tFCqguX+GAiUJpynSHUq6d+PNBmBmmvzFXm1s/yYakalAFA6v9O12g6kXUyBzcc3AR/Eiy6XmphPRxHpWHkgHPFPNBXeloGV4AT+N4+hm1WBxFA==
Received: from giga-mm-1.home ([2a02:1210:8690:9300:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c471000b0040e4733aecbsm2697675wmo.15.2024.02.14.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 10:24:59 -0800 (PST)
Message-ID: <db7f0fbe0a29f99de14fb3155a2091c595b87caa.camel@gmail.com>
Subject: Re: [PATCH] i2c: i801: Fix block process call transactions
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Jean Delvare <jdelvare@suse.de>, Linux I2C <linux-i2c@vger.kernel.org>
Cc: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "Shepon, Oren"
 <oren.shepon@intel.com>,  "Kozlowski, Pawel" <pawel.kozlowski@intel.com>,
 "Usyskin, Alexander" <alexander.usyskin@intel.com>, "Radtke, Jakub"
 <jakub.radtke@intel.com>
Date: Wed, 14 Feb 2024 19:24:58 +0100
In-Reply-To: <20240214155939.728155bc@endymion.delvare>
References: <20240214155939.728155bc@endymion.delvare>
Autocrypt: addr=alexander.sverdlin@gmail.com; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Jean,

thanks for looking into this!

On Wed, 2024-02-14 at 15:59 +0100, Jean Delvare wrote:
> According to the Intel datasheets, software must reset the block
> buffer index twice for block process call transactions: once before
> writing the outgoing data to the buffer, and once again before
> reading the incoming data from the buffer.
>=20
> The driver is currently missing the second reset, causing the wrong
> portion of the block buffer to be read.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Reported-by: Piotr Zakowski <piotr.zakowski@intel.com>
> Closes: https://lore.kernel.org/linux-i2c/20240213120553.7b0ab120@endymio=
n.delvare/
> Fixes: 315cd67c9453 ("i2c: i801: Add Block Write-Block Read Process Call =
support")

According to all the datasheets I've been able to find, the patch
makes sense to me.

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> Piotr, does this change make your tests succeed?
>=20
> Alexander, I don't suppose you still have access to the hardware on
> which you were using block process call transactions back in 2019, but
> maybe you remember having to do the same change to make it work?

Nope, I cannot explain how this went unnoticed... I don't think
we had a downstream patch on top back than.

> =C2=A0drivers/i2c/busses/i2c-i801.c |=C2=A0=C2=A0=C2=A0 4 ++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>=20
> --- linux-6.6.orig/drivers/i2c/busses/i2c-i801.c
> +++ linux-6.6/drivers/i2c/busses/i2c-i801.c
> @@ -500,11 +500,10 @@ static int i801_block_transaction_by_blo
> =C2=A0	/* Set block buffer mode */
> =C2=A0	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
> =C2=A0
> -	inb_p(SMBHSTCNT(priv)); /* reset the data buffer index */
> -
> =C2=A0	if (read_write =3D=3D I2C_SMBUS_WRITE) {
> =C2=A0		len =3D data->block[0];
> =C2=A0		outb_p(len, SMBHSTDAT0(priv));
> +		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
> =C2=A0		for (i =3D 0; i < len; i++)
> =C2=A0			outb_p(data->block[i+1], SMBBLKDAT(priv));
> =C2=A0	}
> @@ -522,6 +521,7 @@ static int i801_block_transaction_by_blo
> =C2=A0		}
> =C2=A0
> =C2=A0		data->block[0] =3D len;
> +		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
> =C2=A0		for (i =3D 0; i < len; i++)
> =C2=A0			data->block[i + 1] =3D inb_p(SMBBLKDAT(priv));
> =C2=A0	}
>=20

--=20
Alexander Sverdlin.


