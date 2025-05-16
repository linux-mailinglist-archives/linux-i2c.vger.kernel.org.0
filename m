Return-Path: <linux-i2c+bounces-10997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 701D6AB980B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 10:46:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D4871BC3545
	for <lists+linux-i2c@lfdr.de>; Fri, 16 May 2025 08:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755B522A819;
	Fri, 16 May 2025 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qhCAu3q+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69917C220;
	Fri, 16 May 2025 08:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747385182; cv=none; b=sY00XtGCtTCAdZrm2HCPNjnKR0lWjCdQZHU+81llVaMjgRF14qgRgclwMA/9J0pgjykm+NPekCEoG4gKB8viiUosBO29NFKEGftdXC+Yq5gTqUCGdfpMSgnS7uDJkkBz37QAnRyUOVzp3Yap+e14nCOBRT6kuo46QelpolesVMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747385182; c=relaxed/simple;
	bh=n0V+NeN0Y4jE/9cZ3kKfpzNLXi6yBWfwIQNqzMtOb9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDaizhEhknG1enxJULwSsl2+XKMT0zkPVkhcZ+Dc+CVkqckFPi2ZgH1LDtotbYXUhdEmZ/ynSbGcAX9syKcht/I/AZeYbX44kj9Tg7jTs54edzcpI6Loy5nfQnGF1hm78TMuYHRH2yj1suzqOJYk0hZn78OiYmpUzYYuiAmase0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qhCAu3q+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006B4C4CEEB;
	Fri, 16 May 2025 08:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747385180;
	bh=n0V+NeN0Y4jE/9cZ3kKfpzNLXi6yBWfwIQNqzMtOb9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qhCAu3q+eqVaiY6Qx7J2z2L7sLFfJlLt7o7r7HrF+K9DphqsbA6UlRinjPgd4xJ3s
	 VSPReCaU22dy5VA5QtURFI6OqehD2p2vOvUakpXf+I8WrOW29AXO8vuNOVOqM3HTLW
	 EOH5pxYytNq/mOmi+1vRm+OTFFBDDWVFDzutcyPLLkY1X4gdOxgNyp4mbbj21og4Tu
	 Ai/8aTbKrZT5xLPa+hGHgsMfFzY/O1pJQUxFXGlrKzvb1bDiH5Y4Vjxfyr1XuXH4rM
	 mIh8NI4QG+8jiDYL9EhgX0Rm3vGvHstk0N3Xy6Z4nyN3hshOaw4n3pdH7OwFEhJPSQ
	 yoRS/qScLSovA==
Date: Fri, 16 May 2025 10:46:15 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, 
	Viken Dadhaniya <quic_vdadhani@quicinc.com>, Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: fix I2C frequency table to achieve
 accurate bus rates
Message-ID: <sdhflgjsnvn7l2pix7e5k5yijycy53tmpg4w7722icp6na5rcx@kec7ra7tc4xc>
References: <20250513-i2c-bus-freq-v1-1-9a333ad5757f@oss.qualcomm.com>
 <y4t3xshxsbrx6xqkxroai3vixjacskco5baaoip2apzjkehjxx@ah6wxu2gy24g>
 <21ae6a2d-c8dd-4064-a851-6a10649ddf90@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21ae6a2d-c8dd-4064-a851-6a10649ddf90@quicinc.com>

Hi Mukesh,

On Fri, May 16, 2025 at 12:23:46AM +0530, Mukesh Kumar Savaliya wrote:
> > >   /* source_clock = 32 MHz */
> > >   static const struct geni_i2c_clk_fld geni_i2c_clk_map_32mhz[] = {
> > > -	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 40 },
> > > -	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 11, 20 },
> > > -	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3,  6, 15 },
> > > +	{ I2C_MAX_STANDARD_MODE_FREQ, 8, 14, 18, 38 },
> > > +	{ I2C_MAX_FAST_MODE_FREQ, 4,  3, 9, 19 },
> > > +	{ I2C_MAX_FAST_MODE_PLUS_FREQ, 2, 3, 5, 15 },
> > 
> > argh!
> > 
> > Can someone from Qualcomm look at this fix? Mukesh, Viken?
> Yes, I am reviewing internally and verifying the same with latest Guidance
> and updates. Let me update on this once reviewed.

thanks a lot! It's very much appreciated!

Andi

