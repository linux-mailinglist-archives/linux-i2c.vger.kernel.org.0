Return-Path: <linux-i2c+bounces-894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3468193E4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 23:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41C951F26E00
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 22:53:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6CA73D0AB;
	Tue, 19 Dec 2023 22:53:38 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57AF3B295;
	Tue, 19 Dec 2023 22:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b78.versanet.de ([83.135.91.120] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rFixj-0002E6-VR; Tue, 19 Dec 2023 23:53:20 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Wolfram Sang <wsa@kernel.org>, Tim Lunn <tim@feathertop.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Jagan Teki <jagan@edgeble.ai>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject:
 Re: [PATCH v3 3/8] i2c: rk3x: Adjust mask/value offset for i2c2 on rv1126
Date: Tue, 19 Dec 2023 23:53:18 +0100
Message-ID: <3368267.VdNmn5OnKV@diego>
In-Reply-To: <ZYHNkgxAauYp6ivX@shikoro>
References:
 <20231203124004.2676174-1-tim@feathertop.org>
 <20231203124004.2676174-4-tim@feathertop.org> <ZYHNkgxAauYp6ivX@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Wolfram,

Am Dienstag, 19. Dezember 2023, 18:06:26 CET schrieb Wolfram Sang:
> On Sun, Dec 03, 2023 at 11:39:59PM +1100, Tim Lunn wrote:
> > Rockchip RV1126 is using old style i2c controller, the i2c2
> > bus uses a non-sequential offset in the grf register for the
> > mask/value bits for this bus.
> > 
> > This patch fixes i2c2 bus on rv1126 SoCs.
> > 
> > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > Acked-by: Heiko Stuebner <heiko@sntech.de>
> > 
> 
> Applied to for-next, thanks!
> 
> But, phew, the fact that this driver _needs_ i2c-aliases in DT should be
> fixed somewhen. I totally overlooked this so far :/

Yeah, relying on aliases for this is probably not the most elegant thing
to do ;-)

Though right now I don't see the perfect way to change that.
Options I can think of, could be:

(1) As this really is "just" a thing for older socs that offer both a very
legacy i2c and the more modern one we use, I guess one possibility
would be to move this completely out of the i2c driver and into the
"grf-cleanup" driver [0].

We never actually implemented the "old"-style i2c driver for rk29xx
and earlier - and that thing is more than 10 years old now, so noone ever
will. So we always want to switch to the new one anyway in the kernel.


(2) The other option would be to try to identify the busses by their
address. We do this in some places, like the dsi driver [1]
with the entry matched against the reg property.


I guess from a "being done with it" perspective, the first option
would be nicer ;-) .

Thoughts?
Heiko


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/rockchip/grf.c
That code does a number of settings the in the "General Register Files"
that we simply expect, so also doing the i2c controller switch there
for all i2c busses in one go would make sense.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c#n1586



