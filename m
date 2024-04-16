Return-Path: <linux-i2c+bounces-2977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5557A8A6DCE
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 16:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB491F215DF
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 14:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68249131187;
	Tue, 16 Apr 2024 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+q/OKJA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2351131182
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 14:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713276975; cv=none; b=GYeJxv4hy9b3k0EZMxn79xUq1Ns50jDwtEBPSpaQ6eA3wvJYeWQb7bcPT/zXuueOc9omM+Bo7RsQdhpZXfz16DK18B/UmA+tAiYkRp/ekfI8aPBgzlGLXBqEl5r5OsLPiT1EGUvQ72dW3Iya606VPsAQTtWgGaarsfLWZJAvC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713276975; c=relaxed/simple;
	bh=U12xAAwG4rQBVCQQyyweodHFp8votgTpdJu4ms7XTZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YBkhk9ueMZjjLQD2VULL1VRRK1KIaCJkn1su2z6LK6Bz9jJbMbmdKbcOGTq7O4k3rCvrVRj49BGrn/fdQagmxxB/FD3ZNZQs4rvchCguZEHPTxuxrVRWF9W82RjE1A8+eprxTX6BXLMfStWJnWyvGf571FDcwm1JlBgrDBj+mwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+q/OKJA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a52aa665747so267469166b.2
        for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 07:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713276972; x=1713881772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aQhrHnPK3yPIExTq+Bo/LE4b4eKmDn78YsL5+8fOLro=;
        b=t+q/OKJAfkq1OJiLKWR5k5JMPuL9smkpO5cESBc+FW+nAPTS9MEUxxIRiVb3Ry6n9h
         BPjNY/YRQeZ8PtB+3l1tj52mnqh1tEe2j7kBI9tjRsSOnBhGY9i43ld5AhZe6jPfNCQN
         FEzVO8Sve7/IVGQl1JpB8ZoA3SiGZM3VylFHFYHfgYmge6xa7o+V2RIzFq5yiM6zjell
         +FiN2YwFyoYi1eFo2b+j3G4PuBVpTSsRoeYMi1Zs3dunGZFFsOO76/pZP6nlCz5EToF8
         jUvSHPi+y5Hk6P4gzRIVvkelh6zWIxBHcbYUdxCoVxu3ScyeKbTWWCWPNPMMKCHTTgjP
         S9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713276972; x=1713881772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQhrHnPK3yPIExTq+Bo/LE4b4eKmDn78YsL5+8fOLro=;
        b=MhEkIpDp3aCehBDTgV89gFSWXnmzhj0+YkKxkcH3EKARLEM13KLiWAT1lu0kTDYX85
         GAr2IzwooTyDnXsIljEKzhx8STzaHlkqIWE1vMBFGdAAPcU/rt9NqMMqR68y2BgIJZXN
         AOYWv+FWlS6lER09//fR6wrA2l/yOykpj9Ok0esqBqtD9deKCURqqFEPUvl9bIf/EICD
         nFPnN8c445IvMV9ZNQx8hkc2wctJRmx9xVpUz3RP6h+jJ4vEcRjbDc467nxtRe9myaeV
         ckOzjJel1axncn3OpU81LhJybUdGk0vwukV9kJ25Z3kcUc1IO3in3hZMYxzZ/lLGm2DX
         gqWw==
X-Forwarded-Encrypted: i=1; AJvYcCVkveAG33NDz3Z/GOJ9BVicerX9DIOSpiaV29jguSrqdKkk2FzD3qwkmQx4GofJNQm+MZwpLLrW26pW4s2ZGQoBxVSuhEgHuO5g
X-Gm-Message-State: AOJu0YyYV4DmxAKZpVS2TW37iUuZNtJRLk/L93yeErhBnkP+pgYNsg8w
	0/iIeScc2s78A4x14vdCIMB6eTTbfZoSCAscBFkZh3Mmx/+4kacVkfz5QTFxv6A=
X-Google-Smtp-Source: AGHT+IG/qwOEHsBcVNP7RIi8AIVdPffoVL9T6hEZjzp2r/9OuroPh0DYyonB2/NkWApdRwqTEgpAag==
X-Received: by 2002:a17:906:b88e:b0:a53:ed46:f836 with SMTP id hb14-20020a170906b88e00b00a53ed46f836mr3076567ejb.2.1713276971657;
        Tue, 16 Apr 2024 07:16:11 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q23-20020a170906a09700b00a519ec0a965sm6867197ejy.49.2024.04.16.07.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 07:16:11 -0700 (PDT)
Date: Tue, 16 Apr 2024 17:16:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Tony Lindgren <tony@atomide.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	gregory.clement@bootlin.com, theo.lebrun@bootlin.com,
	thomas.petazzoni@bootlin.com, u-kumar1@ti.com
Subject: Re: [PATCH v5 05/11] PCI: cadence: Extract link setup sequence from
 cdns_pcie_host_setup()
Message-ID: <111df2a5-7e05-480c-a5a5-57cf8d83c0d0@moroto.mountain>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-5-4b8c46711ded@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240102-j7200-pcie-s2r-v5-5-4b8c46711ded@bootlin.com>

On Tue, Apr 16, 2024 at 03:29:54PM +0200, Thomas Richard wrote:
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> index 5b14f7ee3c79..93d9922730af 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> @@ -497,6 +497,30 @@ static int cdns_pcie_host_init(struct device *dev,
>  	return cdns_pcie_host_init_address_translation(rc);
>  }
>  
> +int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
> +{
> +	struct cdns_pcie *pcie = &rc->pcie;
> +	struct device *dev = rc->pcie.dev;
> +	int ret;
> +
> +	if (rc->quirk_detect_quiet_flag)
> +		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> +
> +	cdns_pcie_host_enable_ptm_response(pcie);
> +
> +	ret = cdns_pcie_start_link(pcie);
> +	if (ret) {
> +		dev_err(dev, "Failed to start link\n");
> +		return ret;
> +	}
> +
> +	ret = cdns_pcie_host_start_link(rc);
> +	if (ret)
> +		dev_dbg(dev, "PCIe link never came up\n");

If we're going to ignore this error the message should be a dev_err()
at least.


> +
> +	return 0;
> +}
> +

regards,
dan carpenter

