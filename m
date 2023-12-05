Return-Path: <linux-i2c+bounces-609-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 651378043C6
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 02:08:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3E32B20C26
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Dec 2023 01:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86BE1111;
	Tue,  5 Dec 2023 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYmtTJ4E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63AA8ECF;
	Tue,  5 Dec 2023 01:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07912C433C8;
	Tue,  5 Dec 2023 01:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701738502;
	bh=ji6tLylEF6Fc27d4abamjU6StrnpLeztKO6gpP4JGIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYmtTJ4Efn43kisMcP71YoDOJ6Bxf1gQoIoVv44GHf7XI3FTQ58nyW5MuLDcRz1TX
	 OK2k7v8hfpq0rrtGUx8GL+g+vmoOT7ekCLY72JtwD26A0Vb7ckIXPmCAzTWlqc3dEC
	 Y+bQf6GJ358F6PzHKaKOrtjxieHlT0Mnt1uHVfek1h9DmW1ZEpFDk6COSg7vHMbjv5
	 h2YqTmHjNaOl0edFXV+CDea+X3hSH14R1ecjWCVtsT6Sw2qcSZE1oGHPLkLPxD8Nno
	 Y/H5zr3aBMjn/yhEHUji6cIJ0mTvgLWs/HBscRc+qG+A+6Y7Znc0MX3OW7zdBFotpZ
	 syeoXVek4H72g==
Date: Tue, 5 Dec 2023 02:08:16 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Wolfram Sang <wsa@kernel.org>, Tim Lunn <tim@feathertop.org>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jagan Teki <jagan@edgeble.ai>, Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on
 rv1126
Message-ID: <20231205010816.bza72xirj2xbufzu@zenone.zhora.eu>
References: <20231203124004.2676174-1-tim@feathertop.org>
 <4413905.22IY78Rhhi@diego>
 <20231203215530.mewjd7n7ltaeed3w@zenone.zhora.eu>
 <4850448.MsWZr2WtbB@diego>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4850448.MsWZr2WtbB@diego>

Hi Heiko,

On Mon, Dec 04, 2023 at 12:36:43PM +0100, Heiko Stübner wrote:
> Am Sonntag, 3. Dezember 2023, 22:55:30 CET schrieb Andi Shyti:
> > On Sun, Dec 03, 2023 at 08:48:43PM +0100, Heiko Stübner wrote:
> > > Am Sonntag, 3. Dezember 2023, 20:06:20 CET schrieb Andi Shyti:
> > > > On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> > > > > Rockchip RV1126 is using old style i2c controller, the i2c2
> > > > > bus uses a non-sequential offset in the grf register for the
> > > > > mask/value bits for this bus.
> > > > > 
> > > > > This patch fixes i2c2 bus on rv1126 SoCs.
> > > > > 
> > > > > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > > > > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > > > 
> > > > Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> > > 
> > > you're listed as the maintainer for the i2c busses,
> > > are you going to pick this one patch yourself?
> > > Or do you expect a different handling?
> > > 
> > > I.e. it doesn't really tie into the dts patches and everything will come
> > > together nicely in linux-next and during the next merge-window.
> > 
> > Wolfram are you going to take this?
> 
> I was going by get_maintainer.pl showing
> Andi Shyti <andi.shyti@kernel.org> (maintainer:I2C SUBSYSTEM HOST DRIVERS)
> 
> hence the question :-)

Ack, patch 3 we will take it through i2c.

Thanks,
Andi

