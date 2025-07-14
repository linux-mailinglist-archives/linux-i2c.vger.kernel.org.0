Return-Path: <linux-i2c+bounces-11937-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BADB0493D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 23:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63CCC1A66E5F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 21:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D5223D2AC;
	Mon, 14 Jul 2025 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFlPe2bt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF671D9A70;
	Mon, 14 Jul 2025 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752528077; cv=none; b=pSOeOXTYvdjPwJ3/hqOMrQ9EcnJEuIDe0Eop/bTu321DdzRw9P/bNIbsG531/LUEcs+8Esxx7z/TbV+QI6diS0OYe13wOPZWANUCrfnB3w2F6F089qDm2SKXTXqWzXUD8n89svTykicaIHCzAWQlYIYJI3VnCELtBLChaULKGGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752528077; c=relaxed/simple;
	bh=8i9rJxA3NTaQEbRzQ81+/17HPGqBh7Tb+twsR+6q+sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhOCU1OyunHpJYyed7kjdB/lCd2dAvqE9Q7eFS1i+k50Vwba2Z/JNTlytTX+mmrabY2UNYRrzxFjP+M5MaQaO+8uM84gmfuOlYqzS3mC5Gwfap86Om5oBcAe8t18OQVX/aHkh7a0ZbTfHBGhn1B53gPN4q/recO3IDxQCyWv2Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFlPe2bt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5053CC4CEED;
	Mon, 14 Jul 2025 21:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752528077;
	bh=8i9rJxA3NTaQEbRzQ81+/17HPGqBh7Tb+twsR+6q+sU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFlPe2btAxB4HQ8bDa+1MlmVEJaMXOKFKUBY0Em8ZddsAuQqiMQY1fM3603j6lf7J
	 3zc8I4Wfpc1096wwVo7m7h3QiEuidnS6lKaPkX1dWzttfK1TjlU+Ny282A9rg9uSri
	 aK503u9wu/IGrVylrLHoHif1M9o6/1nsC76K4op6uKeOThwuVlXsJkXkEbfGZezmDe
	 uexXbzHmHbZlsJvGBcqiEgFUqRfGVHubB9EbekpcOPXqpMqr+FJ4suFoX71eykKtZS
	 KTqwd4mET+V1MUvSxuphz6Io7DhBuajeZGp19byJpNiabpX4Jbjw9AsAQpDA7qZIKk
	 zvYjBXJu7dC+g==
Date: Mon, 14 Jul 2025 23:21:12 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Chen, Jian Jun" <jian.jun.chen@intel.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, linux-i2c@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: virtio: Avoid hang by using interruptible
 completion wait
Message-ID: <n26mc4qkgm452stvcsp3kf3hu7lbqsme2wnqaqclsxrmppqenb@4ofu6juzjusn>
References: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8944e9cab8eb959d888ae80add6f2a686159ba2.1751541962.git.viresh.kumar@linaro.org>

Hi Viresh,

On Thu, Jul 03, 2025 at 05:01:02PM +0530, Viresh Kumar wrote:
> The current implementation uses wait_for_completion(), which can cause
> the caller to hang indefinitely if the transfer never completes.
> 
> Switch to wait_for_completion_interruptible() so that the operation can
> be interrupted by signals.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

