Return-Path: <linux-i2c+bounces-2806-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F76289AF79
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 10:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A2B1C211BD
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Apr 2024 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D291119A;
	Sun,  7 Apr 2024 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM0U4Bsc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4F610A14;
	Sun,  7 Apr 2024 08:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712477573; cv=none; b=ueiBleiUm8Z0jDy0S/EyGF8bfke33qbELEQZORjji7Qku8vyep/AigtJTYI8RIv+8MYxzjnathjolTqrGfZFUMkKs5wmvAXuzHnJxKKo4w1eOZBjFQpk58csZwKKSuN+HmVhIhauauv+QzxGV1+He0wuXGI7gM7ndaJDoqav2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712477573; c=relaxed/simple;
	bh=ECyWhuab0F0ilbkmVh7dcV7STv/BUyc/J9I3cEzrWD4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PV0sDY9kQuhhYvcRHYgHvrQB+lBCMSOU/wATRicc9mFZ6wfRiE4iz0rfeB3kBitNQWvMnIxbjexPo7O26bDBn9t8OupPrtmOXfaBU0hyj03Cku+71knCvysfOeIicYOdqElaiJHQze2wDZo8WNOy0CzNL3+TXBzQ0+O+hYMHJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM0U4Bsc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2D9C433C7;
	Sun,  7 Apr 2024 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712477572;
	bh=ECyWhuab0F0ilbkmVh7dcV7STv/BUyc/J9I3cEzrWD4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HM0U4BscY1gq7quxz7G+hZWdtifPXZg2i2ka1SoGG62usQB3jVSRer57VvreqoU3Q
	 bucakV508aRHUvXLh1OlrfzuFKMuNinqYh95f1ImNC+oaRWvr5aT3JiQ0NJT3t3trJ
	 YzgFZfn85bL+RVrP7/iTLvrpAE3atC/NNGblBeuwp1NDes1pUFJkZVWIHM/D1shicw
	 Wjp4kMFp9FbSgox2UqVmetouYEwj5tyMmbIkXwQtzKsy7uDsO4HPDn0333xAca1PGZ
	 3tf0kSK4eoAkyfTjUc56NeAhjaM8YDlegfHXO79Fi8V9GW+Swou/tajAqAjYrP4dz1
	 F4lewmeXCYmRA==
Date: Sun, 7 Apr 2024 13:42:48 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	quic_vdadhani@quicinc.com,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <ZhJVgDVthhr4hISg@matsya>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>

On 02-04-24, 18:44, Andi Shyti wrote:
> Hi Vinod,
> 
> On Fri, Mar 29, 2024 at 10:15:24PM +0530, Vinod Koul wrote:
> > On 28-03-24, 08:36, Andi Shyti wrote:
> > > Hi
> > > 
> > > On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> > > > I2C driver currently reports "DMA txn failed" error even though it's
> > > > NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> > > > on the bus instead of generic transfer failure which doesn't give any
> > > > specific clue.
> > > > 
> > > > Make Changes inside i2c driver callback handler function
> > > > i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> > > > stores the error status during error interrupt.
> > > > 
> > > > [...]
> > > 
> > > Applied to i2c/i2c-host-next on
> > > 
> > > git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> > 
> > You applied changes to dmaengine driver without my ack! I dont agree to
> > the approach here, we could do better
> 
> this must be an error from b4 ty. The changes have been added to
> 
> pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> branch i2c/i2c-host, As it has been agreed from very long.
> 
> Anyway, the changes are in -next. What do we do now? Do I revert
> it? Mukesh, can you please agree with Vinod?

I dont apply patches to other subsystem without the ack. Either way you
can ask always! 

I will leave it upto you...

-- 
~Vinod

