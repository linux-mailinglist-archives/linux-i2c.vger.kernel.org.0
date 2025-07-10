Return-Path: <linux-i2c+bounces-11905-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E57B9B00D58
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 22:42:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4FB0E7A7BDD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Jul 2025 20:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2D928B7EE;
	Thu, 10 Jul 2025 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ckmPXk/D"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B208F5B;
	Thu, 10 Jul 2025 20:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752180152; cv=none; b=Y62Bav+ziyvAIhZGy7gRToJ2mGWIsyiZZbuRrdWZIoj51JDgKcwP+SPZ4Gr99XHF1gU6+v3szCHcAlw35+8igw9zeNVAHJVy1idaQSvbH1bfBzHYqgrxlXnAMx7ggMDruto+ynG7hmQVyRK71Tpu9c0Ev+7S5GfAaOJ1KPHvM+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752180152; c=relaxed/simple;
	bh=BpIBt7eblRXITiqTHVrVf1FbQ5odVkzWjqspIqG0ueA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmNDu3WKC9JMCOjXPkWgtrIn5VNqYg4JsOGjiVfKBKRk5SJeuCE6MkOo5NvisOFrKNsT66Afz+AQpOVK25ra9lZqLkR/+oPO+n2I6vVjoQtxxnugGyZ5eGsav70Vxj/JduU3fnxnpZlzQY0xAHcb/TWbKADNAdaA2Ah9oslZQKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ckmPXk/D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1EC4CEE3;
	Thu, 10 Jul 2025 20:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752180151;
	bh=BpIBt7eblRXITiqTHVrVf1FbQ5odVkzWjqspIqG0ueA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckmPXk/DBZJ+DmlX/iLC83i64AisYBuNzUN5NyBK6Torw2sewABKTz9+EasOwkJf1
	 wCrCX8uuyd2EC+2CHW4Nycitegtj7ffSe3JVjfsBnHTccoPgKSmjXCrW1OyDWI6iPy
	 23uTX7yB2uitsfKsgpVn65ZD/lzuyn1sWptqIL6IPtirLkU+iAexRGzHWaVFSZUrav
	 mH4YAp5WN29YGdTDag1qpl9b6mHJmOaPnG4oVO8dPn7YyVLrexSwxhIo0p9rRysQrL
	 BtTaDintTWpA9s1ejOt8/CDqkfLUQuyMo7Qy1aFJY+UNjcAbrNmSSPpw5V1FBJ8IWc
	 8cg3QkSxuJGmQ==
Date: Thu, 10 Jul 2025 22:42:26 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: wsa+renesas@sang-engineering.com, Jonathan.Cameron@huawei.com, 
	Patrice Chotard <patrice.chotard@foss.st.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: busses: Use min() to improve code
Message-ID: <tinhpctintv5okjfdzljg4q6tnfmmcsohywy4oqxxaqzmti3r7@3otlpzbypemz>
References: <20250709042347.550993-1-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250709042347.550993-1-rongqianfeng@vivo.com>

Hi Qianfeng,

On Wed, Jul 09, 2025 at 12:23:46PM +0800, Qianfeng Rong wrote:
> Use min() to reduce the code and improve its readability.
> 
> The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
> was changed from int to u32, because the max parameter passed
> in is always greater than 0.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
> Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

The 'Suggested-by' tag implies that the patch was suggested by
Jonathan, which is not the case here. Jonathan reviewed the patch
and proposed improvements, but the patch itself comes from you.

For this reason, I will remove the 'Suggested-by' tag. If
Jonathan wants to add his Acked-by or Reviewed-by, I will gladly
include it.

Thanks, Jonathan, for the helpful reviews, and thanks to Qianfeng
for promptly following up on the feedback.

Merged to i2c/i2c-host.

Thanks,
Andi

