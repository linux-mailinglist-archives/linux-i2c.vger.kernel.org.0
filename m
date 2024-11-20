Return-Path: <linux-i2c+bounces-8075-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A96A59D33CF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 07:54:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02434B20E5D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Nov 2024 06:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76AB158D94;
	Wed, 20 Nov 2024 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hs0kvvOv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864821876;
	Wed, 20 Nov 2024 06:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732085650; cv=none; b=Oyc/gzmAggElC+YrZlGDsWNKrvxHRDD8x05BLQMSTxU//nPhuSW6PmDKPyaw4lOIbuAZbvOIZcetZQuEZ45Y0jpO1Oyd+JYRgrsndHj2k+1JBzggrMNLlqhN5+LgHzPeaItWL3Lt2wEocd+g4Ojz2mzDaIOf7i7k0Kw40+5bvEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732085650; c=relaxed/simple;
	bh=yu0IVEbUHfOiqCOXFtKIo8jBF0HFsQeEynvGjcvNELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulAGoXc5TIeUlgrrI/Mp86pP52sG5+YF1JymeGQ/oRqWQ8VhN3fiiGFziJhNSqFxAQILS6IdUbcIFZUz9sTCLqvfEkCdhrGCLdlYr0SmvX/9QyHSJQVcBHIYWUZw6/csGIg1T2v4voJJ4Ky3SlTXNs2BkLZ5mRDBQ0gt3CcSCPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hs0kvvOv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6954CC4CECD;
	Wed, 20 Nov 2024 06:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732085650;
	bh=yu0IVEbUHfOiqCOXFtKIo8jBF0HFsQeEynvGjcvNELw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hs0kvvOvB6EcOyu+DecW4JQwfXGTTJf/6WS3IneXaxhzQ7mCu7eid687fHls1LqR4
	 hVQKmoCeYYzKhg79WNjIfngDZv3Lasyw42DmaJ+pKXXILr8E2Y72GkStjOrN3dLe39
	 wJzV2dNuGPMZ6j3WyTBGBM2G9lei0aZYx3+q3o8Bh7SB3R6jHn5sRwEkZ3FpBHe0eh
	 895uK8IKGwN/BVbfBI2leAI85qRvGeXZl6Lgnp/8bh71dfExQPd1UM9XzlibNTmc8e
	 BrGtmWRZVvM/Kh9sWNyqMp2kEfo3hIhCYl21Rs5S9uy3vYoz+fIKw3UFbXxtdMH/D+
	 /A2DHGXLlw86w==
Date: Wed, 20 Nov 2024 07:54:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Brendan Higgins <brendanhiggins@google.com>, Tommy Huang <tommy_huang@aspeedtech.com>, 
	"benh@kernel.crashing.org" <benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>, "wsa@kernel.org" <wsa@kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	BMC-SW <BMC-SW@aspeedtech.com>, "brendan.higgins@linux.dev" <brendan.higgins@linux.dev>
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <37pcpov3u7oitszupqaw3upujy7fmns64gijqea5tz3m5zq4yy@stxttuqde5dz>
References: <20241115044303.50877-1-brendanhiggins@google.com>
 <ZzcPJ9sweqxLZOGf@ninjato>
 <OS8PR06MB75413EC87F76AD0B1BBA0FEFF2272@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <x2rt6k5hw2km2vm4wjnqihop3xcy3uirhxs5wvhnesxc2athgb@c2ra7a62mfve>
 <OS8PR06MB754190CEF8763CCF5CE89899F2202@OS8PR06MB7541.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB754190CEF8763CCF5CE89899F2202@OS8PR06MB7541.apcprd06.prod.outlook.com>

Hi Ryan,

...

> > > > > I see that I am the only person actually listed as the maintainer
> > > > > at the moment, and I don't want to leave this in an unmaintained state.
> > > > > What does everyone think? Are we cool with Ryan as the new
> > maintainer?
> > > >
> > > > I am fine, depends on Ryan as far as I am concerned.
> > > Thanks a lot, Brendan.
> > > I am ok to be a maintainer.
> > 
> > can I take this as an a-b by you?
> > 
> Sorry, I don't know your "a-b" means.
> If to be maintainer, Sure, I am willing to be.

a-b is short for "Acked-by:". I assume you have acked this patch :-)

So, thanks Ryan for taking this driver on you, I hope you'll
enjoy. I took this patch into i2c/i2c-host-fixes.

Andi

P.S.
Sometimes you will see r-b which stands for "Reviewed-by".
Sometimes SoB or Sob or s-b for "Signed-off-by".

It's just a way to overcomplicate something that is easy :-)

