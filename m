Return-Path: <linux-i2c+bounces-4824-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC13F92CC7A
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 10:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F971C22FF7
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 08:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845DF84A51;
	Wed, 10 Jul 2024 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEuKMHuU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C8284A32;
	Wed, 10 Jul 2024 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720598757; cv=none; b=YyxaNaCE81W8n9jY60TKwNR195TP4REtIheKBDDZ3uwPQ/Dm5/7IaecizGidnPs4uIkdfUwnKo6chD4XRjqFte8eUFJgaHbPAeB6c2pUinSUhzwE1/HM8+uQNPzRMy5DxjI0PCbIdgHCZ7tSXRHH0Ij5xTjjVyhnxLiVU0FQV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720598757; c=relaxed/simple;
	bh=JC9nfwHWwaL/mn7y20KebYhhgI/Xz1CXJxP6qxdbSxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KAkRZ4C6XBRlAjMG2wn2IYwl5JUbqfjqNzKJ00/05HaZPw66fArugwZ8KhHqZGpImEPtrPROxMCfGWmmFOKV/qRaTL8C3/SudbCAuYuCMl77wIy9PlK74oyJxapdwzVHxPzDtvOu6jN+Uzd8FZPcQ3GfrAZVbo/W0AHJqquDEI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEuKMHuU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41611C32781;
	Wed, 10 Jul 2024 08:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720598756;
	bh=JC9nfwHWwaL/mn7y20KebYhhgI/Xz1CXJxP6qxdbSxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEuKMHuU5bGPCpo/XUE2H4vww3gHIcp46/RSeSFshRfDJPL8jINKdh+2xPLocZM4r
	 8NvkeAMBo61fUhJ4FjP6Zj6uuOSt6zUjberWhE1Ve2LF/UpBBIodu/4wQjWpNq9Y/7
	 yT8kbesITJzDc9YM73elEKaAFZYxQJM44w3/TG9Q1FXXWptOJpr9W9o5Ip09BdMk7b
	 HSlVPU7wz3ecUepzkfkkafR5GZrRt2jUzKs7IoXIRPbaJ/BbNK7/g6FDsVg48mRKLo
	 30w2YTXsFW7rh1hjq3X8b/efrsP4BGLql3bdvCV5k749GVnm4eMfj/ozGSpSH2k1nE
	 +RwyBIaZIpeyQ==
Date: Wed, 10 Jul 2024 10:05:53 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 13/60] i2c: diolan-u2c: reword according to newest
 specification
Message-ID: <a3ji5kqm3mnnbvkvknckyiypuqmqtein6wwc66ctxldf43m7aj@5dpfpwgy3h6e>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706112116.24543-14-wsa+renesas@sang-engineering.com>

Hi Wolfram,

On Sat, Jul 06, 2024 at 01:20:13PM GMT, Wolfram Sang wrote:
> Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
> specifications and replace "master/slave" with more appropriate terms.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

