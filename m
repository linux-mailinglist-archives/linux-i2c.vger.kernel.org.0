Return-Path: <linux-i2c+bounces-3915-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1323B900A03
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 18:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80DD0B22610
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2024 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 043F419A2BA;
	Fri,  7 Jun 2024 16:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qmH+qbV1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C371993B5;
	Fri,  7 Jun 2024 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717776441; cv=none; b=i+UgyepDP8fFvftPvDHBO6TuF7lq2qy27HcDHIiyUu+VdLvXMbP3vLyBQTS8d8vIASlXqHMM9L8wpt+Hekuh2cMU1YSBEjaruOT4DgThsHfP/JpKl0R+8Dgzj47/XDIzfn89ng1MawukGvgqFBFmHfuvWq6jMNDUP0A6MJ109+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717776441; c=relaxed/simple;
	bh=e060FibAN6dn7MpQtsRShU2TwVWcf8cJXNm5kggqNEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9+lpDad3rJtgtJ1ifL65dHy6Y37CtL7MHvZxan+WUviFJb/ccknqN2cwLaAvJ0Sa+xeE4PjUrW75gZobFTWdSrdDHQQUbqPB/JkbhIC0augXvBIrKrg8jj6g5pKIcU8zlqca+TuiyMQUdI1NH6RVOWRE6oaOhlHmcocU13m3x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qmH+qbV1; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1717776408; x=1718381208; i=w_armin@gmx.de;
	bh=WpsPycSkNqefv/DFU2+Dhs9QAFbosKfQE+s+COBHjek=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qmH+qbV1XlN4xPNaXJca+WdLHKdPj1Zn6fxtZKD/K3DAtdHYELtYdCbsRl+0MXof
	 Alkg/uxTkONug79tNzrqqhzhq2AWMtls3nYsecfghkuJXxj+J4QIXdF6LIE/Mvvp8
	 JaY+Mdcp0m8+pGS8KGk01MnVPzbDNZ3mAn4z+2mndHoNXZb9aA8SSP7sfRQvaAtqV
	 StG+EhQOcBEhcnqE8P6690Cb+HBtQ+/UEjstaRKWskmPKVVto2aydGb6OJ8cHCbKE
	 lA1TT7CM7RMM/AlqqoZcz42H47fNEldf5g9eR8cvfMTvFfT1gM+embdi13iTJMz4k
	 hbH1hpQ6MBo1gzWoLQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMobU-1rzBit3cW4-00LrTp; Fri, 07
 Jun 2024 18:06:47 +0200
Message-ID: <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
Date: Fri, 7 Jun 2024 18:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240604040237.1064024-6-linux@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m9nlxK5q1W4gn1wQ+3dfPZz1bRtMa5DYDrz3gb+BT/rgBF6HfRy
 h4XAlOCE7YNAs/Bmruwyjmk+EeZfKnhrfJMKoQrWSTqUamoqr0e5borArKVYLLOO7xmUp2W
 UceDH7ayjPB2PK3N0YCgSshSZlSB9y30aV5ctvOjAfvcQztcJJ4171B9GeTIpR3jgfVLo5R
 ta5Im3gtbwXpqRQT/o6ZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5FObOyZ0MWA=;g4SABbYYlkx5KCNJjhK+xGdWk7M
 5ftpeTThh7KQ3YRrcb+RwIYzlflxyH9cMYpQ3KaWB4plqiRq9JYd+dwVFh69fQdROQnVKyWTN
 EbMSAZV2R7dFdf8fVRlpSezV+zJKC44SjTxcC3mPVXzx6oxP0esBOKtLPpazBtYkSU3UHnHSE
 i6xsBeBfwt4uc7+FU/w0PjAcAAu6NkTStRebWIfmxT0aNupGrV47S4mOoF1SGiXoF83FhUN9s
 uB27/gCSCpvkRVvG0SkZ0GDkHjTRJq27kXbeN1/EHoMZpXwctI3hBprhNMclEHDblUvETKict
 X5fP7/6NRqfVdQS7DwM5pj2CcorfEg93XJObAxB48AC7MHKkbut92a8cuJESl7nuRiAjRPD8D
 0CdSEOAC/GYNN/5rvSc7zNq/dgrMbtRZ6e+rqZ+qs1x6OFatCcygsf5OWDbY5Uqa0kimlFThk
 sWLjy+maf2ngG2ndCNvY7YTBDhhhVAt3JwH4BbcSSbnCS8i+dfuCpD0fgws2XOhx/YLuk999X
 CrbXVqbIbx6fbyTdNTGTBuLKwXK7UShyiUd9u2nso26a3fpT1xpmkfjy1LKKpK6/OHgkavsV5
 O2P1QU2RwCx4kqJZI/IHUGR2vJBB+0NY0SBRrkYTkpG2ixnYooaIG757CLkFN855FjgSxwg6S
 AcrPXvj0NbQY3iCAzlV27GtH9QqZ7DUmySWe1SIZKDbJ+wsQPhvv+UimWjONGpghgE7xR5GtU
 4df46+9/I0y5s90IK7qODXCewsyQYQAnbmE/+yWm1ZuxpY51Zmn0AVFmO6ZOI1Zk3Hv5+0/yV
 oYCM2rG+WHOhkg2XIvhLq02VoFNyLAQXuwJpBWiZL41Ow=

Am 04.06.24 um 06:02 schrieb Guenter Roeck:

> Detect DDR5 memory and instantiate the SPD5118 driver automatically.

Hi,

the text "Only works for DDR, DDR2, DDR3 and DDR4 for now" should be updat=
ed too.
With this fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>
> Suggested-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v5: New patch
>
>   drivers/i2c/i2c-smbus.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 97f338b123b1..8a0dab835761 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -382,6 +382,10 @@ void i2c_register_spd(struct i2c_adapter *adap)
>   	case 0x1E:	/* LPDDR4 */
>   		name =3D "ee1004";
>   		break;
> +	case 0x22:	/* DDR5 */
> +	case 0x23:	/* LPDDR5 */
> +		name =3D "spd5118";
> +		break;
>   	default:
>   		dev_info(&adap->dev,
>   			 "Memory type 0x%02x not supported yet, not instantiating SPD\n",

