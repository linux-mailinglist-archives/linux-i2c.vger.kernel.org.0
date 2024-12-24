Return-Path: <linux-i2c+bounces-8701-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8EE9FBA86
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 09:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B77A07A080C
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Dec 2024 08:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F69E176AC8;
	Tue, 24 Dec 2024 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrBYHCjJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F19DDD2;
	Tue, 24 Dec 2024 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735029163; cv=none; b=ANjQ5180LyzVwRYbqu90acZz0xdiPTnrclwmll4pEM6jqck9SxMCwO+o/6e8QRuOtCaVB77xeDjewjPb60u01JP83UkjK0if3is+pgtsontDZiq+neEUEa8RLvKcG+6NKB5D1BT7wn6zgEpaHA/1xMXdgZRtgsl827/Qh/xPZt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735029163; c=relaxed/simple;
	bh=FC+OB8lfeiAk9A4BKbHuLRMjp7BLRrFmmM83lyJOKQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eq0qeoROngdALL9L/3lbLoi0G8eK2q9BAdZ4uA/d6V7yCPXktmWOdzIGFh2AYMSsIlkrDR4OlbEMrBWUxy1oDwnhMHQ2F0BRyKKnfqiHhfC7H6LDYnsf+JIp3rO/Or+rkF/NEeV5QvsCQ6J5zHU1RPCZk0g+53Y8myCaOdThHAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrBYHCjJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4D6C4CED0;
	Tue, 24 Dec 2024 08:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735029162;
	bh=FC+OB8lfeiAk9A4BKbHuLRMjp7BLRrFmmM83lyJOKQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jrBYHCjJS3HPFIa3KUtGyuuFnbB/ezOv4VNSvOB6wjXRrrbLws38eyocGijRvduPD
	 JhMnM8J4rqEzyToLuzhj6datxr3T9wpfJMSX45WSKHcyazl8dw7ydsntwBnE4IyRPX
	 g+KEX0GCzsDHvqwXjE2RPTdZwXceQKLtcKoGwoZTEYSZcVYTxhizsLDFkHvvkAqPQZ
	 xPvN2tqtznhVkPL+Xqyx3iPHjbIDc/NNo12DqCMF7idiQLEK08eOlV69jYILTdWgT0
	 dY+3YNCk35IMg6yPCpjv8QJfnbT11CLoA1SdzidV5C+cV8kdDiyiS3p9hkT2I7+I8j
	 YOlWvHAkLKFoA==
Date: Tue, 24 Dec 2024 09:32:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Carlos Song <carlos.song@nxp.com>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Clark Wang <xiaoning.wang@nxp.com>, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Message-ID: <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>

> > > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct platform_device
> > *pdev)
> > >       if (ret == -EPROBE_DEFER)
> > >               goto clk_notifier_unregister;
> > >
> > > +     /* As we can always fall back to PIO, let's ignore the error setting up
> > DMA. */
> > > +     ret = i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +     if (ret) {
> > > +             if (ret == -EPROBE_DEFER)
> > > +                     goto clk_notifier_unregister;
> > > +             else if (ret == -ENODEV)
> > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > +             else
> > > +                     dev_err(&pdev->dev, "Failed to setup DMA (%pe),
> > only use PIO mode\n",
> > > +                             ERR_PTR(ret));
> > 
> > My question here is not just about the use of dev_err vs dev_err_probe, but why
> > don't we exit the probe if we get an error.
> > 
> > We should use PIO only in case of ENODEV, in all the other cases I think we
> > should just leave. E.g. why don't we exit if we meet ret == -ENOMEM?
> 
> Hi, Andi
> 
> Thank you! From my point, I2C is critical bus so it should be available as much as possible.
> -ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So error happened in enable DMA mode process.

OK, makes sense, it's the idea of "let things fail on their own,
I'll move forward as much as I can"; we need to be aware of
the choice. Please add a comment above.

But then it's not an error, but a warning. With errors we bail
out, with warnings we tell users that something went wrong.

Sorry for keeping you on this point for so long, but do you mind
swapping this dev_err in dev_warn, with a comment explaining the
reason we decided not to leave?

Thanks,
Andi

