Return-Path: <linux-i2c+bounces-14581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7056BCC3DB1
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 16:16:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8CBF3103E6B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 15:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49ED433DED0;
	Tue, 16 Dec 2025 15:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mYGx0Ccr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F135133D513;
	Tue, 16 Dec 2025 15:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765897318; cv=none; b=sv8LDScvllFJW1H9qYp/1pRazw0YgB91gPVDNwPEVhZSpSWnnChCDbXca40fonxkfeWkEIND6zIpfDMfYXpriJ09Wpg6RAFXtdM3ibORTrD4hwF8N65Y+L7zWolu45i5cmnx5GudIwv9BQWBG2PLlnkw7SzIwKsxCRtB0P5onuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765897318; c=relaxed/simple;
	bh=l6BsXuUQhKVvOvNQVNusVS5RLyr3LsVQL3METhXptkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErH+WdbKy+WNk2nYZQvITj4sEq9OM8mlm7/wHkdclvNkDmRDh2cGuS23OPdu61cY0Je0ZRWm02SOuhV/94/D2S0uFAZdvoUMGxCHGCA+Rrc8iQ3pCA9WjCAzLyqrb4WKh4RYICFkfRekTRAIjjjyXVbtLSDvys5I50Oin4VW5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mYGx0Ccr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2628EC4CEF1;
	Tue, 16 Dec 2025 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765897317;
	bh=l6BsXuUQhKVvOvNQVNusVS5RLyr3LsVQL3METhXptkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mYGx0CcroGx+8n06A1aiaZqq4+chW41i1tx54gQ6z3/T5zHt55tvXEFa2vuQEcXe2
	 Af3ucF7wj1DbxMHQ+f6pzwHYMEyZ7g3EVjkXuPBW2N2gzexqlklcONWJMzeRDYiZmh
	 N2i9sityb9jgDYljDPBPifwuuQFa285GMh2k//q42YRSsrm7b1mzNFreY8b/Wal3kt
	 aqLszFgTsVGqVLLQKMA/C5yoZBFELxhQRtMDKKvRYjZU6kLVUEFGTjlNdBA/rgU95d
	 XQcKiZOhlQuzOzy5V4YZ0CWCmBwH/VUUCkh/cdKYxhnhOETyR+sWL3hgHEH7AwsXKU
	 1uSkfhtJ/uVLg==
Date: Tue, 16 Dec 2025 20:31:54 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Frank Li <Frank.li@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	carlos.song@nxp.com
Subject: Re: [PATCH v2 1/2] dmaengine: Add cleanup FREE defines for
 dma_async_tx_descriptor
Message-ID: <aUF0Yu5Cexvm7JFe@vaman>
References: <20251003-dma_chan_free-v2-0-564946b6c563@nxp.com>
 <20251003-dma_chan_free-v2-1-564946b6c563@nxp.com>
 <2c457a46-2b7f-4d66-8555-3b3cb52afe64@intel.com>
 <aTDkODHZg0JfrZJC@lizhi-Precision-Tower-5810>
 <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77ff15d7-cdb9-46f7-9f05-97aff2dc8ee9@intel.com>

On 04-12-25, 08:07, Dave Jiang wrote:
> 
> 
> On 12/3/25 6:30 PM, Frank Li wrote:
> > On Wed, Dec 03, 2025 at 03:48:41PM -0700, Dave Jiang wrote:
> >>
> >>
> >> On 10/3/25 9:26 AM, Frank Li wrote:
> >>> Add cleanup FREE defines for dma_async_tx_descriptor to support automatic
> >>> cleanup and simplify error handling.
> >>>
> >>> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >>> ---
> >>> Check patch report exceed 100 chars, but it's still better put into one
> >>> line to keep consistent with other DEFINE_FREE and better readablity
> >>>
> >>> change in v2
> >>> - remove surpoiouse remove empty line
> >>> ---
> >>>  include/linux/dmaengine.h | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
> >>> index 99efe2b9b4ea9844ca6161208362ef18ef111d96..27fa1646a807c49c781e1bce9e3e7d9a3c66f41d 100644
> >>> --- a/include/linux/dmaengine.h
> >>> +++ b/include/linux/dmaengine.h
> >>> @@ -5,6 +5,7 @@
> >>>  #ifndef LINUX_DMAENGINE_H
> >>>  #define LINUX_DMAENGINE_H
> >>>
> >>> +#include <linux/cleanup.h>
> >>>  #include <linux/device.h>
> >>>  #include <linux/err.h>
> >>>  #include <linux/uio.h>
> >>> @@ -1612,6 +1613,8 @@ static inline int dmaengine_desc_free(struct dma_async_tx_descriptor *desc)
> >>>  	return desc->desc_free(desc);
> >>>  }
> >>>
> >>> +DEFINE_FREE(dma_async_tx_descriptor, struct dma_async_tx_descriptor *, if (_T) dmaengine_desc_free(_T))
> >>
> >> maybe free_dma_async_tx may be clearer as the name vs dma_async_tx_descriptor.
> > 
> > If that, 'dmaengine_desc_free' is better because avoid create new name for
> > it.
> 
> That works too.

Agree, it is better name

-- 
~Vinod

