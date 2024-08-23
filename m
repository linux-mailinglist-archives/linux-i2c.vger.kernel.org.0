Return-Path: <linux-i2c+bounces-5744-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C5C95CF63
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 16:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0548F1C2211F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 14:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BDF1A2C0E;
	Fri, 23 Aug 2024 14:05:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFC51A2567
	for <linux-i2c@vger.kernel.org>; Fri, 23 Aug 2024 14:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724421917; cv=none; b=mMzyKzMjmk5t/QSVAXkK3Ns/o276/cJ0mbMS919FHUZ28VPjgRHijDXn25VSvI4WGlHcHBT+qrXyw9otYVMxusKIW3GwnhmtAPiDvZPlvBgWcaTYYGGwukR7qRuquG2ZlAtczkA7mzTXPD/RBaWKY3dw6w5VtGbykDD3NTP8KBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724421917; c=relaxed/simple;
	bh=AqkOfvfNc9NvSgAbdMoj8rgdg2S7o/v1UgIhgeSl2/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjPvYdcnBy7oGI41nKoKjmhwkm7B0o4XC1bj8AIBmJZsEHzcEKXMJXGY0eq54OdUGkFD4Ycr34UzRaA79W26gd+uIlr7f16O6nnAOVVwKnnRZFKDdhWgf/4lQGtmyKVs1gWCBu7xxX4Aw2xpa91BQ6iWu0VYmtNmI3VOX9nw7XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1shUuS-0001dh-AO; Fri, 23 Aug 2024 16:05:00 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1shUuQ-002UxU-VB; Fri, 23 Aug 2024 16:04:58 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1shUuQ-001dQP-2U;
	Fri, 23 Aug 2024 16:04:58 +0200
Date: Fri, 23 Aug 2024 16:04:58 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZsiXCqNOs0dHF379@pengutronix.de>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
 <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
 <ZsiTMITWF0Tj3o8Q@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZsiTMITWF0Tj3o8Q@eichest-laptop>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Aug 23, 2024 at 03:48:32PM +0200, Stefan Eichenberger wrote:
> Hi Andi,
> 
> On Fri, Aug 23, 2024 at 02:35:54AM +0200, Andi Shyti wrote:
> > Hi,
> > 
> > On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> > > On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > > > Hi Andi,
> > > > 
> > > > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > > > Hi Stefan,
> > > > > 
> > > > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > > > >  		goto rpm_disable;
> > > > > >  	}
> > > > > >  
> > > > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > > > +
> > > > > 
> > > > > you might also want to add the multi-master boolean property in
> > > > > the binding.
> > > > 
> > > > We discussed this internally and weren't sure when it was required
> > > > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > > > bindings. Is it still required if it is part of the dt-schema?
> > > > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> > > 
> > > The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> > > every thing not in this yaml
> > > 
> > > > If so, I will add it in the next version.
> > > 
> > > Yes, please.
> > 
> > sorry for the confusion, please don't add it. I had a chat with
> > Krzysztof and I will quote him: "this is a core property, coming
> > with dtschema, so they dont need to update bindings".
> > 
> > He also sent a cleanup to remove the only binding using it.
> 
> No problem, thanks for the clarification. 
> 
> Should I still separate the multi-master patch from the rest of the
> series, even though it doesn't seem to fix the problem Fabio sees? I did
> some more testing today and the workarounds he found do not solve the
> problem I see, so they are definitely not the same.

I'll try to review your DMA patches next week.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

