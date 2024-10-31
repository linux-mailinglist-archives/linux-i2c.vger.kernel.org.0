Return-Path: <linux-i2c+bounces-7682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEA99B7A46
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 13:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9C0E1F215BA
	for <lists+linux-i2c@lfdr.de>; Thu, 31 Oct 2024 12:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FAC19B3DD;
	Thu, 31 Oct 2024 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pdt01mWw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB6F191F65
	for <linux-i2c@vger.kernel.org>; Thu, 31 Oct 2024 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730376563; cv=none; b=KB1nud6q40S4YqDh75C3JZ8ft62qhLzD4NoVsfxjvLPuBoB0jDe33MB2FkVbHXNCDS2MqSeyU3mCH33RfU7j2fOT2t9hU9VGXepsaZt13cezQFsMco4aGZ4e5ZGQJdaYw/zgJ3mByPDus+T9meuphoxSNvjlNcGJjktjJIiTgQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730376563; c=relaxed/simple;
	bh=JDc4Md8Nxhddvc8Q1gepqe0Sxu6qcZjj+yeqYNGqjVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zpx1Ps5T0XSEhNUpMem1KSSxiRMbx5EfJWBO/fkmLRnMRruoMS3mlZvITOF/4S2eERxItA/kdIZk7WwxwvvTDidD3X06tQNpMo6ElMgYEURViWLKfrDcTCWSTwM/4UeiXAHffhiN3laKaiR91SJ0XYKSVW3CilKlPbMLhfp0YDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pdt01mWw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BED5C4CEE0;
	Thu, 31 Oct 2024 12:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730376562;
	bh=JDc4Md8Nxhddvc8Q1gepqe0Sxu6qcZjj+yeqYNGqjVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdt01mWwQ04jotA4A9UUzCQkliHo7v4DgtDTSa20i+xw+19wtUVXv12mMxfdXNieN
	 w/nPgHzNGy3tIMkS0jnammDCrUFvjC1CN/smbavZ42dLWlhwP4wv3nPwKEjJvWf714
	 K5WRX4FFFpSuCPeGxhbGnsLhq9sWVf3hqCMhjkha7oCH5iLNyIrJ1g9IhwcTKi9nWM
	 HJqcPAn+w6jAlgUrE8PvSO66o9x3y8eJzJN7uUfEPf3C+N5XgJBMCjCE1R0ZnelkkK
	 eJwX5JV4Q0RDnGlz92gLBRiOjfKECiI5F0/28LKw5HPhXMcrKWg5T0yujZYjDWdtUY
	 89PBYrpGSkE9w==
Date: Thu, 31 Oct 2024 13:09:17 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yang Yingliang <yangyingliang@huaweicloud.com>
Cc: peda@axentia.se, farouk.bouabid@cherry.de, 
	wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, yangyingliang@huawei.com, 
	bobo.shaobowang@huawei.com
Subject: Re: [PATCH] i2c: muxes: Fix return value check in
 mule_i2c_mux_probe()
Message-ID: <yq3ncphzoexlecxqqo5y4qhepc6u7sks4glb4n6jzlytynuylk@ndxwo3twzl3j>
References: <20241026030942.1484-1-yangyingliang@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026030942.1484-1-yangyingliang@huaweicloud.com>

Hi Yang,

On Sat, Oct 26, 2024 at 11:09:42AM +0800, Yang Yingliang wrote:
> From: Yang Yingliang <yangyingliang@huawei.com>
> 
> If dev_get_regmap() fails, it returns NULL pointer not ERR_PTR(),
> replace IS_ERR() with NULL pointer check, and return -ENODEV.
> 
> Fixes: d0f8e97866bf ("i2c: muxes: add support for tsd,mule-i2c multiplexer")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

