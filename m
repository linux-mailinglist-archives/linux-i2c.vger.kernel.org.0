Return-Path: <linux-i2c+bounces-2925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDF68A37B5
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 23:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD911C20B62
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Apr 2024 21:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402811509B6;
	Fri, 12 Apr 2024 21:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="gJkPvnYV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34A1509B8;
	Fri, 12 Apr 2024 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712956376; cv=none; b=ogd16pLOUuQyc5dcrUaEHFcxuijtdKGf77ynI/eFCbkUeHe7ldNsa+xOdBOBUEY4dObwbVQJHWEU3DNkYTdUYl1X0njaOKQnWZ+HVnVye/8k/n2l3fBJoosdQFJjjVk5QYtImdmyO+2TOB9QZE/P20HmaZL74dOROX6w1tRlQ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712956376; c=relaxed/simple;
	bh=EjX2jdQMVn1JND3qJNjAUXPOAkthZ0pv0rGGT5qdgYQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=TxiUklVJOsiHaHGWcTjEr5Rcn2ToebKsKbO5yOV3gAIe5TFmIK5tgPNYjLFghV1u0kNlVcp5iwe8SYPpMv+mmFbOma6MYcBa7F32Pl/22I76FQ+ir8ERbVyUEm/aA/evomC/PASkCZsKrevyIn2q39rb5rzWtFuSq3biqq3epiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=gJkPvnYV; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1712956364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+Eex/96Clk4YEe9dDCjud+Kr7GJR8Rpozk+rMxf9QX4=;
	b=gJkPvnYVlzJVUbumqPTbD5rM2Qx+xmj9iyFfp9rnQtwduvxqrnGP0VT/rn7hKtf1/VD4kH
	MrsjsQhnPG15tKJlqtE4lwPnEKHWDeYUpQIyBzNGgxiqyAfwXopy3SS28sqf3qdEb6zsdc
	V9KveXmSS6fCL3e50Y62+p1XvM+rv+hIthnHtqwdHtMcoENrMgZSiHXmIIwrO4WrvTFRGy
	4ItJhBKdefJvH5wP9Zj/D0Ngbik+ILf4m4PXv8R0MQCWqUP298ixzYyylV/LWVGvKVwfcH
	WdnPLSnUkYtFVz7JkPXdueYmCn9wMmET+ClBbGGHHNOSoK4tLJee695/XW+cDQ==
Date: Fri, 12 Apr 2024 23:12:44 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Andi Shyti
 <andi.shyti@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/18] i2c: rk3x: remove printout on handled timeouts
In-Reply-To: <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
References: <20240410112418.6400-20-wsa+renesas@sang-engineering.com>
 <20240410112418.6400-33-wsa+renesas@sang-engineering.com>
Message-ID: <4bcd397ec377a4932c34d62c85ef28ed@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Wolfram,

On 2024-04-10 13:24, Wolfram Sang wrote:
> I2C and SMBus timeouts are not something the user needs to be informed
> about on controller level. The client driver may know if that really is
> a problem and give more detailed information to the user. The 
> controller
> should just pass this information upwards. Remove the printout.

Maybe it would be good to turn it into a debug message, instead of
simply removing it?  Maybe not all client drivers handle it correctly,
in which case having an easy way for debugging would be beneficial.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-rk3x.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-rk3x.c 
> b/drivers/i2c/busses/i2c-rk3x.c
> index 086fdf262e7b..8c7367f289d3 100644
> --- a/drivers/i2c/busses/i2c-rk3x.c
> +++ b/drivers/i2c/busses/i2c-rk3x.c
> @@ -1106,9 +1106,6 @@ static int rk3x_i2c_xfer_common(struct 
> i2c_adapter *adap,
>  		spin_lock_irqsave(&i2c->lock, flags);
> 
>  		if (timeout == 0) {
> -			dev_err(i2c->dev, "timeout, ipd: 0x%02x, state: %d\n",
> -				i2c_readl(i2c, REG_IPD), i2c->state);
> -
>  			/* Force a STOP condition without interrupt */
>  			i2c_writel(i2c, 0, REG_IEN);
>  			val = i2c_readl(i2c, REG_CON) & REG_CON_TUNING_MASK;

