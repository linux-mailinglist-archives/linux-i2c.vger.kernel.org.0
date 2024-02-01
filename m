Return-Path: <linux-i2c+bounces-1572-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A3845194
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 07:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7C751F24454
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 06:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9D7E15703D;
	Thu,  1 Feb 2024 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MUxg5auz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739C3BB46
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706770050; cv=none; b=coQ+aKd+aWQiwuO3rIRlIR9ke3jlTRQnJW9p3m+TPFZuMQA2xiFZZo6Ui9gSY0igVnZP91rITnQUsUYqQ6kRjdTMgC+yu57EVWhcg2eTPp7fkQSrW0OidPTL8pAm1MkRbb0BLBVmxVE9bpEZwECJIBtQtT+2jHSukAgkHoVEEqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706770050; c=relaxed/simple;
	bh=aGuG/eX4efYXrXL8lO1gvFQc7jyRKQ2XoHuoFFURSf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ci1Jh5ctvvPpv8j1U7rhvM5zpIQJzU8BAbRHrNyd/OyCd5fzWVNRXWVpBPlgjM1b3re9YAnFUUSS9wKv2SzOaN1C05qhlE1xcCoH2szMj6b+SECU2C/+R0wNlrWjEeBSiKQ5RON1S9VQYyRj09G69xVHoMTWQCmrv8ca3GP+UQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MUxg5auz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A6BFC433C7;
	Thu,  1 Feb 2024 06:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706770049;
	bh=aGuG/eX4efYXrXL8lO1gvFQc7jyRKQ2XoHuoFFURSf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MUxg5auzmtjnusStE8NzR2RIskwADQ3gZ3xxj2XtG/ioINgWJJ5sVSJ81Vz7IN7zh
	 R5DKHvtZjTi3cJcDsVWIPQ1w6UziBu27k4MZXgAd8u+BSGTcKy4LywTYGcS7YTf7JJ
	 5i9d5X/qULPS1utTmtn++SWtb5bYGDD3y972jd/l+0zhwmheV4KNSeRVhiueqM/jdv
	 xlTINu/fzLOUGBBdV3kfKYiRNZ1PmPVNaxytFYTuBt2gccZ1Mpnw93DhEi3KhtEFyP
	 Vfaem41uY8HG9ZDpb/qaT5gmotwXB400avgxZSxlbufxkNIioeO3K+adKtmlCtYu4/
	 IHuEv2uI4usdQ==
Date: Thu, 1 Feb 2024 07:47:25 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yicong Yang <yangyicong@huawei.com>
Cc: Devyn Liu <liudingyuan@huawei.com>, yangyicong@hisilicon.com, 
	f.fangjian@huawei.com, jonathan.cameron@huawei.com, linux-i2c@vger.kernel.org
Subject: Re: [PATCH]i2c: hisi: Clear the interrupt status and optimize
 writing limitation
Message-ID: <ix2s66kiawv2o6tfoa6i6z7tu6huxkiv2ia6zt576py3iqjzz6@27damsgaomjl>
References: <20240123080222.1512009-1-liudingyuan@huawei.com>
 <bcprziyqs7cze34j52z4uplxjdqtlvdgat32us347wgb4hv4gm@rtmqlz4c6ie2>
 <2e0660cf-e4c7-d905-d5d6-edf0a0079d7a@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e0660cf-e4c7-d905-d5d6-edf0a0079d7a@huawei.com>

On Thu, Feb 01, 2024 at 10:12:09AM +0800, Yicong Yang wrote:
> On 2024/2/1 6:47, Andi Shyti wrote:
> > On Tue, Jan 23, 2024 at 04:02:20PM +0800, Devyn Liu wrote:
> >> Devyn Liu (2):
> >>   i2c: hisi: Optimized the value setting of maxwrite limit to fifo depth
> >>     - 1
> >>   i2c: hisi: Add clearing tx aempty interrupt operation
> > 
> > The series looks good to me.
> > 
> > Yicong, any thought?
> > 
> 
> Sorry for finding this late. Generally looks good to me as well and just replied.

Thanks!

> > Thanks,
> > Andi
> > 
> >>
> >>  drivers/i2c/busses/i2c-hisi.c | 13 ++++++++++++-
> >>  1 file changed, 12 insertions(+), 1 deletion(-)
> >>
> >> -- 
> >> 2.30.0
> >>
> > .
> > 

