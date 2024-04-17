Return-Path: <linux-i2c+bounces-3001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644158A8980
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 18:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95E561C237CB
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Apr 2024 16:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65FE517109B;
	Wed, 17 Apr 2024 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnbu5ssb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E0316FF3D;
	Wed, 17 Apr 2024 16:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713373077; cv=none; b=aZasATVb4yogOfzB3v7NUIkWDzEsY/h7zBSya9xB8SKSNXTFEAvm2gDQL7DhNDcTR20FZh4hEycHDAG9RFfxI1diccvESktJFDhcal8THzhgfunW7D6FNcQdKg0JA0kyfRFurHAPwfbsX23WUSX26+n1l9Q1r2lse73t60nhwng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713373077; c=relaxed/simple;
	bh=DYUL0m6ccXMv/otBInSaHCfYISs+21asH1HSW9U9wmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyQslIHxInv40StL1oJk/GL3vDhof7lzz7c7JtWDDA2fQAG5tuZezkRFsan41ThdXm18k7MelGFK9p6Uk4r1UtwYXX+YN38UWL3GUOFcP7W0s9GJ6tctvaGUzLS80OPi80XCmYDomIzHkeO2TZEZ3IIkjP0NBQ2CDnn3RhOd8ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnbu5ssb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A31C072AA;
	Wed, 17 Apr 2024 16:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713373076;
	bh=DYUL0m6ccXMv/otBInSaHCfYISs+21asH1HSW9U9wmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dnbu5ssbBWDnom3G2bJwueLXnmecegCGIW0h9WuEX9pYC2KHup4tJbibQodXDgE0I
	 oZK4CnQm2qCLiZistybAUph00C+tjx+zojJ4WQieH6oHI7bdDYC8sxp5CN/TgP0lG/
	 Db3d5SP2QbxyqoQRMKp9q1JIe/u9ckVwSDkpi4Q2moS2rQHKxCryv3r6gbVwROo5Eb
	 XJnEtvqHv0RQoK9mOmMpQh7ArjkPRFAzr5bO5hnsVmg4hQGXSpucU3mAbT4fTUnXRh
	 r4XLT3DWoSaTClUb4SS4NY7P4oBAtomqb1Lv/L4BwZvMme9gE9Rhn4++8PaVpAT2jF
	 eSJd/NpkQ1SWg==
Date: Wed, 17 Apr 2024 22:27:52 +0530
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
Message-ID: <Zh__kAdzU8a2DHLH@matsya>
References: <20240313052639.1747078-1-quic_msavaliy@quicinc.com>
 <171161140136.2698925.4294566764047886777.b4-ty@kernel.org>
 <ZgbwJAb7Ffktf554@matsya>
 <a76mmz5xrfipqpmq2ltsyobwc54dyw2d55gb4vta5d746dwb3i@5mm2ew5uudi3>
 <ZhJVgDVthhr4hISg@matsya>
 <j3zupurwq5vtzfwby7ubl7ft75fqqhutk4vfqolihkcldfcesi@ywwfnkjcfhgu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <j3zupurwq5vtzfwby7ubl7ft75fqqhutk4vfqolihkcldfcesi@ywwfnkjcfhgu>

On 16-04-24, 17:05, Andi Shyti wrote:

> > > Anyway, the changes are in -next. What do we do now? Do I revert
> > > it? Mukesh, can you please agree with Vinod?
> > 
> > I dont apply patches to other subsystem without the ack. Either way you
> > can ask always! 
> 
> Yes, you are totally right; but please, keep in mind that this
> patch has some history and I would have loved to hear from you
> earlier. Anyway...

There was merge window, I dont look up during that. Then I had some
family stuff and travel to take care... Things happen.

When in doubt pls ask, a gentle reminder goes long way!

> 
> > I will leave it upto you...
> 
> ... Mukesh, I'm sorry, but I'm going to revert this patch again
> until we address all the last minute issues from Vinod. The
> silence on this thread is worrying me more than reverting it.
> 
> I hope this will be the last time I revert this patch.
> 
> Moreover, in order to avoid maintainers' rumble (:)), please
> let's try to split patches that are touching more than one
> subsystems keeping the logical meainings intact.

That is best. Very rarely we have a situation where we add
changes which break bisect and it has to be clubbed together. But for
other cases, it should always be split!

> I hope this is fine with you, Vinod.

Thank you for understanding

-- 
~Vinod

