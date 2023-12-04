Return-Path: <linux-i2c+bounces-601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C2802D42
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 09:35:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 807AB280E52
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Dec 2023 08:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC8C6FBE8;
	Mon,  4 Dec 2023 08:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="LOcP4pMi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B99FFE
	for <linux-i2c@vger.kernel.org>; Mon,  4 Dec 2023 00:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1701678904; x=1733214904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PlzrlkVoA5Lfv0X7MHh6wW4mKXUNL0QZHsEIe75p8gg=;
  b=LOcP4pMiFQjDqCmVBoA51uNQBKC+UrKj1A2H8URLLabvVxmjTMQ+wCmC
   7r/W0iUa39XgmfcBkw2cGqWm385yu8mpMR0LYGvtnZc4IvKzpwfvVpH7E
   AJxspff0GlyDtPwg47AsII740aIY9NQ+BKxLeUcL9kZYihMTGpB3PMXc1
   mh4D1AndGnVqCD8kAMgGTJrJ82e2q0vXcAhKnLG+InWmbAKlx3Et8aKIP
   Mr10r3Wzy8ZZE+K1yELF+apjG5/wYMjzfZmp/ZEl/rp82lEa5Joz8c42g
   xo8IjFRiI2CskbaHCM1fmeFyUzICCbGwzBHJsxp2hyVVJ3PCEFx/sZy5J
   A==;
X-IronPort-AV: E=Sophos;i="6.04,249,1695679200"; 
   d="scan'208";a="34303926"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 04 Dec 2023 09:35:01 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 966D8280075;
	Mon,  4 Dec 2023 09:35:01 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] i2c: imx: Make SDA actually optional for bus recovering
Date: Mon, 04 Dec 2023 09:35:00 +0100
Message-ID: <12335412.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231203220444.thaeuyqyv36hpv2y@zenone.zhora.eu>
References: <20231130095751.65773-1-alexander.stein@ew.tq-group.com> <20231203220444.thaeuyqyv36hpv2y@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

Am Sonntag, 3. Dezember 2023, 23:04:44 CET schrieb Andi Shyti:
> Hi,
>=20
> On Thu, Nov 30, 2023 at 10:57:51AM +0100, Alexander Stein wrote:
> > Both i2c_generic_scl_recovery() and the debug output indicate that SDA =
is
> > purely optional for bus recovery. But devm_gpiod_get() never returns NU=
LL
> > making it mandatory. Fix this my calling devm_gpiod_get_optional instea=
d.
>=20
>                                ^^^^
> as Uwe pointed out, /my/by/.
>=20
> I think Wolfram can fix this before taking it.
>=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>=20
> otherwise:
>=20
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks. Let me know if I should send a v2.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



