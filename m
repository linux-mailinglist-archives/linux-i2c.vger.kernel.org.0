Return-Path: <linux-i2c+bounces-6802-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2E497A3C4
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 16:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 613121F24C3A
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11F3157E6B;
	Mon, 16 Sep 2024 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dvi9YBdC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C806157493;
	Mon, 16 Sep 2024 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726495570; cv=none; b=alDhe+qIyHIymw4GDnzW9K1uD8jGAjCOk20jGWDaTq39OLe1JML4NU1iGGxEwi9gd8IYrgIDzTVooa1BJi0+EjBrO3g5Q/YJD14ZTZuL1yu3mNFuiPNtxHOwe77x+1ltqypV6vTwLX2Uh1YNYXh6cnRrJCQK8w13Te9hDN9ovL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726495570; c=relaxed/simple;
	bh=1qmmmQGgtNwInelErEmNCC6yAi/d5vccGDCv62UAxtg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4LQMRhsL5ZGoZ4bHr7ylGguLAsc1kqzMpFROsx7E/Khkizv2NRk5DMTR1yaxrVOJMkmWj1kWJytZHblr06H22Q+a5VsCaCaDxn8O1EodQaHtwbcATjKvspdmUW+BNH9fVcIs6boe4zTdNXCUVW/S78HQR0vilamvNH1b1LHX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dvi9YBdC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59DFDC4CEC4;
	Mon, 16 Sep 2024 14:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726495569;
	bh=1qmmmQGgtNwInelErEmNCC6yAi/d5vccGDCv62UAxtg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=dvi9YBdCeuX7O9Co1XdUUTSgA5LoAP4pngt1LAaUiiT1tyUpxsSn45+CZJJc9JJ3d
	 zgV7UK1MwCr/AMB6mYlO5Oe2j5mHVFchqTtL/UE3mSUkhJ5txyMsg5lKDc75smmhir
	 4/JLSDgSKSotC8NBuEQqkaYODwbwcKRp+IgUXtFIOZIpX2+KaNbdsGAaWbKvwMztYR
	 9b0PuxRo8b+lB8zagTME6MRr/JPTIlw2zYahg1kCFHPCBzQbITMcB2YZzkUl1Yf3oN
	 C5WT4rpiBFNaEwpC9SRk1pXDRLmRdVOt0eSDeSQsK2CPWmcIEOdVvJRcw5bxWtd4d6
	 Ae/qaO5KOkf8g==
Date: Mon, 16 Sep 2024 16:06:05 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Keep comment why interrupts start
 disabled
Message-ID: <yqowbc3r5vglsaemrgadfhyqc4ykadvlkmbxyapnu4y73eitix@q2wvbqcjsvds>
References: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>
 <rezzwxrahok257tz35sxawqodn5sktkgxfokhmhdlrm2o4624p@agqoixuxg3md>
 <Zug09yHONEFdGjav@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zug09yHONEFdGjav@shikoro>

Hi Wolfram,

...

> > That said, I agree that a comment should be added back. The original
> > comment no longer fits as well as it did before. A more
> > appropriate comment would be:
> > 
> > /*
> >  * Do not enable interrupts by default to allow the system to enter
> >  * low-power mode. The driver will explicitly enable interrupts when
> >  * needed using enable_irq().
> >  */
> > 
> > Does it make sense?
> 
> Frankly, I think this is too detailed, we can't have kernel driver 101
> in each and every driver. But I will happily stand back if you insist
> because we are entering a bike-shedding area. My proposal would be:
> 
>  /* Keep interrupts disabled initially to allow for low-power modes */

Ack!

> Chose what you prefer!
> 
> Happy hacking,

Thanks,
Andi

>    Wolfram

