Return-Path: <linux-i2c+bounces-469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3377F96CB
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 01:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65381C20846
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 00:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CDA364;
	Mon, 27 Nov 2023 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-i2c@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B4FF0;
	Sun, 26 Nov 2023 16:26:23 -0800 (PST)
Received: from i53875bf8.versanet.de ([83.135.91.248] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1r7PS2-0003nk-BA; Mon, 27 Nov 2023 01:26:14 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tim Lunn <tim@feathertop.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/9] i2c: rk3x: Adjust offset for i2c2 on rv1126
Date: Mon, 27 Nov 2023 01:26:13 +0100
Message-ID: <4717511.tIAgqjz4sF@diego>
In-Reply-To: <20231126194311.jxkvz3kqgsbzfgek@zenone.zhora.eu>
References:
 <20231122122232.952696-1-tim@feathertop.org>
 <20231122122232.952696-4-tim@feathertop.org>
 <20231126194311.jxkvz3kqgsbzfgek@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andi,

Am Sonntag, 26. November 2023, 20:43:11 CET schrieb Andi Shyti:
> Hi Tim,
> 
> On Wed, Nov 22, 2023 at 11:22:26PM +1100, Tim Lunn wrote:
> > Rockchip RV1126 has special case mask bits for i2c2.
> > 
> > i2c2 wasnt previously enabled in rv1126.dtsi, adding DT node alone
> > is not sufficient to enable i2c2. This patch fixes the i2c2 bus.
> 
> If I don't have sufficient information about the hardware this
> description is completely meaningless to me.
> 
> > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > ---
> > 
> > Changes in v2:
> > - i2c: clarify commit message
> > 
> >  drivers/i2c/busses/i2c-rk3x.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> > index a044ca0c35a1..151927466d1d 100644
> > --- a/drivers/i2c/busses/i2c-rk3x.c
> > +++ b/drivers/i2c/busses/i2c-rk3x.c
> > @@ -1288,8 +1288,11 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> >  			return -EINVAL;
> >  		}
> >  
> > -		/* 27+i: write mask, 11+i: value */
> > -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
> > +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
> > +			value = BIT(20) | BIT(4);
> 
> Any chance to put a comment here as it is in the other
> assignment?
> 
> Are the two assignment mutually exclusive?
> 
> Heiko, any chance to take a look here?

So the background is, that on some SoCs Rockchip implemented to
different variants for the i2c controller. One new-style controller
that they started using in rk3066 and are using even today.

For these old socs they kept the "old" controller block as a sort
of fallback if the new thing didn't work out, and the bit above is
switching between the 

Hence that is limited to rk3066, rk3188 and seemingly the rv1126.
And while the bits controlling the i2c controllers on the original socs
are order sequentially in the grf register, the rv1126 seems to have
those bits in non-consequtive places.


So TL;DR the change itself is likely good, and hopefully there won't
be any more of those, as all the new socs don't need this anymore.

I do agree with the request for a comment describing the issue
in the code, but otherwise

Acked-by: Heiko Stuebner <heiko@sntech.de>



