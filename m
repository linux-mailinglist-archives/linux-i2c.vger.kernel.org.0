Return-Path: <linux-i2c+bounces-11592-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE6AE8FB4
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 22:52:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C25C01C279C6
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 20:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEFC61F9A89;
	Wed, 25 Jun 2025 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uu2UTdeQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709463074AD
	for <linux-i2c@vger.kernel.org>; Wed, 25 Jun 2025 20:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884738; cv=none; b=UcX0kDgzGpW34lDFyGsjvciYbVOyR0leqIDD8yoMtktNb/wDwHT6aNDmn9B5FMtQKKwimg/Unwnx/K+laFnY8to6rmTSO0vZL8ZVLKP36G9EF3c4YlgSQo9aONixloGfB5Ldl3qIWHzJRxPEawZ3AE4T1luKWqekcYSqalWYddw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884738; c=relaxed/simple;
	bh=iZPqMvB2zneJDmvBI45Ig3RsbT1rlNWuQCY3rXzmXGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NHPzVBwKGBjHjNc4H2GxsYa7bBr/uC5x1S1nd9teVoYsvdtVBQYqMlMYoQMjLb4Tu1oxGLL8JH/uV7oYxILFMkP5MH5gp0heMRHt1Zl3wAqWe7iOhBxd1pVQRLnWW75m9eMOsxTY7XY64XC4S9cUignPbBSKAnAkz2uUK8E+kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uu2UTdeQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C960BC4CEEA;
	Wed, 25 Jun 2025 20:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750884738;
	bh=iZPqMvB2zneJDmvBI45Ig3RsbT1rlNWuQCY3rXzmXGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uu2UTdeQhu3fVegWsE7qXG0JKuGtLE88Oa9y6j0ujje3ZPQDRsv/LhQ+gHWYtE4jX
	 g+mT0dnSmIA3ObgHoVnxi0gQSch8FO7zaCVB0kJAwLMp7s2dRBt6vmmh2FjB65/Fi2
	 oz2LpHyuXug2Htp1rpxti8K436X7ESqHr0Qhm8QcEKJJTRjNVBLU+og01yukzgGmIE
	 7FzH0Fz9/5qBh+VXP48B48EMoj4643NvIatc0Qa9MLjMsQE/+XiMnMUhKGmEc0nnWm
	 xT3Gh0WzhwRLLKLVlpmn2uhnrX9nAWIViO5ujoBLCzUUjioZGJJwGZoEBJ9zzeaYTE
	 2q1Cfo07XyWxg==
Date: Wed, 25 Jun 2025 22:52:10 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] i2c: robotfuzz-osif: disable zero-length read messages
Message-ID: <5qiim3xi75fb5j7m7hc5slwekunomccpotsz7nynhpqfii3ooi@ves6pcinfb5l>
References: <20250522064234.3721-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522064234.3721-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Thu, May 22, 2025 at 08:42:35AM +0200, Wolfram Sang wrote:
> This driver passes the length of an i2c_msg directly to
> usb_control_msg(). If the message is now a read and of length 0, it
> violates the USB protocol and a warning will be printed. Enable the
> I2C_AQ_NO_ZERO_LEN_READ quirk for this adapter thus forbidding 0-length
> read messages altogether.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

sorry for the delay, together with the tiny usb fixe, merged in
i2c/i2c-host-next.

Thanks,
Andi

