Return-Path: <linux-i2c+bounces-3615-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E758CA913
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 09:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 778531F2200B
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2024 07:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E43F351C2A;
	Tue, 21 May 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="w+h3wPb3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818864F88A;
	Tue, 21 May 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716277054; cv=none; b=fgMu2NNBULwCWuFsj+bOx9NXOaYFQY0W0bA+7DMRqWG3hEOiPfPsbWGGdfjaS7nSMVIookaAvH6LbE8aSms5hIuxb4ss2UcmJDOHo56TRelw6sxEyyNOnyonbyTPWlFRpu039V9Gyv7NLP/vDFlgZpNt3wxL3AQNOCNXag71bXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716277054; c=relaxed/simple;
	bh=RN8I5CgBWEareyxEJP4IkpgAm7z5y/urYtXZ/8ompBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmrLvigURIyTf168QC+3BVuOqXQbTLRHevgP4Hvx5xy2AVn+GlxkZLTBr5EQihrdw3VxOzWaECGkgxgUfee6BWdelstWSGx8MuDEHcey39nHUKW/tclkvRW9HzYDJcK80WSXYhfLB7BON+v+Xf4+SQu49zfNH2+9+P+9SZu4yGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=w+h3wPb3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77DF1C2BD11;
	Tue, 21 May 2024 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716277054;
	bh=RN8I5CgBWEareyxEJP4IkpgAm7z5y/urYtXZ/8ompBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=w+h3wPb3d5y6PqxztT/3uSjmCzHd8j91s3v55vG0W9UzvecyWPU9rHEKyyGVd6iwS
	 OfD85bH15kzgNuq9PWN5gtEA1i91+BS8YCQldzB7xLEWFafRV5cqN2Jd/H5laBE/i8
	 qO8Kj8qNl8dX/qxQlF754LJD2smyTcePz5Vv3uQY=
Date: Tue, 21 May 2024 09:37:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel-janitors@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin@pqrs.dk>,
	Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH 01/13] a2b: add A2B driver core
Message-ID: <2024052125-washroom-hardened-820a@gregkh>
References: <20240517-a2b-v1-1-b8647554c67b@bang-olufsen.dk>
 <feb239b1-7a14-479a-87f2-dcbf9966bffd@web.de>
 <alv4rqrrnjqw3fb5vsw5r4f6lv7ymvuatcqovt7ddxi5ich5on@aan7wybzrzru>
 <7ffeb91e-97b7-4f60-851e-120062b63c17@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7ffeb91e-97b7-4f60-851e-120062b63c17@web.de>

On Tue, May 21, 2024 at 09:33:51AM +0200, Markus Elfring wrote:
> >> …
> >>> +++ b/drivers/a2b/a2b.c
> >>> @@ -0,0 +1,1252 @@
> >> …
> >>> +static int a2b_bus_of_add_node(struct a2b_bus *bus, struct device_node *np,
> >>> +                            unsigned int addr)
> >>> +{
> >> …
> >>> +     node = kzalloc(sizeof(*node), GFP_KERNEL);
> >>> +     if (IS_ERR(node))
> >>> +             return -ENOMEM;
> >>
> >> Please improve the distinction for checks according to the handling of error/null pointers.
> >
> > Right, I think it returns NULL on error.
> 
> Do you see possibilities to reduce “confusion” about the properties of such a programming interface
> any further?
> https://elixir.bootlin.com/linux/v6.9.1/A/ident/kzalloc


Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

