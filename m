Return-Path: <linux-i2c+bounces-1574-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0528451A5
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C802628B340
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0EE11586E8;
	Thu,  1 Feb 2024 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hb0xeFyH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7DF1586E3
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706770316; cv=none; b=hsDAJsrc4LJdsws3caieal/PaDIkoR/bd+nyPLpzPyXc+MmWZuZJrewhCkafe1ky8W+j+I6hHikB3kWOoH3DjhlbKE+F8YEm99KQ7xDMoR81aYoDtn+qrYnu+2/d0sAwR0yn/v+wDkyGp5QIOh3Va3BmT6IDIsiXQpVbQx6YnO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706770316; c=relaxed/simple;
	bh=o2Jd+8Ra3dqtYUZDIhNM5kMXB/WFSyzhBlT9zawea7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MynOj4reW+a9jk0YI0hzM9Os0x5urGQHtPzaFIQsB9Z+WSahJoj7dFj5TEiw8b9h4dcgxESLNXHDOmkdOCKCtUP3YVEnTZcxiGBOjxlb5wgv7c6Sm1zXy37oED2addEMRgcLRhElH2RsfBVEJKzRhge/jVfXXJl6mQg2hY87iXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hb0xeFyH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8582FC433C7;
	Thu,  1 Feb 2024 06:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706770316;
	bh=o2Jd+8Ra3dqtYUZDIhNM5kMXB/WFSyzhBlT9zawea7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hb0xeFyHQEAMZfNQF5sGpdUsCY+0q7G+5Yr6ju3I7Fwf+1dd1BKSx0UkmVkmC2qqg
	 XmnqJTjz5PMWfEkV9nrcst8YAfzeubwXszhBJbh+ZvEYJNUW2tGToKNp+dHL+8MkWX
	 b/VXtHM+uC4B5IuNY/r56z+Vw1PWnlKqX/GS12qa+ir8C3oVEhfNTANULSKJAOMby9
	 mRu5lAxHia7DMPTX2pNHF86mytEgk85q7/4od7E9aXYrhrhEsy+nfBt1WQZ1aEH/ek
	 QtiwEAIY/hukfr7pU2gSs2WtFH7KwkljVLBBm8yZF5nmAlGjqBdzuDug+eu66l+/vp
	 tK+itrGkSSoKg==
Date: Thu, 1 Feb 2024 07:51:52 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Devyn Liu <liudingyuan@huawei.com>
Cc: yangyicong@hisilicon.com, f.fangjian@huawei.com, 
	jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: hisi: Optimized the value setting of
 maxwrite limit to fifo depth - 1
Message-ID: <wcodkjjrkd5ujfr3gdpqik2ioibnafatmkltrxezpdcr3twtcc@t7wxlnudcsge>
References: <20240201061345.3111600-1-liudingyuan@huawei.com>
 <20240201061345.3111600-2-liudingyuan@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201061345.3111600-2-liudingyuan@huawei.com>

Hi Devyn,

...

>  static void hisi_i2c_xfer_msg(struct hisi_i2c_controller *ctlr)
>  {
> -	int max_write = HISI_I2C_TX_FIFO_DEPTH;
> +	int max_write = HISI_I2C_TX_FIFO_DEPTH - HISI_I2C_TX_F_AE_THRESH;

this is one of the differences.

Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

