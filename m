Return-Path: <linux-i2c+bounces-3914-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE6F9009D3
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64FFA1C23448
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F86199EB3;
	Fri,  7 Jun 2024 16:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Ztllsmqo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E66443AA1;
	Fri,  7 Jun 2024 16:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776031; cv=none; b=bkjYoA8XO/6ecqtOG6p5CfL1FH4ugVqo4rMc6kwb6tbzS0DS7AiQqHzUNcd0m9A5eVX5n8hFG5JGzPNvKNJqV+ogu4lhGO+MPbRcqSr1/Q90NlqboHjqW6zLS0aiNb4ORA6nM8VPSrAi4ZEyVKLCC/WRHPL7bYdXLGpMd8iqLh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776031; c=relaxed/simple;
	bh=ipN6NcG+tPJzPSaA+JuANoD3xQXwFm7y+dIl2bp/uhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs8vQYN1R68qeP/p39XyaGS/gCT1HHZN8YWTZDA62ox7evSgVL6lUEAtaoEGnsVhchzUKqmCwpVGXx50totXRfLuFHhLKCTw04HOUKHI9lt39MpMVVT/QZ7eszeTm+ZiEtojCZsO5ZZFXRUybYG+BO9lavaYvj1cIwQ156ewkZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Ztllsmqo; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717776000; x=1718380800; i=w_armin@gmx.de;
	bh=ipN6NcG+tPJzPSaA+JuANoD3xQXwFm7y+dIl2bp/uhc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZtllsmqoYaaNqy0hHE6wovbGb4j13GI2uK4s0Vk3iiZGNgThWWl14KOXsfazQwSc
	 Kqmk9NUK9Mxd/i3ZJV+uqBjqoq6EYgQFIZpH3lmtkdQgq/Iz5CCy3vVX5OuUxS6sJ
	 7kUqQAV6ONPSE4xPJ7FzSgpeR+GUm3jLixL6qWH6RpKD92TD/CwTfe91OoWv1IOWn
	 VjptevYb/EusNgMQygOpsWUGBgP6yW8pOacrY/alTJGj/rKquXtR8/rDLeEAx/HG6
	 xf45usxPOEFh9cQgJWAnh987hPNnmBvvha9yeGWvSMWjPr/kkLSRf5n9BF6Oh/z76
	 LOriN1LY5eRbozbmaw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oG5-1scehx12mr-00z4Ju; Fri, 07
 Jun 2024 18:00:00 +0200
Message-ID: <c6f398f2-a16c-462a-8c79-d2eda3dbd56e@gmx.de>
Date: Fri, 7 Jun 2024 17:59:59 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] hwmon: (spd5118) Add support for reading SPD data
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-5-linux@roeck-us.net>
 <4cfe1004-77d4-432b-b07e-557a2e57de58@gmx.de>
 <2c94220a-29e9-4b83-a427-5ad406ff1c48@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <2c94220a-29e9-4b83-a427-5ad406ff1c48@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0qDdKGw61X87nQFLHvowo2G5k240GD/KA+cotLxrnQr4berymYb
 wB1CETpGS2SrWjIHwlcssRK6enPLMKMNfrZ2DZARjqgyntnFWoC9Bu5Nkjp8SnXFKAEO5kL
 iq+Dd2+XmHgVCTz7xFytLw8oSYLZ6RqCUwqQ+JpjXYPSaiT153hZFvkanO2BAZ0m1mC68VH
 yWU6d6459Ed314UPd+P4Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wZGDi/oXCIM=;vYmL5x6uzzRQTVhF2LXO3SJZGYa
 +MFZ5gk2HrpjbVxGHGcRMSDsnCBoSCbgmRMPalOWosmL+RxOtNccoo22PjH2dvQcvNntRv8Ip
 qWaAoLgBgZ3RTTeZ1aXXwzGaCBkkFml4VErK+8p+vQ32PN2SEEEaexbHGTvMg1Y6zrSvQ3Ky/
 bUJAnRXzTPVvnt59G3e5YpmygFGmxZP6Ev0IWAhMzOHfa8NjTB4ZhOVZthVH24nDwokr1EYWH
 EKddhxKiwIVpgdGyntHIsKBbo5m4HkzPIK4zSUFLyW8of+GsUMJAjA659uiRCcUHQduEmjk6+
 VnKAkhLNWgLlYal/QTOGYI3W6nez6ezXpdkkLeGQV+Iqhw7HkYsLLP2mgHPOKnYKwR55jTrkn
 9Kz3HBBxlnH64VRhKQ4trYwgDvwFVFdjXTpx9ibOsYIaead1P1i1qV4Uy3ofaapf/5Tes/Nh4
 39VGPwk31EZbol0Q5FAzvnjW5Bedf20Jn9D+D/VVkopW9WhLGvlBEldDGNfR//DxShrycXGsg
 eCHO1ONCScDqBuo9lOPHiAJhbIaRNEFJGYM3s+WXe7v9AU4N7w3oQM5LXHyo+xIRTK3yQrBpn
 bLnoDQCIua3AYnNxrNlqPkEbfeAySCwTFAdy0SopyVc8ft8SfWguKaP0yGPeK1xHXC+QvL3sA
 Mzoa0zWI4AE1tYQ5hUtQTMQ7INI5b1Qoxqc027dhdEsqRIqGUYLVe30FG83Koft5+Z7JzXY3r
 +tR5Vb8i4Qu7oS3K9htnKVYfFLZbRBxpmkabf5p7P1rm8KbK08oENEBp1IKj1220C6xoOccgQ
 1KF8Z/3jzfVRj3w8fxSwBwohCK2bMzKIAgCe2mfscZ0bc=

