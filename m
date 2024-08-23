Return-Path: <linux-i2c+bounces-5706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4199195C27F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 02:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74A871C21BF4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 00:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC34DBA46;
	Fri, 23 Aug 2024 00:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbScTtEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75844C148;
	Fri, 23 Aug 2024 00:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724373359; cv=none; b=mALAnSH62G371VdQa2aSMorWZnMDwVUokF9fNH8yQ8lYmFOWsIzGd2OzFeKxM2ZDxxzIyxmitWd+m3JT+8qHLASNxUh0EHdjB0wI3XIK9gZSWpGs2DVyY+f34QeFn+JyBZrO2PvZGQY4sEp4GfheP5i61qNIIHmNq1FQjDBkErs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724373359; c=relaxed/simple;
	bh=34CmkLcFRdcnkwr6YeKCo6bJ1EHYGUz+YRnm7Cd3Z3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2PEEhLD0hh9nUq1MTVWWTenHQRP2KmOgY1fobt9UXQI8T2imli1R6HYtoc9GeBlZutbbK777TTHHIyAlb9+qjuyB+2CZHUC5x/sjLhIh9S0ljaQH4jLEo1ijXWY7oSn4DIrvR7mrP7NaLZV3+L3ywMUWG1jRo7xUm570VqbuHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbScTtEt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6405BC32782;
	Fri, 23 Aug 2024 00:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724373359;
	bh=34CmkLcFRdcnkwr6YeKCo6bJ1EHYGUz+YRnm7Cd3Z3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HbScTtEtW+3XIRz5a5aap2TFlTnkIt7ghdCQj//95o+Z+5uw7DPLug2Jd2sY8izkS
	 lMrT9PdQkVhcFn0jS2DzEFLduHAMc4kYm6Q/tOvgc8+wGl5IBx8EuGx6xCXFTw6Vu/
	 fieGIsC7ADX8wtIQQPu7WAL7E2NHBJOB3r2nF/m5gOoKkDnYXJkzvsNitmUpvb1Nam
	 Ws+lkkQMztMpVzUegABv5nfZGDEyLWJYIO9BUVr/irdxoM72ykL4ogZuKTtkCdtUlN
	 8qvWTWJs8AL6jEacmmhSnfb7iGzbkW1rcTxYr8yjVJ9+LMqWTDTIudezeiMEHHeHB7
	 EWsuC/+cAcr+w==
Date: Fri, 23 Aug 2024 02:35:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Stefan Eichenberger <eichest@gmail.com>, kernel@pengutronix.de, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <2bbddaxyjkxfmlgmq3yqcbzo7dsb2pq5bvdatk2y4ig4iintkt@35btqkdv7sy3>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZscNO2PKNlK3ru_7@pengutronix.de>

Hi,

On Thu, Aug 22, 2024 at 12:04:43PM GMT, Oleksij Rempel wrote:
> On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > Hi Andi,
> > 
> > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > Hi Stefan,
> > > 
> > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > >  		goto rpm_disable;
> > > >  	}
> > > >  
> > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > +
> > > 
> > > you might also want to add the multi-master boolean property in
> > > the binding.
> > 
> > We discussed this internally and weren't sure when it was required
> > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > bindings. Is it still required if it is part of the dt-schema?
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> every thing not in this yaml
> 
> > If so, I will add it in the next version.
> 
> Yes, please.

sorry for the confusion, please don't add it. I had a chat with
Krzysztof and I will quote him: "this is a core property, coming
with dtschema, so they dont need to update bindings".

He also sent a cleanup to remove the only binding using it.

Thanks,
Andi

