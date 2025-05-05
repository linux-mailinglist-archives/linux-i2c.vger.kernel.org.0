Return-Path: <linux-i2c+bounces-10788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FF7AA9E81
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 23:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36BEF1A80384
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 21:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7476F274FE8;
	Mon,  5 May 2025 21:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hweynfnS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1451F78E0;
	Mon,  5 May 2025 21:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482380; cv=none; b=ldfFpZNki3j/CXKeSCY0gm0akko92XfvCjsEVtAEpbcF/omrBx2CsFVDtlFFszyZ//19SZz1HlBl6eOw/SydScKPICa9nMlfVVkV3zrsz6jx/en6GI+haqBbGucffmf3qrymbV3nw2UY4sovf/2eIT4+y1azhCb14h2gcFZ8eTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482380; c=relaxed/simple;
	bh=pbVayOz5HNns5TXksUWnNztEgNESCbOZdZ2cbLHEUaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RyiMe1c0nhszRUKd78KvBmcV9U34fr3YYCiOdHd/Bz0hXhPKS/rwl4rUngjxIddc437ZPOZjwsDWCqckwLU0Z1CKZejBYimIaA208cjKIYhddMPV6F4tTZRHC0h1yShn817frie7h49Mub+nLTV1osO7bQcHBOQvKhsa0z7F70c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hweynfnS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D316C4CEE4;
	Mon,  5 May 2025 21:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746482379;
	bh=pbVayOz5HNns5TXksUWnNztEgNESCbOZdZ2cbLHEUaw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hweynfnSwfx9jUG8tvveiogmExVC4mPt0x96ITje1n1Laz7y0x7qu7wycjPS3c/JF
	 hNOCq8c3/HKaZkVp1f7dhfMvS2bHTpkVn6GjjF8gNY/JQQTZyyLdc0XVX0ZmTLB9Cl
	 3CXiBvbJ8q4iuQw7eAG+7gK+aHDDLcyRcsXylO6pNeHV5BBFYGdcQGp53GVr9p/9zl
	 RFUIZ57Hh/CgsPjyZTarA7AEsqKv0gTWg6nI9AERn2E/4O86eZtv6JIwAfHxaBGPWP
	 cK1rkjEWZT5BIUKGm3Es15Y0leLRi3F4NMfWJWAP7EKhH3vq9VOtlf5WsqYvBdP8v/
	 TksSg2+uDQHxw==
Date: Mon, 5 May 2025 23:59:36 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: shao.mingyin@zte.com.cn
Cc: kblaiech@nvidia.com, yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, 
	ye.xingchen@zte.com.cn, asmaa@nvidia.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, feng.wei8@zte.com.cn
Subject: Re: [PATCH] i2c: mlxbf: Use str_read_write() helper
Message-ID: <ugtrvi4kuitnb2kgqeofc3uocudy7metvpvcbkiaqplkaas2c4@zq3hp3xd2yz5>
References: <20250401192603311H5OxuFmUSbPc4VnQQkhZr@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401192603311H5OxuFmUSbPc4VnQQkhZr@zte.com.cn>

Hi Feng,

On Tue, Apr 01, 2025 at 07:26:03PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Feng Wei <feng.wei8@zte.com.cn>
> 
> Remove hard-coded strings by using the str_read_write() helper.
> 
> Signed-off-by: Feng Wei <feng.wei8@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

merged to i2c/i2c-host.

Thanks,
Andi

