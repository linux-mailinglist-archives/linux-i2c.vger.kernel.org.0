Return-Path: <linux-i2c+bounces-2015-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B438684D6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 01:03:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F8D1F2281F
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 00:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B581849;
	Tue, 27 Feb 2024 00:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiEmc0Ld"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A31366;
	Tue, 27 Feb 2024 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708992232; cv=none; b=o4SajGRy9EB4dLBYIuWsoT6elxm6e4XiHhpEM/d3oU/CJZBBTXpo9YQqC/yBVbv29YHcpOGR1ttYNWyaw2gQNcg3SDb6JluzQuCa2FwQ8PAy5ll4qzL55et+vj+hvX5h6TW7ngxKejqi9uglyzCh7Kpm8A7OoH/5i692mbi6LdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708992232; c=relaxed/simple;
	bh=9wVs0aKYTFlakXRhBSb/pGMVjRFLxQlTpXtbal+hpxE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxIu1GzfWBkm+MMMUj8GcKymf5gjuEMBgkmZpA+s+I0UdHrBfZy/hyvhzSdNbGrPqqG3qtPtjZqZ8b7K3asppc/z/5pjzFcslqVGn/6ojjJFpm95CGXSBpxt0u1RJ4hCb1XrGiZoowDfB2JRUzmJUuZkKiPKnFE/85c3CK2Do5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiEmc0Ld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D22FC433F1;
	Tue, 27 Feb 2024 00:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708992231;
	bh=9wVs0aKYTFlakXRhBSb/pGMVjRFLxQlTpXtbal+hpxE=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=iiEmc0Ldus6MpMGdon7NguRIEq3LkMcp7ImTX1xNRVSUnQQcdAqT5P9fPHtAkGoVG
	 cJwlqPICOWDG5MFdZftyz7IJRBEEAc0L5T4vKfpqGKwS05r4eoZQM0/8TLInsKM6ak
	 n12tRTFzk9rgO5ssya1IHwvg+vAEasFNQ3UJOFfZ+Xu/+wuNReyqP9hfc3XdqwoBiI
	 6XvhWWaizUIVJK2BkHy/ZLTnRIQ/fBwyPTu5wZ3Wde+yxbFmTQNHIzqfY2q51GJnoG
	 pjSe0FVd9xmwdH9mu1NYnFOncx89A2ypNONmXGjk/yJp/bjcdt/a8Wlw2XsyM86g7O
	 6rp1+3MHGRIGw==
Date: Tue, 27 Feb 2024 01:03:47 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: dtschema: i2c: messy situation about timeouts
Message-ID: <c6yyhxzqfavqjphumemgjn7ick4ddjzhlxfjb6wtgsfvdetdqt@radooxy4o4mx>
References: <ZdxjGwvGXlDGkYs0@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZdxjGwvGXlDGkYs0@shikoro>

Hi Wolfram,

On Mon, Feb 26, 2024 at 11:08:27AM +0100, Wolfram Sang wrote:
> Hey guys,
> 
> we have quite a messy situation regarding I2C timeouts in the dtschema.
> Partly because I was too busy to pay detailed attention, partly because
> reviewing dtschema changes happen on Github which I totally missed. No
> complaining, though, here are my observations and suggestions to get it
> straight. Comments are more than welcome.
> 
> - "i2c-transfer-timeout-us"
> 
> Description says "Number of microseconds to wait before considering an
> I2C transfer has failed."
> 
> To me, this binding is very descriptive and makes sense. We should keep
> it. Sadly, it is the newest one and we already have others.
> 
> 
> - "i2c-scl-has-clk-low-timeout"
> 
> AFAIU this binding tells that the controller can do clock stretching.
> But what for?

One of the controllers that was sent a while back required some
hardware description because, in some versions, clock stretching
was supported in the hardware.

Depending on this, the driver could either use it or force the
clock GPIO value down.

That's why I made this change.

The naming is a bit fancy, but it depends on the spec used as a
reference; smbus, i2c or specific drivers often call it in a
different way.

The naming is a bit fancy, but it depends on the specification
used as a reference; SMBus, I2C, or specific drivers often refer
to it differently.

> I don't see why this is important for clients. If
> anything, then it would be interesting if the *client* can do clock
> stretching and if the controller can actually handle that. But no need
> to describe it in DT, we have this as an adapter quirk already
> 'I2C_AQ_NO_CLK_STRETCH'. Two controllers use it, but no client checks
> for it so far. Coming back to this binding, it is also unused in the
> kernel.
> 
> Suggestion: let's remove it
> 
> 
> - "i2c-scl-clk-low-timeout-us"
> 
> The description says "Number of microseconds the clock line needs to be
> pulled down in order to force a waiting state." What does "forcing a
> waiting state" mean here? I don't understand this description.

It comes from the specification. The clock stretching is given as
an interval that can be tweaked depending on the hardware.

So far I haven't seen anyone using it, though.

Andi

> It is used in the i2c-mpc driver. The use case is simply to put it into
> the 'struct i2c_adapter.timeout' member. That timeout is used to
> determine if a transfer failed. So, to me, "i2c-transfer-timeout-us"
> makes a lot more sense to use here.
> 
> Suggestion: let's remove this binding and conver i2c-mpc to
> "i2c-transfer-timeout-us". Yes, not nice to have two deprecated
> bindings, but things happened.
> 
> 
> So, these are my thoughts about the current situation. I might have
> missed something, so if you have anything to add, I am all ears.
> Comments really welcome!
> 
> Happy hacking,
> 
>    Wolfram
> 



