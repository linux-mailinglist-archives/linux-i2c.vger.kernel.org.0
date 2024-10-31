Return-Path: <linux-i2c+bounces-7683-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6281F9B7A72
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 13:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B1E2B2308C
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 12:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260D819CC34;
	Thu, 31 Oct 2024 12:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agU3snlv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBEE19CC08;
	Thu, 31 Oct 2024 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730377431; cv=none; b=BoOrCVJqWZIKeG/mU6ajXb/ZRnwMdX1PTM3I3KkowkNCZpgYx8q2NNpVon1gQFJ//EYENiOyQX1RDFgIWd4maINZ8v2n03VZm9GAjLKMlgWmqhOjDwNtbk9NpvSN+Y1wHl9kziPPBfQLM7gw7138ExD7kByWcnW9LhHxMp7TZA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730377431; c=relaxed/simple;
	bh=dADoK+rRwsBwxgt5AIiHceJswYu86JTOLxIc0/c0PvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Omdu/GZmbnVOOduZIY1K4vJUaLwUazPlKXdYkPnTYUlzPgCvR1iBQKogY3giZ8D/lN7ten3///XXigZpz7WSyYxFjEQ/+ikUaIVM3lJ97RN8IXSSSMKl2vpt29XnBrbBnrPuHuwQD/kPEnV6MHpZfjTdGLBZDzJF7zB2koxHwZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agU3snlv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB3FC4E690;
	Thu, 31 Oct 2024 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730377431;
	bh=dADoK+rRwsBwxgt5AIiHceJswYu86JTOLxIc0/c0PvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=agU3snlv+qwGyOip3i1LoYpsf9DE7GWMD6JxwsADinyv4FIDj+y6zC5dhAXWTbk9c
	 4ekVdggT4vRdbS8x4bawN/gBDxhpZbPY9wFYlkr3ZfUtPkamKtIk3i+8PdTpws06Jf
	 +WOBXaYhp1SvaPwtiKi6n/flznsmgDGCwycBtCgIj05+VHXOMeoMU59tDSWNFyEIRt
	 rHUi6KsDsWKD97lGalkZSbcwx0wvh1SZpCKgZeKAdr71hxV3POpcM6/CRDlr33GWM2
	 kLcTbJ4B1UBs64VprCfE05hR+K8PwDs3sIUg52Fxmj6fG1yESHiS7LhBcOzd7QIoaY
	 ZNHPt4lMBtrng==
Date: Thu, 31 Oct 2024 13:23:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	loic.poulain@linaro.org, rfoss@kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <auvqypvayvlhzi6n6jp3r6swq4sik3jvcxxafvu67i2y3r337m@uy33er3gujk2>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
 <rql2u5k3esavdmpdzgo4l4up4ir7yjpdzc3qlmsvjvqalqzvjc@xspprcohlout>
 <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>
 <7f5amyf7ljvtfjyksfe7cad25wu7qdg4e45mdite6bdxx63ge5@ov37ohc7qtai>
 <e1c55403-55ee-4742-b7e6-8f0a4387ce9e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e1c55403-55ee-4742-b7e6-8f0a4387ce9e@linaro.org>

Hi Vladimir,

On Thu, Oct 31, 2024 at 01:59:45PM +0200, Vladimir Zapolskiy wrote:
> On 10/31/24 13:41, Andi Shyti wrote:
> > On Thu, Oct 31, 2024 at 01:13:24PM +0200, Vladimir Zapolskiy wrote:
> > > On 10/31/24 12:44, Andi Shyti wrote:
> > > > On Tue, Oct 29, 2024 at 10:09:31AM +0800, Jiapeng Chong wrote:
> > > > > Variable ret is not effectively used, so delete it.
> > > > > 
> > > > > drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> > > > > 
> > > > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > > > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> > > > > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > > > 
> > > > thanks for your patch! Applied to i2c/i2c-host
> > > > 
> > > > Thanks,
> > > > Andi
> > > > 
> > > 
> > > FWIW I've noticed that my Reviewed-by tag was added to the accepted change,
> > > while it was the conditional one... Actually I don't know how to be aware
> > > of such nuances, if only b4 tool is used, likely there is no way for it.
> > 
> > I thought the change that made your r-b conditional was the
> > Fixes tag, right? That is added. Have I missed anything?
> 
> ah, no, it was about the copy-pasted commit message, which mentions a much
> more popular 'ret' local variable.

oh yes, the new commit message says:

"Variable cci_clk_rate is not effectively used, so delete it."

I'm sorry, I will fix it.

Thanks,
Andi

