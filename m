Return-Path: <linux-i2c+bounces-5948-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB9E9658B8
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 09:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 022F5B20AE9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151B0153BF9;
	Fri, 30 Aug 2024 07:37:26 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D48F14E2DE
	for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2024 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003445; cv=none; b=d9wOP3JvQb3y93xaSKQGaiSNzjUc8Jk8H3kFnZv4SOaKRBsxxjk4chr9WtgnAfKI7ThVgeRUQnZrlXe2qVAo1U9MJBrjjDskNjyprSPrrIWBiAePtziYR4VfvLmmSu53dpEvKGvC/wfDzahRy+h7gsCDqCtz0oXPMMviOSCkrRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003445; c=relaxed/simple;
	bh=EBqHwxvdQVyhbuiFBoLIU4AmBPq9DuPoCbMZM/JAWHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INiFMljlveZclTOGS/VPlX24MC2zz/16wh3WRfyUzy36UztQEbRfXPBB+QtvtPs2TO5beDkI5xrhXAJmIzSYZfmkA6e+293HogZUttAIq/HtHq7mvaiXBy0qw8ReYM5IG6TYFmSOBan7pzKG46TMIUU0qb4/daUT/bONPUE4yeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwC3-0000Kx-Ay; Fri, 30 Aug 2024 09:37:15 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwC2-0046DZ-9c; Fri, 30 Aug 2024 09:37:14 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwC2-00EQsl-0Z;
	Fri, 30 Aug 2024 09:37:14 +0200
Date: Fri, 30 Aug 2024 09:37:14 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Message-ID: <ZtF2qj2cIjULy-RY@pengutronix.de>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-4-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819072052.8722-4-eichest@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Mon, Aug 19, 2024 at 09:19:09AM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> Use the relaxed version of readb and writeb to reduce overhead. It is
> safe to use the relaxed version because we either do not rely on dma
> completion, or we use a dma callback to ensure that the dma transfer is
> complete before we continue.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

