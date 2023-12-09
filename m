Return-Path: <linux-i2c+bounces-698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D4880B14D
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 02:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4921F21243
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 01:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472677FB;
	Sat,  9 Dec 2023 01:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HK50ULOJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02828628
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 01:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 725A9C433C7;
	Sat,  9 Dec 2023 01:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702084375;
	bh=McEaU9YApVXXwgVd14zRJ/m9N5xIfeTdb+EvPe13yEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HK50ULOJN9nIj+wbn0+MpbHCuYEyBK5WLxjvE1XD02LNNQELZJvYZh1nA0sbPJizN
	 94nEP3qbSti5bC3oCd5hq1LVqpSSHIginUjpEalnGuP+efJ/1nK5b+DquqoRB4PvcN
	 olo2q62qajM0dBAxJgYD4yrmAscuex+YXxRto8a2sC7WcBIcVRssKJjxKCA2rFh3eZ
	 XLqg7DTBDbjmhv/5G9mpacl/0jaDujQhcjh/UkMi6b/mZ55T2KkIO+Bf71korZ9j6x
	 E/1/Rsbvflhe6eW5TW4MStwG8nvtft9fZ/zNK19qheFUvE22JATt5ZNuDBVCyK036n
	 ywD3zDvtN1HCA==
Date: Sat, 9 Dec 2023 02:12:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v5 07/24] i2c: designware: Add missing 'c' into PCI IDs
 variable name
Message-ID: <20231209011246.c7on5pc4x2373qez@zenone.zhora.eu>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <20231207141653.2785124-8-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207141653.2785124-8-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Thu, Dec 07, 2023 at 04:13:47PM +0200, Andy Shevchenko wrote:
> Add missing 'c' into i2c_designware_pci_ids variable name.
> 
> While at it, move the id_table member after the driver to
> be consistent with platform glue driver code.
> 
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Link: https://lore.kernel.org/r/20231120144641.1660574-8-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

