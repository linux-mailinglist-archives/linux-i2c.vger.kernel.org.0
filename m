Return-Path: <linux-i2c+bounces-576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C9B800AC2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 13:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC3D281B13
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Dec 2023 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC7224B4B;
	Fri,  1 Dec 2023 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wgpDfuTX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C902D48;
	Fri,  1 Dec 2023 04:19:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F1E6556;
	Fri,  1 Dec 2023 13:18:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701433120;
	bh=4MUNcOQBhQ9lYXfZUQpJ2ICebkBlDtfeSr3V13uLiuA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=wgpDfuTXlQl1aB/QrNafqAMOG2vNQ5/r0cLspEXbyjKlXWQhadqEHkre9DAomehoY
	 2896x+IepeF31RB3rrkWj0KUBueFqswNcslY3FWcc5Y+xpBBcuNvaEGt68zmLOaEO3
	 5v7/C8SWqAOYwpiVc3SXxBLpILtWYdZYYz8NtgnA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1464986273-12039-1-git-send-email-pantelis.antoniou@konsulko.com>
References: <1464986273-12039-1-git-send-email-pantelis.antoniou@konsulko.com>
Subject: Re: [RFC 0/3] Portable Device Tree Connector
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, Wolfram Sang <wsa@the-dreams.de>, Stephen Boyd <stephen.boyd@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robherring2@gmail.com>
Date: Fri, 01 Dec 2023 12:19:14 +0000
Message-ID: <170143315452.2829918.3199477991260309208@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Hi Pantelis,

Digging out a thread from 2016!

Quoting Pantelis Antoniou (2016-06-03 21:37:50)
> This patchset introduces a portable device tree based connector.
> It allows definition of a connector in a portable format so that
> hardware expansion boards that utilize it can use the same
> DT hardware definitions unchanged for all the boards that
> have the same kind of connector.
>=20
> It completely abstracts away the baseboard implementation details
> and allows one to describe the expansion board in it's isolated
> domain without having to figure out the per-board specific
> hardware configuration.
>=20
> The first patchset is the implementation while the next two
> define a connector for the beaglebone board.
>=20
> There was a session at ELC2016 with the slides at
> http://elinux.org/images/d/d0/Panto.pdf
>=20
> This patchset is dependent on the previous two patchset I sent out
> some time ago.
>=20
> "of: dynamic: Changesets helpers & fixes"
> "gpio: of: Support cascaded GPIO"

Did you go anywhere with this since 2016?

As you perhaps saw on the other thread - we're starting to hit an
explosion of combinatorial arangements of cameras that can be connected
to and supported on different platforms, thanks in part due to the
non-standardised but maybe defacto camera standard port cable on RPi (in
two variations, 15pin with 2 lanes, and 22 pin with 4 data lanes).

I'm wondering how we can build upon or resume this work with DT
connectors to support expressing camera modules independently from the
platform they connect to.

The port/connector usually expects an i2c bus, a gpio to enable power
regulators on the module and perhaps one additional optional gpio, and
then the clock and data lanes for the MIPI port link.

Any thoughts welcome - and if there was any newer work to build upon or
resurrect I'd be happy to help test, or find time to start looking at
how we could build this.

Or of course if there was any reason this work was abandoned (not
feasible, not acceptable) I'd be keen to hear this before diving in!

Thanks and Regards

Kieran


> Pantelis Antoniou (3):
>   of: Portable Device Tree connector
>   dts: Beaglebone portable connector definitions
>   dts: beaglebone: Portable connector BB_RELAY_4PORT definition
>=20
>  arch/arm/boot/dts/am335x-bone-common.dtsi | 1678 +++++++++++++++++++++++=
++++++
>  drivers/extcon/Kconfig                    |   20 +
>  drivers/extcon/Makefile                   |    3 +
>  drivers/extcon/extcon-dt-con-gpio.c       |  337 ++++++
>  drivers/extcon/extcon-dt-con-proxy.c      |  480 +++++++++
>  drivers/extcon/extcon-dt-con.c            |  491 +++++++++
>  drivers/extcon/extcon-dt-con.h            |   93 ++
>  7 files changed, 3102 insertions(+)
>  create mode 100644 drivers/extcon/extcon-dt-con-gpio.c
>  create mode 100644 drivers/extcon/extcon-dt-con-proxy.c
>  create mode 100644 drivers/extcon/extcon-dt-con.c
>  create mode 100644 drivers/extcon/extcon-dt-con.h
>=20
> --=20
> 1.7.12

