Return-Path: <linux-i2c+bounces-14609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2609CC500A
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 20:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4EF2304DE99
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC1D931B810;
	Tue, 16 Dec 2025 19:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7rjhCKb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536FC1DF254;
	Tue, 16 Dec 2025 19:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765912899; cv=none; b=FzpAbyb8isNiCooHtPUMZbY4IyV4MxCtXzKFg1CmUN6xc47pJ3IerjN7cDYiizber9HN2iVCjQfDn737brVURTATgC5hdHoUnJ0ndIxD1iGeao9Nc+1z573i6felWmOlZAFUYKxAsbIitlqmVsX9Wpnx3PXoB0WZM48BrWPGLE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765912899; c=relaxed/simple;
	bh=Xoj2+UZBr810qOacTHbN7kBbTeg1yhj8owJTmFMj32g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFLcnkpazQ7tZQFN5YQwh46tatpBkUswPVXaoOQo1+YO3I24BpnqcBtpPCXTwiIFKn+Y6XwD00ikRp8jvJhs549alnC1tKBQYy5lFr/sErsR6tH2M+EFWkosOAV2WTvd6+LPg5rhsx2qvr4QjBwrCYhw5eBPugR1cpTm2tK51d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7rjhCKb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1208BC4CEF1;
	Tue, 16 Dec 2025 19:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765912898;
	bh=Xoj2+UZBr810qOacTHbN7kBbTeg1yhj8owJTmFMj32g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V7rjhCKbB/vu0XS/uMJiwkm0SvqcuzVP/cGwOIIEK3MyQdAOcaVzSFt/L5ikrj/4o
	 GzPqixeIPCQ61GrT6ifZcmXe7dhLT3Pp0RuX9sih9mHW7DZxUYfgm/lvWzJ5zg3qSH
	 Ou6CKZgudcSESlPUUZAICKHYDHC7ebJNXbmrIMK8rZB1MEKh/BguckGSHgBZKJ3+T7
	 j1V5j3Xm1/3X3q8S2dF3wEi8o6DUrx59VLuLS0xh7YXsvk4/dViiqV1R32DPPaO1l6
	 ocUwovLUpWEmF6lF2R1amgLR2abM5UV2kebe/JeEghKPrnH5vIg0jb+gV0kc4oiXKo
	 H46+2OIPVwYyw==
Date: Tue, 16 Dec 2025 19:21:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, herbert@gondor.apana.org.au,
	davem@davemloft.net, vkoul@kernel.org, linux@roeck-us.net,
	andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linusw@kernel.org, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	richardcochran@gmail.com, wsa+renesas@sang-engineering.com,
	romain.sioen@microchip.com, Ryan.Wanner@microchip.com,
	lars.povlsen@microchip.com, tudor.ambarus@linaro.org,
	charan.pedumuru@microchip.com, kavyasree.kotagiri@microchip.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org, mwalle@kernel.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 04/19] dt-bindings: arm: move AT91 to generic
 Microchip binding
Message-ID: <20251216-underarm-trapped-626f16d856f5@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-4-robert.marko@sartura.hr>
 <202512161628415e9896d1@mail.local>
 <CA+HBbNFG+xNokn5VY5G6Cgh41NZ=KteRi0D9c0B15xb77mzv8w@mail.gmail.com>
 <202512161726449fe42d71@mail.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JMGrDU/kSkSLVB0U"
Content-Disposition: inline
In-Reply-To: <202512161726449fe42d71@mail.local>


--JMGrDU/kSkSLVB0U
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 06:26:44PM +0100, Alexandre Belloni wrote:
> On 16/12/2025 17:56:20+0100, Robert Marko wrote:
> > On Tue, Dec 16, 2025 at 5:29=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 15/12/2025 17:35:21+0100, Robert Marko wrote:
> > > > Create a new binding file named microchip.yaml, to which all Microc=
hip
> > > > based devices will be moved to.
> > > >
> > > > Start by moving AT91, next will be SparX-5.
> > >
> > > Both lines of SoCs are designed by different business units and are
> > > wildly different and while both business units are currently owned by
> > > the same company, there are no guarantees this will stay this way so I
> > > would simply avoid merging both.
> >=20
> > Hi Alexandre,
> >=20
> > The merge was requested by Conor instead of adding a new binding for LA=
N969x [1]
> >=20
> > [1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/2025120=
3122313.1287950-2-robert.marko@sartura.hr/
> >=20
>=20
> I would still keep them separate, SparX-5 is closer to what is
> devicetree/bindings/mips/mscc.txt than to any atmel descended SoCs.

If you don't want the sparx-5 stuff in with the atmel bits, that's fine,
but I stand over my comments about this lan969x stuff not getting a file
of its own.
Probably that means putting it in the atmel file, alongside the lan966x
boards that are in there at the moment.

--JMGrDU/kSkSLVB0U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGxNwAKCRB4tDGHoIJi
0jgGAP9HJZaoV7xZYsaM1xS+0iOnONpVazsKajaX+Wy9Nh+ezwEAykBqiV2aIKsr
xWT86r0yfYAICF0tcUEqk72s7JY0GgE=
=5GBE
-----END PGP SIGNATURE-----

--JMGrDU/kSkSLVB0U--

