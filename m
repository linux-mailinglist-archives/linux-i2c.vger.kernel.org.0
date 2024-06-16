Return-Path: <linux-i2c+bounces-4052-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBD090A09A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2024 00:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3E071C20CB2
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 22:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8378571B52;
	Sun, 16 Jun 2024 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Bcvrc7d5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C01847;
	Sun, 16 Jun 2024 22:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718578281; cv=none; b=WoEj/ybk6/7jxV53iW4hGo18HbcMrLSwHeDgiIqXB5LeQr2/rHrru76s0y/aFWfNFZkLezLO4ajamjFce/WowCgYsgQIDemxBCkwyhhP+PbbdroTu9dSB4v1d/rlyXlrFw9WjiK3MTN2fxNVszPB//AhrcBLV26xW1e0V5Kdaxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718578281; c=relaxed/simple;
	bh=yJlgW9UrW4omqwaBaOUEXjoztVTlH9fY5tVIGbqAUjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjC1FH3mnRY4x9u1RmX4rP/ZdKy72YnnsorB0OuOy4lysEpBZiKjWdFZIpxlwify2tjh2s0GGXOJeP4Wq0Q+bxeiVjzX3S4c/jCVbvf+ROfxoHHmkCFTjmoolxjyuHaUnpWUVQwYBp7SnHEyKyDMpeYKU14KKEYjvqPvmIfUwis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Bcvrc7d5; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718578243; x=1719183043; i=w_armin@gmx.de;
	bh=yJlgW9UrW4omqwaBaOUEXjoztVTlH9fY5tVIGbqAUjM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Bcvrc7d5+wDfh9hXQUc6Ai2hI7y1mjys88iUwZ9rO4/zsTzmX1W0RKOVhfSt+GtG
	 qZ3XdzcNf8+2BEVpMERums1rSuKtAJBXYa+HIojjecDVsbLyYQ0Fu+I7Kaoxs2eo/
	 EsresJqryX193eZ3P1720R4omXLDenTRsVH8CLyIUqveMk0Ry232JosGBxm8LvTB7
	 9ZOt9Qna4qqzGP6y+ILNYQ1ZuV5/lW4KLiBMKFOMnMZk+gW+Tve331fW8uMuc5XTe
	 KmR5J3O/9u8JhPPsuN3SwaLHRSTmhxTo9pl0pKH67/zMM5c6xce1t6VfdnXKTMLLl
	 wcpMB1t6HLqGkFiO/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mq2jC-1snLiz09pq-00ozp8; Mon, 17
 Jun 2024 00:50:43 +0200
Message-ID: <da7c9855-ff4b-4e80-99b8-b2fe24a9a9d9@gmx.de>
Date: Mon, 17 Jun 2024 00:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] hwmon: (spd5118) Add support for Renesas/ITD SPD5118
 hub controllers
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Sasha Kozachuk <skozachuk@google.com>,
 John Hamrick <johnham@google.com>
References: <20240614185924.604672-1-linux@roeck-us.net>
 <2046d2c3-bbf6-4842-bc51-b2f567f33c0a@gmx.de>
 <d2ba6ed1-3a6a-4481-9f43-265eee78c0c1@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <d2ba6ed1-3a6a-4481-9f43-265eee78c0c1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YG+AR2HaD0ZrDXDgA6S0XsN5xRge+w9izDgXbPEpHlS89095d9x
 jdUSITzOeLngdD8HpH/K+faiJ9nX+E19GVWdeM3Ktt47y+xC7Sv2EJEpNFxpefFZO9IqzWB
 5EOgQ9OEv7SZZZjwpwU2ThP+DFKfcBBc2qKHbvSgnUInEtZ9WHlh3ke6tb2T9QegWlhqNva
 ILDBizK/uG2oqGvhGhptg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:81bpPNYPz28=;4RTuB/Py0X8z0D2Vpj5QnVp7dHH
 vZlLoXFH9FybtsiYtEGpa0ra18sUoqRIlVuKKnURWPk6Awjhy24NMPsPGMmVT6T0/5FA9mHTV
 Mtzt5zQgQpJ0KCFm0sUff1xuoh6VpCr/6FQIPAgHZChhAb+wdKmyPP1ABOE5QE1LBWYQO/JiY
 7ZCskEuuXP0cUhsg5QdpMQvPDSP3q29bPbXNmFJA2PHv1OoVg0ogVc4FHXOM/zQqww/i2Syk0
 BA/KIGs82B6a/QnJ/euhrKKlsTeV5qBNlUCD3HrqxMCVRwsQKDUWYX0v5G+kgtrNGamoigLP7
 dBi2NBUm5epptcduTrGB5BzK/xcSq+Vx3wIcum/zT2WDxJpFE/gJ6LeMfncRojzulQZ1hW0O0
 knGRN1EcEkt6vuvGTqz6cM48JdA+j/70CNkpi+nR1K+z0gx0qbvswhB4qA3EkjXxRDD+E1UbO
 0wDixkCeYy6KCPRvAXUJSC3f5g7FZ1tuGqvBC53QfbXq4XEn7LvYUEx4HWmAPFElYuYgT4CKT
 lFbtnxiSKOWxSSXtshR1wpAq+8uzn3UKZgnZCgW4vKGM/QtEfmOBX9jU8oNFxwdb/DUHSUurt
 0GLHCt0WZbE96TlfS45Pdui8RgK0t77QsKFTEj9/0/ZXhCCU9DVtFxS/xrrFzo4Wcl7hj7y4h
 3SY9TgPqkVtdDFxHqymnt87F1TxUkg3vMMOFHRzB19JZzxcqkH90pDHukkVEDdJyT4+zn/hzN
 GQ/shGAWZZR66O/7f8r5BkWgjpR+L/jhF1x3Inw3y1z4DhvL8oGa4ciJdwEjwNDRxyuEeD3Vx
 gUvI4lZgQ6fenYK7Lz3lJpnOWx3NtEU3/2CyZY2Al60sM=

