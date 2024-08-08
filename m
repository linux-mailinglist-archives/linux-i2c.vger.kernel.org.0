Return-Path: <linux-i2c+bounces-5205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B0494B5E6
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 06:26:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2A171C21C40
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 04:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2EA80C13;
	Thu,  8 Aug 2024 04:26:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 538D29479
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 04:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723091204; cv=none; b=fWp0CV/e3CQ+Uuq27Qy8nViMcan5hZCIljZnKWa5Cuq3eEi7lXZ6DnIAgHyl+km9fuvb/aR0sNK6XSO6r4wwOmUWFJnJvJTAvTn64PVlZibd5aAqKIKoKzLldXZ79kz43BVC4sUbadQ0SmkGKoN5M1Y9wliw9S5F+WwVghvRZbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723091204; c=relaxed/simple;
	bh=QGnVs/hBMZ+V2bFzJUgoqEY3bPK4afP6ceE2dxtc+bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTH1MaH5jJbhfoGsphzDc5o31K4cIacfrdlaIHVgG8E8CeoyQCDb3UQZNrbWpCBbJKyLwxeMYKXqNwrcsF+AiKFTVIk5rFpV6I44IMdVZ3PNfSzXZCjMzgrsNBU0p7vKA9GgkdHpTgJBIoUnQQZpDqPvucSvWuFO9D/s2+jh4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sbujW-0005ks-IT; Thu, 08 Aug 2024 06:26:38 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sbujW-005LL2-34; Thu, 08 Aug 2024 06:26:38 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sbujV-008jaU-3D;
	Thu, 08 Aug 2024 06:26:38 +0200
Date: Thu, 8 Aug 2024 06:26:37 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH] i2c: imx: Switch to RUNTIME_PM_OPS()
Message-ID: <ZrRI_XLeVmMn-keU@pengutronix.de>
References: <20240807181456.78760-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807181456.78760-1-festevam@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Wed, Aug 07, 2024 at 03:14:56PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

