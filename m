Return-Path: <linux-i2c+bounces-2442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D852C880E7D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 10:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141E51C20C6D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021D23A1DD;
	Wed, 20 Mar 2024 09:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRizieSJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B9338F84;
	Wed, 20 Mar 2024 09:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710926712; cv=none; b=JTgLIna10dPztAOADsBxFcka+rruarpN11XYDhnvorT8RpJ703QDXBZX3p6dz2Z7blumr7R/0EGl9a9oEvmWMl0lkICU/eK/0sM57wVU2rJXFnAzp1AeK4uMWPllX9Tp0cnUsxsDbT0t6i0r/HGAuD5kNdvjVcSq1z7ncK3qs8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710926712; c=relaxed/simple;
	bh=FQoGAbwlTf0DJp74wmNZ8hBAIlA3qiBZofpLLvehAV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ARSj+awVojKkOWD95CQ8B5SteILox2bt8Q5njOcYOn/6HkQxwtKnyaa3YvIp2SEQ1A1uxvzT863Y1O6BMn8tvUbyynDBXoUYKOYS+XXKxBooqWDLvW+rfaHv40dVgujRmTfooS1vNKDGJKSWSQDJcRnBL0LKN7/YQ1v3tA4ibc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRizieSJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A43C433F1;
	Wed, 20 Mar 2024 09:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710926711;
	bh=FQoGAbwlTf0DJp74wmNZ8hBAIlA3qiBZofpLLvehAV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRizieSJrS6bjBiIuwTA68WJHWac0tFbO1F/jjbC16LF+ocZ7VmqO5eFLF6ik6mt7
	 6g7m4Ly/59vXk7j+ClMNKF6XYbn2qi1XmoFQtiEY0JWpzzktui6yuOW2kc8EsdGygr
	 WWGhTIDREfnzJDNiu7uoJAdgYTduoSuuGLnNSBorNlzy1PYvtmdUPaopmT0p9GztTu
	 Ur19mh/kD6K6r8kxGU3GHZkPerZNeAN4alz8IoCwILG7PZsAv2wUw/cZa8C3I0f0Me
	 1AtZRmaWKN71sawoNkWx/uA493m5YJMk2K33hdBxTPIzeS/Zm03GnUGytZLV07xQZs
	 GoQx9rD/TCgVw==
Date: Wed, 20 Mar 2024 10:25:07 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: dt-bindings: Convert Omnivision OV7251 to DT
 schema
Message-ID: <Zfqrc8Td3Qmgq4RV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20230817202713.2180195-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HXEdzY5eZHUH4YXG"
Content-Disposition: inline
In-Reply-To: <20230817202713.2180195-1-robh@kernel.org>


--HXEdzY5eZHUH4YXG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 17, 2023 at 03:27:13PM -0500, Rob Herring wrote:
> Convert the OmniVision OV7251 Image Sensor binding to DT schema format.
>=20
> vddd-supply was listed as required, but the example and actual user
> don't have it. Also, the data brief says it has an internal regulator,
> so perhaps it is truly optional.
>=20
> Add missing common "link-frequencies" which is used and required by the
> Linux driver.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Trivial fix. Applied to for-current, thanks!


--HXEdzY5eZHUH4YXG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6q3AACgkQFA3kzBSg
KbalNQ//edfA8JCnaVWkPGemvl1pFfVEwgQRgajixyU6z3u/1a3rSnRLoTvkutkb
mA7Ak3V6f4ZohnyIR3NIzEIilxf155M0J8RqVLeqObQwzakDkoC/fLWADSCYKbd8
N9WBokOQcp0TA2NY4ra7EXqMwiMXtTiloEw7iOvnnDwIvsLzxGI4wUcdEY0RaXkG
TT9nUypvLXSmgPJXhpAlFGG8Py9bbG2Xq69GxjE3uPMDgpzkAJl8QPvYNPiyuxp9
N/FvgtqeCMgV9g++qgpbYaeZ9YPwGoVoAIJMKJmgPFmitiCuvGL0BkJzCTjCTINZ
xcgzr8e9yysjx6NKUrbQiQghcf2U4oE42L7f+oFTgP6q7X5LVEGiwNGNGzMdBb4X
zsgc7by7r1JexOScTPLaTQEe5h5H9xHKyEAVbUGGMlIyaBvOTDlImIbY03N31qJZ
d0fHiQenVwyP7boiaeK1dYEEJ7Wx4RkC4N0xNL44ChIk/q0/pwnlLfVs3H336mW8
dicO3+jR0a5hxUh7xc3rCP695wp4h1FORlsDMySyof3OjB2AO5i98qCKzYRhxmz9
tg8Enm13q2h/ry4V5q+Xosjep7UPysvHllko1LMPsvF7CBDOE+xkqwRW6S4Kq+eJ
6hD2iTe3E142WhCPPj6rzZm7trz1owCCPwSyZQm6CfUWr7VI6gg=
=/7Gw
-----END PGP SIGNATURE-----

--HXEdzY5eZHUH4YXG--

