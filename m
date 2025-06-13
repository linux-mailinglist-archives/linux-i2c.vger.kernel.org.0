Return-Path: <linux-i2c+bounces-11428-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDB5AD8BC3
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 14:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CF4218930E9
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 12:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82C3234977;
	Fri, 13 Jun 2025 12:10:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C222D5C87
	for <linux-i2c@vger.kernel.org>; Fri, 13 Jun 2025 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749816627; cv=none; b=PiPT7AbRRbmx7j/Tl9qhWbzFovRWaRt5vtU7Tiuv1+jS+KeEKdDEN7Ut7IvFenLzN2xnEdaNfg127BXz3VBn052UsLNifoYEugzPoDZkthQ4wtbADKukxSlTL4KaeoNlv7E/oJd4RNBgQ4D+8pmuTp7noWdvcTiYZlFihhG1+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749816627; c=relaxed/simple;
	bh=tmLzgaovaz45XOZnteG8pVFwIUd/urRG0UiH/QrU5rA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIy+c1TGyl8xNG2TxeDGXGKlJl5kIEmiNzJjPsNuYnvk1laKyDAQlmD5l8zhhZZxT4iZlGeMDwEpay3EDQv/GZ0IefKUZwRLeKWs+E7aMqTUb5Iz8YvSgtYHBQc8VTKjqz9jvO8py5Vpfn4OiFQoDOrXKTLr1XBESeMMb5xX8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3EX-00013u-Vm; Fri, 13 Jun 2025 14:10:09 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3EX-003HuM-26;
	Fri, 13 Jun 2025 14:10:09 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uQ3EX-00BAHI-1i;
	Fri, 13 Jun 2025 14:10:09 +0200
Date: Fri, 13 Jun 2025 14:10:09 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	kernel@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 1/6] arm64: lan969x: Add support for Microchip LAN969x
 SoC
Message-ID: <aEwVIcDtGpWRPaXu@pengutronix.de>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-2-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-2-robert.marko@sartura.hr>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Fri, Jun 13, 2025 at 01:39:36PM +0200, Robert Marko wrote:
> This adds support for the Microchip LAN969x ARMv8-based SoC switch family.
> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> Acked-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

