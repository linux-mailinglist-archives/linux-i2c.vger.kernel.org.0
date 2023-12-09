Return-Path: <linux-i2c+bounces-699-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBBE80B151
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 02:14:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C5F7281942
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Dec 2023 01:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8FA80A;
	Sat,  9 Dec 2023 01:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m10ex5B7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E67F8
	for <linux-i2c@vger.kernel.org>; Sat,  9 Dec 2023 01:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB189C433C7;
	Sat,  9 Dec 2023 01:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702084485;
	bh=yW/oNjayrBgmBQcnKaR/BHHHylnywMfGm38sEfYKmLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m10ex5B7xuxpfbrUpv9WoB9vpJEyd34DLVdb1+6i+oxZrtIHQZEp4rJj/ADeVjkWA
	 Evx5Z0HXbeHMAPOes8z3rRfUE2EM6zPoDc3HP408d7+g48J21i4Qrfsbn/D/5Akmf9
	 9QuLA2W/B9hO7s6TX49TMZ3D3Zgy0CFUa6dy84cOg7nPNME/XX1VQz+K1ZyOJP5ul/
	 t4nm//F4NHhuTQNbjRpOkHDvjG9QsLtf4ddo090XwyGvD2Gk5Nz6jqyUOzqO5bLp4J
	 Q7OqPWZntFPWHM1XARaCXH1cnMpe5e7EWYwiODBvTKAfCteHZagvzy/3wIWxKzU9X4
	 wvXhsKo87Ky/g==
Date: Sat, 9 Dec 2023 02:14:36 +0100
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
Subject: Re: [PATCH v5 24/24] i2c: designware: Fix spelling and other issues
 in the comments
Message-ID: <20231209011436.rwvaivgewhbthtzl@zenone.zhora.eu>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
 <20231207141653.2785124-25-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207141653.2785124-25-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Thu, Dec 07, 2023 at 04:14:04PM +0200, Andy Shevchenko wrote:
> Fix spelling and other issues, such as kernel-doc reported about,
> in the comments. While at it, fix some indentation issues as well.
> 
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
> Tested-by: Serge Semin <fancer.lancer@gmail.com>
> Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Link: https://lore.kernel.org/r/20231120144641.1660574-25-andriy.shevchenko@linux.intel.com
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi I think everything here has been reviewed.

Thanks,
Andi

