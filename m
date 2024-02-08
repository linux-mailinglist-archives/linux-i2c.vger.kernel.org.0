Return-Path: <linux-i2c+bounces-1661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9133A84E465
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 16:52:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BEE12831BA
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 15:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BF37D3E0;
	Thu,  8 Feb 2024 15:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bSe9PK47"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B677CF23;
	Thu,  8 Feb 2024 15:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707407552; cv=none; b=aLlgxfBfv9Q9k4Izdqzf5bSJbCEewUilQjqcOR+T/65IflVlr47DFHwoqVpIEY2UYftC41VWH6w9N5beuYocaVR3w5hMxH26XzdAZsN3nHs1Zll703F6lpmCiRIu53YfGdh5esOYV8M530uNSWqt04P7Ggw1j60ovtt7cUO2SrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707407552; c=relaxed/simple;
	bh=8wAkocgzW4T8kfmPqArrycrun16teDyWi7a3ZHxhggs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4r3IvoVaD5Uh0zzGfDJRaP0rZUO8RpOUSpkQodxYd+Jo52+Q0ZiQ4WxfqijQ2nsm2tO7TBjbAi7CN7FtCq3cc3V4gUx1Qe5MAm7BnfaR9i3FSoqNPTOY5wHhi1ndajBTKjQ88ZIfOt8BkdhF47bVrW+BNwJYp2Dpch+rnVz2Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bSe9PK47; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B13ED1BF20A;
	Thu,  8 Feb 2024 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707407547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9B0wVUjPxEv2QBY9FiBPeeaEoehsJ57DXumqRBJ/n6U=;
	b=bSe9PK47gxI5Clu47C1OkB0hXrB4/Yfweuei1EH2vhYWYd3laL6W+TiYxCyyvTkw7aMyFY
	2hZMMYKlSvj+uw71BKP+ZjuHyon9VbbyCJMhjpeE3UfPF4Odtm6B8OTTi5Y2XGDKBeWOot
	IvyCXhQZHbTyL9Bdg+Hfq9jc6pB5YXz5+L0iV+bH5as0slbejB4i7wlbPQC73R/5CiRor0
	Nz08kVh+TUDv0mPCpgThMEyPuqx3ZevOHu6WaCgexl1xV6DeGRqQ1vgEg9esdEaKScr7Dl
	DQg3zvx1T8ri0oglXQHSOwSndU/GYFTcHS8QR3AGbEARe5DJAV7bGCZOMjWyjg==
Message-ID: <8228b76f-ce15-4335-8a09-08d0d57974b1@bootlin.com>
Date: Thu, 8 Feb 2024 16:52:24 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/15] pinctrl: pinctrl-single: move suspend()/resume()
 callbacks to noirq
To: Andi Shyti <andi.shyti@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Peter Rosin <peda@axentia.se>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Tom Joseph <tjoseph@cadence.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
 theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com, u-kumar1@ti.com
References: <20240102-j7200-pcie-s2r-v2-0-8e4f7d228ec2@bootlin.com>
 <20240102-j7200-pcie-s2r-v2-2-8e4f7d228ec2@bootlin.com>
 <CACRpkdYBnQ6xh2yNsnvquTOq5r7NeDhot6To9myfuNbonKcgzQ@mail.gmail.com>
 <6hyubhrho6xbki6yxtmqedylc2gpeyj4yu5gtrjrq4nsthcr7g@elfukmqeve2a>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <6hyubhrho6xbki6yxtmqedylc2gpeyj4yu5gtrjrq4nsthcr7g@elfukmqeve2a>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: thomas.richard@bootlin.com

On 1/29/24 23:49, Andi Shyti wrote:
> Hi Linus,
> 
> On Sat, Jan 27, 2024 at 11:31:11PM +0100, Linus Walleij wrote:
>> On Fri, Jan 26, 2024 at 3:37 PM Thomas Richard
>> <thomas.richard@bootlin.com> wrote:
>>
>>> The goal is to extend the active period of pinctrl.
>>> Some devices may need active pinctrl after suspend() and/or before
>>> resume().
>>> So move suspend()/resume() to suspend_noirq()/resume_noirq() in order to
>>> have active pinctrl until suspend_noirq() (included), and from
>>> resume_noirq() (included).
>>>
>>> The deprecated API has been removed to use the new one (dev_pm_ops struct).
>>>
>>> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
>>
>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> Do you want to merge this as a series or is this something I
>> should just apply?
> 
> there is still a comment from me pending.

Hi Andi,

Based on your comment, for the next iteration, I will move the cleanup
in a dedicated patch.

@Linus, you can apply pinctrl patches once everything is ok for you.

Regards,

-- 
Thomas Richard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


