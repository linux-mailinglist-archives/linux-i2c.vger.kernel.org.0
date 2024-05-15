Return-Path: <linux-i2c+bounces-3492-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F68C6120
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 09:05:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4814283A7F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 May 2024 07:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F23741A88;
	Wed, 15 May 2024 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HIZkmPNZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A651441C7F
	for <linux-i2c@vger.kernel.org>; Wed, 15 May 2024 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715756744; cv=none; b=LdzVvCuDVB5WyoL4EAYi6AcobhO5zeeokq0F9MYfEHhfsfzwNmY4jPrLJTUJquQCR9yyce9gWmn7neXd7JQ22UIvzpAAETdJl7lmu+O6mYmaaeYWzEkAp7EnYsA9jA7GXXr+Y8vAGg6o6vZSTMoEdH7LpkUXSQLL5wVa4oGpGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715756744; c=relaxed/simple;
	bh=RtKyoqiDLhVTAKC8deDb8sf4vqkR0RW+M2pcJe2zDNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlIhoYXCCwvmiuhe9r5LtpQ7iVuHNCPZjeUzy4SJbrTLWiaTvr9rtgHVUQOaX7PW7wdHhxfec+82qkeGmvS7tsPCVAwdman/iEH7xeNjJdNHGOU+uR1Nw3P/nUNuff9T2KyRXS4vVtgW3nhKJDAl40Gb2Sj/KRYzMCKLiSRf1oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HIZkmPNZ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42016c8db2aso19885515e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 15 May 2024 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715756741; x=1716361541; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntMSL/st0iLS0tnCXAPXzy7ZhcKJCMyFAGnRoDypkYA=;
        b=HIZkmPNZ/yejRdoAx6tBdtuYpzfeaIRHuD3v5RdKFrEOA/ZZzqN2y/w0p/NcZdiwjp
         OUoCiMQFvHI4dNNbTO1TmCl8CZ3iXTJFFdXzRNyd7iO2sls8Q0dLiAAqbtE5wW4Lhxqs
         qY3RprLQQebc0ySSDenhzB5x4SL4vukhA0DRtOnppzLCd24ehUT7EPpArYRCFHe70YMT
         Ravyl7+G6FJCOO0fRoLKhZctx2ARm+HcztRr3K0lOCjXgrGyjRfjJW4OIoV+b/UCxH0m
         cXfeln6X8RogBZ8HYiEbHOxtqwFZ8ua1R6LOSv/KpegA7D9UYLHL3eG9cb+MhgOLR6a+
         /M4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715756741; x=1716361541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntMSL/st0iLS0tnCXAPXzy7ZhcKJCMyFAGnRoDypkYA=;
        b=m1HF9AeQv/rvohBsptwglsYXvbjVDOzGwx2Yfi7jysP7TafXugoTgDv/91J5g3gOoj
         vICDGgZYo9PBnC0BChrSOMgGDkvkUC4VBUzpol2ds4ZB7wLx+ECvZwE6Kc+U4a+PL/si
         sSUw/pSdFh3xxej35tCdcRZ8eONmglCz3gkvxPt91Adlh2ewRHZWbzssaaap3Y/bddcO
         K0OhS4fm6Jd1TSe7jZqj0tGmDVWj97XlWrVWPT/Nvnt0SP4IeKTmau2/fzLX1bnfbHfH
         fz6m0rNFVAQ43j4GUR5bWEEfbYbtkMYtwa3cRgr2OX/dZ7bt3mDiJgSDx5JT9Pp6+DKn
         lTsA==
X-Forwarded-Encrypted: i=1; AJvYcCV4bBusepnavsRv+Bugk5ORkLj05cH59iL/l7egwOWyU285IeJJWmUbQ/RuCzvRG1sGkLpsZNuaUeRq1/HsY29t8/YikY7ld7+g
X-Gm-Message-State: AOJu0Yw++06V7hC4avfOzwGBJ3nFJF+AoLAWWL3AJEkGGk7MjyWH5YoO
	RbtVXoghnKV1TSqzYwNfViSFd6RO0J3uczH7xOBERUqI6eQanrF1QUsO5LcnARM=
X-Google-Smtp-Source: AGHT+IG7fOzxfMdPYwa7Ec8fNnQWuOlyBziHShIetO8nEu6c++Wn3p0WJyf7YVbIYB9frPW8Z+99pw==
X-Received: by 2002:a05:600c:4686:b0:419:d5cd:5ba with SMTP id 5b1f17b1804b1-41feaa2f45cmr97326285e9.7.1715756740631;
        Wed, 15 May 2024 00:05:40 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccee9292sm221053815e9.37.2024.05.15.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:05:40 -0700 (PDT)
Date: Wed, 15 May 2024 09:05:37 +0200
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
Message-ID: <0bee2d4b-b190-4353-ab29-003364721a3c@suswa.mountain>
References: <20240102-j7200-pcie-s2r-v5-0-4b8c46711ded@bootlin.com>
 <20240102-j7200-pcie-s2r-v5-5-4b8c46711ded@bootlin.com>
 <111df2a5-7e05-480c-a5a5-57cf8d83c0d0@moroto.mountain>
 <56b2bbcb-7181-4640-93b3-0cf3e2029367@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b2bbcb-7181-4640-93b3-0cf3e2029367@bootlin.com>

On Tue, May 14, 2024 at 03:15:34PM +0200, Thomas Richard wrote:
> On 4/16/24 16:16, Dan Carpenter wrote:
> > On Tue, Apr 16, 2024 at 03:29:54PM +0200, Thomas Richard wrote:
> >> diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
> >> index 5b14f7ee3c79..93d9922730af 100644
> >> --- a/drivers/pci/controller/cadence/pcie-cadence-host.c
> >> +++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
> >> @@ -497,6 +497,30 @@ static int cdns_pcie_host_init(struct device *dev,
> >>  	return cdns_pcie_host_init_address_translation(rc);
> >>  }
> >>  
> >> +int cdns_pcie_host_link_setup(struct cdns_pcie_rc *rc)
> >> +{
> >> +	struct cdns_pcie *pcie = &rc->pcie;
> >> +	struct device *dev = rc->pcie.dev;
> >> +	int ret;
> >> +
> >> +	if (rc->quirk_detect_quiet_flag)
> >> +		cdns_pcie_detect_quiet_min_delay_set(&rc->pcie);
> >> +
> >> +	cdns_pcie_host_enable_ptm_response(pcie);
> >> +
> >> +	ret = cdns_pcie_start_link(pcie);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to start link\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = cdns_pcie_host_start_link(rc);
> >> +	if (ret)
> >> +		dev_dbg(dev, "PCIe link never came up\n");
> > 
> > If we're going to ignore this error the message should be a dev_err()
> > at least.
> 
> Hello Dan,
> 
> In fact it could not be really an error.
> If you physically don't have a device on the PCIe bus,
> cdns_pcie_host_start_link() will not return 0.
> 
> So if we use dev_err(), we will always have the error if there is no
> device on the PCIe bus.

Ah okay.  Thanks for looking at this.  It feels like maybe
cdns_pcie_host_start_link() should just check for that at the start and
return 0 instead of doing waiting 1 second and returning -ETIMEOUT.
But I don't know this code well enough to say if that's even possible.

regards,
dan carpenter

