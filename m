Return-Path: <linux-i2c+bounces-6488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA55973B2B
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 17:12:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D19051C242DF
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 15:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1992199389;
	Tue, 10 Sep 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXtOrRHd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D1A196434
	for <linux-i2c@vger.kernel.org>; Tue, 10 Sep 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981134; cv=none; b=ECZz4Rk5wKCfb4Pa69k4Ih4KhxJZwD+AqjpWhQrl0JBkVQITPaEIDH+eg8ZzBvoIorWQqrbNHFyyAPNrmaxsd2tXeQ2sjLbq2ula65k4GtgaX+3Ea4W0QG8kCTyfIAWgv7yVqbHrPYC0TyKV1yGJO2mrdm7heFU4H64OYgUpYog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981134; c=relaxed/simple;
	bh=SCihoWfg8TnSg+3cg+LIEIih1bUWK0vpavMi/7puKd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTzJsdifMPZighzQv7lgIQIo0iZ3XXixAajWgiVGISnP4NZQagBG9Phw2iQ5Bd0Lqxymoa/MvMdWOehXM4O8voofbDZekbnOIjKoZ1m8So0sybzJITM8wDrwUXOhW5/2Nux1iGvC1mhtHtZKqW4+WlGf3uL+lid87Wwodm1NzIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXtOrRHd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F7E4C4CEC3;
	Tue, 10 Sep 2024 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725981133;
	bh=SCihoWfg8TnSg+3cg+LIEIih1bUWK0vpavMi/7puKd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXtOrRHdMfRMT5F5obuP/r0+7Rg8yqvGwOmdKOnqI1oAXdncTboxM3H7OAojzOSQF
	 0mRqHrzANerW4uyRFqiP6B1CJYckVyOzWnlsR5lbcu1xGFz5FaPOWR/UqnJOnYUeoX
	 c2z0fSGMBV3ES2YrtBezu0zuHafqAavrt2JjQn0u0Oh51lH9KmOxwMh9UKJ+4XZTvJ
	 zdmHhFWJvyCpKcT3kw4mqTjxj89filIHMoLqn40vpGDqK2Wa4U46tjVk8udtLNA8Xx
	 Wa3nD+kCmx1JTJOcsSB+ps7VlTqHvj88XfQy5Vw/mE9YVjqADhbPnKebTyhgdUgycj
	 5Y9u9MHoC9Qtw==
Date: Tue, 10 Sep 2024 17:12:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: linux-i2c <linux-i2c@vger.kernel.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>, 
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH] i2c: ljca: Remove unused "target_addr" parameter
Message-ID: <zfipbylhxndiu4cqdwhbrsbgrkegcdiwfgbn67mbyy7cxclic7@wan3qrwg7r7h>
References: <20240808000042.110722-1-andi.shyti@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808000042.110722-1-andi.shyti@kernel.org>

Hi,

On Thu, Aug 08, 2024 at 01:00:41AM GMT, Andi Shyti wrote:
> The stop command doesn't use any address on the target:
> 
>   w_packet->data[0] = 0;
> 
> and indeed the targed_addr parameter was unused. Remove it.
> 
> Signed-off-by: Andi Shyti <andi.shyti@kernel.org>
> Cc: Wentong Wu <wentong.wu@intel.com>

merged to i2c/i2c-host.

Andi

