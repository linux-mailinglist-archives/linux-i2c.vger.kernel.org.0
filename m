Return-Path: <linux-i2c+bounces-482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3C47FACE6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 22:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 930ADB21397
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 21:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F332B46550;
	Mon, 27 Nov 2023 21:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hXjes13U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41146456;
	Mon, 27 Nov 2023 21:57:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010A3C433C8;
	Mon, 27 Nov 2023 21:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701122257;
	bh=QXQkJS6YNg1DGqHzWpDvNBBwbklJYKJXSUCjijBVtSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hXjes13UVbZDddAPPj4XZ69gRVkvRvJWZvTx8B+LYPj/lg9v9fzn6pZ9AYgOI9Yyw
	 Ucoa8IHxW4zE/IeuB7AEa6CiVa/apJYtrn7x18W0/xKWESgW6UassuTBe9AFazSmGx
	 NwoEkyusfIMPf8hWzvHNQixzJO/QkWLHNlEfS2k4mFF6Ut4HSlU3sR8JCS4Tpg/efc
	 xZfNpb46rgUQuQ2EKWNgF2riWaazXqK0GbATCiivu31A/4ZaTPasXRLFio+tvP+8Ce
	 s2Kr1ejfE8rqr2FOw4SX9O8ZXFRa43r4YfIzGUVQIlL2AFHVahUpUFUqino3k3PzBA
	 YZPUlhj/0Vl3Q==
Date: Mon, 27 Nov 2023 22:57:32 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tim Lunn <tim@feathertop.org>
Cc: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 3/9] i2c: rk3x: Adjust offset for i2c2 on rv1126
Message-ID: <20231127215732.l7ib24u3lgdy5cfr@zenone.zhora.eu>
References: <20231122122232.952696-1-tim@feathertop.org>
 <20231122122232.952696-4-tim@feathertop.org>
 <20231126194311.jxkvz3kqgsbzfgek@zenone.zhora.eu>
 <4717511.tIAgqjz4sF@diego>
 <69e4609d-689d-4f03-b5f7-d3563ace185b@feathertop.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69e4609d-689d-4f03-b5f7-d3563ace185b@feathertop.org>

Hi Heiko and Tim,

On Mon, Nov 27, 2023 at 09:11:57PM +1100, Tim Lunn wrote:
> On 11/27/23 11:26, Heiko Stübner wrote:
> > Am Sonntag, 26. November 2023, 20:43:11 CET schrieb Andi Shyti:
> > > On Wed, Nov 22, 2023 at 11:22:26PM +1100, Tim Lunn wrote:
> > > > Rockchip RV1126 has special case mask bits for i2c2.
> > > > 
> > > > i2c2 wasnt previously enabled in rv1126.dtsi, adding DT node alone
> > > > is not sufficient to enable i2c2. This patch fixes the i2c2 bus.
> > > If I don't have sufficient information about the hardware this
> > > description is completely meaningless to me.
> > > 
> > > > Signed-off-by: Tim Lunn <tim@feathertop.org>
> > > > ---
> > > > 
> > > > Changes in v2:
> > > > - i2c: clarify commit message
> > > > 
> > > >   drivers/i2c/busses/i2c-rk3x.c | 7 +++++--
> > > >   1 file changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
> > > > index a044ca0c35a1..151927466d1d 100644
> > > > --- a/drivers/i2c/busses/i2c-rk3x.c
> > > > +++ b/drivers/i2c/busses/i2c-rk3x.c
> > > > @@ -1288,8 +1288,11 @@ static int rk3x_i2c_probe(struct platform_device *pdev)
> > > >   			return -EINVAL;
> > > >   		}
> > > > -		/* 27+i: write mask, 11+i: value */
> > > > -		value = BIT(27 + bus_nr) | BIT(11 + bus_nr);
> > > > +		if (i2c->soc_data == &rv1126_soc_data && bus_nr == 2)
> > > > +			value = BIT(20) | BIT(4);
> > > Any chance to put a comment here as it is in the other
> > > assignment?
> > > 
> > > Are the two assignment mutually exclusive?
> Yes they are mutually exclusive, and its only i2c2 that is non-sequential
> (as per Heikos description below).
> > > 
> > > Heiko, any chance to take a look here?
> > So the background is, that on some SoCs Rockchip implemented to
> > different variants for the i2c controller. One new-style controller
> > that they started using in rk3066 and are using even today.
> > 
> > For these old socs they kept the "old" controller block as a sort
> > of fallback if the new thing didn't work out, and the bit above is
> > switching between the
> > 
> > Hence that is limited to rk3066, rk3188 and seemingly the rv1126.
> > And while the bits controlling the i2c controllers on the original socs
> > are order sequentially in the grf register, the rv1126 seems to have
> > those bits in non-consequtive places.
> > 
> > 
> > So TL;DR the change itself is likely good, and hopefully there won't
> > be any more of those, as all the new socs don't need this anymore.
> rv1108 is also similar but different bits again (only going off the BSP
> sources).
> I dont have hardware or the TRM to validate this on rv1108.
> > 
> > I do agree with the request for a comment describing the issue
> > in the code, but otherwise
> 
> I will fix this.
> 
> > Acked-by: Heiko Stuebner <heiko@sntech.de>

Thanks for your ack and answer. Will wait, then for Tim's v2.

Andi

