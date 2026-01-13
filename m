Return-Path: <linux-i2c+bounces-15109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C2DD196C1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 15:25:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6F01D300753E
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 14:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2E4285CA2;
	Tue, 13 Jan 2026 14:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvqDhf7S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11ED2857CF;
	Tue, 13 Jan 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314195; cv=none; b=VWSOm2Kg3hlef3WVdpIuFV1pX7YOvwjqhLJMhyE8R9BWticoP7TvF7+Dh4TaWVKRj63O366SSQIhNHhlsL538DiP+4VLkbPyyls+whZyC3kUscBhP/yCZYC5UI9CQN5wCcAjGiFbFc7GVtmk40Ftr5Iyz2B87piJV3JfMLyNFkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314195; c=relaxed/simple;
	bh=3hwWDMSYImxtTFTuhPzBiBnGPdsb2QRZw+DjmSuu434=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aXZhe6oRgyTKkoxXi0LqrXJV/RjuG4BXZedZg1q9GSAvu5YVmeJGxaNZCSCZN5xJDJ818KTshfqba0p13P4eoJWbqnJowIfCCnbDGm/+IeZBWatvjvvuhdwG15EyXv60Hz39pXDf5ZK0pXAsVbmpDBNXfJquD7IfmEvAY+l/TWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvqDhf7S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A1FC116C6;
	Tue, 13 Jan 2026 14:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768314195;
	bh=3hwWDMSYImxtTFTuhPzBiBnGPdsb2QRZw+DjmSuu434=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvqDhf7SpZVQXiVf7n7S78DpkRF/WBp4KpW7zS8/JIHN25h8U1oBUVvAcTKsLUC6J
	 NaU4yO4i0un0UJUnF7mdkD2jKEhm7Gh3U9ggHJLOY7TbmNi4ZMw+CCNKk5f0eLMAjV
	 lRXb6VJUfTxlXSTMkhCGCHTAvLbchj24T/9C3nrYDm7j7sxjszczh7fVPusf1qPtt3
	 rNHdwbuh+7Rl8Qsw2z41Rpzxim8mxzXuw3CeeCQGWZ9qXBrSSaZpFGzsD3PO0rRXrZ
	 ctlyq9Jyzzq2X4FOdfoTABgkmZSjUl5gO8jXiovg7IFkU4V+rsfy4AJ7cJXfM4HCTe
	 Qw48AdtHTx5CQ==
Date: Tue, 13 Jan 2026 15:23:11 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi@smida.it>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Qianfeng Rong <rongqianfeng@vivo.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
	Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v1 1/7] units: Add HZ_PER_GHZ
Message-ID: <aWZVN6bLbqZMu_mY@zenone.zhora.eu>
References: <20260112134900.4142954-1-andriy.shevchenko@linux.intel.com>
 <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112134900.4142954-2-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Jan 12, 2026 at 02:46:09PM +0100, Andy Shevchenko wrote:
> The is going to be a new user of the HZ_PER_GHZ definition besides
> possibly existing ones. Add that one to the header.
> 
> While at it, split Hz and kHz groups of the multipliers for better
> maintenance and readability.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I'm taking this via i2c if no one is against.

Andi