Am 04.06.24 um 16:30 schrieb Guenter Roeck:

> On 6/4/24 04:58, Armin Wolf wrote:
>> Am 04.06.24 um 06:02 schrieb Guenter Roeck:
>>
>>> Add support for reading SPD NVMEM data from SPD5118 (Jedec JESD300)
>>> compliant memory modules. NVMEM write operation is not supported.
>>>
>>> NVMEM support is optional. If CONFIG_NVMEM is disabled, the driver wil=
l
>>> still instantiate but not provide NVMEM attribute files.
>>>
>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>> ---
>>> v4: Use NVMEM_DEVID_NONE instead of NVMEM_DEVID_AUTO
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Ignore nvmem registration failure if nvmem su=
pport is disabled
>>>
>>> v3: New patch
>>>
>>> =C2=A0 Documentation/hwmon/spd5118.rst |=C2=A0=C2=A0 8 ++
>>> =C2=A0 drivers/hwmon/spd5118.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 147
>>> +++++++++++++++++++++++++++++++-
>
>
> [ ... ]
>
>>> +static int spd5118_nvmem_init(struct device *dev, struct
>>> spd5118_data *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 struct nvmem_config nvmem_config =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D NVMEM_TYPE_EEPRO=
M,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D dev_name(dev),
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .id =3D NVMEM_DEVID_NONE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dev =3D dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base_dev =3D dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .read_only =3D true,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .root_only =3D false,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .owner =3D THIS_MODULE,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .compat =3D true,
>>
>> Hi,
>>
>> do we really need this setting here?
>>
>
> The "eeprom" file is only created if both "base_dev" and "compat" are
> set.
> decode-dimms depends on it. While decode-dimms has to be updated anyway,
> I did not want to make that more complicated than necessary.
>
I understand.

> Another option would be not to use the nvmem subsystem in the first
> place,
> similar to the ee1004 driver, but my understanding is that the use of th=
e
> nvmem subsystem is preferred.
>
> [ ... ]
>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 err =3D spd5118_nvmem_init(dev, data);
>>> +=C2=A0=C2=A0=C2=A0 /* Ignore if NVMEM support is disabled */
>>> +=C2=A0=C2=A0=C2=A0 if (err && err !=3D -EOPNOTSUPP) {
>>
>> Maybe we can use IS_REACHABLE(CONFIG_NVMEM) here?
>>
>
> We could, but I prefer to avoid conditionals in the code if possible,
> the dummy devm_nvmem_register() is there specifically to cover that
> situation, and no other driver does that. Also, since the underlying
> functions are dummy, the compiler should optimize it all away if
> CONFIG_NVMEM=3Dn.
>
> Thanks,
> Guenter
>
Ok, then i am ok with with this patch.

Tested-by: Armin Wolf <W_Armin@gmx.de>


