Return-Path: <linux-i2c+bounces-465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AAAC7F95A7
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 23:03:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1AD1C2082B
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFC9713AF6;
	Sun, 26 Nov 2023 22:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JctvLzOu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7428DA4F
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 22:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92AC0C433C7;
	Sun, 26 Nov 2023 22:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701036233;
	bh=NWeGXlDvgFIUVAoJZ5GS+vF5TfO+nSCEgC3q8n3U/Sc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JctvLzOuE4eA2KY39vrsNyADJ16JfNAwzxTUxg0n7U0Yiw8sF6DSPC17UTdQa8P/7
	 HV5ay1rjwkKTX7geADtkdj+W8nV5xmSNVRkMOH9HGWewh00rKVEvNFMPh0Az+sFsaP
	 5jGr+weEztJLM9O1xKMFzw5ZcCpEnnFMy7RK72lmVTScP7yfdzo2dz81DoLd/YMJHi
	 QRU9Iqgw5HL01vKHYiz4t5/TOg2dY6Qh/8eXfW+NOvQhdqajYsOJT9d3ARnuBd5XwJ
	 Sk8qgasu5QToPJRRHxMnl6SQm2xaui+cmEQRkknwOd11c5lLfJHQked5VeizjM8wkk
	 0uN6guONsXQoA==
Date: Sun, 26 Nov 2023 23:03:49 +0100
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
Subject: Re: [PATCH v4 03/24] i2c: designware: Let PCI core to take care
 about interrupt vectors
Message-ID: <20231126220349.on6qy66ixzu2jmus@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-4-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-4-andriy.shevchenko@linux.intel.com>

On Mon, Nov 20, 2023 at 04:41:45PM +0200, Andy Shevchenko wrote:
> PCI core, after pcim_enable_device(), takes care about the allocated
> IRQ vectors, no need to do it explicitly and break the cleaning up
> order.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

