Return-Path: <linux-i2c+bounces-14992-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EBABBD018EF
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 09:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AC0B3308A75
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 08:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49085366DC6;
	Thu,  8 Jan 2026 07:59:43 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A7B36405F
	for <linux-i2c@vger.kernel.org>; Thu,  8 Jan 2026 07:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859180; cv=none; b=IWU0hw9qSQ7o09iF4btJnS4PWndsAub77vT14nNjk3Bi8NNx98yiGd+KAA7/NYofAaDq+ESnXSwalzCCoDmO4Lvu9vQ7S9xe9QtpPJcRSc97mWZ7XBLbWSuI427Uyh+rWlJYTxPvc77B9mlY+/LQVG3H06gBUSMBp7tFbtRIa/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859180; c=relaxed/simple;
	bh=euPMXGUfHmKY0j6jRwBm4ZQL/PEILyPhKfkeMXB9tJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezEVMcsYGe9H/WhTMYm3MQQ7ooWckIFF1UFW/7RRRVk+OfiiRw7OvED3DfikAmt8Ktd72TE61Vi/lgZ1B+93w0jqKbFXoIh3qNMmAefSoaa9tlz91a+v2vImcUi0kmXafXGw10dbczAkrBYkxiomrXC0TSWA96dYSqR0a2JcOn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvF-0008Sm-PT; Thu, 08 Jan 2026 08:59:09 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvE-009doK-10;
	Thu, 08 Jan 2026 08:59:08 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vdkvE-000JhN-0b;
	Thu, 08 Jan 2026 08:59:08 +0100
Date: Thu, 8 Jan 2026 08:59:08 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aV9jzI8_EAuT9KmF@pengutronix.de>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
 <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi Andi,

On Wed, Jan 07, 2026 at 09:13:24PM +0100, Andi Shyti wrote:
> Hi,
> 
> Can anyone from Pengutronix give this patch a look and possibly a
> try? Oleksij?

I'm just back from my vacation. I'll take a look tomorrow.

Thank you!
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

