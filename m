Return-Path: <linux-i2c+bounces-14788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DA5CDF8C4
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 12:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E3CBB3001628
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Dec 2025 11:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FEA311C31;
	Sat, 27 Dec 2025 11:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mp7Vf87Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CC92853E9;
	Sat, 27 Dec 2025 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834242; cv=none; b=uhe4DrJrk75m79+0UDM0BwCiS6ANvW8eGqYX61HQFEfOkNRvX2TeCyB52HECIZmkz9gpit9gLJBJZPpNBOm9V3HX24+XspYGkYfS8WhsqYG1ki22Y153sU81Fz3neAv+zZJS1aer2zUhlDQRjfymETOPyL6SLa1BDrPQ8tuDHWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834242; c=relaxed/simple;
	bh=mkTJBdGWaaGFXpk4ABan/EOXP8frmcAGWpzfe9DTQsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHdvuj2XjjAJUdzKsASVVjPnTmzXKv0m8dNl+CQdZxXSe1HLlFDbCXsKPV9eUur4dK/dm3kgTtrZHXIVqPBY4YsorIRmVKlu4yv2Nh+vm21pp69jPbjnRQ5XWJmIQCxnoGdp3RNTprAbmc/9KYc2Fx9On5/StfvYvCH++XGaa0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mp7Vf87Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F9FCC4CEF1;
	Sat, 27 Dec 2025 11:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766834241;
	bh=mkTJBdGWaaGFXpk4ABan/EOXP8frmcAGWpzfe9DTQsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mp7Vf87QB6NclKUBLSZgG25HwjCXi0w1BFQg/Xi32LC2n/3/VELl6cCodVL+Uaohv
	 knt2f4OAFECmBI2yR6QaJKc4Fu3a0RgdjeQelMCbEngpVtwWKTYTsHw2W1Iz+bxEWv
	 0zWs04mKwiyvgUvPwIasj1QjjKsDJq89hdt7OjelzvGxzL+3ihvEu5fdHBabQtgXr8
	 DllSXXTp5/+fVCOegZ18LBeyKqUAgJDvKyYQhRds9kFnFYu05Qmf5FSqSpvj2eGiJS
	 UXpqSihw//fBPaMJNj+nca6ZTcB88RkYwMxJpkTmCUhvWbKSEP90A++xF9C0FO43Cv
	 F68a/aRlgpAVQ==
Date: Sat, 27 Dec 2025 12:17:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com, 
	claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
	vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, andrew+netdev@lunn.ch, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, linusw@kernel.org, 
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
	olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, lars.povlsen@microchip.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-clk@vger.kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v3 01/15] include: dt-bindings: add LAN969x clock bindings
Message-ID: <20251227-splendid-striped-starfish-ece074@quoll>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
 <20251223201921.1332786-2-robert.marko@sartura.hr>
 <20251224-berserk-mackerel-of-snow-4cae54@quoll>
 <CA+HBbNGym6Q9b166n-P=h_JssOHm0yfyL73JZ+G9P81muK=g4A@mail.gmail.com>
 <78bf252c-fd5e-4a36-b1a3-ca8ed26fde7a@kernel.org>
 <CA+HBbNG+ZVD6grGDp32Ninx7H1AyEbGvP0nwc0zUv94tOV8hYg@mail.gmail.com>
 <d210552f-c8bf-4084-9317-b743075d9946@kernel.org>
 <2025122516245554f59e2e@mail.local>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2025122516245554f59e2e@mail.local>

On Thu, Dec 25, 2025 at 05:24:55PM +0100, Alexandre Belloni wrote:
> On 25/12/2025 09:47:34+0100, Krzysztof Kozlowski wrote:
> > On 24/12/2025 15:01, Robert Marko wrote:
> > > On Wed, Dec 24, 2025 at 2:05=E2=80=AFPM Krzysztof Kozlowski <krzk@ker=
nel.org> wrote:
> > >>
> > >> On 24/12/2025 11:30, Robert Marko wrote:
> > >>> On Wed, Dec 24, 2025 at 11:21=E2=80=AFAM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > >>>>
> > >>>> On Tue, Dec 23, 2025 at 09:16:12PM +0100, Robert Marko wrote:
> > >>>>> Add the required LAN969x clock bindings.
> > >>>>
> > >>>> I do not see clock bindings actually here. Where is the actual bin=
ding?
> > >>>> Commit msg does not help me at all to understand why you are doing=
 this
> > >>>> without actual required bindings.
> > >>>
> > >>> I guess it is a bit confusing, there is no schema here, these are t=
he
> > >>> clock indexes that
> > >>> reside in dt-bindings and are used by the SoC DTSI.
> > >>
> > >> I understand as not used by drivers? Then no ABI and there is no poi=
nt
> > >> in putting them into bindings.
> > >=20
> > > It is not included by the driver directly, but it requires these exact
> > > indexes to be passed
> > > so its effectively ABI.
> >=20
> > How it requires the exact index? In what way? I do not see anything in
> > the gck driver using/relying on these values. Nothing. Please point me
> > to the line which directly uses these values.... or how many times I
> > will need to write this is not ABI?
> >=20
>=20
> The index here is the exact id that needs to be set in the PMC_PCR
> register and so it is dictated by the hardware.

So not a binding between Linux and DTS.

Best regards,
Krzysztof


