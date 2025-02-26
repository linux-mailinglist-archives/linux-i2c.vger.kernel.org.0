Return-Path: <linux-i2c+bounces-9599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E3EA46E71
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 23:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B03B188B603
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 22:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF4825CC87;
	Wed, 26 Feb 2025 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3cGzaSm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB625CC80;
	Wed, 26 Feb 2025 22:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608815; cv=none; b=GYIrOFMHMGqAU2UxrgfBbTM1pRZL+hy8/+6TvtiXu3kXdc1tFZ7T7WbT7u5/HHu+wjaW4A9nZmNrLkhzrQWXMN3KNYoqlH69dqWFMTnS+6caWLEe2ddyE2lyrb4VYgruZGfNB8Odf0G3cpSY56B8jFAx69B5ahGnd/jJNx0fW/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608815; c=relaxed/simple;
	bh=S5TieZVBNIX4Pm01SOcANxsHKiEhgQMhpaQC/of4bQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rpPd7WG27zsn09tlDquMynfc9ipkxbkov8iSvOhHa9emfNVsIdCvhf19HEpHLM9emDmYFeMQ76FagNkwnaVjUJXANrU2cqOQ/YzFv/A7m+zEYoiAYctuO76TKvvsf8VyqRRRfBXD4yt3HguLqtICLoZ/00eqK5laHCJ2aHeM4KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3cGzaSm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6575AC4CEE7;
	Wed, 26 Feb 2025 22:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608815;
	bh=S5TieZVBNIX4Pm01SOcANxsHKiEhgQMhpaQC/of4bQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3cGzaSmqZDe6gag31VlyicAPh8XBMuagX3JSEh8lZ6JwK9I4Wq8VR6t2KgLRCMU6
	 oOeJeDmkIoEaqqv3I/OWwZoa9ftGoZFHqeBV+lHwqK9Wjkt+DI5pX6I6HnGQK3lfds
	 GKxlMPYpYJ0GMRxW65cxkC36znzkT+UEJ0VijN5NyoWPGaez56ZoA3Z66GKZx2g3TG
	 1hWApsiR3btZHhQrWRwk7hQdAb+HXfkZ0dw0XfO6zGFkzmSlYPUirliFeWndcME4Gl
	 uOZJLXbScbSZiwEUAm2ENun1XSAhipbFH4t8YXdZhtQB7M2jCR0O9lhfQRY4IoQv95
	 fu8FCQ4IZaJNw==
Date: Wed, 26 Feb 2025 23:26:51 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, 
	Huacai Chen <chenhuacai@loongson.cn>, Wolfram Sang <wsa@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-i2c@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, stable@vger.kernel.org, 
	Hongliang Wang <wanghongliang@loongson.cn>
Subject: Re: [PATCH v3] i2c: ls2x: Fix frequency division register access
Message-ID: <pqcakeyxoktpsix6gnp7nhy4ykk7nyq2ay7o67nvdlaa7fxsyl@ezcisdrxiaw3>
References: <20250220125612.1910990-1-zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220125612.1910990-1-zhoubinbin@loongson.cn>

Hi Binbin,

On Thu, Feb 20, 2025 at 08:56:12PM +0800, Binbin Zhou wrote:
> According to the chip manual, the I2C register access type of
> Loongson-2K2000/LS7A is "B", so we can only access registers in byte
> form (readb()/writeb()).
> 
> Although Loongson-2K0500/Loongson-2K1000 do not have similar
> constraints, register accesses in byte form also behave correctly.
> 
> Also, in hardware, the frequency division registers are defined as two
> separate registers (high 8-bit and low 8-bit), so we just access them
> directly as bytes.
> 
> Cc: stable@vger.kernel.org
> Fixes: 015e61f0bffd ("i2c: ls2x: Add driver for Loongson-2K/LS7A I2C controller")
> Co-developed-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Hongliang Wang <wanghongliang@loongson.cn>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Andy Shevchenko <andy@kernel.org>

merged to i2c/i2c-host-fixes.

Thanks Andy for the review!

Andi

