Return-Path: <linux-i2c+bounces-9502-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4E6A3C8F2
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 20:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D4D4189CBB7
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Feb 2025 19:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EAE22AE7B;
	Wed, 19 Feb 2025 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2IiOYt/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D6184F;
	Wed, 19 Feb 2025 19:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739993812; cv=none; b=W4e3pjYcpdV4oFS2hm/cKx2NkGI35dDPirLUpDuCvgrurtKrSDXkLYGCuqkaRsg5XJtcQ86On7HxZJRx2acfBSYbNGs62jX6EzlphKKOnPsQPxsrsl+Ow4P5n6s/Z8uVoejZs1Rvfsk+6zhPKA3BtI/fAy9heAMxUJuRLLl8Zbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739993812; c=relaxed/simple;
	bh=aWjGOrdanvCHhMvLkqQxVR3acimlPUcIETjy0Hy+610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=feF9bOcnnwvXWxql0d3AmKApYK2M5nR22z+0SMzj0JC6CMSPm1IJqF/A8XybLCJiyZPSHL4oOSQxtxi3Bvea3TSYAfU1h3+HadIbP4kYrWZlZA9YMg/r7UEA/nmktZ+b4700ryasvbT5SNVzSpm7xBzdeCRyS+RWiAzF3xaRsYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2IiOYt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C2DBC4CED1;
	Wed, 19 Feb 2025 19:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739993812;
	bh=aWjGOrdanvCHhMvLkqQxVR3acimlPUcIETjy0Hy+610=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2IiOYt/PmzJ4tNxnE6HYYLOXnY7+1eCZF1Kw2sU6A7AW5tb/urj1OcVBSBrvJbDh
	 fe/Y12tmW0F7DPWCCcaQN7jqgj4oTGzjTOR3CpqxKL5VhmJ4J02qa3jiWN1MHkTExa
	 /gL8uPIofzpAZ5jrxzRKyi5IlxEV+cTizxeECS3YM8oMGU239aC1H1aXiEwLule7Ai
	 xx9ebwbyA2sLRLEusSCUgP7/LTmeOIjugg4DqZQtQKebJ7lTcPUoXrgiA6HGgzpXth
	 hifyk4FYJEH/aioxFkA2ZQ/sWkhcCUBjxWjyEjbOl+5X0DHlAZ784rmGP5AmdScOHR
	 8+IKemQLIEfeA==
Date: Wed, 19 Feb 2025 20:36:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Wolfram Sang <wsa@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: qup: Vote for interconnect bandwidth to DRAM
Message-ID: <bhm7ydwoed7lufnjzwtfipmqpbyc2phun5rh7cinwogbpmscp6@s2ulyfqstlro>
References: <20231128-i2c-qup-dvfs-v1-0-59a0e3039111@kernkonzept.com>
 <20231128-i2c-qup-dvfs-v1-3-59a0e3039111@kernkonzept.com>
 <5dr5ps4vb57xj2mfelgsxgoyrr3gg4ggwqggqchff6pda3ffsn@thxpg4h6kgel>
 <dac33c2d-3bba-4ea6-8a20-12ff9b6ebbb3@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dac33c2d-3bba-4ea6-8a20-12ff9b6ebbb3@linaro.org>

Hi Krzysztof,

On Wed, Feb 19, 2025 at 08:00:25AM +0100, Krzysztof Kozlowski wrote:
> On 19/02/2025 00:02, Andi Shyti wrote:
> > sorry for the very late reply here. Just one question.
> > 
> > ...
> > 
> >> downstream/vendor driver [1]. Due to lack of documentation about the
> >> interconnect setup/behavior I cannot say exactly if this is right.
> >> Unfortunately, this is not implemented very consistently downstream...
> > 
> > Can we have someone from Qualcomm or Linaro taking a peak here?
> 
> You replied to some old email, not in my inbox anymore,

feeling nostalgic :-)

> but your quote
> lacks standard quote-template, like:
> 
> 	On 19/02/2025 00:02, Andi Shyti wrote:

I'm strictly following RFC-1855, but you're right I removed a bit
too much to lose time reference.

> so I really don't know when was it sent. For sure more than a month ago,
> maybe more? This has to be resent if you want anything done here.

It was sent on "Tue, 28 Nov 2023 10:48:34 +0100", definitely more
than a month ago, I'm also surprised to have it in my inbox. But
it still applies cleanly.

Perhaps a resend can invite people for more reviews. I don't
mind.

Thanks,
Andi

