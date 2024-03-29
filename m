Return-Path: <linux-i2c+bounces-2678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 536F38927F8
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Mar 2024 00:55:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 855601C21378
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Mar 2024 23:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3EC713E3FD;
	Fri, 29 Mar 2024 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRBBhENU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AA85644;
	Fri, 29 Mar 2024 23:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711756500; cv=none; b=Sn5EsEj6iku1JlPCEJgWPKiSXqYwTQSllmrdpUCOXpiAJodvqrW7N2FXCYwH5t5y1QXIVJLgQ4SFTNUo3cTKgdbmLpj1rTcFBbmx6zsKW7pumm6KtEfWbj3Q3IYoNTPIlmA4/rICrmEi9QkkemSy/z/rodYPPKSAkaU4GtdYUTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711756500; c=relaxed/simple;
	bh=qeoez9ZPUzTd3Q2NKfA2e2k8lx5b8TFJ7Z/BE/D0yCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeIsdWQYI1iIS2yeLTK1iZCH25/D0bttRCqaLl406QMz4kJAS552he+Y+WNUELyU77wrOlzif81bcDX4Mr+DP+bhc60wrnvIyHGOXmwXyyJJlEyRc95FLeMjoQW6DYJgRqHc6gSyhIp93nr0McXRH+fhaDVshrrKyqpKLdSZGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRBBhENU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99D6BC433C7;
	Fri, 29 Mar 2024 23:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711756500;
	bh=qeoez9ZPUzTd3Q2NKfA2e2k8lx5b8TFJ7Z/BE/D0yCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dRBBhENUyWeK+c09cMAQRqguYXZ1dBOm/LTKAqwzBcauccPYHPByg+R1fipX9gmPh
	 nWzfgMy/zyKclpTbZJxJBNhipDPNdGozdiS1m+eupU54SnYaq2HJxnwNuKK/1otZXZ
	 Q7mr7SXYLnPFzLLX9yS3VD7IjHSEIaPqTbscerPbABf2T5WvvWMNsj1zZKHbmp+lwJ
	 Z22idm+2ThIfkJ1wqVcRd1AY71BJyUJsDPFavEYF4HzNBX4u0PTl97Fl4RSIZ4k37t
	 JfbGJ5+h1PG//0YTiA7Aal/RKqtxyiEzk6hLUO5auhEB7/4ebbozJsqjm5mQrTFGct
	 K1FdDXDePepcA==
Date: Sat, 30 Mar 2024 00:54:56 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	quic_vdadhani@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <mo7d5ayw4gy2lqb6e5o4ijegodx6a5naytatwmoblujftwdjfg@sc4amlo3va7g>
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

This patch has been around for quite some time and there has been
time to review it. Altrady two people have approved it.

This patch has already been merged once via the i2c with the
agreement of everyone, but reverted for a trivial failure.

Your review come after I have merged the patch (I did merge it
even earlier, but forgot to send the notification, which was
anyway sent before your review).

Above all, I appreciate your review, but it wouldn't be fair to
revert it now. If Mukesh is OK, I can do it, otherwise we can
send subsequent patches.

Mukesh, please let me know what's your preference.

Andi

