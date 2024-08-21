Return-Path: <linux-i2c+bounces-5629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D377995A029
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 16:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 910AF281DB0
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Aug 2024 14:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACD1B1D76;
	Wed, 21 Aug 2024 14:39:53 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE181B1D42
	for <linux-i2c@vger.kernel.org>; Wed, 21 Aug 2024 14:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724251193; cv=none; b=n6S3C9p4IwkDPnZU9EEBZog+hDTd4BgorcJCaNYaEHDgBECqJqLuGq66Ln3s+GERryKGd659pOJhLk86w7faph1V5eqYGCNjGFnL/L9fSgmjBmwpn8lv9f6DAsSERfUbydKBir6OvfxH370QQJuYRKXuINpAWNSl74Drk+Z9Akc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724251193; c=relaxed/simple;
	bh=xMcCS+EBmuGaYl1JyAYde/ccZh6Tohl0Niv38BHitvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOe1Hk4lIkzRiJ5N73caROwXu0LDQXStxkGOTZr++zCrB6sbLnQQimiQrcyKAiOV2bqq0H3d0y6QAXF1/ZCPoC7jlX41k+RWQ7zpRWeFVlNaBqyBTr78v/epusB5UyucAOki+OBYseV0IvBZd0G8xmbQrate3DDHyRF+OfmfgnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sgmUv-0001Z2-24; Wed, 21 Aug 2024 16:39:41 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sgmUt-00227J-UZ; Wed, 21 Aug 2024 16:39:39 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sgmUt-00FXl6-2f;
	Wed, 21 Aug 2024 16:39:39 +0200
Date: Wed, 21 Aug 2024 16:39:39 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: Stefan Eichenberger <eichest@gmail.com>, kernel@pengutronix.de,
	andi.shyti@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZsX8KzkQw0wJUCbc@pengutronix.de>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5CYUNESmBdZBMSMwNraQbqvvsF5fn8i+nHr=MB_T_AG7w@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Fabio, Stefan,

On Wed, Aug 21, 2024 at 08:01:20AM -0300, Fabio Estevam wrote:
> Hi Stefan,
> 
> On Mon, Aug 19, 2024 at 4:20 AM Stefan Eichenberger <eichest@gmail.com> wrote:
> >
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > According to the i.MX8M Mini reference manual chapter "16.1.4.2
> > Generation of Start" it is only necessary to poll for bus busy and
> > arbitration lost in multi master mode. This helps to avoid rescheduling
> > while the i2c bus is busy and avoids SMBus devices to timeout.
> >
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> 
> This fixes a pca953x probe error on an imx8mp board running linux-stable 6.6:
> 
> [    1.893260] pca953x 2-0020: failed writing register
> [    1.898258] pca953x 2-0020: probe with driver pca953x failed with error -11
> 
> Could you please add a Fixes tag and Cc stable so that this can reach
> the stable kernels?
> 
> Tested-by: Fabio Estevam <festevam@denx.de>
> 
> Thanks a lot,

It looks like with this patch, the I2SR_IAL interrupt is not cleared.
I would expect some kind of interrupt storm. Can you confirm it?

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

