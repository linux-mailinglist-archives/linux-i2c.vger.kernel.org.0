Return-Path: <linux-i2c+bounces-11879-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF973AFEB70
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 16:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C743B5617E5
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 14:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D0922E7183;
	Wed,  9 Jul 2025 14:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csQQz/AD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC42E54DF;
	Wed,  9 Jul 2025 14:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069772; cv=none; b=rGJEP+JH4eS9mgquF3Rgb6cgsmBDcH+HqNlsLKxAC3qchV2GHWxfE8xyHSNoYbYsZJQnJBMzP+su8Prn2kaNTsLxBQfRNIXsswPLMjc8xC5N7OKG3E8YNVfQ8D5IUOCuVCV2XfgzPio3b6aYJaEg61FcIl0CppmaJfKCjib4Rh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069772; c=relaxed/simple;
	bh=LBu/v4TM44q/brksks0Td8G5F8Mwm2ZSsG3t2zekMcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bX7pNqSTZPgwCHDfd8rv+/dfLh/H4a2NMuxoWNvBYV6sc1a0EdLt6dfgHUQWC5qAklMl939VkY5iYtup454jKntaW/8jJbCQXo4IppYp0dopP5mOCqnNQEuZf55MArA1j8FPxYvq5Y02AaTWWpl+KW45iUagxjXQmKgdWgxINEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csQQz/AD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A00C4CEEF;
	Wed,  9 Jul 2025 14:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752069771;
	bh=LBu/v4TM44q/brksks0Td8G5F8Mwm2ZSsG3t2zekMcg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=csQQz/ADVTu9pKPy2/IjhRWIpwzcbJoaX3jQDDAVAJ5B8UyVtC1TjE2H1/NogyIKg
	 UCUnDEO5jdK2l+ZsVL+dVMB0TgniISxG93cNq+dSWiYyxLYXeH2UXw0Hoq9wxsy7Qk
	 zUKR2DyXl7sqVW7qwTJmXX9c+3ESc4qrrsC61odGgfABUmAolPcLQrBI/qnGzaXAEP
	 937901zcoF1HSQ75SWuo0XLRJBEnrXaNEr4XwbrNL8lJhBu4BVDXLWuvn62wuJRnjN
	 xEdkjwGYUox9P5+WIGZy92XCJznU55EoGYpSoizlY7ZcFr6+X2zWY6/KLTUfGFtlAl
	 2nf0c1qOAvAPA==
Date: Wed, 9 Jul 2025 16:02:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com, 
	miaoqinglang@huawei.com, grygorii.strashko@ti.com, wsa@kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: omap: 2 Fixes
Message-ID: <rqqdjuspyenmtpzsy7mm4xqvgc6fghb2cbv7cspf3xos7xof5f@7r3xkbnnkwzy>
References: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751701715.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

> Christophe JAILLET (2):
>   i2c: omap: Handle omap_i2c_init() errors in omap_i2c_probe()
>   i2c: omap: Fix an error handling path in omap_i2c_probe()

they both make sense to me. It would be nice to have a comment on
the first patch from the Omap guys who have been very silent
whenever I asked for help on reviews.

I will apply them and if any concerns comes, we have time until
the pull request to revert.

Thanks,
Andi

