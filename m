Return-Path: <linux-i2c+bounces-2978-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C18A6F49
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 17:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AE2F1F217E4
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 15:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1967412FF9F;
	Tue, 16 Apr 2024 15:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Evlue0WE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE3E12AACA;
	Tue, 16 Apr 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713279925; cv=none; b=sQCTTemznZKOb9/jzHv83/zGIWdDpskWnFnJtV+aCAweUufGuOSlzYJQH7R6cMjeZfB+RUdxxgK+ONtOnfZf1xquF/pHYG1iEYbiGh5DQ8ghsrkRliHHiO89pNI9FkoNVUaLXCI3T9Zq/33SvYc0gg09VuwcC6I4EnVIE2I/JrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713279925; c=relaxed/simple;
	bh=eoUEUNDDT3IISkVkLcQVShb7N8n4cu8oTCAwsjC3QRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b1E/ddFx7XUE+VfrRIlokjI9OFNRCgMx2/D1Ur96YXwcsjDlPyh1wSvl58ZebqU47YHDyCkG1okS2SasYVXisxgzpb0IoaULikr/ojAK2AYmeRh5aa36uJGDAzIIF4wSGXzwZnchSJ9RWw9I4YJ7Zy3ytroeUj9U5stxObiSv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Evlue0WE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72DACC113CE;
	Tue, 16 Apr 2024 15:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713279925;
	bh=eoUEUNDDT3IISkVkLcQVShb7N8n4cu8oTCAwsjC3QRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Evlue0WEIc8vjVKo7214wtqrJwG33LppDFpOSjHmzZdLCpH0Q5ZwKbIIiRdjODvRi
	 io69mrj6mVB9dGbkDBmiNtGdXiX5X/SQ19kkg4C77i/9vZM0ArEnmYW3JquUAY7Y+D
	 idxob1Z1DbnhbnMD+JG+/TXq45ba4+/JMMJ5RIJrNmsReWNyKb3tuBkk4R9hBh1+r4
	 PU1VIJvEhcRnV5C4TUQ6vOasuo0TndKz0yClmR+lyJfUPdkO3zcH6vquhQnZ8dBksj
	 KjL8P5Dt8rAVG30LcylEElB/LEjPH+JGka8otxNzGzv5QGpGiAIhE8xV1GR8wMZY3x
	 0dZbj9gZT6ESw==
Date: Tue, 16 Apr 2024 17:05:21 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	quic_vdadhani@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <j3zupurwq5vtzfwby7ubl7ft75fqqhutk4vfqolihkcldfcesi@ywwfnkjcfhgu>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
 <ZhJVgDVthhr4hISg@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhJVgDVthhr4hISg@matsya>

Hi Vinod, Mukesh,

On Sun, Apr 07, 2024 at 01:42:48PM +0530, Vinod Koul wrote:
> On 02-04-24, 18:44, Andi Shyti wrote:
> > On Fri, Mar 29, 2024 at 10:15:24PM +0530, Vinod Koul wrote:
> > > On 28-03-24, 08:36, Andi Shyti wrote:
> > > > On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> > > > > I2C driver currently reports "DMA txn failed" error even though it's
> > > > > NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> > > > > on the bus instead of generic transfer failure which doesn't give any
> > > > > specific clue.
> > > > > 
> > > > > Make Changes inside i2c driver callback handler function
> > > > > i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> > > > > stores the error status during error interrupt.
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied to i2c/i2c-host-next on
> > > > 
> > > > git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> > > 
> > > You applied changes to dmaengine driver without my ack! I dont agree to
> > > the approach here, we could do better
> > 
> > this must be an error from b4 ty. The changes have been added to
> > 
> > pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> > branch i2c/i2c-host, As it has been agreed from very long.
> > 
> > Anyway, the changes are in -next. What do we do now? Do I revert
> > it? Mukesh, can you please agree with Vinod?
> 
> I dont apply patches to other subsystem without the ack. Either way you
> can ask always! 

Yes, you are totally right; but please, keep in mind that this
patch has some history and I would have loved to hear from you
earlier. Anyway...

> I will leave it upto you...

... Mukesh, I'm sorry, but I'm going to revert this patch again
until we address all the last minute issues from Vinod. The
silence on this thread is worrying me more than reverting it.

I hope this will be the last time I revert this patch.

Moreover, in order to avoid maintainers' rumble (:)), please
let's try to split patches that are touching more than one
subsystems keeping the logical meainings intact.

I hope this is fine with you, Vinod.

Andi

