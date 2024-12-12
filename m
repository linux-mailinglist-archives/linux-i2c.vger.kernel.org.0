Return-Path: <linux-i2c+bounces-8465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC3E9EE666
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 13:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D2E1883D16
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Dec 2024 12:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3B5211709;
	Thu, 12 Dec 2024 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZRDZ6IX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2A1E9B27;
	Thu, 12 Dec 2024 12:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005563; cv=none; b=bYJILeRvQr44/q/G6SalqNu0Md1MLS49bB0+BY3kS1jMqIBjihzhHqgnqUN6TC0fIqCOythYXXY2EBsLY7yrtX77B3tVQ8KUa7kox5zbcj8BOQJ7QKFLBP0+wUM2vOZqKGMvU0zYtzOya3L8lIdT/prEcqg7sXMbYg07Cf2C3gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005563; c=relaxed/simple;
	bh=+XrIez4xocMGbkR6OBBEEUJb2yDAgLlSckB/4e+OAsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YQbepneCSlM1fprLZbRRrd2FTcdO827WSJt5tEPM+Ge/qf+yCNbjf90vp/r+4z+YlMeStFOhfpGLzzvvzlYowuae3pBZdCEx1sDRr9lwR6H9ITS5kmO3Ix85jEFs4LO8vS1ecOQPjwMAzoNcms8aiO6H8Em6TdffqoCtkIe49QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZRDZ6IX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E268C4CECE;
	Thu, 12 Dec 2024 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734005562;
	bh=+XrIez4xocMGbkR6OBBEEUJb2yDAgLlSckB/4e+OAsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tZRDZ6IX+vjLI18v2MB96dEha09ed9JEGGrjLB+JQwNQa16MI3woIcLG9jW5ssmWq
	 HrdSxmo5pR57A6yq8KYBKA2MHGjJe6m6XfiqxvtUYUiUWEf3KGQl+6BdaOXJMCe9ac
	 N0uMU7Mb61frJCgjr7Gd5mweVWTETA6/9e11E5KhWi90UDpPV3cM5ZX/hKkinvuOke
	 CJEjjvg81KK5+i5ymmNxYTIPMIw7nxqZx4cfX498VSjczbU/GMbY4zr+BpGVbxW57d
	 IV4GvvYp36RpSQKbAw1HF2U315GQI86YFcUzPEfKyBirKo6hfd9ZLCngPEd0FYkU/J
	 UPuG4Qn7qP8Ig==
Date: Thu, 12 Dec 2024 13:12:37 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, frank.li@nxp.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: imx: make controller available until system
 suspend_noirq() and from resume_noirq()
Message-ID: <awvsvzf5ucgcvl6v7giuxeb6dvt3sw5e6kxo7t56n4rk6u3527@2hid4a7acavv>
References: <20241125142108.1613016-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142108.1613016-1-carlos.song@nxp.com>

Hi Carlos,

On Mon, Nov 25, 2024 at 10:21:08PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Put runtime pm to resume state between suspend() and suspend_noirq(),
> resume_noirq() and resume(), because some I2C devices need controller
> on to do communication during this period.
> 
> The controller can't be wakeup once runtime pm is disabled and in
> runtime autosuspended state.
> 
> The problem can be easily reproduced on the I.MX8MQ platform:
> PMIC needs to be used to enable regular when the system resumes.
> When PMIC uses I2C controller, I2C runtime pm has not been enabled,
> so in i2c xfer(), pm_runtime_resume_and_get() will return error,
> which causes data transfer failed. Therefore, regulars can not
> be enabled and hang system resumes.
> Here is resume error log:
> [   53.888902] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 529, parent: platform
> [   53.897203] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.902713] imx-pgc imx-pgc-domain.5: failed to enable regulator: -EACCES
> [   53.909518] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 12331 usecs
> [   53.917545] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 529, parent: soc@0
> [   53.925659] i2c_imx_xfer, pm_runtime_resume_and_get is -13
> [   53.931157] imx-pgc imx-pgc-domain.6: failed to enable regulator: -EACCES
> 
> I.MX8MQ system resume normally after applying the fix. Here is resume log:
> [   71.068807] galcore 38000000.gpu3d: PM: calling genpd_resume_noirq @ 530, parent: platform
> [   71.077103] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.083578] galcore 38000000.gpu3d: PM: genpd_resume_noirq returned 0 after 6490 usecs
> [   71.091526] mxc_hantro 38300000.vpu: PM: calling genpd_resume_noirq @ 530, parent: soc@0
> [   71.099638] i2c_imx_xfer, pm_runtime_resume_and_get is 0
> [   71.106091] mxc_hantro 38300000.vpu: PM: genpd_resume_noirq returned 0 after 6458 usecs
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi

