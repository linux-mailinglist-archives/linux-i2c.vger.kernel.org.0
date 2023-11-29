Return-Path: <linux-i2c+bounces-553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4327FE412
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Nov 2023 00:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70A971C20BA6
	for <lists+linux-i2c@lfdr.de>; Wed, 29 Nov 2023 23:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 827D43B1B2;
	Wed, 29 Nov 2023 23:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jy1w8B14"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32210339BD
	for <linux-i2c@vger.kernel.org>; Wed, 29 Nov 2023 23:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2C4C433C8;
	Wed, 29 Nov 2023 23:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701299458;
	bh=3DUY32anruoKX0hBLF8yOSnm4ahLIBTQIQv35W8gZa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jy1w8B14QuOTO1AMypKe8etpTizWLEb/pRWR0wuvxyEKA7/lHqA6ICHAyPgRHHVlF
	 OAPA2Cmnm2NALY3D48utcazWNPDfa8Me6OJpRd5XtdFs+/zvQEqxXh15xkWdB5GGZL
	 R1j+yBP5qYfP4yyxpZsZHsVYBQVuluqU1e0TuHgpaF3/vbEnPJ1tiDNGG1lb+xdE03
	 BfjOc7pfIH1hOOAgTuYMr8GHc2fFZQGjHZj746MlRYqWXnJHKkVsvlRg3LBDDRuDGE
	 3Nzl7kBuA6iYTqGmtDAdm2faHa0FvtmtA1l0PgPoL8qU8y+Tcf4bFCjrwEdo1WXPot
	 0H62JLZEM7Piw==
Date: Thu, 30 Nov 2023 00:10:53 +0100
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
Subject: Re: [PATCH v4 21/24] i2c: designware: Use pci_get_drvdata()
Message-ID: <20231129231053.mlas3vd7wxhkd6wy@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-22-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-22-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:42:03PM +0200, Andy Shevchenko wrote:
> Use the wrapper function for getting the driver data using pci_dev
> instead of using dev_get_drvdata() with &pdev->dev, so we can directly
> pass a struct pci_dev. This is a purely cosmetic change.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

