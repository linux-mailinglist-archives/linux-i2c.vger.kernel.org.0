Return-Path: <linux-i2c+bounces-10295-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2250A873D9
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 22:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 792F53B45C7
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Apr 2025 20:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498041EA7CD;
	Sun, 13 Apr 2025 20:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdyW5OQx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3066131E49;
	Sun, 13 Apr 2025 20:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744576912; cv=none; b=XZXBdnDPruXDn3dGecp7oF1GXpyDH48exeuGYbwKhJertN5HId5Mp4wcYQphzaHu3NVyx/6C/UhNl7BLN5nTYb6XQ7xY4f8PIilVANvs8uVwLpsO9YJTkX+I1qbuRyJKB3I+F1kudxvPri+bjTRQ9sTE7X42/mD//+qeFqpFsj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744576912; c=relaxed/simple;
	bh=8BblCTdCvwkOkbtJ9xAbALEBDKyCEwg3Ua9/9+xfMq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6FnZtVIGfP87iKyQ8U2qZnsRv/NnqVyt950wGWgXxNoFN/ML2uCdE1JMyfxkt/Tgcie5RXVLDwXV5soG/G4vWDgdlLgBHUfCgBMBv5wFdNLU2i7VxiaUJF2bGzsdbwMQx04e8cggGaOJ6+5CQDLOSd5EamcSxe+Pnf4xlZBEMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdyW5OQx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB4BDC4CEDD;
	Sun, 13 Apr 2025 20:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744576911;
	bh=8BblCTdCvwkOkbtJ9xAbALEBDKyCEwg3Ua9/9+xfMq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdyW5OQxZ6en/4OBLFNVCk92zJvCNmiAi7HcR1ou+cMzwZKJiIFDt4QwX/UMctbwI
	 hoOZ/FFuJRmHJsTxHIbxkTkDZdyOKggDlDIUiN5Gxi401DM2zTIQQV7UWDAUSY1fF9
	 Jcqbf0oJzk1Uo6YzgB0T/1wjsBh6tE7nWZBjE5MZLl5o7QfdZnLgoO8FlT/f0OIAdr
	 wdAkA9OZv99Zk2KRZGF9xniFRJ/0aQytze0Pk9sRQlJIvc6MdRiTgFEfpqCx27Rmgz
	 8rf1ccog654bY3O8YCSZ3wOg63kuUSD4fxEDjCiZSDOl2tPnj1FUpV3hebfS3Fpqai
	 DyvdjG2XegyyQ==
Date: Sun, 13 Apr 2025 22:41:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, 
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: Re: [PATCH v1 1/1] i2c: qcom-geni: Use generic definitions for bus
 frequencies
Message-ID: <7jhgwtwhgmxooofln2zjpjp4kdqjuc5dd5bnrht54ts63s626u@ixaa53eptlkr>
References: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250322144736.472777-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Sat, Mar 22, 2025 at 04:47:36PM +0200, Andy Shevchenko wrote:
> Since we have generic definitions for bus frequencies, let's use them.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

merged to i2c/i2c-host.

Thanks,
Andi

