Return-Path: <linux-i2c+bounces-4904-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9D892E47A
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A6D3B2286E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF99158A1E;
	Thu, 11 Jul 2024 10:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gioyeWjQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F073A14F9E5;
	Thu, 11 Jul 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693369; cv=none; b=k1A2HU4U3zYFPG+gnLt5L3bpTQ0ZZHMiSxd/hUgWdnfRixkWIzMzEkncYSgWHbnjoSc9IyjAbTOKj2KBiQ+IE2WWx2ec+9QaF2P9FQNiuK0IjWVaC6rjqq6hV13ZA9gcWlwBSoAeDhIRPKXiFCmw82jWqTVd32rO6NPDbjtSuwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693369; c=relaxed/simple;
	bh=qheh9FPmbFwSDDu9nVDesVxIUWzyC3M+rpxEiBYjPGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOZubqWclPLQiSYngLux/A1CbRaRRnyyhnrqwx0ZUd+WP/eckPh1jpiKiXME2qQve5e4lEol6Xd8gqunr/Xu7qw8MpVZHBLaTllOVVWTmAM2qHd+pSdZvh1SeFEwEiJWA2F9lH86nbubBLmhpUsmar3euFJ1QnBZjqeYbrfe49A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gioyeWjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202FEC116B1;
	Thu, 11 Jul 2024 10:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693368;
	bh=qheh9FPmbFwSDDu9nVDesVxIUWzyC3M+rpxEiBYjPGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gioyeWjQFLPyqN4GbG22ff3pm4ZuooLdw1DcXUpnDHwUllIjfnAdaT4r4U82OCKdC
	 ebZB7uTiZ5Q+BX8QjmL4Y01GCITZlV+Scf+aPHsLD7b5EZyJSoTxC2RnN7dNSmVWh/
	 fAdapm5lutGphKRWKErZceSg04RH31/g32KmIrf6pFnrGJMRkd+XSfXgpfAd+SYHma
	 t73k/5XCMvYU7i4jcXWbwXoe/wpUSh+iZCafQ8mS3gOYyRpqle7468xtgeRvEYz68M
	 DOwH661EX+dAhEIXLLcx7FNhZjUjvyL3EdZOsNoTBBtPRNpX7Qf/YaLEsOA48PAQty
	 NqwgBOBqIbPEA==
Date: Thu, 11 Jul 2024 12:22:45 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 42/60] i2c: rk3x: reword according to newest
 specification
Message-ID: <yzje4usiemngydl2tajqd3wmh3zqyxu4w3roolz3tdvevrsydt@yalsecywueob>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-43-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-43-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:42PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

