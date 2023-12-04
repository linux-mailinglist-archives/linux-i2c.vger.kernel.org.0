Return-Path: <linux-i2c+bounces-604-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 638E0803199
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 12:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B6241F20FED
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 11:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EBD22F04;
	Mon,  4 Dec 2023 11:37:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01066B0;
	Mon,  4 Dec 2023 03:36:55 -0800 (PST)
Received: from i53875b61.versanet.de ([83.135.91.97] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rA7Fk-0004Ac-MV; Mon, 04 Dec 2023 12:36:44 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Tim Lunn <tim@feathertop.org>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Jagan Teki <jagan@edgeble.ai>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-i2c@vger.kernel.org
Subject:
 Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Mon, 04 Dec 2023 12:36:43 +0100
Message-ID: <4850448.MsWZr2WtbB@diego>
In-Reply-To: <20231203215530.mewjd7n7ltaeed3w@zenone.zhora.eu>
References:
 <20231203124004.2676174-1-tim@feathertop.org> <4413905.22IY78Rhhi@diego>
 <20231203215530.mewjd7n7ltaeed3w@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Am Sonntag, 3. Dezember 2023, 22:55:30 CET schrieb Andi Shyti:
> Hi,
>=20
> On Sun, Dec 03, 2023 at 08:48:43PM +0100, Heiko St=FCbner wrote:
> > Hi Andi,
> >=20
> > Am Sonntag, 3. Dezember 2023, 20:06:20 CET schrieb Andi Shyti:
> > > Hi Tim,
> > >=20
> > > On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> > > > Rockchip RV1126 is using old style i2c controller, the i2c2
> > > > bus uses a non-sequential offset in the grf register for the
> > > > mask/value bits for this bus.
> > > >=20
> > > > This patch fixes i2c2 bus on rv1126 SoCs.
> > > >=20
> > > > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > >=20
> > > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> >=20
> > you're listed as the maintainer for the i2c busses,
> > are you going to pick this one patch yourself?
> > Or do you expect a different handling?
> >=20
> > I.e. it doesn't really tie into the dts patches and everything will come
> > together nicely in linux-next and during the next merge-window.
>=20
> Wolfram are you going to take this?

I was going by get_maintainer.pl showing
Andi Shyti <andi.shyti@kernel.org> (maintainer:I2C SUBSYSTEM HOST DRIVERS)

hence the question :-)



