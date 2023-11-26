Return-Path: <linux-i2c+bounces-466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E157F95C5
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 23:23:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 641FB1C20831
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8951114A9C;
	Sun, 26 Nov 2023 22:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKP9/xaD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDF412E58
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 22:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FC3C433C7;
	Sun, 26 Nov 2023 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701037429;
	bh=pfTsofaa4QprR278/y3czVdAOGvgumfdtsYbR8l/K4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKP9/xaDc0JuMidlR6fhMtSVuPfGpU7ZVDTrtrBkQBAyte6w9mgVeoaltT+HEJzMH
	 lo0zBYUHiZGtcbWdm570JDHkx31KgxRNQtChwSV5WFnuqqcZgP+Pyi/tzc7C2ezZzo
	 DdWdW9Bj7Mrii+O+UX3svEpa0soPDrSVN4UzZIy07iLAhNrVHJIZG6sQxFgauy5CCx
	 anyd3GIaMpSmAIKmkxcup4+uehDaPZEU+oHjq4azAP5G8n8P1p5QdZy4n/ONi3UHQp
	 3Fmfm2DxKl71okkrw74vCRbVfwzHJ0M2R6GvpuafDBdWC5S3Gp/t4LAGcr+ZGqOKKC
	 Yw96ezWa+GfjQ==
Date: Sun, 26 Nov 2023 23:23:44 +0100
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
Subject: Re: [PATCH v4 04/24] i2c: designware: Fix lock probe call order in
 dw_i2c_plat_probe()
Message-ID: <20231126222344.xaci244buhwbn2v7@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-5-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:46PM +0200, Andy Shevchenko wrote:
> We should not mix managed calls with non-managed. This will break
> the calls order at the error path and ->remove() stages. Fix this
> by wrapping lock probe to become managed one.
> 
> Fixes: 78d5e9e299e3 ("i2c: designware: Add AMD PSP I2C bus support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

