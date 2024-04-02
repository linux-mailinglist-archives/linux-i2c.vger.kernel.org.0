Return-Path: <linux-i2c+bounces-2731-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E48959FB
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 18:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6C181C22BA6
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Apr 2024 16:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7292D159901;
	Tue,  2 Apr 2024 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml65pl4R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F242AD1E;
	Tue,  2 Apr 2024 16:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712076290; cv=none; b=SHxKdqaMOjndG9iD3WFVddQf2iHJZ4AeUbQ1p9nFQB/2zih8JkA30aRh8QjdOd19co5HYwqn2lU5+YY7KBJ1IXnH83EWKkM+TC8y5UT5QZaI9Q7exx4r+aSMoJEUMKEyyixqSQQLXRURvCHyFod9yeWbZa1Sz05z7RVkTWZTLac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712076290; c=relaxed/simple;
	bh=ArAEjvxRWa3ejxTAbxZrelEmPh3To0VkbfB3gGDLz/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFFjcWz0j1R+hBa8kl2ZAsKnivJle4QrBl6E1wgJyV8FrTmhFWSCcNi1qSzMz5i3t/Wj0emNVOtTCaSyYi+5rQybQNwbsgPJIfJQB5fG/YUBtQbjTxgVCkx8jI9KagMxlJJzkemZQfQUKAewuTIlJKol7WYdLEA89CdsmydOdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml65pl4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A976C433C7;
	Tue,  2 Apr 2024 16:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712076289;
	bh=ArAEjvxRWa3ejxTAbxZrelEmPh3To0VkbfB3gGDLz/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ml65pl4Rz73ExvROKIV9pAtzpNIFldag8HnsSViRoJwszA4hJKyPY/OrORzSjCPSn
	 vkm7+hkRWP0JBGLe5oypYjAEqg2h4h2ln+i8ALPwxGu/m+Oeh8YJqLCzzwazA0wCSv
	 7UbTHB1VYSSH0g47kNQ2tSki9Scpry0P5uV3+a1WSeF+Mf6dTwWZRVTWv0/z1EqLJ8
	 9/uBJpMBCCD1VQouOK58kHguyucDy+L4rsfrGB/HtuTThzW4Of0AWd2G3HoAmklyED
	 hgkZnTb6hwMMBL7QZgvUM8rdcAHSjpUx2/6s4WPTmz3m7wx4lA1I8RasK7rmXbhqab
	 WaDB1RJQU7Ryg==
Date: Tue, 2 Apr 2024 18:44:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	quic_vdadhani@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgbwJAb7Ffktf554@matsya>

Hi Vinod,

On Fri, Mar 29, 2024 at 10:15:24PM +0530, Vinod Koul wrote:
> On 28-03-24, 08:36, Andi Shyti wrote:
> > Hi
> > 
> > On Wed, 13 Mar 2024 10:56:39 +0530, Mukesh Kumar Savaliya wrote:
> > > I2C driver currently reports "DMA txn failed" error even though it's
> > > NACK OR BUS_PROTO OR ARB_LOST. Detect NACK error when no device ACKs
> > > on the bus instead of generic transfer failure which doesn't give any
> > > specific clue.
> > > 
> > > Make Changes inside i2c driver callback handler function
> > > i2c_gpi_cb_result() to parse these errors and make sure GSI driver
> > > stores the error status during error interrupt.
> > > 
> > > [...]
> > 
> > Applied to i2c/i2c-host-next on
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/local tree
> 
> You applied changes to dmaengine driver without my ack! I dont agree to
> the approach here, we could do better

this must be an error from b4 ty. The changes have been added to

pub/scm/linux/kernel/git/andi.shyti/linux.git

branch i2c/i2c-host, As it has been agreed from very long.

Anyway, the changes are in -next. What do we do now? Do I revert
it? Mukesh, can you please agree with Vinod?

Andi

