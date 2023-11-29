Return-Path: <linux-i2c+bounces-556-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E34C57FE426
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74ED0B20ECE
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367DE47A45;
	Wed, 29 Nov 2023 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DuopeACd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD434CB32
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1BF4C433C8;
	Wed, 29 Nov 2023 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701300114;
	bh=PYzACPIE8RGmG59RoMprAZsHsC9zrxefFFB60TgKGw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DuopeACdSOBtuBSGbIR09hxnq9lEFOpTcZdYCuxqEPy5zDCboXLAFeu/ocXorLQeL
	 j3GVVVlMt+ZvTN9Qsirsl4kPruWPlrNz2Pmsdui03WxNdWOexMlHRWix1OXHWQkU7o
	 n46Jf36iKKZlddoHaSl1U6bi5Gl+P8jectgorjm0EcUzepkIHKmQbRUbjdoHv0/eeR
	 DCRo/m3mFkN+M4jzWOJfn1EC/dwf9HsN2DLDbGqxsiky6p3qIfWsiK0zDyBM3ebHoe
	 dpCA9p+pssFm6PR6ctb3iSM2ov87vUNXTIPPYaXxGgENxSKSCROVSq9L5nbIlawJOC
	 Mjontb8Zsj49g==
Date: Thu, 30 Nov 2023 00:21:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v4 19/24] i2c: designware: Uninline i2c_dw_probe()
Message-ID: <20231129232151.ueum2axn74qzuzes@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-20-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-20-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:42:01PM +0200, Andy Shevchenko wrote:
> Since i2c_dw_probe() is going to be extended, uninline it to reduce
> the noise in the common header.

where is it going to be extended? It's not in thie series. I'm
fine with the patch anyway as it cleans up the header file.

Thanks,
Andi

