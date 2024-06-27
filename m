Return-Path: <linux-i2c+bounces-4415-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE7291AB0A
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 17:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F75C1C22A5C
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 15:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31680198A09;
	Thu, 27 Jun 2024 15:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgtqDjns"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14781591F0;
	Thu, 27 Jun 2024 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719501706; cv=none; b=h2tWqG5Juo9VQYfT1jCtX39M9zpvDp9BGLOm6i1Bo3kK6D8vJ6tZGxO5rqD+6xUywRgd2I66a+I2ftx0C+3jOnswGkIAlFT3+s+USIXGfkminGOwJ/X+Ktfdcb05jcbFkgkJlzfP/6V3aSFICmMIvp4tvt+hYOrxgkh7SpEz6ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719501706; c=relaxed/simple;
	bh=2jTe8TkDCFNj+tlAFvYShwxEC623St7oJq/uib3g8p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEwQA9FzfAk6r4Cb+zrKOWDfY/bOhsmkpUgKxv/KfGJW6mBFMJ/g1VzvwtXDpDiZevnYoYPGWN9SeR/gcPz/Hdjj3zv5ELJxkeTW3cTM9RblUmTc+yjHNRBuOi0G4UijnxPMqGsp6aplkwp00dswsVRofyDs2PISsa3WnL7LNnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgtqDjns; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52877C2BBFC;
	Thu, 27 Jun 2024 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719501705;
	bh=2jTe8TkDCFNj+tlAFvYShwxEC623St7oJq/uib3g8p4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LgtqDjns20o4C/BYAwvgOdfxFhivKA174u5OHSIQWWrKXJ/xYBGgMKd1OQzIS3KG6
	 Lpeu+p6MB2GRoDjWcsyGcW+zXRhpU7DUHGddbOtKJr54ANBpnPUWv3l+NlecP0N1UN
	 OUikhwYU/RmHNzuhiqvX7sTB6WLnVGjI1y5GGYcczVU1RynT02PU0QIlu3ES7Xkf0K
	 bRRleB0GqXQhlLr+44Izp0AGkaMVxmpBfMStYdPwV6/bpzkl+JPct1xJSLECsoPIl4
	 54vy8oRjoHISUiS6/CWHv6ETuMPL/edqLytl17HNLwp0YNhRp4GJ+2pP0Y8UtRvBfy
	 ttt9HcB/VQ44g==
Date: Thu, 27 Jun 2024 17:21:42 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: testunit: discard write requests while old
 command is running
Message-ID: <m2sxpply3xx54v7zfu4py7jsq43tcd73gy5ivxliaits4ozo5s@hqd5lmki7mnu>
References: <20240627111445.29751-4-wsa+renesas@sang-engineering.com>
 <20240627111445.29751-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627111445.29751-6-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Thu, Jun 27, 2024 at 01:14:48PM GMT, Wolfram Sang wrote:
> When clearing registers on new write requests was added, the protection
> for currently running commands was missed leading to concurrent access
> to the testunit registers. Check the flag beforehand.
> 
> Fixes: b39ab96aa894 ("i2c: testunit: add support for block process calls")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

