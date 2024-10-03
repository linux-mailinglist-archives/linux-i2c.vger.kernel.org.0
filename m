Return-Path: <linux-i2c+bounces-7206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FE98EF19
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 14:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEAF328517D
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Oct 2024 12:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7135E170853;
	Thu,  3 Oct 2024 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H4FgrxZE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20071155A21;
	Thu,  3 Oct 2024 12:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727958058; cv=none; b=j3XuBXMnY8x7jfylWPvJDcJW3K5qavJu1ECDj1YnDp34KCXE/Y9tdceQNV+LWKBjzEmL/RGN3VHJ68FPlRL6utUEbu0DjN9OJh+IbmMm8hwhLSQTsQteJK6CJYbYKd0A1Ei/q9hEiZmxmSQ9gRNFjVws/ZBRbuyrHefLNGen34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727958058; c=relaxed/simple;
	bh=Pf0+TU0f00yp9qWjNLSXwb+armxPLekuoPDpZwMlAbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhREeQgLpCABEY++r7qiBLFojCiaqDtJ3snduH3uZDbYTR8nya0WNBJVIZ6HnsZcYu6ujju+RUCLZLnusZ+3gjeFBY4tmD+xHh1497GQ62XWHY6q+Z99x/yS+Q93WEA/mV0txbYh5auyxvVbcAAlhIt/kLfMlgwHsPN1iMp74j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H4FgrxZE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCCBC4CEC5;
	Thu,  3 Oct 2024 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727958057;
	bh=Pf0+TU0f00yp9qWjNLSXwb+armxPLekuoPDpZwMlAbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4FgrxZEgU3kWjhmgdHrOtlgKcYXTXghBdWGkzxNjk6OIJqt+Pe476dPs11yGTjuu
	 0tu4/7ntUBgEvNs/JFtoiW35MsWnsi8kQr4KHsDA456buueTqDWkgAZsZUY3liCQKc
	 /BCml7jgM62ad7O21bW94xZjnyle2r22HOE6qDJRHqfLY4gRK21bIpI2Fit2TalhVK
	 FwyO44A2clQQsnz4cn2TP/7wiFyiEbFw5NlkUtSFpIZe270R61Ap3plvZa6+UGriDr
	 BpoXbJhQxBegfUYXZLxoBUF14TPA+cgkCe9nDa/I6Sm/Pnehfo96yFDD9ogZFcB2Vb
	 OsYGVU6G2zRcw==
Date: Thu, 3 Oct 2024 14:20:54 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, 
	"brendan.higgins@linux.dev" <brendan.higgins@linux.dev>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
	"joel@jms.id.au" <joel@jms.id.au>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v14 0/3] Add ASPEED AST2600 I2Cv2 controller driver
Message-ID: <dun5dterlkikft4p2yuuebb2e4nyzed7xeofmeivzldeardhmf@kzv3iokk6cxn>
References: <20241002070213.1165263-1-ryan_chen@aspeedtech.com>
 <Zv1aOedi9xl2mg9b@smile.fi.intel.com>
 <SI6PR06MB75359904E108D7D0CC89A329F2712@SI6PR06MB7535.apcprd06.prod.outlook.com>
 <Zv5u1gTK9yug7rbK@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv5u1gTK9yug7rbK@smile.fi.intel.com>

Hi,

On Thu, Oct 03, 2024 at 01:15:50PM GMT, Andy Shevchenko wrote:
> On Thu, Oct 03, 2024 at 03:41:57AM +0000, Ryan Chen wrote:
> > > On Wed, Oct 02, 2024 at 03:02:10PM +0800, Ryan Chen wrote:
> 
> ...
> 
> > > Is it possible to switch to new terminology wherever it's possible?
> > > I.e. master --> controller, slave --> target. See, for example, f872d28500bd
> > > ("i2c: uniphier-f: reword according to newest specification").
> > > 
> > Just for cover latter? Or I should modify for each patches commit message?
> > Or entire i2c driver statement need switch to target?
> 
> I believe everywhere, where it applies: driver code, comments, documentation,
> commit messages...

If the datasheet refers to a register, state, or any other
hardware property as master/slave, we should retain the
master/slave terminology. Otherwise, we should follow the i2c and
smbus specifications and use controller/target.

Andi

