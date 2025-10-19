Return-Path: <linux-i2c+bounces-13638-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA29DBEEDEC
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Oct 2025 00:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DA2F1897B76
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Oct 2025 22:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38FB923BCF5;
	Sun, 19 Oct 2025 22:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raBtFhdG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0870B67E;
	Sun, 19 Oct 2025 22:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760911390; cv=none; b=uwLLnlf1Q7l6SF40LGikBo2A39vaoeGn+y8IypH3vx7TmZRqdvMADqUIF6O88G2FkShVmYf5DdkMORd2bZNUJQD7Yan6KdLiISsImeTTkLxmLFaSYRuCeEVduvR89l33sDQ78sFmD0TQ8VNnp2FlrMfJhhMwJr+iVXktGHMMi5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760911390; c=relaxed/simple;
	bh=q+y4WekbZnVJWEvU7N4YTvT9dRXVTOhnB+ztjW029eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+9Ekq6vRRZA/JMt0MhydiyWb5NdCfjzqDLBZEKS301Z0JGMmXUEWH44hhgCzPfROgqNIyH4cSt02du2ifcCZ+WYGVQtFFZi9VDIuf5U44oFe5TNJNF7nt7ohJAIi0aZBHeYeOAWdOJahfkYX/kTmsJG9L+1u9/+uAPf0Zq/riA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raBtFhdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAD5C4CEE7;
	Sun, 19 Oct 2025 22:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760911387;
	bh=q+y4WekbZnVJWEvU7N4YTvT9dRXVTOhnB+ztjW029eU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=raBtFhdG/ZNouALrAvymre+Syv/x+rHKj0u0QJBBsidUhwT2myFJjtNYvgwicAoW9
	 CNXRP6RA99D4cAf8AUpl7CHQKUjqLIA04JGIswjmqIURsSvf0XoINYUKs9O12FBKEd
	 LDrT8ug4w2Tm+fqLD1B4NksCjguzO+o0cSWFBDxPx8F5WyWuOEASfejzRRnxe0Ce/h
	 XlG8AnslzqdUALIW0hR3CfMv88rASZinHnAEimjYkSm+BesYd8vgQrp2ZHqRkxJkWZ
	 /eLckmMEhAMDvTCXUTf1JjLH04acNE0zUQxd9fgstjshLEi4MHIH1Kf1knfgKBSdwW
	 VRlBg0yVJVGVQ==
Date: Mon, 20 Oct 2025 00:03:03 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: wsa+renesas@sang-engineering.com, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/3] i2c: pcf8584: Move 'ret' variable inside for
 loop, break if ret < 0.
Message-ID: <zlb7ok43sqjsxq7gv6gutiqaw32oupzlvyglfc2f7jg5qwv6or@yvnxchzpmf33>
References: <20251018091258.5266-1-chiru.cezar.89@gmail.com>
 <20251018091258.5266-4-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018091258.5266-4-chiru.cezar.89@gmail.com>

Hi Cezar,

On Sat, Oct 18, 2025 at 12:12:58PM +0300, Cezar Chiru wrote:
> Require spaces around '=', '>' and '<'. Add space(s) around binary
> operators.
> Move 'ret' variable inside for loop. Then check if (ret < 0) break.
> This improves usage of ret variable.
> Enforce errors fixing based on checkpatch.pl output on file.

Thanks for following up.

> @@ -284,9 +284,10 @@ static int pcf_xfer(struct i2c_adapter *i2c_adap,
>  		goto out;
>  	}
>  
> -	for (i = 0;ret >= 0 && i < num; i++) {
> -		pmsg = &msgs[i];
> +	for (i = 0; i < num; i++) {
> +		int ret = 0;

there is no need for initialization here.

>  
> +		pmsg = &msgs[i];
>  		ret = pcf_doAddress(adap, pmsg);

as a folloing patch you can make pcf_doAddress of the void type
and avoid this extra assignment.

Andi

>  
>  		/* Send START */

