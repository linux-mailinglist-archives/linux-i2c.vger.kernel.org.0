Return-Path: <linux-i2c+bounces-12000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBEAB0EB8F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 09:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6FD23B29B2
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jul 2025 07:15:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B56526CE0F;
	Wed, 23 Jul 2025 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ryz3mPKK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3926E25C833;
	Wed, 23 Jul 2025 07:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753254930; cv=none; b=mVosIi6q0vdqEy75zIuFQIKjFyKkV205OxalL2sYVsj+8pOufjfTTWhGP5QbVOOQqNVNS1UaplMvAb735IkTRAv+X+yp0Lh5+k7NvDOcMLR6c7LRih/2y9L+TKhZ7TRt6s3mvqHIjV9io864KfYzZxES6rr+JyUVhkTBl6v/MO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753254930; c=relaxed/simple;
	bh=aoQqriX7CooIPgMf9W7uo25rnfymCO1WAzndg4imAxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1L7qOpc3qCa3/ll8FLToB+t2etZMtHvpNsstK3C6IG0KyRqbox5AfNsdea6n3DGAMkKtkxZ/5bCeIQR+g8FsAG4S0Ub9tWFumdhL6pLbi0c9w2lY+HpNSLj1UdGJpkFEtHxoqA/YPb6dw0gi55oa8TRRxyxHydIma9CTJAuRqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ryz3mPKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEA7C4CEE7;
	Wed, 23 Jul 2025 07:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753254929;
	bh=aoQqriX7CooIPgMf9W7uo25rnfymCO1WAzndg4imAxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ryz3mPKKqpMYfFdxtdLwsLUNADzvjjWOQj9xApvRL/oZjV4pGyNB2CcAVql1LM8gG
	 1OF9dXIptw4qYkMUmgtx+r9Vp/wvKnGmqsj/PV77SOobPPfX7QQQ3jHGzTw3TdaEqp
	 k9Z9zcaC1+9uZRm3Llky+X0MyyzfgEK2GILXMURVCyZV6vZAUrBZSrsyoTi2S0Supq
	 1n0X1Y8POOkozkFMTU5KAB9sxAqzQQZRkqNSJpjrGJIA8ME/leaiOBYrfGni7yGH4K
	 jcZ0K4UK0HtJs8RpnVR3qiQEqUeIoTK9cVtc9oXU7KT5bDUpV4tGlAvAI5jKFzuvm2
	 crjsI7K7CdRXQ==
Date: Wed, 23 Jul 2025 12:45:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v6 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <aICMDROkyjzBZFHo@vaman>
References: <644oygj43z2um42tmmldp3feemgzrdoirzfw7pu27k4zi76bwg@wfxbtgqqgh4p>
 <dc7358a1-ddc5-402e-9024-283f8e46e3b6@quicinc.com>
 <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>

On 22-07-25, 15:46, Dmitry Baryshkov wrote:
> On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
> > On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
> > > On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
> > > > On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
> > > > > On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu

[Folks, would be nice to trim replies]

> > > > Could you please confirm if can go with the similar approach of unmap the
> > > > processed TREs based on a fixed threshold or constant value, instead of
> > > > unmapping them all at once?
> > > 
> > > I'd still say, that's a bad idea. Please stay within the boundaries of
> > > the DMA API.
> > >
> > I agree with the approach you suggested—it's the GPI's responsibility to
> > manage the available TREs.
> > 
> > However, I'm curious whether can we set a dynamic watermark value perhaps
> > half the available TREs) to trigger unmapping of processed TREs ? This would
> > allow the software to prepare the next set of TREs while the hardware
> > continues processing the remaining ones, enabling better parallelism and
> > throughput.
> 
> Let's land the simple implementation first, which can then be improved.
> However I don't see any way to return 'above the watermark' from the DMA
> controller. You might need to enhance the API.

Traditionally, we set the dma transfers for watermark level and we get a
interrupt. So you might want to set the callback for watermark level
and then do mapping/unmapping etc in the callback. This is typical model
for dmaengines, we should follow that well

BR
-- 
~Vinod

