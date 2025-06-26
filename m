Return-Path: <linux-i2c+bounces-11627-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F3FAEA87A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 22:55:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA32D1C44078
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Jun 2025 20:55:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D500D238145;
	Thu, 26 Jun 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBjC28nN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA0202996;
	Thu, 26 Jun 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971323; cv=none; b=hEXr7WUjnvUcqt4dhRaOiUdT58fMhSuRePQjaJ/ETiLGy29Gq8O9cHwFLPDMQLbCTqLuWOf78X08DnxcAOn/v39JU017KADwcABC8VeeGzifgBOovbRuxmv1aCSxs1Ndmc668tehOptNt6Yyr4/AzxtNuYt6neijmq0ij9sufP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971323; c=relaxed/simple;
	bh=hLlzonJAvNms9VG34BSVk9UF0cfYYAcLzKIDWMr15GY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxbOWJbx4wxwNrQ3MxurccvM0XS+3Kl4avD4l9quLIlWC04QVuBpo5gPH7PkW74wwW5XfFKLR5O9/6fXZo/NDLBmsWr5LjdFJNHPu2/sowv2po3cGcwMdFkt12X64XsYHyzf9C1F0DtOJsbCV/+Y3twzQqb97xo7OzOYRyeq2xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBjC28nN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2BDC4CEEB;
	Thu, 26 Jun 2025 20:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971323;
	bh=hLlzonJAvNms9VG34BSVk9UF0cfYYAcLzKIDWMr15GY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBjC28nNB+FQqzQqdq3y1XK41BqrcL25ES1u4oYjPVI7GTgB9BhF3Lq7KWZLOwt4g
	 TqCtGs3icQjmKKYk5VxgNmY1X+W34f4Jx4x96dB2ZDdP2dlMkRyLH6jfy0ZSdzTQh2
	 pjZGkdA5yul1P5FHh2b21af1hqz5fZRb21TaMnq8+g3cmsR9ehUpoJZS4V8k2rl5gO
	 IJ2JQEvx2gOni2azjZVh+zrdSpxC3yNGiI79jCtlpD4aEhL7QX1ItVkcXOSH1GIpFD
	 HxjYYOXV67WTcpQtf5+h9s/JPGDUOQwc/56IAhn0KKcr5YY3eca40aIOS01WLkhlsS
	 rX8eBRwoyqqzw==
Date: Thu, 26 Jun 2025 22:55:17 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: long.yunjian@zte.com.cn
Cc: pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, 
	ouyang.maochun@zte.com.cn, fang.yumeng@zte.com.cn
Subject: Re: PATCH] i2c: stm32f7: Use str_on_off() helper
Message-ID: <tfj32n5ex5ss4lj52oglc6rnj5bvwxhgabcc5xe4w2nreehgsv@j2dh3bcsov5q>
References: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623203144007kQF7E1Bhy5PJl-Ph3u3Ou@zte.com.cn>

Hi Yumeng,

On Mon, Jun 23, 2025 at 08:31:44PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 
> Remove hard-coded strings by using the str_on_off() helper.
> 
> Signed-off-by: Yumeng Fang <fang.yumeng@zte.com.cn>

merged to i2c/i2c-host.

Thanks,
Andi

