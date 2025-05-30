Return-Path: <linux-i2c+bounces-11160-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81392AC8820
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 08:06:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EEA4E2FC9
	for <lists+linux-i2c@lfdr.de>; Fri, 30 May 2025 06:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6980319F421;
	Fri, 30 May 2025 06:06:52 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A731EB9E1
	for <linux-i2c@vger.kernel.org>; Fri, 30 May 2025 06:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748585212; cv=none; b=teGriHXbcAWJ1epX7q8Wu0xMI59TbgdTrWfi5lH7Cd2ihqk2otEQkRYvVgrX9YRMVhGOlFrYp2qT5AdwbSE6krZ6VhFScFuTC7iKy1/01Q8bane5F672WdtIErLfmxiIFDx+tpQjPzXKxdrl9idKFwuVuqWy/LpUHRDh4+lh6bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748585212; c=relaxed/simple;
	bh=SH221srNFL7pEpU42O3+CTSkBAPPKNwmvmN1SK6EYLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q2uSDM9qmE5JwR3Sb8P6FnqxhGjXLnG1V3tfisLmtfbFsj9u09LGvLoeqn/J2H1EtqudNJlerT9kUy2ifnSLXz9j9+uQyKUhSEgAT3DlssDiir3884+SGcINILLneoxbrwGOXIyFr2PW4dM49TBQX1z4RYP/Cyx404v1P8oX8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uKst8-0007Jd-Ci; Fri, 30 May 2025 08:06:42 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKst7-000vwy-33;
	Fri, 30 May 2025 08:06:41 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uKst7-000nJw-2f;
	Fri, 30 May 2025 08:06:41 +0200
Date: Fri, 30 May 2025 08:06:41 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Troy Mitchell <troymitchell988@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Yongchao Jia <jyc0019@gmail.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/2] i2c: imx: use guard to take spinlock
Message-ID: <aDlK8VH3GRSJCKCk@pengutronix.de>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
 <20250513-i2c-imx-update-v3-1-817b7426a67e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513-i2c-imx-update-v3-1-817b7426a67e@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Tue, May 13, 2025 at 02:36:13PM +0800, Troy Mitchell wrote:
> Use guard to automatically release the lock after going out of scope
> instead of calling it manually.
> 
> i2c_imx_slave_handle() can safely be entered with the lock held.
> 
> Refactored the i2c_imx_isr function so that i2c_imx_master_isr
> does not participate in the guard scope
> 
> So Using scoped_guard simplifies the control flow
> by ensuring consistent and automatic unlock,
> which improves readability without affecting correctness.
> 
> Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

