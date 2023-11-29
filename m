Return-Path: <linux-i2c+bounces-554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4597FE417
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03A5EB20FA3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F49F3B1BE;
	Wed, 29 Nov 2023 23:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeDIres4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455D5339BD
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37FFC433C8;
	Wed, 29 Nov 2023 23:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701299542;
	bh=HSts/RtmkEfp+hucOjG24Evpl8KCO+IZ46P7Gko2SYQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YeDIres4usu9TV865nZhvq8NuWquu28P645VlNhRqrBH0p79EnGADd5vGB5GKzHs+
	 +6IlzcNlMEoCrmkCXC8AH2pVMpdlZg9+kDVMdSGL5rDDeh4SVCJBIUBtG5FmcjKS++
	 CV0zFFnQRMvU5Fp3XOyhl1HgHJ821Ax/EtrszRAnOQ/qDlETD1DSC6SrfNAvRE5xQb
	 LH6z2SXv9fjlK9BPKAPU7Oi56fMVsgXEqErjqMRLUqVswZ4eGcwIxy5+4QbCdKu5P6
	 xNeZQ6Eiu3ERl6zj55/t1E2jGsmQjbBEIVoSLGLHcEh0vaVsJxVPbr+EFKasOoe+Uu
	 7xJldqnvqwkGg==
Date: Thu, 30 Nov 2023 00:12:18 +0100
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
Subject: Re: [PATCH v4 22/24] i2c: designware: Use temporary variable for
 struct device
Message-ID: <20231129231218.izcslvhss7frcam6@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-23-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-23-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:42:04PM +0200, Andy Shevchenko wrote:
> Use temporary variable for struct device to make code neater.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

