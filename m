Return-Path: <linux-i2c+bounces-14501-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E6118CB3B74
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 19:08:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5736E301B2CD
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Dec 2025 18:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0748731D75E;
	Wed, 10 Dec 2025 18:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="ROoWxZO/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A6248F5C;
	Wed, 10 Dec 2025 18:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390106; cv=pass; b=JB4sd6qO74G9UjloLcJBPAx/IHT/a/F6GsUKUt6+dvP+uKMctZ/7yQv43WL3fUUIvKRRJG5qP57pxI0ecBF5flCy3xGgMAo2vU2acAYOw+X9GReWmoQ2PLnsQQLzYvBVY+5aqSYaV3rO4ieLU5ggtar/EaV5GG3BNbOsyK63Lzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390106; c=relaxed/simple;
	bh=bgDmLhaY1NO4JB72njZjKH2ScX+D/cpVpwiVK7S4fHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7AIIzqT/Hy6Qodz+094d1MCGfCX3YttWzbZc69EPJwYPMJ2VKmhLkzxh4vZGRzZ7exCVch7X94lRrmDY0Xd+cKYvNIAPFM3lZiEmx8uloodY+golIRsxjgvdMGqfGDlna/EhlzaqWDqtP+y3IhwtGLkGLAtzsx12uszDIMF+Q0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=ROoWxZO/; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-143-161-nat.elisa-mobile.fi [85.76.143.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4dRNxc2XnZzyNV;
	Wed, 10 Dec 2025 20:08:17 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1765390102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJAA5IVaGvUosOi6GQ8uQHuXREwy/pXMFX1PmrToNyQ=;
	b=ROoWxZO/NuTDVhS11l392n4c6xihl0X5w9g7y6RRYEPvGsWGkzT/wKNw/z+DujQOh/ojx2
	QGSdtpFH5mrqK9JF0Zp9V8hiV94v/CUiX7xJ6baSM24KmGubGYBIYfxhQdo+wNBFH5PlVl
	QUrOIqevTEZQ+l6FUfnFzg3jFF649lE=
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=meesny; cv=none; t=1765390102;
	b=b8oUrx9O2I3EiZ608LHR75OUNaMTJ4xi9+1zS78DwGp6dUO0o/+dUHYxHs7rm4gzeGxBJ7
	kxXOhSX7xuvKizmi8PRWs91SWPkhJz6DDVGFxd7TQOyDzTG0cM+8hTJqZ4/DeAxqGlJAh8
	5HQK5NO7sXih/P8YcaCI/ah8TDiQNAI=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1765390102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sJAA5IVaGvUosOi6GQ8uQHuXREwy/pXMFX1PmrToNyQ=;
	b=arLvp0KKdBcx6PGl57rlFjColUuxLGyXTPONvGVA4NU3h3QQQoAdnUvNbgb4UPd02XFTX5
	DHRyI49BUtv94BHTzzZUJflTQvuR4JW+Z5n6j4PGzA3TKBIWbt0eSibGo9oHKjU7+/BifZ
	RyOc+PzTUVdIdR5NBIubyauav/lInJo=
Date: Wed, 10 Dec 2025 20:08:16 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Fernando Coda <fcoda@frba.utn.edu.ar>
Cc: jmkrzyszt@gmail.com, tony@atomide.com, vigneshr@ti.com,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: fix incorrect SCLH timing calculation
Message-ID: <aTm3EGNR8smNE4Xl@darkstar.musicnaut.iki.fi>
References: <20251210052254.279899-1-fcoda@frba.utn.edu.ar>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251210052254.279899-1-fcoda@frba.utn.edu.ar>

Hi,

On Wed, Dec 10, 2025 at 02:22:54AM -0300, Fernando Coda wrote:
> According to the AM335x Technical Reference Manual, which uses the
> i2c-omap driver, in the section 21.4.1.24 (clock timing parameters),
> the SCL high and low periods are defined as:
> 
>     tLOW  = (SCLL + 7) * ICLK period
>     tHIGH = (SCLH + 5) * ICLK period
> 
> Every other reference to SCLL and SCLH in the omap_i2c_init() function
> follows the same pattern:
> 
>     SCLL = value - 7
>     SCLH = value - 5
> 
> However, in this line the value of SCLH is computed subtracting 7 instead
> of 5, which will produce an incorrect SCL high period.
>
> This appears to be a copy and paste error.
> 
> Fix by using −5, consistent with both the TRM and the surrounding SCLH formula

What's the impact, and how the change was tested?

I think the code line you are modifying affects only OMAP1
(OMAP_I2C_FLAG_SIMPLE_CLOCK branch), so AM335x TRM reference has little
value.

A.

> 
> Signed-off-by: Fernando Coda <fcoda@frba.utn.edu.ar>
> ---
>  drivers/i2c/busses/i2c-omap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index d9f590f0c384..d0a33f5f1bb3 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -459,7 +459,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
>  		if (psc > 2)
>  			psc = 2;
>  		scll = fclk_rate / (omap->speed * 2) - 7 + psc;
> -		sclh = fclk_rate / (omap->speed * 2) - 7 + psc;
> +		sclh = fclk_rate / (omap->speed * 2) - 5 + psc;
>  	}
>  
>  	omap->iestate = (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
> -- 
> 2.52.0
> 
> 

