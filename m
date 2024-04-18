Return-Path: <linux-i2c+bounces-3007-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E306F8A96A3
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 11:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 723B2B23B53
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Apr 2024 09:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1FF15B14A;
	Thu, 18 Apr 2024 09:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYnlDahX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318B715AAD7;
	Thu, 18 Apr 2024 09:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713433759; cv=none; b=Cb9C3pRiV4SYK8mvZrUhvOgwX5zYVn/7GIdGQ12haafEoJKrRGu2QwX6kG9r2a4vVmHeaBt5eMUKa1lm19moc7dckfwo1X9UyweXed9yQxGt95idjfzVhZC1k3gLLAvsrUg5qTLDrazHnUdFZH+sNdXbnyjmmj4gkHTI8Gck/bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713433759; c=relaxed/simple;
	bh=tJ0Urn4BLG+quubxU9dNS3fApOza0xmBM3lZkeFRNuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FOdKGFfDhajYEZ2i1Ut0q7fAHZ3Hitom641JN1Cj4EkcaMH3DkHPHalxtFvPA37XFiZVxDLFO4vDbuDuFjTFQXRtVCujCoR0nVSWNss28nerkrh6HQbsSY4jr0uGeAAkUWhu5nrTW/Rdt1ppT6duGC5IODHoDnnku0jvOWDBdyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYnlDahX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60988C113CC;
	Thu, 18 Apr 2024 09:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713433758;
	bh=tJ0Urn4BLG+quubxU9dNS3fApOza0xmBM3lZkeFRNuc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IYnlDahXBVoeo0e0ajK4M+gQ/Rq2df/pwFzDaDQbg08tu+ujOjvYnuCiGgTjqh79d
	 m8jVwc0FCDR6F/ZMazzvuDfm6FHdLfmDsjozbVwnQJoXtAM7vu2shB2fSYhWUqOQnm
	 V3wD/ZmbMJ0+fluru/XzGpVFPuO4og1mdeHP8bJl82Ry1eejXTnI6XmWEAMoPe8Ch4
	 nC5+3Z91kFslHfuRB1LaY9iukv46Su2hmVw3nnolGW3HUBUjSG66AqlX5rPnvaMq6D
	 80WHxrx28lUyyHODhjGz8Rurh8dwRPVugPdKXblQ0sLfte9Mxj9F2aHRJuOtdld7so
	 9GT2KtMz0s28w==
Date: Thu, 18 Apr 2024 11:49:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, wsa@kernel.org, 
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	quic_vdadhani@quicinc.com, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <xdefqlzo6ttlpxzi2o6yjf7pkhdokx377lblqtrgleoxua5dfu@mtolpvw6lln2>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
 <ZhJVgDVthhr4hISg@matsya>
 <j3zupurwq5vtzfwby7ubl7ft75fqqhutk4vfqolihkcldfcesi@ywwfnkjcfhgu>
 <Zh__kAdzU8a2DHLH@matsya>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zh__kAdzU8a2DHLH@matsya>

Hi,

On Wed, Apr 17, 2024 at 10:27:52PM +0530, Vinod Koul wrote:
> On 16-04-24, 17:05, Andi Shyti wrote:
> > > > Anyway, the changes are in -next. What do we do now? Do I revert
> > > > it? Mukesh, can you please agree with Vinod?
> > > 
> > > I dont apply patches to other subsystem without the ack. Either way you
> > > can ask always! 
> > 
> > Yes, you are totally right; but please, keep in mind that this
> > patch has some history and I would have loved to hear from you
> > earlier. Anyway...
> 
> There was merge window, I dont look up during that. Then I had some
> family stuff and travel to take care... Things happen.
> 
> When in doubt pls ask, a gentle reminder goes long way!

sure... I'll be more patient... thanks!

> > > I will leave it upto you...
> > 
> > ... Mukesh, I'm sorry, but I'm going to revert this patch again
> > until we address all the last minute issues from Vinod. The
> > silence on this thread is worrying me more than reverting it.
> > 
> > I hope this will be the last time I revert this patch.
> > 
> > Moreover, in order to avoid maintainers' rumble (:)), please
> > let's try to split patches that are touching more than one
> > subsystems keeping the logical meainings intact.
> 
> That is best. Very rarely we have a situation where we add
> changes which break bisect and it has to be clubbed together. But for
> other cases, it should always be split!

Please Mukesh, address Vinod's comments and let's get this patch
in.

Thanks,
Andi

