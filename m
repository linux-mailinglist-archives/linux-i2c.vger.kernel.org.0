Return-Path: <linux-i2c+bounces-2273-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838C4875E19
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 08:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3CB282C3F
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 07:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E677A4EB32;
	Fri,  8 Mar 2024 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a5r/nxFN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8928F1CFB2;
	Fri,  8 Mar 2024 07:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709881335; cv=none; b=I5sRy2WcfkEHIGjlJEWu6bdyQg1ubOMpbYZVbwQSqbcP9lMFvB0b1xOV3csTdAoMG1TcOB1k4Y25osLphIIK908/V/DxdRJqawvIu1ionXUsOAepKoGVPSmFjXCAHVPS1WElI5i42RguZoMGoBXp+MQ7efIVbUA6gJqWwCIQvsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709881335; c=relaxed/simple;
	bh=iTLENVg3/Y3YtimadfoWFR5x7fj4yBYLoTVs3XljBhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALoE/Iw8pytXOg+HXR7W44NPzlij5U2O1bhVSm7cf+5OvJLDEk7d4sp2rkAyxIiMSJGbPXZfWnSMnXiT8F00yOZtF6cCD/g4O7aWnBlMoqZ64PO6aIosrUQRT6g2+kQrlA7VqNID2DSVsBoje6SK6VuvqM7ISI7dnkkwOg+voHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a5r/nxFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 277D1C433C7;
	Fri,  8 Mar 2024 07:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709881335;
	bh=iTLENVg3/Y3YtimadfoWFR5x7fj4yBYLoTVs3XljBhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a5r/nxFNoA9OaeVntqzq6Bwqr+WsxPU8YQ5VdWAWOqe+ho4kZqxjAJ8MjNg3RKi/R
	 1Rmm9U+vJ/3t4Brwv6zdRu7qB4A7KcMX1Lm+cW6MQ8uK9fsyrH3aS6fFcQJOGE5+4Y
	 6T6thBj7FXIUv15Iz3Et6XaMyvdUz+VLldnA0rbtNtloK3iPI9iEmiqcBmdO0NV2wa
	 0z+zGkwEqtUK/wXIgK9LLqPnQ3RhPyqJriRnj+fRsgGx9pJUgOkQJdnH/6jy5XnXiN
	 CD/x5p7mwLsUqatUBIGfAngpRuZWTgQUSarpPl7K5WFeL9EgHA/pfQLkvxbKNEe8Pg
	 KYqjQz5zM/aHg==
Date: Fri, 8 Mar 2024 08:02:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <yocn3rjxn37c7qniv2kkawgg2k7ghdwvrxcf77tdlpujnul3du@6oqvt5v4ykno>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
 <9dbe987a-fdd1-4bec-b350-5936abf69b1b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dbe987a-fdd1-4bec-b350-5936abf69b1b@quicinc.com>

Hi Mukesh,

...

> > > Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> > 
> > I still don't understand what's the fix here. You are making a
> > generic DMA error to be more specific... where is the bug? What
> > exactly is broken now?
> > 
> This is about being particular while reporting specific error.
> Like i mentioned, instead of generic DMA transfer error, it should be
> particular error 1) NACK 2) BUT_PROTO 3)ARB_LOST.
> Ofcourse when data transfer via DMA fails, it can be considered as
> DMA Txfer fail.
> In summary so far driver was considering all failure as txfer failure,
> but i2c has errors which are kind of response/condition on the bus.

I understand that, but what I need to know is: does the system
crash? does the system act in unexpected way?

Moving from "you received an error" to "you received a nack" is
not a fix, it's an improvement and it should not have the Fixes
tag.

Having the Fixes tag decides which path this patch will take to
to reach upstream. It's important because after it gets to
upstream other people will take your patch and backport it older
kernels.

I want to avoid this extra work when not necessary.

> Sorry if it confusing still, but please let me know if anything required to
> be updated in  commit log which can bring clarity.
> 
> > Besides, keep in mind, that commits with fixes tags get
> > backported to older kernels (this one dates back to 5.18) and you
> > should also Cc the stable mailing list:
> > 
> > Cc: <stable@vger.kernel.org> # v5.18+
> 
> Sure, will add into CC. was waiting for reviewed-by tag.

No need to resend.

Thanks,
Andi

