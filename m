Return-Path: <linux-i2c+bounces-5638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5C95A7B9
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 00:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C9A1F22D63
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 22:21:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B6417B402;
	Wed, 21 Aug 2024 22:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPxPPvWt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0493817A924;
	Wed, 21 Aug 2024 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724278895; cv=none; b=F76OZpF1F0HFWkUCnjulUCW1kxtp68els+iD7tPVgCNW3pjGYnFPgGnsoVMw3sd9Dq7teZYYBCn7TFBKH9K4T2jYIvgtYegjsejlafr2GpbGBimDPy38yY6yVtVH0AaAA/SXRPHdqi6jDSoPxN6sqUKRKIoGmPBBqvmhRFA+vHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724278895; c=relaxed/simple;
	bh=NnOlCxxIn6erplFaU2Mz2b+ujQMtR93NwBMtIYq6ROM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHvt5FrubsxnDActsYpO2n6sTzMRmhaeK6PQJuOJx++dMj/y9VAU/nR3oan0oI/9IOn6M6qM1bRb6lrLjT/tfCyETeB8YvqBqCsuYMjFAns6g6ZmuBJ1gTtP0B0FfzPOhcPSjZddwfNKsBUYCP/qXvvduLlWW/gkwdL+FDFPCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPxPPvWt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB85C32781;
	Wed, 21 Aug 2024 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724278894;
	bh=NnOlCxxIn6erplFaU2Mz2b+ujQMtR93NwBMtIYq6ROM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPxPPvWtPTX5FXWEUK8hXeG5cfaN+dxY5wbdTjsj846FckfHcz7xCoPhuRqlTer0y
	 O68igrpNWEB2Oy+vWyHg2aLZVVFBEpVZlCNK1LaYuCMPCUvht0bbvIbyEjnexYFTYe
	 PU9PUqmh6ARjB5zmRmyo87MUv7ijcbTm1Gab0kVKpZAWJKkTsRrw9hOvhHxxyI+JV+
	 OmFkrvdNacqCnC8uY4d79z5h7X7W7Pihwe2Gshn4cFLBMrWHnoYYIH9XWqqWT7Q3w5
	 dTtbbz4J2RGQBFq617hZzfzpAkf+XKw7sA602E4Dr7njr6M46DVqDCpy29lou85rVM
	 J/rE91yAIVCNw==
Date: Thu, 22 Aug 2024 00:21:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com, 
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819072052.8722-2-eichest@gmail.com>

Hi Stefan,

> @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  		goto rpm_disable;
>  	}
>  
> +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> +

you might also want to add the multi-master boolean property in
the binding.

Andi

