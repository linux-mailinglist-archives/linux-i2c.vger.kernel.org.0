Return-Path: <linux-i2c+bounces-6341-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7863B96FD74
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 23:34:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23A291F25FC5
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 21:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449D415958A;
	Fri,  6 Sep 2024 21:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GvE78ztU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0189F159571;
	Fri,  6 Sep 2024 21:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725658484; cv=none; b=EjsY65Ekfj+4oNYBC7u5E5eXD/Ttvwz/NZGTMA/07VwmM1IugRwBizbrKctlaAqYb67cz6IPU5qQppFwuPNDKaPFJ3dOPOj5zRjXf+JDJs5obyieun2hghulvuriUVvq6FgWuunaZwpd4AyNAB98th3Qj1RddmJdV5vvcm/7Sy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725658484; c=relaxed/simple;
	bh=bOA3vbXjx15rV+Hi0lSEOJDpqnblL9X2syI0liSe+1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BmNSMGyq4eRXkncH/WpJdaSR1UibqQrkGgB+0N+s2MXvAZf6ugP4OwOmd60E+zQYj1kL63gWalLTeAuVvdReqwRywjVfGWR9+HUvO3A1c9OAgJQ0GRPgZKl2PiaObIuezCIe7xkbtPK3wWY2VIYgrr57Ex5pEjjLJzJlDLYJOZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GvE78ztU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD7EC4CEC4;
	Fri,  6 Sep 2024 21:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725658483;
	bh=bOA3vbXjx15rV+Hi0lSEOJDpqnblL9X2syI0liSe+1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GvE78ztUAfYlAKST2TGecI/FWeHk2ysNScNNAZR0x9CfCleGMImu0my39HSTd8bQS
	 CAjW/9+Y1lU/fHf1OXacW6Z1Updg2PdrjMrDnLFcdOc7Lqc6goYQjI/NsqWyOCIlmp
	 jeAXR7tVC0ANehuwaYka+1A3jyLPDYHjR1x5831+3+kBiXl4s4uTzAb6PK5PZ/LACw
	 HGDUTG1bGZUb6trzU41awp1HusE66o31dJ/Dxdd0w82TUSStjKyd46OwK2ks9mGE/A
	 jPgxx1nCATu1FZwiGc5olqNTEGKPsa8Q1gtbSlrc8z3zF2B6KkyFQd2/z2la7utFLl
	 CJhjFk0TqhyYg==
Date: Fri, 6 Sep 2024 23:34:39 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Kimriver Liu <kimriver.liu@siengine.com>
Cc: jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com, 
	mika.westerberg@linux.intel.com, jsd@semihalf.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <tlyybm626om6a64du5ke4sbxqo4nx2p3g5g4f2mfhv5wp4pulw@5alrb7jixquw>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906074731.3064-1-kimriver.liu@siengine.com>

Hi Kimriver,

...

> diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
> index e8a688d04aee..2b3398cd4382 100644
> --- a/drivers/i2c/busses/i2c-designware-common.c
> +++ b/drivers/i2c/busses/i2c-designware-common.c
> @@ -453,6 +453,17 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
>  
>  	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
>  	if (abort_needed) {
> +		if (!(enable & DW_IC_ENABLE_ENABLE)) {
> +			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);

BTW, your patch doesn't compile. Please make sure that you have
everything in place and please resend.

This time I expect you to follow Andy's suggestion.

Thanks,
Andi

