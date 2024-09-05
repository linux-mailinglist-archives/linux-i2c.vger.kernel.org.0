Return-Path: <linux-i2c+bounces-6254-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30C96DC40
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 16:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CCE11C2542E
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 14:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADC871B3A;
	Thu,  5 Sep 2024 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eSKchGnj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04091B964;
	Thu,  5 Sep 2024 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725547603; cv=none; b=IPWctU8HPIeu/5zZZuUAQpm6CgG8HyJuLvGfmB/az3uuqp5LYP9DBVyZATPTIJZJ25oUIVJa4CIE7or341Di+wXAD7SVCj9k2AyN2Ake2kWA2O0fxNGYJnZf+HuZ52cpiKBbGaCBC6rvHEejb8xZR2U1o5QmmkQ/gam1uU3ukYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725547603; c=relaxed/simple;
	bh=jZVQs5pK52j5ingzK9N7BLO72JIPeKvs/nqAa43IdZE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NkH7CfrDh2X2SZRuLYQeASQZ0++l/wg3K0q6OLALN6ChkpSP97j6Z9hBbBMqeSOfbsCyEggcxJyjmlh/AHtoqt9sjtDjgP5mLR8N3PIGb+EjPbN6TTnAJGiC+udnvZ7yjd8TnVKnagNNXxBlvLzJo2uLcS0aXnzfHzvjbWn3r1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eSKchGnj; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=JnR8cQ5MJgNKybCXzzEm48pRwck+OW5NiB11eDM7etk=; b=eSKchGnj6kjcWT8kpucsxhRvbi
	vpB45lprZSOUv5VXzsTSrPcB4RHkz+k1hz4zHISEiWMrj93N/RPylJ9D8H8GIFsqvOkVE0FoMPbFF
	OB1nqSDGqTmHRUvoms7o5DOnXt8v6IkQpzevRFAU1Anwbb6XLrZIf7bIS8c2gHXrqPYU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1smDkP-006gtH-Lo; Thu, 05 Sep 2024 16:46:09 +0200
Date: Thu, 5 Sep 2024 16:46:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	sudeep.holla@arm.com, andi.shyti@kernel.org, tglx@linutronix.de,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	jassisinghbrar@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
	amitk@kernel.org, thara.gopinath@gmail.com, broonie@kernel.org,
	cristian.marussi@arm.com, rui.zhang@intel.com, lukasz.luba@arm.com,
	wim@linux-watchdog.org, linux@roeck-us.net,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-crypto@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-watchdog@vger.kernel.org, kernel@quicinc.com,
	quic_psodagud@quicinc.com,
	Praveen Talari <quic_ptalari@quicinc.com>
Subject: Re: [PATCH v2 16/21] dt-bindings: spi: document support for SA8255p
Message-ID: <c0346758-f4eb-4fd3-a2bc-588918e3841d@lunn.ch>
References: <sdxhnqvdbcpmbp3l7hcnsrducpa5zrgbmkykwfluhrthqhznxi@6i4xiqrre3qg>
 <b369bd73-ce2f-4373-8172-82c0cca53793@quicinc.com>
 <9a655c1c-97f6-4606-8400-b3ce1ed3c8bf@kernel.org>
 <516f17e6-b4b4-4f88-a39f-cc47a507716a@quicinc.com>
 <2f11f622-1a00-4558-bde9-4871cdc3d1a6@lunn.ch>
 <204f5cfe-d1ed-40dc-9175-d45f72395361@quicinc.com>
 <70c75241-b6f1-4e61-8451-26839ec71317@kernel.org>
 <75768451-4c85-41fa-82b0-8847a118ea0a@quicinc.com>
 <ce4d6ea9-0ba7-4587-b4a7-3dcb2d6bb1a6@kernel.org>
 <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4896510e-6e97-44e0-b3d7-7a7230f935ec@quicinc.com>

> Ok, what is your suggestion on dt-schema check failure in that case as I
> mentioned above? Shall we remove examples from yaml that we added?

As Krzysztof keeps saying, Commit message. You have an unlimited
amount of space to document why this SoC is special, how it is
special, maybe include some ASCII art showing how it is special.
Justify it being special. Once it is clear it is special, has
dependencies which are real, we are likely to accept the patches. We
know SoC vendors do weird things, and sometimes mainline processes
just don't work. But you need to clear, upfront, and state, the
process does not work because... in your commit message. Maybe put it
below the ---.

Something i often say to Mainline newbies. The code is easy, it is the
processes which are hard. The commit message is part of the
process. You want to try to anticipate all the questions Reviewers are
going to ask and answer them in the commit message, before they ask
them. It is process that you split patches by subsystem. It is process
that binding changes and driver changes go together in the
patchset. Your 'code review' should include all this, not just the
lines of actual code. And to begin with, process is probably a lot
more important than the actual code. So please concentrate on
processes, get them right.

	Andrew

