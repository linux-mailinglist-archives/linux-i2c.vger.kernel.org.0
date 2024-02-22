Return-Path: <linux-i2c+bounces-1912-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E691185F3A5
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 09:58:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41B2EB21E48
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 08:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1772BD01;
	Thu, 22 Feb 2024 08:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AUl8Y3d8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384EE182CF;
	Thu, 22 Feb 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708592279; cv=none; b=hteBMY2nMlz4DOfj8mS7FTF27k48SdnQn8mh1BhZmLe1i4Gf/Q500xMvSUB/0rqsckZPXydRZKaqeCGd3hoxl8I51kGzzmnfEy0VrSruZ91eE6p7YxoOIVRRTpXjjbtbIFN0R00lGkDkzJzRgI4Q/q4uO7iWv/5KdF+rgUrHz6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708592279; c=relaxed/simple;
	bh=th7l9GDlitBQrVNcZgGUJYqJa0Nwh+9KQ0v3uwoZ/rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKu2E8vFgiMrL7aUy69FyCyGSaUuZKJwdC/OfatgdkEmWRP0B/CpC/lHP0qBVOmyLL0ltrbXZEkVihpTX2fb+MhzZiaBLMATKf5C4kRDkPNGZKD4nK9e6eehZzCIAfBRxFDiMJkiLLHq3s1gXP23W+RlEyfTzyJxwnJBsvF5aDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AUl8Y3d8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E9DC433C7;
	Thu, 22 Feb 2024 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708592278;
	bh=th7l9GDlitBQrVNcZgGUJYqJa0Nwh+9KQ0v3uwoZ/rg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUl8Y3d8UX/Rj84fOlyp+s0kCjjZ3xD4t+Uxpb5sH5slYu7KIzraPk+76C0R1qGhv
	 W8/jQRxpmx2XRb1jyY2dNBoT+YB9ue5JdbCLJPQS5QPd0O9mevjqCjKBPWq4Q4ql5t
	 POjLZRefaF26ZQIo4U7W6g+QrceUaur4c1cdgmBtHYKeaiF6jEkYh6skGVzVTqJThe
	 hhPsOLDtWaF9K48vjEXDoLbMiTtsRiVXYWPydAgXuUIB1pMbNVKK5hEjaTJ51LMU1T
	 7Zn8+Pb1i5bneZMBEAJQvOCu8PEyn6iZ1+tc3AAkpz0WXgUA1/eHTGuyXr7nT096xK
	 bh9ZLjdi5WdLQ==
Date: Thu, 22 Feb 2024 09:57:54 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Tommy Huang <tommy_huang@aspeedtech.com>
Cc: "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH] i2c: aspeed: Fix the dummy irq expected print
Message-ID: <v4nawwb4rwjiy2g7xv2sfyhc545mhk4izb3g22f7jupcevjuzb@nxmqgf2zjyqs>
References: <20240216120455.4138642-1-tommy_huang@aspeedtech.com>
 <nbkkaktcozbhly44hii3zwie7ivsra3qxzdibyzhyhooxrudvb@zik6skmkki2c>
 <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYZPR06MB61911F076C8719C6A7D57B97E1562@TYZPR06MB6191.apcprd06.prod.outlook.com>

Hi Tommy,

On Thu, Feb 22, 2024 at 01:10:39AM +0000, Tommy Huang wrote:
> > On Fri, Feb 16, 2024 at 08:04:55PM +0800, Tommy Huang wrote:
> > > When the i2c error condition occurred and master state was not idle,
> > > the master irq function will goto complete state without any other
> > > interrupt handling. It would cause dummy irq expected print. Under
> > > this condition, assign the irq_status into irq_handle.
> > 
> > I'm sorry, but I don't understand much from your log here.
> > 
> > Do you mean that irq_handled in aspeed_i2c_master_irq() is left with some
> > states that is not supposed to have and then you end up printing here:
> > 
> > 	dev_err(bus->dev,
> > 		"irq handled != irq. expected 0x%08x, but was 0x%08x\n",
> > 		irq_received, irq_handled);
> > 
> > Can you please explain better?
> > 
> 
> Yes. If the platform met any irq error condition and the i2c wasn't stated under ASPEED_I2C_MASTER_INACTIVE.
> Then the code flow would goto the end of aspeed_i2c_master_irq.
> 
> 	ret = aspeed_i2c_is_irq_error(irq_status);
> 	if (ret) {
> 		...
> 		irq_handled |= (irq_status & ASPEED_I2CD_INTR_MASTER_ERRORS);
> 		if (bus->master_state != ASPEED_I2C_MASTER_INACTIVE) {
> 			bus->cmd_err = ret;
> 			bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> 			goto out_complete;
> 		}
> 	}
> 
> Some master interrupt states were not handled under this situation.
> The fake irq not equaled message would be filled into whole of demsg.
> It's most like below example.
> 
> ...
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> aspeed-i2c-bus 1e78a780. i2c-bus: irq handled != irq. expected 0x00000030, but was 0x00000020
> ...
> 
> I thought the bus->cmd_err has been filled error reason and it would be returned to upper layer.
> So, I didn't think the print should be existed.

thanks! Can you please write a commit that explains better the
fix you are doing?

> > If that's the case, wouldn't it make more sense to check for
> > bus->master_state != ASPEED_I2C_MASTER_INACTIVE) earlier?
> 
> Did you suggest to add "bus->master_state != ASPEED_I2C_MASTER_INACTIVE" judgement before print the irq not equal print?

no, not really, but nevermind, on a second look, what I'm
suggesting doesn't make much sense.

If you want, please reword the commit message as reply to this
e-mail and I will take care of it.

> > And, still, If that's the case, I believe you might need the Fixes tag. It's true that
> > you are not really failing, but you are not reporting a failure by mistake.

Please, also consider adding the Fixes tag if you see it
necessary; I think you should, but it's borderline.

Andi

