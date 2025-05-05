Return-Path: <linux-i2c+bounces-10758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B16AA8CD1
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 09:06:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67FF416D643
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 07:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE97E14AA9;
	Mon,  5 May 2025 07:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="CQ7Wwaul"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6EB1805A
	for <linux-i2c@vger.kernel.org>; Mon,  5 May 2025 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746428793; cv=none; b=Zr+d/BgUmY0N70qLLeylnRCxQ0iM30k2uFOPb6NkWkHdN5ojDNQpBlhfcXLQAeaLOnfALCxyDmPyo3X6sr5CRCG7c9Qj/yxapY5TKJuhr7mYuOKAI/gCXCVoM54DcQISUy2GaiC6qZ6u+pDa26TfjdC4V0ii0PFGwXkMI/8L4IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746428793; c=relaxed/simple;
	bh=agdf8tfyPqTN/rAN9Hf6YgKVYC9qjd+YRImPZNohMIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkzrYndu4yAhPBegcT5Rbm0zeRDfmyC3Ht4fgxZFXaqq3HXnHLyho/id079T/FBeaSHN2a47JCUQ23gOOgi/ToYZVBp2Z2sfz9+n2583DgmSMRSPYKatRd1Lrid/KkAhktPDMm5i2mRucGcmYIqUhmHXl4EjMMIlyP6imZgwhfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=CQ7Wwaul; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746428790;
 bh=gIXg7np9usec25+u5f5CPg2C+dLhyz1Hb6Nl/ECOjP4=;
 b=CQ7Wwaulma4QRhTixZ0UHxzavdchAaPfJHOE7fHk5QhMwgA0XOApJMfHPUkC4MGJ3IuY2txcX
 F5NUGMDNQUAk0J4gJ2Ql55tAXxTq4/ud/O9DZuoO6YbAvwUiuobC3dhdYc1l4uEqQk0hUHYnkJr
 UfYi3ZUBYN9zFVGzSjcB08qpO8CW5xgmtJ0Y0sQFBWJ8iWuZmR8JnknSp5FW7L4IoPl46eGKh1S
 1ICS8z31Xs5So17Y6yGs2K037r+e02HczAfNbLnqw9Yc6lBIros1HZspef45noSKvoDfsQwH23K
 CQvjkLPBNpFVimpYxhrfYT3V8eREBYYpqXCAF+Xo/a4w==
X-Forward-Email-ID: 68186375baed44ffca19f440
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <9b804428-1c36-437b-9d48-4bce2a79ce63@kwiboo.se>
Date: Mon, 5 May 2025 09:06:25 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Add onboard EEPROM for Radxa
 E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250417120118.17610-3-ziyao@disroot.org>
 <20250417120118.17610-6-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250417120118.17610-6-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-04-17 14:01, Yao Zi wrote:
> Radxa E20C ships an onboard I2C EEPROM for storing production
> information. Enable it in devicetree.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

Reading from the EEPROM on my E20C works:

  $ hexdump -C /sys/devices/platform/soc/ffa58000.i2c/i2c-1/1-0050/1-00500/nvmem
  00000000  52 41 44 58 01 00 03 00  00 01 00 00 01 00 01 00  |RADX............|
  00000010  58 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |X...............|
  00000020  00 00 00 00 00 00 00 00  20 20 52 61 64 78 61 20  |........  Radxa |
  00000030  54 65 63 68 6e 6f 6c 6f  67 79 20 43 6f 2e 2c 20  |Technology Co., |
  00000040  4c 74 64 2e 00 00 00 00  00 00 44 31 45 38 31 30  |Ltd.......D1E810|
  00000050  4f 32 52 32 39 58 34 59  36 00 00 00 00 00 00 00  |O2R29X4Y6.......|
  00000060  00 00 00 00 00 00 00 00  00 00 9e 69 04 00 02 00  |...........i....|
  00000070  0c 00 00 00 01 00 56 31  2e 31 30 32 00 00 ed 09  |......V1.102....|
  00000080  05 00 03 00 78 00 00 00  01 00 30 00 00 00 00 00  |....x.....0.....|
  00000090  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 e0  |................|
  000000a0  4c 0d 0a 5c 00 e0 4c 0d  0a 5b 00 00 00 00 00 00  |L..\..L..[......|
  000000b0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
  *
  000000f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 cf 50  |...............P|

So this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> index 57a446b5cbd6..6e77f7753ff7 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
> @@ -110,6 +110,20 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m0_xfer>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "belling,bl24c16a", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		read-only;
> +		vcc-supply = <&vcc_3v3>;
> +	};
> +};
> +
>  &pinctrl {
>  	gpio-keys {
>  		user_key: user-key {


