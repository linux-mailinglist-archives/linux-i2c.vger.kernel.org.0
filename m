Return-Path: <linux-i2c+bounces-5659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5439495B293
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 12:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7FE11F229F0
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 10:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A76D17C220;
	Thu, 22 Aug 2024 10:04:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C2516F8E5
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724321097; cv=none; b=oHGxORXq2+ez58dLfrMLzW/ZEU3NC4wAT2gReYBAZIFS450Z0v7O0gGrapH9Re406V5ffmcKOuTSowF+Ezu6NQWG01ygVCSSCZrkYUAKqxPAC6+wc4HHF4F7MnvmjZZCSSm0DGEXBxMt7kLceuyPljXduzRFuzBKCsdqAx9j/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724321097; c=relaxed/simple;
	bh=xQBwgLkBPFDSFjRuS4TJAEFmCZoN+w3PJZufqSqm4Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkFWEOTaGiRPD+Vg9b7gtKzDRxGNEoiGMQEbUsGKhIY5OINktwJDmjvgxgibZF8cWQeGToqYnWFP8obn29T9yagKffjM5OQuUrEPEGhi4bU86l9CVVTRLrQMb2cXV0pn6AgMJiDJBmwmes3OkHeWb+7g7NF8rj+aPgb2A2MZE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sh4gP-0001Zq-3h; Thu, 22 Aug 2024 12:04:45 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sh4gN-002DnD-P8; Thu, 22 Aug 2024 12:04:43 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sh4gN-00HLZP-27;
	Thu, 22 Aug 2024 12:04:43 +0200
Date: Thu, 22 Aug 2024 12:04:43 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZscNO2PKNlK3ru_7@pengutronix.de>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Zsbi2xcxBGE7o9uE@eichest-laptop>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> Hi Andi,
> 
> On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > Hi Stefan,
> > 
> > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > >  		goto rpm_disable;
> > >  	}
> > >  
> > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > +
> > 
> > you might also want to add the multi-master boolean property in
> > the binding.
> 
> We discussed this internally and weren't sure when it was required
> because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> bindings. Is it still required if it is part of the dt-schema?
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
every thing not in this yaml

> If so, I will add it in the next version.

Yes, please.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

