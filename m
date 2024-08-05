Return-Path: <linux-i2c+bounces-5148-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 218FD948015
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 19:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C033D1F23A22
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 17:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171C015E5D3;
	Mon,  5 Aug 2024 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bP6Sao+w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C1155351;
	Mon,  5 Aug 2024 17:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722877868; cv=none; b=dLiVWotobOKdnum3ajOjTv0Ufnc6gtBLMvwZxe6rjhf5ZmCihr99hlqK3LCIcU/6BQqBwgWNQQHzUiMRxe7DYnHCODlrj6BjTsdiaq93ZsXDBStLxo2KlN4bioDp9jBxN/2oIe1NGiXmR+sIdUe3XDbXXxnIWfpNuYBOT6noHyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722877868; c=relaxed/simple;
	bh=kfT/0Rtuxj/GpfGy2EPPs+dE385NlrEi5dpfZqPydW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeuO5G14NkX3QEWNORVYq9xAOzY1zUxUnkp7fYr9dMk4k75Vg/Cobv2vsZiBynZ5u+u0xXaf4lfKP75341Rmzy0TrdSsV0Fpjbj3r5sJ+3mxOgc8bZes5bvnUT+k7HcNd4b0XHqJ6BXkMu9oKkvwQtSdAPqlTYkVEmOcRbQB40U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bP6Sao+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0126C32782;
	Mon,  5 Aug 2024 17:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722877868;
	bh=kfT/0Rtuxj/GpfGy2EPPs+dE385NlrEi5dpfZqPydW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bP6Sao+wg8G+bBD29VrvMtp78cBe+Qf0M+s0QmsoY3pdCGMnsZDH/9cf4I4aLRsXl
	 sQdlSauQ/hTk1xZWdwG5avSdQ6oYfi1BdESrcke9FydlXtK7KwXLeaR9vyuXbpjGx3
	 BzGkvEr/5UP6v4XoA5qwne6aGSPCwaY7vEbRUyH3SrvG1oqg5GNQZQ0QrrMrU4GZg4
	 wpW8l2uS/zrpP6yBrIDvbkQbdDmJLuMV0vOPVQIQ04rrCUretLPNQsFQV1x2U3EeZC
	 RRC75AQDaUTkTUbJZvmQzb/LS0r4q19eHfy82AmT4XzqF8BoxrR2hq8oan0wtYS6Tp
	 8KIEQ94IUFlKA==
Date: Mon, 5 Aug 2024 19:11:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Gaosheng Cui <cuigaosheng1@huawei.com>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] i2c: qcom-geni: Add missing clk_disable_unprepare
 in geni_i2c_runti
Message-ID: <2w4bpzbrem77q2xr4pdo7ual4vh3pgvsbdxhphhtp53qwtch65@36h2nzb2sk5j>
References: <20240803061041.283940-1-cuigaosheng1@huawei.com>
 <a12d2ec6-07b1-4577-8bed-981024c5cc9c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a12d2ec6-07b1-4577-8bed-981024c5cc9c@linaro.org>

Hi Gaosheng,

On Mon, Aug 05, 2024 at 12:21:53AM GMT, Vladimir Zapolskiy wrote:
> On 8/3/24 09:10, Gaosheng Cui wrote:
> > Add the missing clk_disable_unprepare() before return in
> > geni_i2c_runti().
> 
> The function name above is scrambled, it should be geni_i2c_runtime_resume().

with the function names fixed, merged into i2c/i2c-host-fixes.

> > 
> > Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
> > ---
> >   drivers/i2c/busses/i2c-qcom-geni.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> > index 0a8b95ce35f7..78f43648e9f3 100644
> > --- a/drivers/i2c/busses/i2c-qcom-geni.c
> > +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> > @@ -990,8 +990,10 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
> >   		return ret;
> >   	ret = geni_se_resources_on(&gi2c->se);
> > -	if (ret)
> > +	if (ret) {
> > +		clk_disable_unprepare(gi2c->core_clk);
> >   		return ret;
> > +	}
> >   	enable_irq(gi2c->irq);
> >   	gi2c->suspended = 0;
> 
> The fix is correct, thank you.
> 
> FWIW there is another missed call of geni_icc_disable(&gi2c->se) on the error paths.

Are you going to take care of this, as well?

Thanks,
Andi

> Fixes: 14d02fbadb5d ("i2c: qcom-geni: add desc struct to prepare support for I2C Master Hub variant")
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> --
> Best wishes,
> Vladimir

