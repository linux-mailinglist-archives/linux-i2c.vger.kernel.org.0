Return-Path: <linux-i2c+bounces-7679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3889B79E0
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 12:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618B8284FEA
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 11:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 890F919ADB0;
	Thu, 31 Oct 2024 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bhDZsBHP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C13A19AD48;
	Thu, 31 Oct 2024 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730374890; cv=none; b=g/9aI2nREngUHT7HRWBWzlkLvZvNlPuBuXIss5Id+xvjgeM9Ik6KVvdmygf1uF9aAdI2iM3h2Bk7NFUVkucxJXsohxjBNaa2uisJXoXD2rPlpnTmMK3bRS4ROGVipgGKkzPnOVNqFzG5YwA+ZruK3dHdme7MBvJz0oS+v5ht52I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730374890; c=relaxed/simple;
	bh=4qxINBYrqhRsnSoU5fBGCoMBvbFJVkEOPzAlUqBRcjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENYhXAQzDmQc91gpKO/2YGYaF+uAQtqgdRt5D3HOsmrcA6GB51he3j5a8pJsxDr6NAepqjvhvNjaFRrE3VOUIp7npdcKaKkYDGfEMakBWpqA0QckhUtoHWoKMGoyjkzPzKvOzqpFTgeYvmItpHUtKFLzFriWyXPWkqn5Arwf2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhDZsBHP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05EFC4AF11;
	Thu, 31 Oct 2024 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730374889;
	bh=4qxINBYrqhRsnSoU5fBGCoMBvbFJVkEOPzAlUqBRcjo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bhDZsBHPysWc7FfvPbbnO1f4jvAefqTta5h3XXvSKyvP1Ul/R0e8g7E8vYmj8SWgS
	 4lUK7K0UNIG8TYVhvGBhHHAtAMyBWlvg6+FZWbHgOTXDqm8huBa9TBasvng98KB5UO
	 WNTrfVJ1nF1UpYe4ixMDBC9NFVjGam20R8C92VmvvA/FKZx589d0FJRiFm1y/TWQbF
	 JrfGoo9WesTUlldDbGpZ3c9e+2jarZBQM8D7u0yf0r1kgmd9Dqdq0G4wlBha5fLnUv
	 jm1NJ2W045ZyFxaEN/mtLeK+0bIBBN2tWPirHbuiyLVBe+Roy8dDsS9ct5lVl2zvSL
	 Ji3klRuB4CL4A==
Date: Thu, 31 Oct 2024 12:41:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	loic.poulain@linaro.org, rfoss@kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abaci Robot <abaci@linux.alibaba.com>
Subject: Re: [PATCH v2 -next] i2c: qcom-cci: Remove the unused variable
 cci_clk_rate
Message-ID: <7f5amyf7ljvtfjyksfe7cad25wu7qdg4e45mdite6bdxx63ge5@ov37ohc7qtai>
References: <20241029020931.42311-1-jiapeng.chong@linux.alibaba.com>
 <rql2u5k3esavdmpdzgo4l4up4ir7yjpdzc3qlmsvjvqalqzvjc@xspprcohlout>
 <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f06dea2e-893b-4de5-89a3-e25af56afb31@linaro.org>

Hi Vladimir,

On Thu, Oct 31, 2024 at 01:13:24PM +0200, Vladimir Zapolskiy wrote:
> Hi Andi,
> 
> On 10/31/24 12:44, Andi Shyti wrote:
> > Hi Jiapeng,
> > 
> > On Tue, Oct 29, 2024 at 10:09:31AM +0800, Jiapeng Chong wrote:
> > > Variable ret is not effectively used, so delete it.
> > > 
> > > drivers/i2c/busses/i2c-qcom-cci.c:526:16: warning: variable ‘cci_clk_rate’ set but not used.
> > > 
> > > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=11532
> > > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > 
> > thanks for your patch! Applied to i2c/i2c-host
> > 
> > Thanks,
> > Andi
> > 
> 
> FWIW I've noticed that my Reviewed-by tag was added to the accepted change,
> while it was the conditional one... Actually I don't know how to be aware
> of such nuances, if only b4 tool is used, likely there is no way for it.

I thought the change that made your r-b conditional was the
Fixes tag, right? That is added. Have I missed anything?

(I noticed later the v3, but it's basically identical to the one
I pushed).

> Hopefully I'm not too picky with it.

Absolutely not! Please, keep pinging me if you see anything I
might have missed.

Thanks,
Andi

