Return-Path: <linux-i2c+bounces-4940-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C267E92EB00
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 16:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4B7D1C20E1D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27028158DA2;
	Thu, 11 Jul 2024 14:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AuPvm2HY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1142415B97B
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jul 2024 14:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720709120; cv=none; b=YJeJmjKxiDqjWplCbbnE9j21KA6wh61d2WOTAwGK0bJXR0k/0Lszm98zT6HbAnI9wYFvP9rWcw66PeYP1aQiY3ZMPjKsd4kHv2UY6VQgdWQ+6j3uzKDCwqaUIhIXzGA/EBFgrfgj/l0NIsLXUekqnlYi8Qx1uUx97wMJ6k4BOUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720709120; c=relaxed/simple;
	bh=X/Vus3odAr0nVoUkxLttzX7Pk94wValiSx+VwO4R69w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRmVxXJZ6P4vref4HTkPgsjw9kzhmi+NhhJYWq1MiSoDPFMSPtBHMf+3bLmUDO+EjAaghHj3Sk1LDcmghE+YYQZ66nu7oICyPh8nSZmPKtMoiWYtI9yVYNI15ptRRZk8ee1nDRiM1vKf0SrdtAfLM+LjuHqEvs8DUJYY+i5Dg0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AuPvm2HY; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X/Vu
	s3odAr0nVoUkxLttzX7Pk94wValiSx+VwO4R69w=; b=AuPvm2HYrBBxPCRmojQD
	7CRnGb08OzEAMIGsRtGo1cADF0LX2II9QCJrZUl8IaFo/ZZrZu7J+SrEBWtj60Pv
	1FkcrDPS/qIZnwEyGkXZcTAvUt2AcDbXPu9bRoCsRQVJ3yq7hI4gN1/pRnYBoxmm
	LrVreSCYG9WfR6AIcwartOTLwI8fldcBkiqrbY/9wh/UHI5zzHySLqznxmN0E27e
	CL+TVhOO2A9S47NlInzK62SsP9b7IiXAGum0KbJErYmlY66z9pmjZt/lJ/IEYVUY
	0s8pI4FRRnO0k8J6sY5OSdOg4ouZH//OI4WOka5wh84Dzu3nFqTCzDfn3u4TXjEA
	qA==
Received: (qmail 877093 invoked from network); 11 Jul 2024 16:45:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jul 2024 16:45:16 +0200
X-UD-Smtp-Session: l3s3148p1@33mez/kc+ORehhtW
Date: Thu, 11 Jul 2024 16:45:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
	Benson Leung <bleung@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Chen-Yu Tsai <wens@csie.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	chrome-platform@lists.linux.dev,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>, Hans Hu <hanshu@zhaoxin.com>,
	Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
	Jean Delvare <jdelvare@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jochen Friedrich <jochen@scram.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Shych <michaelsh@nvidia.com>, openbmc@lists.ozlabs.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Korsgaard <peter@korsgaard.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Ray Jui <rjui@broadcom.com>, Robert Richter <rric@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Scott Branden <sbranden@broadcom.com>, Stefan Roese <sr@denx.de>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Till Harbaum <till@harbaum.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	virtualization@lists.linux.dev, Vladimir Zapolskiy <vz@mleia.com>,
	Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH v2 00/60] i2c: reword first drivers according to newest
 specification
Message-ID: <Zo_v-xk3Hh_88sNa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Ajay Gupta <ajayg@nvidia.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	asahi@lists.linux.dev, Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Baruch Siach <baruch@tkos.co.il>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
	Benson Leung <bleung@chromium.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>, Chen-Yu Tsai <wens@csie.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	chrome-platform@lists.linux.dev,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Conghui Chen <conghui.chen@intel.com>,
	Eddie James <eajames@linux.ibm.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hans de Goede <hdegoede@redhat.com>, Hans Hu <hanshu@zhaoxin.com>,
	Hector Martin <marcan@marcan.st>, Heiko Stuebner <heiko@sntech.de>,
	Jean Delvare <jdelvare@suse.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jochen Friedrich <jochen@scram.de>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michael Shych <michaelsh@nvidia.com>, openbmc@lists.ozlabs.org,
	Orson Zhai <orsonzhai@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Korsgaard <peter@korsgaard.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Ray Jui <rjui@broadcom.com>, Robert Richter <rric@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Scott Branden <sbranden@broadcom.com>, Stefan Roese <sr@denx.de>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thor Thayer <thor.thayer@linux.intel.com>,
	Till Harbaum <till@harbaum.org>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	virtualization@lists.linux.dev, Vladimir Zapolskiy <vz@mleia.com>,
	Yicong Yang <yangyicong@hisilicon.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vk6JWgUmE7mz+Biu"
Content-Disposition: inline
In-Reply-To: <nbi3fngfcipt35gzguk2mh4zzh3vy5a5gsk7dti5smm2iimytl@drm7p2iqsinp>


--Vk6JWgUmE7mz+Biu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thanks for this big work, at the end it turned out quite nice and
> I'm happy of the outcome!

Me too. And thanks for the enormous review work!


--Vk6JWgUmE7mz+Biu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaP7/sACgkQFA3kzBSg
Kbbq3A/9FNY+7cgd8CU9HNabmoXmMSCsOVflmaDNapeEn/iIYZUiBBFhDcYnJczI
T429i2bK95+lup88Nhn9fzXQ4hoPFa2TuPkQ5n3M7A9hjFnAOxLmTd91uO98BfVm
8IYBr6EIu/AfX/+D6Rj1Ro1VpSwK4laze5p9WGyNjp6QIzJ+KqmRh+vf9Shg1urk
9gNjTClxMD1OjQ60X0Vr4XmDONnsK8guT/Zkkk1gtDRDC8P92Jw17/3vtuBQnwP6
S1NAFaqvdLbLKuRBsK7KwJ6oJ4sH5jq2LCiJk87GHsXnQBerXSR3AFORTQWjvEBF
6qz8rHh0/GrQklzbs/VgVlqV3NygU4D2T18NZMyLxaJAGPmDPGeL5YvcweblR0TL
yMMuXmSq7ACO+aTJgqIqt2Wx1PS4cbvSmaHUnG52eGrX28o1PgjIW5y0xGu9G5FU
Funcvt0JlI2HtC1FI2FGDsCW77U3mh3U5N5NEo7y24XPebmTVhGifj2kWp/WkA3F
UPgJdkXF0gUzDxQj3Febmvmeh3m58s+Io+3LWBncCK2eRgL4YyEaKpEegQfA43Rl
PJGODikSLI1gh/8qN/WE44DGio65TYItOJrPX3b8VwOQLCgKgwz0y+a37vy2Jd7W
X/LXLwb8txlca1gF88Bg07eWwR/jwNoHp4c/k2C80iwHtJ12Kcg=
=ribe
-----END PGP SIGNATURE-----

--Vk6JWgUmE7mz+Biu--

