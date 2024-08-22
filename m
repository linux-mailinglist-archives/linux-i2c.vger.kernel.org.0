Return-Path: <linux-i2c+bounces-5644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 223E695AE01
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 08:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEDEA1F21F30
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 06:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD65513C3DD;
	Thu, 22 Aug 2024 06:51:28 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBE137C35
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 06:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724309488; cv=none; b=QQEu968vfZ/aOUCQLE7Duezv2JgpBgX6Nny4yrSS+UF/TMsqC9uXSTmi24jzXc4u6sWCSiNUWJwDzfpUyyEGc/giLnI29bJeDwzi2swQ1OYqNIyd+6G0PxnI5Xtj+FUFP0bYCm9WC5APQ3tRx25GDEsSMOPBwmc5Vx9bGVKxz/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724309488; c=relaxed/simple;
	bh=A+TiNVsUJJTeUodlTQCafTHeDk6hNmvPgg3lnmgA0SE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfzYpylpjS037If2Ayd9hE/FrTRZ4JB66PfJlYbsOSOgZn4MOdeQW96xHi2Sf+olrz653eb1dFysVdWSpYzztZSrYJcB05Ccf0CGAGeWnnZUfbq+CA3dbTDCbnlT1ZmJWjNfbYxeaebYvd1Yia/7DHnwG4QcsbE/kRuy5n8COKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sh1f8-0006e3-Hh; Thu, 22 Aug 2024 08:51:14 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sh1f7-002BmF-EH; Thu, 22 Aug 2024 08:51:13 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sh1f7-00HHB1-13;
	Thu, 22 Aug 2024 08:51:13 +0200
Date: Thu, 22 Aug 2024 08:51:13 +0200
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
Message-ID: <Zsbf4UcngEdr7XGz@pengutronix.de>
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

With this updates and extended devicetree binding, you can add my:
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Please send DMA related patches as separate set.

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

