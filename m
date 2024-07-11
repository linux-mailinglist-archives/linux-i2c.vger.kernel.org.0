Return-Path: <linux-i2c+bounces-4930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9750492E8A6
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 14:59:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 369A9B2724B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2024 12:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9EE15DBD8;
	Thu, 11 Jul 2024 12:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5ZkZ9ow"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1796B155C95;
	Thu, 11 Jul 2024 12:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720702783; cv=none; b=m+M6A7m+ssoiQUH4sGqoloXUh1oDi+oFTSATRL7cVHAENC872sdnVg6OqHrgmcEPMQuEw7JZ2EQ/3AwzP4JhDly570L8fel5IqU87VoW9hNcOjTMKVQQ1aQ+1tRA41EroJWJbYggThiqgwrZE8n4xl6QvjTgOWmwPshL1exFK+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720702783; c=relaxed/simple;
	bh=n3QFNTdevq9NWXAL/a2Ai78dneDf8kyV8jRC3YrZWrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwmlqLgF13jVkFDIAtscKYz61kpTmR/z4CvT93lZA5had2joQDxpIBBGTICdRsB/q+xyI03FiUXN6C+eO70i0Y0y60pw3BrokdtrKaBl2j+J1tYP7WkzSQBtE6Lx3zIJD+IGOXwQ7ljoXAkr3ap9ldJshjK5gxTN7h2xbt1bseI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5ZkZ9ow; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB1EC116B1;
	Thu, 11 Jul 2024 12:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720702782;
	bh=n3QFNTdevq9NWXAL/a2Ai78dneDf8kyV8jRC3YrZWrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F5ZkZ9owj629JPUdwUIw8WfN4U2vCPdLhTLHbmrsDsiNnQAM2ucWTRaz77KV5Zhx1
	 2O9H39wMw3+hPHK3WyPmKq88fYRwL+RguCr09gtkLU/yA9B6N8HgnQYStBhDHOm/FZ
	 w+8jy7S1kBBYesojb2ch5U01JRxDcfncHyYY9wxvyuJF88CG/xFTgBFJq3AW+u21ya
	 bqZMC0QgThw1Abic7ujz3nIWhXN18+XNH3kTEizy0Nv8TxGLlR9HY0/8s1/RKiHDpn
	 5TCZS4zCjsnFXs6EXapsPpSwL5Q4PdKpRAi3LaWY0/bp1WSimkQh1kuDOxZF2/nNnY
	 k0kKorwfVsaQA==
Date: Thu, 11 Jul 2024 14:59:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 53/60] i2c: uniphier-f: reword according to newest
 specification
Message-ID: <ameebaezcmhycelzerkk2yzm2cjde6zjd6vpaqx7llcjoze7vk@lcpddniq562j>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-54-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-54-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:53PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

