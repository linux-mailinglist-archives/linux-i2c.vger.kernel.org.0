Return-Path: <linux-i2c+bounces-2135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A986FDB8
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:31:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B331C217C6
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 159C024B59;
	Mon,  4 Mar 2024 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+xvoZF2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DE822099;
	Mon,  4 Mar 2024 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544474; cv=none; b=YHwJ4pOdtG80LOsTBxbDaG4Ij0yEw8ZaaVF82uFhuT0aruhSYzLG5HD4itHZqyzuu5sSbvjkr5mSsMdkWJQ+1objXYvJ/yANIAHO6IWFHojrsWF6ZOn4fPKVCYcyITXOFLulNth3LEH/9y2g+lLXMM7CPf5DaWQgmxQ7UfjQJUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544474; c=relaxed/simple;
	bh=jMsyGLHvO8uB8zv0yGRDRKH0t8IOUmfWepSdtjUOZTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV9RwBows4GKzNrOj08j5PyVv8rEtKhgdw/x1HwAsYU1bdReSxUa40hmFKJDEJGJBdVFmGeIuBwTMBZsDJYdGaUn5bRSJcywGyLGq4a6xDUCT90krQAzTW7+XNIoYtUsvjcIhrs1VrwjFShJaC7mDSIqkkcuBWflRxWAITLmAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+xvoZF2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC5BC433C7;
	Mon,  4 Mar 2024 09:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709544474;
	bh=jMsyGLHvO8uB8zv0yGRDRKH0t8IOUmfWepSdtjUOZTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+xvoZF2GTy/RNd7tMYk20WS/5PzimRZfztQAxovLMVTXz69+dyZ3qiz7K0DNMsiv
	 6loEi8eC5AEsdku3Q/yBt7VJObLtzwbE+H6j62sODfdpE14MVYoyHsitx+xavdlxUy
	 PruOIlewnMt95GVoqhhkGEsuqfiwu87CfLAX4HCLoxi1Ivfl0p+W6cskTwun1xDCQj
	 qZTPn4K2ZZ489A54xop/I1dsnBIReBy3WHECGJ9z+zeURekb/l8eQaf2QeHtFsFRq2
	 1/+JhT9HPehKi3+Jm2w3yg7HKXwxHJAKw1F5rw0R+fSPvNkb9JTY4kcd7CVPNUMVj+
	 lNHjw5HJhXmjg==
Date: Mon, 4 Mar 2024 10:27:51 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 09/11] i2c: nomadik: support Mobileye EyeQ5 I2C
 controller
Message-ID: <ZeWUF4P9CcovI3F5@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k8nmJLf0eP41vvSM"
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-9-b32ed18c098c@bootlin.com>


--k8nmJLf0eP41vvSM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if (of_device_is_compatible(np, "mobileye,eyeq5-i2c")) {
> +		ret = nmk_i2c_eyeq5_probe(priv);
> +		if (ret) {
> +			dev_info(dev, "%s: %d: %d\n", __func__, __LINE__, ret);

This is debug code, or? Please remove it. Especially since
nmk_i2c_eyeq5_probe() prints something out on error.


--k8nmJLf0eP41vvSM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXllBcACgkQFA3kzBSg
KbYjBg/9FCc3QH08DNHSDclrHAf1fg5Z5zrN+QWrseFFm2Snxk2BMxDn5RV7YGpa
5ElyrLnZX1DpRQtokMYrejy1yTOJlwVUUZIIbdB958ASVTLp47vkRw6Diz5s0Jh1
Jy8Lry+P72uLeSdagK31sLOw4Hoys31DkkGZhzRotEO6G3VvgjQ5mXU64Cyz5xfy
1LV0uiL5iJ3d1a3rV9cFmjDroHjeVQ6UA+cahAr10S3BHsaxgt6q5ZyCbsSQWr8C
YETLFQfCU6MjgDikEPch4GcpX6g2uNUR4nicVtvclxdT4C7b2dK8iWNTYRqncbcH
QgcfhX6sYT5J23tMqnuKKfCHD0Fmo2nlyFNlHUUkLnZrMgCXU7APz8JUsN70Eahn
tN0St7ccWN79BntxXyUeAooDOopPAhklSvN/rc0epG0/PGUlx4QZrZK+SGPWtTdP
JX9tRIDavd4Swd7DRiL9hCmFQE2P6DhPlvO10TPoz7KI9LvZCZ0Fd2WJAsajo5mD
MdgK0n4jC1XdqSC3WFTm7+MiAJUZJTsdkq7OFlGfWGgy0T0AQwq0FYX0sjREswQB
05xfcgLhn9XjUzAQIRErvh459o4IrxwfB3zgJtnL5RN64YN0P89+FBm5kkxfcATC
72f3ECGuiYFDiCbEWCuIT5OX5hiY37WcWVfynwSOgcAeBfRRT/c=
=SBTB
-----END PGP SIGNATURE-----

--k8nmJLf0eP41vvSM--

