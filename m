Return-Path: <linux-i2c+bounces-486-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD917FAEBC
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Nov 2023 00:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5209C1C20C35
	for <lists+linux-i2c@lfdr.de>; Mon, 27 Nov 2023 23:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27D0249F7D;
	Mon, 27 Nov 2023 23:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N4vZOSFa"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C7D3C49E
	for <linux-i2c@vger.kernel.org>; Mon, 27 Nov 2023 23:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60D73C433C7;
	Mon, 27 Nov 2023 23:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701129366;
	bh=vzsJLkVjF5DQbuwiIC2KYyTCOYV47GwObWIW6Ubwtyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N4vZOSFak2jLtlL+AfPmEAKEk+b+eQ4cGMifBo9VHf3HEiUHLEAfAXndQ7NWcEOH2
	 rbww4owp9RZybgGBYBdAzc3oQlGnleOcEWBzo2+78TA1YY5Mv6Jfbhpf58EvicyXgf
	 orAnRFV/Dk26rSGNAajLVj7nrTKscnlw4dhDFeiJj5X4uAZ8aKgmqThNm26c9DTxmJ
	 aH3qaiZ1B276YSg2wF11T0v5UpWzPxvGnmVuisndUpwX137dgWjj7pT9xwKjpB+18N
	 yPxyErj1lzZbZdzLB28aQSpjt6K97liCiPi05U6+v/B9atj0c7fZSH3dWCLZ2fA9iN
	 5jdRFSBff797A==
Date: Tue, 28 Nov 2023 00:56:02 +0100
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
Subject: Re: [PATCH v4 09/24] i2c: designware: Unify terminator in device ID
 tables
Message-ID: <20231127235602.kt6yzpn36srgkqnu@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-10-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-10-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:51PM +0200, Andy Shevchenko wrote:
> Make the terminator entry look the same in all device ID tables.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

