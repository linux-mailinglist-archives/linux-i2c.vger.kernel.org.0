Return-Path: <linux-i2c+bounces-8956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D93BA04CCA
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Jan 2025 00:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CE871887539
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 23:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8131E2859;
	Tue,  7 Jan 2025 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gF85C++3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84D41DE4CA;
	Tue,  7 Jan 2025 23:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736290816; cv=none; b=kfES5b0pSfRIEGwQ0jv4WFfi0aRvB49gmOuYUUAiiU6FXDv8YP9KEPcFFHjCTEa5Jg0TYb9un41WAKGeE0+jOEJPFXEPK/y8xVcxclw47Ubs4LWwjRsIoC1nlb9XGk5HvRGcURMh+16x3CaL0VOpVOZIveDPA3HVb47xz3UD7GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736290816; c=relaxed/simple;
	bh=UnKUUBq2SmugIKnovltJwIBCdCDqgI5xyyhzrT51Mgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGB0fIq4r/HNMsyOFnkNKgPxf2d5ITUugfhhqhmHBqeW/7F9boSPKt8dXuS9RzBnjG8Gg/6dUCu5qiUHRCQ9M13fVfF6rBL/1wnTdLJ7kAWB16JOPfHKAqi/AhSKxSfMuald/ePYWHdfjSyfUAfMuDTTjJd47D5R+qBvC3WN9lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gF85C++3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6887C4CED6;
	Tue,  7 Jan 2025 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736290816;
	bh=UnKUUBq2SmugIKnovltJwIBCdCDqgI5xyyhzrT51Mgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gF85C++3bN9UpvT2RJ/5CcEeXC7FbIHXE446W6YChguOboVhbzHOsitcnL4XGRaou
	 559UqdEzhzR2AMljbBLE+6OVcN+tgYb8Pn1nwzwnL6ATu5zmG2rbxB9CyaGTyMwPUh
	 m9RRMiiy/SRxlWB9S7XgxzNWAz6VRBmBDCBP5K+jUWah26yoQc7Qdayh/sg5I8sfA0
	 XCU0AbNph2tHQ8PM2b8kbVePbfEV7diIuaNv/hzAfx+ppvuW9N6oyVnWUthCJFPD+8
	 WOnLxayCk0t7RfbmMn7c/4qp/LwZBjLgpfwBMLM9xQGKL7zfGshMOxGyfY3/RphnGV
	 awwqbn2V6eS1w==
Date: Wed, 8 Jan 2025 00:00:12 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/3] i2c: davinci: kill platform data
Message-ID: <cpf327z4gotr3keocxe2pwhwpyao5abg6izt332r5w3ulfz45y@wdzmqwujsg2t>
References: <20241211102337.37956-1-brgl@bgdev.pl>
 <awney7utrl5n63xsgzxnnlpqajuqtjnrjsbpzloic5iqt4pv2u@ktkhejuihbde>
 <CAMRc=Mci6bPCirruk90hnjBvJW0=HKhqCq+9p4t2k9B=Oy8Ocw@mail.gmail.com>
 <fxj2tqrjfr23cxqmtmpj74bombtfjn3qtpz5iiegvhbap7v5md@pkmrskwamatl>
 <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MfRq9xU7a64qCOrDCYgSbeWVKF=PnzS8Cabm5a3zzFekQ@mail.gmail.com>

Hi Bartosz,

On Mon, Jan 06, 2025 at 11:31:23AM +0100, Bartosz Golaszewski wrote:
> On Sat, Jan 4, 2025 at 1:02 AM Andi Shyti <andi.shyti@kernel.org> wrote:
> > > > > -/* default platform data to use if not supplied in the platform_device */
> > > > > -static struct davinci_i2c_platform_data davinci_i2c_platform_data_default = {
> > > > > -     .bus_freq       = 100,
> > > > > -     .bus_delay      = 0,
> > > >
> > > > what happened to bus_delay?
> > > >
> > >
> > > bus_delay is not set by means other than platform data and it defaults
> > > to 0 so it's safe to just remove it.
> >
> > yes, but how is it related to this patch? Can we put it on a
> > different patch?
> >
> 
> No, why? This patch removes platform data and all bits and pieces
> associated with it. Splitting it into two just to first remove
> bus_delay and then the rest doesn't make much sense IMO. The argument
> that it's already not used would be incorrect as it IS used by
> platform data (even though it itself is no longer defined anywhere).
> I'd keep it as is.

yeah... merged to i2c/i2c-host.

Thanks,
Andi

