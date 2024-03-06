Return-Path: <linux-i2c+bounces-2203-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C384C872C39
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 02:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B2601F26A60
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Mar 2024 01:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC336FBD;
	Wed,  6 Mar 2024 01:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sbrdtODI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD95BECF;
	Wed,  6 Mar 2024 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709688744; cv=none; b=mwbeTKMqtDj1kXIAqgslPu5ZkPr7AkkzaNy73qnUMx9OWkhER773yuU2UjtiZcchmoXDlAsQJWvEFPoTZRFIegt66z9AjiEmwmerOykw0Xxrevt5uLnWaP7tQzZUnsgzbuz53XmIHdGgwXXC8nhHZ+UtiP4YVKrLQas1/BV6J9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709688744; c=relaxed/simple;
	bh=K7e/3Jvw+q4xoIZ8XEiXRizjLSRo5qPWF23ZIKnpUQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cGPlQAC2M3Pjno4KFWt00DnSi1flblBTzbMqZmPeiHioL1nCCuwWrU4OUSZuJG3mebk+SnOgWVUaKB1jvDaGe1VwFsrNjPbCUOs3ZlOArpg96hBp6knh91k4oEyB6JEqb5t3OPJCedv+wENTh83kgg1iUWotjXmBLIQW+5GU6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sbrdtODI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF86AC433F1;
	Wed,  6 Mar 2024 01:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709688744;
	bh=K7e/3Jvw+q4xoIZ8XEiXRizjLSRo5qPWF23ZIKnpUQ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sbrdtODIBW1NW8cU33R418vIc1i6JmLP38GALrxpMpUMKSIHl8x2IaXVShMRWL5YQ
	 MVAD9BgZkGAIJ++9HPLja3RUB3lPoU2/BwTtMxvrvzp9qgb4ouF8veosAjC55JIQtr
	 mhnchoy3+uq7QotmGM+stV1rOejtAb3jtX3RWyqPLodkPbEhQ48dyEYhqMZLKWe6L7
	 uGglMABeHllLDXAvPMctbpKl9knSNrLXi2rs36HEXl+4qpQ88/Bs79xUGPg8nUA0nS
	 5I5FpUmjhNTJBMo1kZw4+r5vNS6SCYCKYSwIYc+AkBKiMGt58pFCpeAXNqnpIzM+1K
	 23kNChbi3n61Q==
Date: Wed, 6 Mar 2024 02:32:20 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: "Hsin-Yu.Chen" <harry021633@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: remove redundant condition
Message-ID: <ev25m7yfkcpe3s5bjuhio77kz27m7ibejhalpea224u53q74qf@oa7dzhsply7m>
References: <20240305165652.18842-1-harry021633@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305165652.18842-1-harry021633@gmail.com>

Hi Hsin-Yu,

On Wed, Mar 06, 2024 at 12:56:52AM +0800, Hsin-Yu.Chen wrote:
> I2C_M_RD is defined as 1 and `flag & I2C_M_RD` is one or zero
> no need one more condition to get the value

this can be written a bit better as:

/no need one more/no need for an additional/

> Signed-off-by: Hsin-Yu.Chen <harry021633@gmail.com>

anyway:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

> ---
>  include/linux/i2c.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 652ecb7abeda..363dde9ef94f 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -931,7 +931,7 @@ static inline int i2c_adapter_id(struct i2c_adapter *adap)
>  
>  static inline u8 i2c_8bit_addr_from_msg(const struct i2c_msg *msg)
>  {
> -	return (msg->addr << 1) | (msg->flags & I2C_M_RD ? 1 : 0);
> +	return (msg->addr << 1) | (msg->flags & I2C_M_RD);
>  }
>  
>  u8 *i2c_get_dma_safe_msg_buf(struct i2c_msg *msg, unsigned int threshold);
> -- 
> 2.38.1
> 

