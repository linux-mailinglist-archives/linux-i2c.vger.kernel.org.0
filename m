Return-Path: <linux-i2c+bounces-464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E827F95A1
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 22:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01238B20A3B
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Nov 2023 21:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B6F12E7A;
	Sun, 26 Nov 2023 21:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wq9/AmsX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5ADA4F
	for <linux-i2c@vger.kernel.org>; Sun, 26 Nov 2023 21:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A2AC433C7;
	Sun, 26 Nov 2023 21:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701035883;
	bh=baUZoNh2JMvbytQ1QkvNeal4oXmaY+syquDQSd8t/Wc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wq9/AmsXFK+XG2Jaz4dCyjC4QXtD4a+IPfwgO/4qJHq0zCWkr3QSBjJdQefhl/Cso
	 hyRyQcHRux8UCjU42vFx38d7dWsHXu4pugYmlleTCGdkISx0b6iw/OykXS8l8gD4GN
	 bKdW3nGZIRSuiu0fQ1RCqUk3T+NE/Z7qAalf16a3ziVaLbouuPE8c81s5lFL51mZdJ
	 jLp8KA7SKvKbdrblVVQk76+iNl/HhKrSvLWtsSaBKn5XGhdoiZ1wg7vzXNDl8Zdba7
	 bI4ocLvGYlKwrO1BAy7DR6KnKX7ZcAum1lpkGF2ZDQDR0ry2jKw5uxZVMTrYYNKhpr
	 B3YeDMdNrqZOQ==
Date: Sun, 26 Nov 2023 22:57:59 +0100
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
Subject: Re: [PATCH v4 02/24] i2c: designware: Fix reset call order in
 dw_i2c_plat_probe()
Message-ID: <20231126215759.6huodkf3xanvfupd@zenone.zhora.eu>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
 <20231120144641.1660574-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120144641.1660574-3-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Mon, Nov 20, 2023 at 04:41:44PM +0200, Andy Shevchenko wrote:
> We should not mix managed calls with non-managed. This will break
> the calls order at the error path and ->remove() stages. Fix this
> by wrapping reset control to become managed one.
> 
> With that start checking the rerurn code from reset_control_deassert()
> as it may fail and calling assertion in that scenario is not always
> a good idea.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

