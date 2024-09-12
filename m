Return-Path: <linux-i2c+bounces-6605-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A530E97615B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 08:19:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548D41F2454B
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 06:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1638618952C;
	Thu, 12 Sep 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Djeotmfi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B0F1878;
	Thu, 12 Sep 2024 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726121972; cv=none; b=igZ9Wt0a39Wp9gNqLbHgta1h2D7J47ZykMHNxlaLxOJvck1xbMuenc184uAZ4Fv0mqL+ms7n0wSimDw1vc0NAgb0zwz54f0ogiNQLVUE23PBCyYRwU15HCXdiZYj+fNXzZxo0WCUgyTNi1RaszVt2fsM398c0KHMzB13eiVhxak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726121972; c=relaxed/simple;
	bh=jMxnTDCVFJ7N6GMUoCTIlzYXhXyiHznJYAfTwzYxni8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktGV9STBS2FRrSrWBApZuoA4uXT27jz7TW3mKMI4Re2xv0Mk1R/vWJFznay91kCUNexuJSjK+KutTGDsfvVcw8QHT1My9v9XWn3SJFdhKL3BqhYScNl4K6F3JwKmM0btkC6dWF9JwrYlp0NHg6rN1pDtnWzlcwhyFocfy6JZepE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Djeotmfi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DBBC4CEC3;
	Thu, 12 Sep 2024 06:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726121972;
	bh=jMxnTDCVFJ7N6GMUoCTIlzYXhXyiHznJYAfTwzYxni8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DjeotmfiMXVzgoR+s/PJ+UFBX1r2gpczUnIY5GfqPa5s8pTx0Z6ga5logrzblf1WD
	 +PFM4+Az2F6WcwUo0QYFeujdUgZkBbAaOlytN9vK0py+fspi7/XyeQnD/NjVm0c+0b
	 UNb5AuDebSrTno5omR5hTmRYFwVcd/dKObn5zeUfrS0IMme5pPqmb6ebFzs7YFIAAc
	 Wml2DvOTOf8WlKbuq11t60Xq3s/fAYVpillKAwYes5brTWqe3xJvJqBg+JDLDOnD7h
	 e6np9J7Lbp0DpZwLDSnET8mbCU2ZfsEZMlpSqFrvOC89XJHjxQUQNPFQI2t61XOExl
	 XyUUAVfYgFBLQ==
Date: Thu, 12 Sep 2024 08:19:28 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: swboyd@chromium.org, wsa@kernel.org, sdharia@codeaurora.org, 
	girishm@codeaurora.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
Message-ID: <g4g6w56k6hljjs7m73bntdqgm23nnpt3dkrytnoyxquqa5fa4o@xnxwctua3vti>
References: <20240912033459.3013904-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912033459.3013904-1-ruanjinjie@huawei.com>

Hi Jinjie,

On Thu, Sep 12, 2024 at 11:34:59AM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 37692de5d523 ("i2c: i2c-qcom-geni: Add bus driver for the Qualcomm GENI I2C controller")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

