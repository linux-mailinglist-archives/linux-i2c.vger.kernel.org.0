Return-Path: <linux-i2c+bounces-6400-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AFF971911
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E736B21AC7
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 12:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A241B3B19;
	Mon,  9 Sep 2024 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rR3cZOrf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3A1B12EA;
	Mon,  9 Sep 2024 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884143; cv=none; b=A8YvSqeXrIWz5lqI6w0xWw8i1eHIojeAdY/ye0hbPP2JMX1xm1Zigp8+BLGjPfn6z0twJ5jNetifKSKFPFQ0+O/Gvwy4oVY2D5xdcpsQfMkXRVMRA7r5GfNEiB9s9y4hTRJHQ21krMWEuo5A5aqqfQOecrh4uVWGvceTjPPqA1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884143; c=relaxed/simple;
	bh=jfjwC544K9+38QlPz5Fz7wUWjUqbHym4ZQ7aRqAqaeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ezhctgwUjyeLtmckCGkEMTJf9J76007CcajWOExAPM/GvEdIlUBIcL2mqrpSQof6AxeB8dCfpO3YxIuN+4X7Zmy6/ScFPeIXM+w7/Og4wftVQMp1+YH5Mpac0uNeaKLq+TfOxA+wKCJ95Cg12SKkH5/MDRg9TzcfSXwhQnWFMFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rR3cZOrf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D318C4CEC5;
	Mon,  9 Sep 2024 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725884143;
	bh=jfjwC544K9+38QlPz5Fz7wUWjUqbHym4ZQ7aRqAqaeI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rR3cZOrfQbeDe8cLA5X42UOWQWqixyujNKYSg7tsR/UfM+8dxiG8W1ekrys1693K/
	 ooqMmLyL0hdslR9HjFDfV4+FVWER/pqWOEzsc8xLtyiMTIFKHxPXoVLt1TYDjkfQBx
	 k91shGy9yvkQ5N3DkQWCg13yZE8Y+Ltl4r087ydrtmpV4S/v82GIfuGHtPymH2OJhT
	 BgIpx/RGCXNKHchVw0VXEH+a2GCJ0irXzHlhyKgyHRzva3KbkCxPf3hHrFLuyEquuB
	 FwoZX/fv9L1loxsghi+or10pe5HMgcaI+DI9rKRZMFQu2RQ7uATjOxU2Zpq10xmxPY
	 xWBRQXfWF1vDw==
Date: Mon, 9 Sep 2024 14:15:38 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: o.rempel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
Subject: Re: [PATCH v1] i2c: imx: Convert comma to semicolon
Message-ID: <zuqhbscchztqrus5w4hyl5b7d52gj7zkety77ytaapevac3rd6@q5nw24et4vs4>
References: <20240909075257.34168-1-shenlichuan@vivo.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240909075257.34168-1-shenlichuan@vivo.com>

Hi Shen,

> @@ -687,7 +687,7 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
>  		i2c_imx_bus_busy(i2c_imx, 0, atomic);
>  
>  	/* Disable I2C controller */
> -	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> +	temp = i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN;

yeah... pretty ugly!

Thanks for the cleanup, merged to i2c/i2c-host.

Andi

