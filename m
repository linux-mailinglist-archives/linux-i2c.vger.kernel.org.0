Return-Path: <linux-i2c+bounces-6036-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868496A0A3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 16:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EC50B2139A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2894E146D78;
	Tue,  3 Sep 2024 14:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/uubxF5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A371420DD;
	Tue,  3 Sep 2024 14:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725373804; cv=none; b=h6jmhXksyJlQaB58x/DkW9E6WuM4AomM2d6orN6SPUzsVHz30XWVmLhRoD8Pq6rlS+6hhvYVFbM8jxjhrPZuJYCj9gY9dW7IKLCF9surLSlLXQ88b1zrbt2Zhv1NcSHjfxRolT04SeebWoPPZt2LWLcsJvfFBSxeZ8r4YIPcv1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725373804; c=relaxed/simple;
	bh=sjKoXk1z/rlVpknvexNcdZienzI2tB0ICyNAVxm1paI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCRraGjr2YsDI6ykE8zytb47mjMYZYpnx8uX3YoyG0V0+oLjCnqtsZexr0AZlBduMI2EkxEwIb9pH33Te851Mv3MMYtuP0snpxpUOTMFYLpl1mp6MxA8pd/n7QMoGbAaingz6ehFtATVRF5NGsybleSzxOBqCrYD1VoXOkRAuyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/uubxF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10C4C4CEC7;
	Tue,  3 Sep 2024 14:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725373804;
	bh=sjKoXk1z/rlVpknvexNcdZienzI2tB0ICyNAVxm1paI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d/uubxF5/g0Nm9YFqMtmnEPNf0YHjjrq4S8pt/NCGO+z1GQqlWIZfn/bEBCM/DRFs
	 lYKXlThzsRBcAqFFcK8pWiYwY+6ynOd94/5XfVlGyUjchm9+/4MWFRI1wxj0Rbc6gO
	 10MHlhJPYlICf+dUmNCuDrNysHBhrZlXsvTr85jsKvmgHRinTNoHuUVsofmKEKjOwm
	 Ovam5hlZv9bCQDkRy1D6MW8JPAgA3r6r4hE6z+s/pBMcDyF0+WkjmTK/SaTq/SaVMK
	 lb+OdwC+QyKM0FIYlbCWpAKOmpdxlhosw+RQqnRPvlGimsrGCnGYWMsDrtym7HnPEI
	 /MEp+97kU0XGw==
Date: Tue, 3 Sep 2024 16:30:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, Narasimhan.V@amd.com, Borislav Petkov <bp@alien8.de>, 
	Kim Phillips <kim.phillips@amd.com>
Subject: Re: [PATCH v2 1/1] i2c: designware: Consolidate PM ops
Message-ID: <g74jbzdorj4vdhqxaztbl6rsjrybhlhx6swybrtms6jeaufzhq@ac77f3xcip2u>
References: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827150101.2171107-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

On Tue, Aug 27, 2024 at 06:00:37PM GMT, Andy Shevchenko wrote:
> We have the same (*) PM ops in the PCI and plaform drivers.

/plaform/platform/

with this change I pushed it to i2c/i2c-host.

Thanks,
Andi

