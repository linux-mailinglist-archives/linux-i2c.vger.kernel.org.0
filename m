Return-Path: <linux-i2c+bounces-626-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC380645E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 02:47:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5086E1C2110B
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 01:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC07220F9;
	Wed,  6 Dec 2023 01:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fewuHwMf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C61A20F5
	for <linux-i2c@vger.kernel.org>; Wed,  6 Dec 2023 01:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21887C433C7;
	Wed,  6 Dec 2023 01:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701827248;
	bh=m3OXxxaNOcCbca66NX0B9W3SqJV3ZbMjQp5zBskM9iI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fewuHwMfF7zXS1KUN/yTlis/ON6ZzuoLEyVFUGPZ9e0JM1b5qkBEecx3SbLP+A37V
	 a/zKC02fLbBZZPpc0mgpq429kLVSQFKqQEsqzFL93X3zu5IVKo/cKFbVkKTZJd5Q1S
	 I2L71pZtRcUtVBwYOwdNraE0eqvY23jcqGWw4uVgmSE4wIEU4KSlFMWwupnyQK8GbX
	 qDztWGvvIwum5XxJAv2Io7HNrLcPdOjpN2LdpuMlMWWURAu3XVrGheH3uoeun4M6ab
	 Zotz94GIIYhaQu02K5yIPlbabSBak30TMDqUN3ctur3BFI+PwiYxSktdXmpiWbeWJJ
	 49ab9W3qz4atQ==
Date: Wed, 6 Dec 2023 02:47:14 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Jochen Friedrich <jochen@scram.de>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: cpm: Fix data type
Message-ID: <20231206014714.etrj4ecnt4tln5ev@zenone.zhora.eu>
References: <de07101166ac0e4649cf3b57fdf960748c9ecc75.1701800124.git.christophe.leroy@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de07101166ac0e4649cf3b57fdf960748c9ecc75.1701800124.git.christophe.leroy@csgroup.eu>

Hi Christophe,

On Tue, Dec 05, 2023 at 07:16:53PM +0100, Christophe Leroy wrote:
> sparse reports an error on some data that gets converted from be32.
> 
> That's because that data is typed u32 instead of __be32.
> 
> Fix it.

the reason for this sparse error is that the data variables is
then parsed with a be32_to_cpup() and I think that's not
necessary.

I think the real fix here is to not use be32_to_cpup().

Andi

