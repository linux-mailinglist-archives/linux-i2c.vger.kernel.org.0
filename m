Return-Path: <linux-i2c+bounces-6305-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCDE96EBD6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 09:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D58FB2345C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A14214B955;
	Fri,  6 Sep 2024 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a10YbZlr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6E17C9B;
	Fri,  6 Sep 2024 07:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725607269; cv=none; b=FVJ3fT4S5c7uODBwQlyL1Gc5CN41OJz8dyPRVh4Jt9bTRNpWQt+0ZnOyO+iU5DGJuOVoB00vUZzFoLHp34Gx1z9eR2/LgzxvpOQ73QAYcPlZ+zXMfi0x0ZBn+xrGrJh7KcwI094afehyeELAZGLd6Gqye0OOeBffGHmYv5ERAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725607269; c=relaxed/simple;
	bh=XH2QzjP1CufEq8D/+0yCvenvO3KuEuFwhuTKcq7Vxz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HofZW//Ibn9t8j5BNQt9qhmM8XBzsolKGRmlzDOL2UyppFe4RdnCA9X3QiziKTsuJjkIeVqHfqPYpV7eusxKWSCnps2p+YK5Pt3Q2FjM0HdSSzUawRmfnLwUqe/Ws4owW8+5oKeVcdVeCvwvWe0WJfV9+OfJGIAiaSatEaZpzFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a10YbZlr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4984FC4CEC4;
	Fri,  6 Sep 2024 07:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725607269;
	bh=XH2QzjP1CufEq8D/+0yCvenvO3KuEuFwhuTKcq7Vxz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a10YbZlrC+BkaBwuH8U8LtN0ZB3KbrVXgtag0KdHoq3/qt+tPPotLhyGEaAmy73x+
	 WcHqA5ncjVzF2JRLrtuubpDHf0ABaIQd+gRUZLBVcHvhaNCfqqMjyaXFGjN/gWXmBa
	 P349v9CGW8rFADmaC++KQvVa0BQWymFy7i4IKiSSZJVwzxJDQJg2uguJGtEpTgPLgf
	 o0uAK4daqQhswhX8k7CKjVCYAQume/uP0BL0ptsVDaItKTois/53B/MV7C2WthT58o
	 kk4/U0KQqJZKgokzptTxgcHM9M0m205K0IvXztv2t50WITZn8qb2FZ/+G/ejtUN8qR
	 3j3JUVYuDRO1Q==
Date: Fri, 6 Sep 2024 09:21:04 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 0/7] Add SDM670 camera subsystem
Message-ID: <vjfddnykgeihdjlp5wzaeu4d4qn2boc22hufe2ceajt5wazznb@nysgwxk4ksdm>
References: <20240904020448.52035-9-mailingradian@gmail.com>
 <tthbaop6bkyvebpibiyvyct4khrd5o4apdbipqdthnidxmu2cx@m726xv4ocblg>
 <ZtpqrANbJurWNOzV@radian>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtpqrANbJurWNOzV@radian>

Hi Richard,

On Thu, Sep 05, 2024 at 10:36:28PM GMT, Richard Acayan wrote:
> On Thu, Sep 05, 2024 at 10:09:34PM +0200, Andi Shyti wrote:
> > Hi Richard,
> > 
> > On Tue, Sep 03, 2024 at 10:04:49PM GMT, Richard Acayan wrote:
> > > This adds support for the camera subsystem on the Snapdragon 670.
> > > 
> > > As of next-20240902, camss seems to be a bit broken, but the same series
> > > works on stable (although it is much less reliable now that the CCI clock
> > > frequency is not being assigned).
> > 
> > I am not understanding this bit: is this series making it better
> > or not? Can you please clarify what is broken, what is less
> > reliable and what works?
> 
> When applying this camss series and some camera sensor patches on
> linux-next, the Pixel 3a seems to hang when camera capture starts.
> 
> When applying the same patches on stable, the camera does not cause the
> Pixel 3a to hang.
> 
> When these device tree properties from the previous series were removed:
> 
> 			assigned-clocks = <&camcc CAM_CC_CCI_CLK>;
> 			assigned-clock-rates = <37500000>;
> 
> the CCI would sometimes fail to probe with the error:
> 
> 	[   51.572732] i2c-qcom-cci ac4a000.cci: deferred probe timeout, ignoring dependency
> 	[   51.572769] i2c-qcom-cci ac4a000.cci: probe with driver i2c-qcom-cci failed with error -110
> 
> On further testing, the rate can be set to 19.2 MHz, and there would be
> no failure (or rather, it wouldn't happen often enough for me to witness
> it).
> 
> > Besides, I'm reading that this series has not been tested and it
> > makes it difficult for me to take this in, considering that you
> > are adding a new support.
> 
> Of course. This revision of the series wasn't submitted to rush into
> v6.12-rc1. It can wait until everything is resolved.
> 
> When device tree maintainers comment "not tested" on the documentation,
> it usually means that `make dt_bindings_check DT_SCHEMA_FILES=...` gives
> errors or warnings (even though the device tree and driver may work on
> the hardware). It's a separate test and one of the things I haven't
> scripted into my workflow, although it's still a responsibility.

OK, thanks for clarifying. Then, please, next time, to avoid
confusion, make it an RFC; or, if the series is in an advanced
state with little things to improve, state it clearly in the
cover letter or after the '---' section.

For now, thanks a lot, I will keep the R-b's for the time being
(unless the reviewers are against) and I will wait for you to
know the outcome of the tests.

Andi

