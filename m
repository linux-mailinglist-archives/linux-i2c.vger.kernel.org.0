Return-Path: <linux-i2c+bounces-5951-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA699659D0
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 10:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAA2F1F21EEF
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 08:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E8616D336;
	Fri, 30 Aug 2024 08:14:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F481662EF
	for <linux-i2c@vger.kernel.org>; Fri, 30 Aug 2024 08:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725005650; cv=none; b=JWFHwxk4Ta06QiexQMUt+t9h9tbwGBeKBOUKxRzSGApkBT4Z0DsQSUhnhaJ0jtYPtXbn4tHfNB8Qhw+6uv8vHwQiPodWr4vUDk8ZjCwhDI1bQmorpAWj9GtbvM44BHMuxL9elw2VZcFb10qjEmPmw0O77kvh0GRV5WuUKQFCD1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725005650; c=relaxed/simple;
	bh=gs8m6XzA7rsiitgMax02+6Zf3kJfaVZMXfkZt6ROd0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVoGxtaA5rKu3aEcCJIDm4CfgG3LSYmQMEq/aDhcT52LDDf0ZrRGb9kcrhdlnpLRKrKuvRQM6y0z2PjH4rbqHmJGtsVLGxPrWeqov+d/avGhIciern1nyCGKXaQ71wAXlvrEhM5dQVJK1jWKhB6xelwlsFVMXktnqawSb41Yr6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwlZ-0007vV-UZ; Fri, 30 Aug 2024 10:13:57 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwlY-0046c9-UI; Fri, 30 Aug 2024 10:13:56 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1sjwlY-00ERNa-2d;
	Fri, 30 Aug 2024 10:13:56 +0200
Date: Fri, 30 Aug 2024 10:13:56 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 4/4] i2c: imx: prevent rescheduling in non dma mode
Message-ID: <ZtF_RJaG9lj_Mvtb@pengutronix.de>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-5-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819072052.8722-5-eichest@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Mon, Aug 19, 2024 at 09:19:10AM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> We are experiencing a problem with the i.MX I2C controller when
> communicating with SMBus devices. We are seeing devices time-out because
> the time between sending/receiving two bytes is too long, and the SMBus
> device returns to the idle state. This happens because the i.MX I2C
> controller sends and receives byte by byte. When a byte is sent or
> received, we get an interrupt and can send or receive the next byte.
> 
> The current implementation sends a byte and then waits for an event
> generated by the interrupt subroutine. After the event is received, the
> next byte is sent and we wait again. This waiting allows the scheduler
> to reschedule other tasks, with the disadvantage that we may not send
> the next byte for a long time because the send task is not immediately
> scheduled. For example, if the rescheduling takes more than 25ms, this
> can cause SMBus devices to timeout and communication to fail.
> 
> This patch changes the behavior so that we do not reschedule the
> send/receive task, but instead send or receive the next byte in the
> interrupt subroutine. This prevents rescheduling and drastically reduces
> the time between sending/receiving bytes. The cost in the interrupt
> subroutine is relatively small, we check what state we are in and then
> send/receive the next byte. Before we had to call wake_up, which is even
> less expensive. However, we also had to do some scheduling, which
> increased the overall cost compared to the new solution. The wake_up
> function to wake up the send/receive task is now only called when an
> error occurs or when the transfer is complete.
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

