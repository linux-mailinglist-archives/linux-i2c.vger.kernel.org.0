Return-Path: <linux-i2c+bounces-2283-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0E8763E5
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 13:01:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0B512824E1
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Mar 2024 12:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7420C5647F;
	Fri,  8 Mar 2024 12:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W97ON/Ls"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6D5645C;
	Fri,  8 Mar 2024 12:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709899257; cv=none; b=sybCZFKsQwFbyr8SfX73cXlPbr1e7DOkdUYoqVtlAm6z4cL5fmEeZ1sG03bKyMSXsuzOcbA041YRVJ4QFpoRY71we4MhRwM9EVf006zXg4q4xqba/JcBSYcucGc05xUjnxVsIQ2nx4OPklSGV1j34+KutTZJgzzVINBPuV4sQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709899257; c=relaxed/simple;
	bh=LWR/498Kq6rWVdryO0v1b1PSggeQr7N6MpR1wJl067U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSOM/ZbC3fhOs8VCUVtZVQ4bIgnIYrXMaFhAWqTiUUaLb4fIk5cVVIHBwMoohGJlUFJVZGHqORVreFS75Lie9neMv/ze1GZ84GIan6rkI1LkOowm/m/xd71aoxSepyK0b2BenuBQYSqTIcUupwd50BEGsUeecv8hjn3QS8t0FyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W97ON/Ls; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F73FC433F1;
	Fri,  8 Mar 2024 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709899256;
	bh=LWR/498Kq6rWVdryO0v1b1PSggeQr7N6MpR1wJl067U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W97ON/LsH20ncTfxxUqSWOkOYpd0BhJEkl8fgQfPySxsw0gJetxHxtGAtkcpVq4HD
	 io9mF/6xV3QiRu0Xo6TglH/B5u9Z9O4PlQFz4irLpWtzqsQv6wE+IJGtQyJrvWYUOd
	 TW8QQEKuRmcBGN1kbBWh99Kx80oEIkl5o1RfISsEYChqQFX5BUwZHn+lQzFXHALWtx
	 9/WX87FKrWhm9vb7Fy3r1xB+uaQL9Jvcfrraj7Ls6+korh8RKOZxsxaB73g7qMMg1n
	 hkU6zuFzbnFz5x0iTEcyg4fauar8m4FkSFgPjJnzFA2SfqrcLMzI930C4sbci4FSr3
	 WtpMIB/2Tntrg==
Date: Fri, 8 Mar 2024 13:00:53 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: konrad.dybcio@linaro.org, andersson@kernel.org, vkoul@kernel.org, 
	wsa@kernel.org, linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, quic_vdadhani@quicinc.com
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Parse Error correctly in i2c GSI
 mode
Message-ID: <tbbpjk7ddpqnbtdu26pdcj3kzpanbih7cnok6vudbjq32qeoly@rrdsi2mgfsfp>
References: <20240307205539.217204-1-quic_msavaliy@quicinc.com>
 <cmtru4nvoab6g5emp2yrxnvfpvtrcsuna6dqsyewpagg3qmkau@r2zoj6vgslet>
 <9dbe987a-fdd1-4bec-b350-5936abf69b1b@quicinc.com>
 <yocn3rjxn37c7qniv2kkawgg2k7ghdwvrxcf77tdlpujnul3du@6oqvt5v4ykno>
 <6bacd2be-14d4-49cc-9c98-7010a5f9f9bc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bacd2be-14d4-49cc-9c98-7010a5f9f9bc@quicinc.com>

Hi Mukesh,

> > > > > Fixes: d8703554f4de ("i2c: qcom-geni: Add support for GPI DMA")
> > > > 
> > > > I still don't understand what's the fix here. You are making a
> > > > generic DMA error to be more specific... where is the bug? What
> > > > exactly is broken now?
> > > > 
> > > This is about being particular while reporting specific error.
> > > Like i mentioned, instead of generic DMA transfer error, it should be
> > > particular error 1) NACK 2) BUT_PROTO 3)ARB_LOST.
> > > Ofcourse when data transfer via DMA fails, it can be considered as
> > > DMA Txfer fail.
> > > In summary so far driver was considering all failure as txfer failure,
> > > but i2c has errors which are kind of response/condition on the bus.
> > 
> > I understand that, but what I need to know is: does the system
> > crash? does the system act in unexpected way?
> > 
> > Moving from "you received an error" to "you received a nack" is
> > not a fix, it's an improvement and it should not have the Fixes
> > tag.
> > 
> > Having the Fixes tag decides which path this patch will take to
> > to reach upstream. It's important because after it gets to
> > upstream other people will take your patch and backport it older
> > kernels.
> > 
> > I want to avoid this extra work when not necessary.
> > 
> 
> Sure, then i think i should be removing fixes tag. It's not a crash but
> it's an improvement. That being said, i think don't need to CC stable kernel
> list and i should remove fixes tag ?

yes, don't need to do anything else, I will take care of
everything from now on. If Wolfram accepts a last minute pull
request, I can queue this up for 6.9.

Thank you,
Andi

