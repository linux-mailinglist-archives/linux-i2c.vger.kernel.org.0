Return-Path: <linux-i2c+bounces-12244-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A2B2137E
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 19:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 246FA626CD0
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Aug 2025 17:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A5C2D47F9;
	Mon, 11 Aug 2025 17:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UstHmftV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4D21771B;
	Mon, 11 Aug 2025 17:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754934041; cv=none; b=Z/kEvRY2FLBMXdFSKOQb9pwLqmg73sw0p/xatF6UymyirhWB+DMylRvl5yyfOfgdoykYJJ7b1xvzeGfnax26bgJ7/G/n40+GQHbSVdLrFfYuVIFS7x1JNtIQAuXUYmRsYlPBLMG4viv7LaUmgcIm9fvKBqVZdLmzBodifoh24fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754934041; c=relaxed/simple;
	bh=vNeEGZtQOxuFBJ03hCHxJ0zqee0UqgJZnTvwQUQSHrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HzgBvwaPU8AY9k1VOWqt7pOEsq9FYH26Za9bEV5h7PqxsTSIjMqRZlpqdxQoa3QkWhd+V9MNcWRu82upWgUr7Y878K1VB4bRK9eTShMQy755+8IMe11a5aD52fwG0rsezqN/Ka/kwl0onDJ9rYC67NuYOQYVUg9gJFz5ZJvb/y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UstHmftV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 853A5C4CEED;
	Mon, 11 Aug 2025 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754934040;
	bh=vNeEGZtQOxuFBJ03hCHxJ0zqee0UqgJZnTvwQUQSHrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UstHmftVxCQTMDVIZqfzPXOXwi8NsvUVZuh7gnMbMAJO75iNtUapyN9pt3lojXddG
	 2JFtVrEKDxONVM+YH8C2IvIIA7hW9k5x3y+nGBYfkkHsZivSgcckFrYyrVvKG794QY
	 d0LyZfmVRfv+7aJfjat6kooL3o32XbPKKfYad6koOc1zZFJ2NmE/n9yhm6hJx68cX6
	 svvQSl1PR4JA1TF76TO0BNZLm7vS2M/gL0QirKfeX5ZQ5DFqSd15GwcwnI9ZX51jTQ
	 +gGpSQCL4epXTgu32ZuurDjucscXI+fHhDm4gWOzEAkYGWOdBkaU6vkk42hgZU0bAO
	 ome+ZBHH2RKAA==
Date: Mon, 11 Aug 2025 23:10:35 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <aJorE6bL2d8se6E4@vaman>
References: <CAO9ioeVuAO6mYpBSpiTW0jhFRPtkubZ5eEskd1yLBHVdR8_YMA@mail.gmail.com>
 <1b55d9d4-f3ff-4cd9-8906-5f370da55732@quicinc.com>
 <28d26c70-178f-413b-b7f8-410c508cfdd7@quicinc.com>
 <CAO9ioeXBwFYL8q7x7_fHvx5YO+qyAXk4wpnfPrku4iY9yBsk0Q@mail.gmail.com>
 <cac5e84b-fbdb-47a9-860d-16a7fa4dc773@quicinc.com>
 <4q3vlydi5xgltd3pcez54alxgrehhfn4pppg47ngwp6y5k7n33@d4d4htntj64k>
 <53dd18ec-9a65-4bf7-8490-ca3eb56ce2a5@quicinc.com>
 <iang2jpe4s6wmbypmtq5uswcm6n6xntqdulyhekcz5k6zxddu3@re3rrr4dso5p>
 <aICMDROkyjzBZFHo@vaman>
 <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a149580-5044-4744-b432-9f0eef0a0d31@quicinc.com>

On 25-07-25, 16:20, Jyothi Kumar Seerapu wrote:
> 
> 
> On 7/23/2025 12:45 PM, Vinod Koul wrote:
> > On 22-07-25, 15:46, Dmitry Baryshkov wrote:
> > > On Tue, Jul 22, 2025 at 05:50:08PM +0530, Jyothi Kumar Seerapu wrote:
> > > > On 7/19/2025 3:27 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jul 07, 2025 at 09:58:30PM +0530, Jyothi Kumar Seerapu wrote:
> > > > > > On 7/4/2025 1:11 AM, Dmitry Baryshkov wrote:
> > > > > > > On Thu, 3 Jul 2025 at 15:51, Jyothi Kumar Seerapu
> > 
> > [Folks, would be nice to trim replies]
> > 
> > > > > > Could you please confirm if can go with the similar approach of unmap the
> > > > > > processed TREs based on a fixed threshold or constant value, instead of
> > > > > > unmapping them all at once?
> > > > > 
> > > > > I'd still say, that's a bad idea. Please stay within the boundaries of
> > > > > the DMA API.
> > > > > 
> > > > I agree with the approach you suggested—it's the GPI's responsibility to
> > > > manage the available TREs.
> > > > 
> > > > However, I'm curious whether can we set a dynamic watermark value perhaps
> > > > half the available TREs) to trigger unmapping of processed TREs ? This would
> > > > allow the software to prepare the next set of TREs while the hardware
> > > > continues processing the remaining ones, enabling better parallelism and
> > > > throughput.
> > > 
> > > Let's land the simple implementation first, which can then be improved.
> > > However I don't see any way to return 'above the watermark' from the DMA
> > > controller. You might need to enhance the API.
> > 
> > Traditionally, we set the dma transfers for watermark level and we get a
> > interrupt. So you might want to set the callback for watermark level
> > and then do mapping/unmapping etc in the callback. This is typical model
> > for dmaengines, we should follow that well
> > 
> > BR
> 
> Thanks Dmitry and Vinod, I will work on V7 patch for submitting the I2C
> messages until they fit and and unmap all processed messages together for
> now.
> 
> Regarding the watermark mechanism, looks GENI SE DMA supports watermark
> interrupts but it appears that GPI DMA doesn't have such provision of
> watermark.

What is the mechanism to get interrupts from the GPI? If you submit 10
txn, can you ask it to interrupt when half of them are done?

-- 
~Vinod

