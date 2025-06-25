Return-Path: <linux-i2c+bounces-11593-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666ADAE8FC9
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 23:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 082815A63F5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Jun 2025 21:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BCEB1C861D;
	Wed, 25 Jun 2025 21:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m2evYmPy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B683714F9D6;
	Wed, 25 Jun 2025 21:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750885359; cv=none; b=KynDrWly4pTUsbb/xxiw1IDEhxnuM47k17jqrwFCbwnJCN8905r7wUE/h/zCVWlEeSU4rr1H0iR99qD8ZTJ53nUNlNK5LHIHWPsOs3Cmmu5icQwy7TsQqR24943amvLR9/r7SMKSxc0AQnRDkZiMa8ikXQYypeNnmT1TlZEydew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750885359; c=relaxed/simple;
	bh=DSBiVBGaGl053liqN+1YDOK55xX2RlMth3+oFu4qu88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jP6ZIuuDv7EUJ2Ahxt7N9AqGyD/8RTEw8rNsbjb4j/wlB2eaKmNUG4zvcQU6y4M9GFWEOrotTJ93s4D12L/7/ybtoN0vesCEzkzv7F4ZoxXz8c+ytCXnx2oo3Ffo505FYFc647OrTyh6q6I6AGW6OwqMvI0edcMC2lqVXqzOry0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m2evYmPy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C94C4CEEA;
	Wed, 25 Jun 2025 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750885356;
	bh=DSBiVBGaGl053liqN+1YDOK55xX2RlMth3+oFu4qu88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2evYmPyAUMUA355NG/SEs1um1ALvC6wqjyF62aKXnQEaoqMORymTShyvdKjoZwk/
	 huk/axCD+rAbQ6NGcNd2Zez0rCxeDLyPwuQmWucYcVXcZHBdXu0mH6+LUUZQFOjcVI
	 zboD0R7nZHLN8Yu1mRHsF1I3cKRf4T6av8NFJQhHTSozNB5gtN9AS/2ugLEPIBtqsn
	 MSlpkNudhMUbRKLbJ7/dBkPkg7ld4xxZRXyJozl3EWQye+ZKQzQ1HyAV4NYqGERgdl
	 tVatecqbxTXCQecWlf40e5mIa4pNjvJT+rdkpbwqwSfyGO4/o7gV9KUsuYl4t59X1W
	 Rb6D/8Dwdvimw==
Date: Wed, 25 Jun 2025 23:02:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: ldewangan@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	digetx@gmail.com, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, hans.zhang@cixtech.com
Subject: Re: [PATCH] i2c: tegra: Add missing kernel-doc for dma_dev member
Message-ID: <2dhrjeetbn654gz6jhe55ihypfrhgkkhw3cdpidv55gmat2qk6@64yfrjoc2wjy>
References: <20250522163814.399630-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522163814.399630-1-18255117159@163.com>

Hi Hans,

On Fri, May 23, 2025 at 12:38:14AM +0800, Hans Zhang wrote:
> Fix the kernel-doc warning by describing the 'dma_dev' member in
> the tegra_i2c_dev struct.  This resolves the compilation warning:
> 
> drivers/i2c/busses/i2c-tegra.c:297: warning: Function parameter or struct member 'dma_dev' not described in 'tegra_i2c_dev'
> 
> Fixes: cdbf26251d3b ("i2c: tegra: Allocate DMA memory for DMA engine")
> Signed-off-by: Hans Zhang <18255117159@163.com>

Thanks for your patch. I merged it in i2c/i2c-host without the
Fixes tag as this is not a fix which deserves to be backported to
older kernels.

Thanks,
Andi

