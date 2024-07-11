Return-Path: <linux-i2c+bounces-4909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145992E4A0
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7825A1C2032E
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 10:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B14158A17;
	Thu, 11 Jul 2024 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fojr8kMG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AF4157A59;
	Thu, 11 Jul 2024 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720693550; cv=none; b=rwZl3EpdRUPvuuW+uXvU8KReZ+4LqyA+uxxBFg7Ldrmfh1FzBXmCEiBqBhKtoRR3NuI4wFm2OIltKWGMc1RY4UZMxggKMPq1bervMrB0RmabPz0kuxilMtBkqxgYXCYQ2JP8yFTdwEYanLz0CwcOOSw9nXLoDMf3svzdb2fyT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720693550; c=relaxed/simple;
	bh=IFR2JhJFc02dzT2z2GEn9H0aw1jGLPZSx+VQlPtx9L4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhVhZBeylZIrGV032LeHxyetEYdRHAv5l4eqLD+RkI8x1ad3iiwDqrIysDVFBbIO0K0Gh4GlADkwmkb8frxr9aYOvCoMlhlLLzI4zM9LsHx8/tCbdSBFsMu55TN5coqnMpQFFzqm+uhUWEEl7rf8Dbh1k2qqV27Ax31nB9EGoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fojr8kMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57ED1C32786;
	Thu, 11 Jul 2024 10:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720693550;
	bh=IFR2JhJFc02dzT2z2GEn9H0aw1jGLPZSx+VQlPtx9L4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fojr8kMGKInK0IDLpuIVMx4THW2CfOSmQ3CeL0youvhDSgQXXlhNOUwE5hHPVLl8t
	 YmjZCgum8XLjeyP4TupeU2qBsz+czzDd7AndriuvN90q9jroo5PiKix3eGaDZhNCSa
	 KHmTyNmPaMjF9YvN9U6FklD1wPwKKXIdfoWKRDVWt8yux2leBVY9i0EYg2aL0G1gWD
	 J8bR3iujeuRjuvWspjtNMZ+8uddFeFP56Wzfb/M7H2M3Xoaev62VYOnd4fOY1CjIy6
	 zDxnbjIIsF2eBJag2XLNuFtmM3hopJXvox9n/xtL48yJVZ5XNfZzk6JJp+Vqp6Rn8Y
	 d3sZV7elOVkNQ==
Date: Thu, 11 Jul 2024 12:25:47 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 47/60] i2c: stm32f4: reword according to newest
 specification
Message-ID: <4jfq7tsdyztvwcgg7fg5buy27tqrndcds5dssjnpnnn72v7qaz@sz5vwesh3kpc>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-48-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-48-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:47PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

