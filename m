Return-Path: <linux-i2c+bounces-11158-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C9AC87BC
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 07:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02AC91651AE
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 05:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59A051E572F;
	Fri, 30 May 2025 05:13:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210091E570B
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748582003; cv=none; b=MZvEh9Ca5jzMDFbXqdsBni4hc+4kJH6LKJY+x81Z30JRL4I+pmdN8BnOlZsWbdosCXcaPAI2ElwsHfRLShxAlIxgrWoaS8SziAEEiz1OeA9H9o6UlHKAPiHyOG2QtykFh1NLmkgcq6FpLRPZ66PRdZkqNMDw4Fn4HOn8ig+SOXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748582003; c=relaxed/simple;
	bh=80CBZ4qYgzBTvAjwCPihgoQpVTk1e4kHEhhP9lPMf2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLSHO6zTOMOKSZOMa5e96bDNxHPEmxgLgXGi7VL4Vfg9CBlAWUKRHipAo6+Vkn+skVpy1JYQV4XJxrGC/F3aP0H8pupyclKJh6FvzOffV/hxcX/VAJVSZR4/epYrWeIaMK+lv2yw4IQT/UfQotY052lOW03t5RTeBYn+7Jga1vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uKs3B-0001uT-Md; Fri, 30 May 2025 07:13:01 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKs3A-000vYP-2X;
	Fri, 30 May 2025 07:13:00 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKs3A-000mgl-29;
	Fri, 30 May 2025 07:13:00 +0200
Date: Fri, 30 May 2025 07:13:00 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <aDk-XKZBJiT_hJq2@pengutronix.de>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
 
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

