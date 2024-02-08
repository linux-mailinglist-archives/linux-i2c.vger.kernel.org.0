Return-Path: <linux-i2c+bounces-1666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE71484E64E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 18:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD6F1F29413
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Feb 2024 17:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46A484FDC;
	Thu,  8 Feb 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpWdknL5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859B584FD6
	for <linux-i2c@vger.kernel.org>; Thu,  8 Feb 2024 17:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707411951; cv=none; b=DWDQpk4U0k0nwEsSj57wLdMQppC58y0QVa80dKYNza25TTVuFQkcYys1w+ha27PJBbDAkv3ptcMbGb4XDlqjBmuVc0g7hUSru3H+4bzhhnQkqg2eVF+hnxaXHIoXWGD29M8KtQcIw/S73qndlMpCwGQTBFqrqbcq8oSbFaTb7Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707411951; c=relaxed/simple;
	bh=f5W20BmgvycRPh+5fxKIXKyA6Yg876sQ3P5Tt99x1YE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLtKI0BrP0Iaocv/BHpnQ4qIXnRfHl1FZm6UIbPUs3d+fAV/IW7FzngckBJNlTy13Z/1QpKg5x0YrwR3kt7rLpdzUeM+y+LkYPURT9ffpXrkNTilU8SruYISpLn9MmbAbdP3WN4+6IWAyXZLs7xnRiYnKyWtMbLjnVwWvjuhZi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpWdknL5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76379C433C7;
	Thu,  8 Feb 2024 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707411951;
	bh=f5W20BmgvycRPh+5fxKIXKyA6Yg876sQ3P5Tt99x1YE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpWdknL5NHDhYsAG5+MDvobKhfhG+HTNs1KmLAdpOV76OOrJXD74/tR7UOiwRc8Qb
	 KdtiHtm6+xTryrhRSMEHaI3y9N9eAdw++DdgXm461sAwtMro1JKJvk4TfQAiemc9v1
	 1YCdeBawCShlWkTKMQVs1mTPhPHIG1Sim3NYyMfuLcHnv8p3EEDo5c1UBvaSaStiba
	 YpVBSePRuRqtaP1QP1DpdWr45KNe7QP4QUu9P0ztg+a3ZEcTtDYZ9gFOuGFHGDfVYR
	 UEyYzIy+bO2UsgWcUaufyt0UtH5UKu3yxwLNr7cLcY0yVkM4+gRC0AJ4r7qMS49emC
	 J65MlvTOwAa3w==
Date: Thu, 8 Feb 2024 18:05:46 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 5/5] i2c: i801: Add helper i801_get_block_len
Message-ID: <zcrujkxnlnojcwuyyes543cgggwzuhkly5vcfsb4oxl73xy6cq@2pbcx4ashtmi>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
 <c7e808ba-b333-4c5c-be75-7b74e02aad95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7e808ba-b333-4c5c-be75-7b74e02aad95@gmail.com>

Hi Heiner,

On Fri, Feb 02, 2024 at 08:06:30AM +0100, Heiner Kallweit wrote:
> Avoid code duplication and factor out retrieving and checking the
> block length value to new helper i801_get_block_len().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

