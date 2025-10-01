Return-Path: <linux-i2c+bounces-13294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89878BB2176
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 01:56:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F09A1923BC0
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Oct 2025 23:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5702E29E110;
	Wed,  1 Oct 2025 23:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/wEpGpX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C16C2222B4;
	Wed,  1 Oct 2025 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759362991; cv=none; b=qSYuS4aJJxG6p2+9kcYzu+Qc04YT6Siqav8CL8s7zU2Vw6Ndc4QYAUMPA455X8Q42QGL+N0PCXDfjVW+LyZ3XlN21WKrJ+wohSjlikrD8l25/ay731RF7H0j2UeD0BBymOvD0OW4/X75svG8g+H3D6r82sDkoWpcCzrbjs/eUGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759362991; c=relaxed/simple;
	bh=x+l79Fi6Gb8DAi1tS8bk67k8/fMpNk5VIgVodP1W2BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGhcA7eGvjApm50811SCNfkPmjAnLu7ecRW9tsbpB0Jq9pU55o+SBHZtCB4+j5xWfQYAEdc1bp5phkfNcry7ki/iTdbGiL44TTt7QIUb3n9VUOJx9PDmLFqX4MPO7XAUma1PItyu4decNRO7yfg/M3lQJSpr9BWvGyjOyK8Q6vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/wEpGpX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7817DC4CEF1;
	Wed,  1 Oct 2025 23:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759362990;
	bh=x+l79Fi6Gb8DAi1tS8bk67k8/fMpNk5VIgVodP1W2BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h/wEpGpXnmg2bK7dCZ8D8Pdu3kQpsrMvW8gm92ZzwRYAzEDtUSfX6PjVxPGKz7hJv
	 hl8Ubm8VuqqgMRd0AxaBSRyzzVMqCYYxUikfHtPIBzrn7kWlPXIRebzHK2OYTOENeK
	 rLhNEEX31X7O0Fcw82RgwTLJGIN5zxuup3SbKwlizR8y79XlVLyI2fLhADUz62Jwiv
	 sJlVEZrrIzlSRMtD8kqXCO1OJ4lz3h6J2V3xXB7jFrmKNVi7nJuvzY8UUPb8f5JOYL
	 +2UfDYoyI+ooJIpILmLJjMCddkXa4iNkN7EcmDt8dp6qaQxwDypyCN3u9P/Se6lyJK
	 BmqqpAzPoefHw==
Date: Thu, 2 Oct 2025 01:56:25 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: syniurge@gmail.com, shyam-sundar.s-k@amd.com, wsa@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] i2c: fix reference leak in MP2 PCI device
Message-ID: <7cu6uvwjki72rz6zoshfg3vonawikiasxheotmrsowqoalk2jb@7iu7cenha7p5>
References: <20250928071933.1627-1-make24@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250928071933.1627-1-make24@iscas.ac.cn>

Hi,

> diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> index ef7370d3dbea..60edbabc2986 100644
> --- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
> +++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
> @@ -458,13 +458,16 @@ struct amd_mp2_dev *amd_mp2_find_device(void)
>  {
>  	struct device *dev;
>  	struct pci_dev *pci_dev;
> +	struct amd_mp2_dev *mp2_dev;
>  
>  	dev = driver_find_next_device(&amd_mp2_pci_driver.driver, NULL);
>  	if (!dev)
>  		return NULL;
>  
>  	pci_dev = to_pci_dev(dev);
> -	return (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> +	mp2_dev = (struct amd_mp2_dev *)pci_get_drvdata(pci_dev);
> +	put_device(dev);
> +	return mp2_dev;

the patch is good, but I don't think you need to declare mp2_dev
because to_pci_dev(dev) should work even without hodling the
reference of dev.

I also have to agree with Markus that something like:

struct device *dev __free(put_device) = ...; /* it can also be NULL */

would work nicer.

Thanks,
Andi

>  }
>  EXPORT_SYMBOL_GPL(amd_mp2_find_device);
>  
> -- 
> 2.17.1
> 