Am 16.06.24 um 22:26 schrieb Guenter Roeck:

> Hi Armin,
>
> On 6/16/24 11:09, Armin Wolf wrote:
>> Am 14.06.24 um 20:59 schrieb Guenter Roeck:
>>
>>> The SPD5118 specification says, in its documentation of the page bits
>>> in the MR11 register:
>>>
>>> "
>>> This register only applies to non-volatile memory (1024) Bytes)
>>> access of
>>> SPD5 Hub device.
>>> For volatile memory access, this register must be programmed to '000'.
>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>> "
>>>
>>> Renesas/ITD SPD5118 hub controllers take this literally and disable
>>> access
>>> to volatile memory if the page selected in MR11 is !=3D 0. Since the
>>> BIOS or
>>> ROMMON will access the non-volatile memory and likely select a page
>>> !=3D 0,
>>> this means that the driver will not instantiate since it can not
>>> identify
>>> the chip. Even if the driver instantiates, access to volatile register=
s
>>> is blocked after a nvram read operation which selects a page other
>>> than 0.
>>>
>>> To solve the problem, add initialization code to select page 0 during
>>> probe. Before doing that, use basic validation to ensure that this is
>>> really a SPD5118 device and not some random EEPROM. Explicitly select
>>> page 0 when accessing the volatile register space, and protect volatil=
e
>>> register access against nvmem access using the device mutex.
>>
>> Hi,
>>
>> maybe we can use struct regmap_range_cfg so the paged register
>> accesses are being
>> done by the regmap code itself?
>>
>
> In theory that might work, but regmap does not permit a selector
> register to
> be part of another range. The first range would be the non-volatile
> registers,
> and the selector register is part of that for all ranges.
>
> I tried the following ranges configuration.
>
> static const struct regmap_range_cfg spd5118_regmap_range_cfg[] =3D {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_reg=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D SPD5118_REG_I2C_LEGACY_MODE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_mask=C2=A0=C2=A0=C2=
=A0 =3D SPD5118_LEGACY_PAGE_MASK,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_shift=C2=A0=C2=A0 =
=3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .window_start=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .window_len=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D SPD5118_PAGE_SIZE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range_min=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range_max=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D SPD5118_PAGE_SIZE - 1,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_reg=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D SPD5118_REG_I2C_LEGACY_MODE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_mask=C2=A0=C2=A0=C2=
=A0 =3D SPD5118_LEGACY_PAGE_MASK,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .selector_shift=C2=A0=C2=A0 =
=3D 0,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .window_start=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D SPD5118_PAGE_SIZE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .window_len=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 =3D SPD5118_PAGE_SIZE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range_min=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D SPD5118_PAGE_SIZE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .range_max=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 =3D 9 * SPD5118_PAGE_SIZE - 1,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> };
>
> This results in
>
> spd5118 0-0050: Range 0: selector for 1 in window
> spd5118 0-0050: error -EINVAL: regmap init failed
>
> If you have an idea how to configure the ranges differently,
> please let me know.
>
> Thanks,
> Guenter
>
Oh, i did not think of this. In this case we indeed cannot use regmap here=
. I will test the patch tomorrow.

Thanks,
Armin Wolf


