Return-Path: <linux-i2c+bounces-1511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C19BC841596
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 23:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7973C282242
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jan 2024 22:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C0E159589;
	Mon, 29 Jan 2024 22:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck2k0fZw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD21604C5;
	Mon, 29 Jan 2024 22:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706567059; cv=none; b=SfCuUhB17tOT1m7HkIvKvcDmwGHHWsOA2d/gHBi7/Mr6SmXqaYntHZRlNVxWr4ZjgA/W/57uJYaYXFnLWR57V/uUaxni6B/+B+iSIzTkOoXSXJV8LEtH8j4kSIWgI4v4bjuSFC3AiHAcMbZXwmgox0pDeXQvKK/OQtSkZS8IGik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706567059; c=relaxed/simple;
	bh=ybFG/1Z4KxjabyhfsG3KnCV0yC0WVemE8bZH31BWBWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LKCkAd4RSdtnwguZOzkaRwvaEJdX4xNP7lq6EKac4pXwJmonhMuQ3eTX2GOCZ4An8PmO+OY3r75/9LsiffqmEDKXOPN9hacN+2aZsA+zjcccQPgEb+7eSZfiasq4/AyLAppj28rQv4LrLLQyMrAKjGPwrIoA4WbOiWtMoIb5/Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck2k0fZw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A73C433C7;
	Mon, 29 Jan 2024 22:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706567059;
	bh=ybFG/1Z4KxjabyhfsG3KnCV0yC0WVemE8bZH31BWBWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ck2k0fZwm/Pk8pIi0KJeREyhovqDDsGwMIZgTbTDEMIvOq+jcsS6gwzg6tSqm2yg/
	 Un7ZiJ28Dy5HREDsy3riYcb7eyEhabvcj1iKQ4sPAxSVHGGGB0HE/fsf2aBy4FAhMQ
	 pEC7ux/ujiSzz8Y7i5g4gIQxwMxX5NHtu9xqWz+Qb4x2l05G7BsmL3oMOh4m6siavA
	 TCiOXzOQdnUGZzjSpIyAukY0UNO5mkt2X8Sy5TzavFpMOQQLgruDl//y/D89GDN+T+
	 JkRoApJbNDyjseUhath0mAq9O1iHmGXNMri1QlN1mzR6hlIcdcMBI3yBc8XFxF9QZ+
	 VFCMG08qKy0mw==
Date: Mon, 29 Jan 2024 16:24:17 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Haojian Zhuang <haojian.zhuang@linaro.org>,
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Tom Joseph <tjoseph@cadence.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pci@vger.kernel.org, gregory.clement@bootlin.com,
	theo.lebrun@bootlin.com, thomas.petazzoni@bootlin.com,
	u-kumar1@ti.com
Subject: Re: [PATCH v2 13/15] PCI: cadence: add resume support to
 cdns_pcie_host_setup()
Message-ID: <20240129222417.GA477936@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240129221647.GA477676@bhelgaas>

On Mon, Jan 29, 2024 at 04:16:49PM -0600, Bjorn Helgaas wrote:
> On Fri, Jan 26, 2024 at 03:43:39PM -0600, Bjorn Helgaas wrote:
> > On Fri, Jan 26, 2024 at 03:36:55PM +0100, Thomas Richard wrote:
> > > From: Théo Lebrun <theo.lebrun@bootlin.com>
> > > 
> > > That function mixes probe structure init and hardware config.
> > > The whole hardware config part must be done at resume after a suspend to
> > > ram.
> > > We therefore pass it a boolean flag determining if we are at probe or at
> > > resume.
> > ...

> > It'd be super nice to have them the same.  Passing in a "probe" flag
> > works but seems a little harder to read in cdns_pcie_host_setup() and
> > you have to keep track of what it means in the callers.
> 
> Maybe a better way to say this is that this patch uses the "probe"
> flag to select the behavior of cdns_pcie_host_setup(), and I think it
> would be nicer to split those two behaviors into separate functions.

Oops, sorry, Andy, I wrote this before I saw your similar response
from last Friday.  Didn't mean to repeat what you already said!

Bjorn

