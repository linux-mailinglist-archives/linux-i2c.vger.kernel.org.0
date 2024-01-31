Return-Path: <linux-i2c+bounces-1562-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFDC844B37
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 23:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0922B25E37
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 22:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC453A1DD;
	Wed, 31 Jan 2024 22:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wbd86LSL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4439FEB
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706741245; cv=none; b=nR75Oxl1+sAtBbgipMqJlXo204b9htIvOtIh8pBtdLW4qXGDPlcgGmRPwzhjCC6+uMhSITOvF6tkNnflh449MJuC/6EfpdripTFrtFQrrCeDHo0rGkFWsKQn7gun/wO9SvDFFUWydVD4m6D5NGUFOf4oGNJeJ21fXPP4aaPf/JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706741245; c=relaxed/simple;
	bh=5MRUIb8edWicoAe0Wu18TOtKzdKQX9G8kRAyJMQjg6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uxFxNBqpw89grOvR/9HLL4AR8/e98IOCCNPXObO3cvki9LobLui8ZKsLp8qb3NnrkgnrFuN39Lbm7WjXlaDJdwlkLgl8vY81XMo4IxfzIhIvMQJUtgsGDbnmQVSyGeWWvInOSiFmLfBt+9l4QfX9olWOVSL0A6UzwaHrxGmj2fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wbd86LSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC235C433F1;
	Wed, 31 Jan 2024 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706741244;
	bh=5MRUIb8edWicoAe0Wu18TOtKzdKQX9G8kRAyJMQjg6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wbd86LSL1mZWHYDk0sOOP9ApIGx0ttAztQfRmLLtMHTJ4I9ueBH1nG3J1GVQAQ7dI
	 I2gH9s5nCAQ0R1SxpJK/7NrTJJ6nzsF9SdBNlHeZdg0k+t7Xwh5EXc+JwATQhFsZJg
	 qkSX+cpcBzNhEkcxHv8EED/Xy4JKZ7PSyd2lG+sLhHMqmrk8aSNlOaIypnuWOmXbEX
	 fiO/6YW/93EEksaWFDeHkpl89BVXCxoGo+66mDsuf5r/RClmS1Qz2t5sF5OgCzoUmt
	 sfwQqAZSXCIWEvZFq14kSEvW+DRewnV+CljXJQlUAFF+vbi3xLlU1+eB5a0lR96k7a
	 vd6LP10d92F2A==
Date: Wed, 31 Jan 2024 23:47:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@huawei.com>
Cc: yangyicong@hisilicon.com, f.fangjian@huawei.com, 
	jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH]i2c: hisi: Clear the interrupt status and optimize
 writing limitation
Message-ID: <bcprziyqs7cze34j52z4uplxjdqtlvdgat32us347wgb4hv4gm@rtmqlz4c6ie2>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240123080222.1512009-1-liudingyuan@huawei.com>

On Tue, Jan 23, 2024 at 04:02:20PM +0800, Devyn Liu wrote:
> Devyn Liu (2):
>   i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
>     - 1
>   i2c: hisi: Add clearing tx aempty interrupt operation

The series looks good to me.

Yicong, any thought?

Thanks,
Andi

> 
>  drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> -- 
> 2.30.0
> 

