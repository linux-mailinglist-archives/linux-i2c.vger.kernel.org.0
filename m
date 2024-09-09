Return-Path: <linux-i2c+bounces-6447-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA6F9724B6
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 23:58:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 458EA1F24816
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 21:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E7118C91B;
	Mon,  9 Sep 2024 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZEPsNst"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2698F5A;
	Mon,  9 Sep 2024 21:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725919083; cv=none; b=TGDkuA2t5RL/GyCoUFcYCkW9M2/huH53YRA7zyzY6i8heNJPH9oU3CWOrv9s24TabOEofSpYx+HxZt2ik1qHSbP9C2TJECnMI7TK46QF6KRZ7/xx15twjJJVCqDkQRmpPv1M8Xq8SkkiDobly3SxDIBpz2tzZh2dxu+J480Xxbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725919083; c=relaxed/simple;
	bh=npeW6BmdC0+F29Sv3BG7mRJ7+MKbDosHGqli7M1OJns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTZe+ykHTUIZTnZtqmXGrdRBVfKwCagqJlFDbtWjWFiCDMHMgVVWR2a+OXKDK+Z3g0vg3XEr6xeAJGQE62AtxzFNjTBvp7fUnPO360ufbadvggcl3SB41HJZK+zWmRi3KcVZtFjCTrnkQllkJURemKr3yFM3eYmnoLmMhCCcZsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZEPsNst; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D06FC4CECF;
	Mon,  9 Sep 2024 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725919082;
	bh=npeW6BmdC0+F29Sv3BG7mRJ7+MKbDosHGqli7M1OJns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mZEPsNstjF9fa2I8DElJWQ9G4YWF4/tdH5pmUmoBKgrExGPKat8jLODuyGv5r7TxW
	 BKPmNeSrsGUPO56kjDlPbjv/M1wZRcdzvsq8XnXPo7X5JmBWx6MYFnd0oEw8i87+EU
	 kekgo9dRjPI5HCS0r+nJpQ4J5tQoEQCnWqdw6UROEnLG3xA13DJZkzAo7nAkCJYycG
	 iVNuL+/k3QDRffX0g+3NHeJmu2KAESI/QqVvdL5e6AeVtMjfJHZRLvfq200U277V+U
	 MOdUGEuqHPYkqGGXjlW19HdTHD/r91eaOSf2azV306leBJiN2vR1oz5nxFdz2w919K
	 wi7GVsykYmMpQ==
Date: Mon, 9 Sep 2024 23:57:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"francesco.dolcini@toradex.com" <francesco.dolcini@toradex.com>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v3 4/4] i2c: imx: prevent rescheduling in non dma mode
Message-ID: <y7ml6eaxoz56arnwek5d4aqugw6kqs4w2r4vqfefsyg2ugzyur@7jvufihuw4yy>
References: <20240902074330.6349-1-eichest@gmail.com>
 <20240902074330.6349-5-eichest@gmail.com>
 <pva2d5fc76ykjlzyxivrau4qnt6cu6qqlgmuvq3ykzlaqvsqio@xuultvre2f4d>
 <CAD4aGmRuy_a4K5ENv7m8V1NO5U2Xa06EkWReHqJbHtMoTGRF6Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD4aGmRuy_a4K5ENv7m8V1NO5U2Xa06EkWReHqJbHtMoTGRF6Q@mail.gmail.com>

Hi Stefan,

On Wed, Sep 04, 2024 at 01:27:55PM GMT, Stefan Eichenberger wrote:
> On Tuesday 3 September 2024, Andi Shyti <andi.shyti@kernel.org> wrote:
> 
>     Hi Stefan,
> 
>     One final ask...
> 
>     On Mon, Sep 02, 2024 at 09:42:04AM GMT, Stefan Eichenberger wrote:
>     > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>     >
>     > We are experiencing a problem with the i.MX I2C controller when
>     > communicating with SMBus devices. We are seeing devices time-out because
>     > the time between sending/receiving two bytes is too long, and the SMBus
>     > device returns to the idle state. This happens because the i.MX I2C
>     > controller sends and receives byte by byte. When a byte is sent or
>     > received, we get an interrupt and can send or receive the next byte.
>     >
>     > The current implementation sends a byte and then waits for an event
>     > generated by the interrupt subroutine. After the event is received, the
>     > next byte is sent and we wait again. This waiting allows the scheduler
>     > to reschedule other tasks, with the disadvantage that we may not send
>     > the next byte for a long time because the send task is not immediately
>     > scheduled. For example, if the rescheduling takes more than 25ms, this
>     > can cause SMBus devices to timeout and communication to fail.
>     >
>     > This patch changes the behavior so that we do not reschedule the
>     > send/receive task, but instead send or receive the next byte in the
>     > interrupt subroutine. This prevents rescheduling and drastically reduces
>     > the time between sending/receiving bytes. The cost in the interrupt
>     > subroutine is relatively small, we check what state we are in and then
>     > send/receive the next byte. Before we had to call wake_up, which is even
>     > less expensive. However, we also had to do some scheduling, which
>     > increased the overall cost compared to the new solution. The wake_up
>     > function to wake up the send/receive task is now only called when an
>     > error occurs or when the transfer is complete.
>     >
>     > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
>     > Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> 
>     The code is fine and looks good to me. The commit log is also
>     very descriptive. However, there isn’t a single line of comment
>     in the code.
> 
>     If someone else encounters this code without understanding your
>     specific context, they might find it too complex and attempt to
>     simplify it or revert to the previous implementation.
> 
>     Please add comments to describe the state machine you
>     implemented, the reasoning behind it (as you explained in the
>     commit log), and make it understandable for those who haven’t
>     reviewed your patches.
> 
> 
> Thanks a lot for the feedback. I only have limited access to my computer
> the next two-three weeks but will add comments as soon as I'm back. 

Other than the comment, there are also some checkpatch errors.
Please, do fix those errors, add the code and then I will take
your patches.

Sorry about that,
Andi

