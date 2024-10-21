Return-Path: <linux-i2c+bounces-7490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7F59A5CAF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 09:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23CE31F210C0
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2024 07:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4F91D221D;
	Mon, 21 Oct 2024 07:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GyPMG86s"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ECD1D174B
	for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2024 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729495377; cv=none; b=ToxWYGcDVKWXkyBW0ErwazwGg4Z7QZJ2NYtOpV3iThIq5KXv5x5BP/ha3lOuwjF8vEK6LYv+u+H71btax1JaG3Eql01EACWtCD9089LodzydLYz8cfMX7wIoi7EujX5t5XcE3WSatiI0HGG30lh7knm03vBP8YUw6m8QY2obOzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729495377; c=relaxed/simple;
	bh=akqdO3psSSDcqPoPmRfhBaq7KYA8OuLkph2vgmsZ1Rk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ksTI09kmfBTYPsPOAVMKugXfB0KRPjEnM2xDqWh3445GE36RUtXFplLkEaTlW9ijszHuHTO4bvJ5Y8KwVPJInS+ngxCSzQXll231nMQ15+gkiKFeua+iMmzraNXchXs/ndBHyeGB95h9Nt7k7JBLOCaMUmd5pxvM0AHet6D1AAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GyPMG86s; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so27435115e9.2
        for <linux-i2c@vger.kernel.org>; Mon, 21 Oct 2024 00:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729495373; x=1730100173; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3hGXgeNMIw4U0yQPd3D3dKiR4l6lD9w9YryhZf6FB70=;
        b=GyPMG86srfmSTYEaJt5uC0PAtf2Pi470RvQBg+U7lK5a/e2Qlhrga3LzyM53muHYZQ
         wfc1yNeVHbb3no45jCXVE6YCN8JlC9Nfu7IY9wY1kAm9jPzyxsdoEiJuqMc3GiIytstu
         IY1IYfHXHg5N9szmZw4jLncyT4gQ3FkhYHty68UC/qtJ99TqwHqll4M8Eak1KDOzGt4t
         gyqyxUWXc30mxJIa0+nncEMoC9l8ongBJnGgKHjsnT2k8FDZTSDj6LNcjlqUx/JblRCU
         kv36ENO+0zQNKd96xprNdPNJJEKa77/mKHA7nZopFXstQstqNVWaS84p7xImKo4nUh2H
         46eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495373; x=1730100173;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hGXgeNMIw4U0yQPd3D3dKiR4l6lD9w9YryhZf6FB70=;
        b=jOpNvNDgbJQkFggm3RehwE+0Z7KWVzid2dEFOisIPOZxx1rbFQSrvXccrFplIXTE5g
         uf8Gmnk35vAyymKMBVli4w7GzzGhHdT4psbZXIxwdd6ja1cCaB2WKEPWpgBBd2u2S8T4
         1wGfsQz+jws6iURX0mZtvAfuskesz/0HleS5PNf9inYdVPlWfxIYQzgJtL+qcHP/2Lrz
         MvTAc2wrbDJlg7YyBxphNbPLVxmoqCOxOuv3ksUUsu42jPaWSLemZ7P9uNgjSR4Yzsbt
         jKZKmc0oYmgCSWVFlcq/eYOz9qgIuRh/RX2naKnw6d9YDd9K8eDYqStWa7+l62nYII+Y
         RUQw==
X-Forwarded-Encrypted: i=1; AJvYcCW+QN23Qs4zMTmIW1rqUS/43V22vpMEaC6yRGsHxjNDLdhNfZ3/WVuhA+wRGE+ydzexlXqU5aYkIk8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywibf0oJXulhWPNoquylWCbOQXJzDH2z8BZ6uUvtzU2qy6PdHzW
	oecqVq0y8q0WbYzgwRQEokBVk1uJEbyhwUmefKHEt+nDBRKNsPS52ioalOH1w3k=
X-Google-Smtp-Source: AGHT+IHZljiICRUhyxDdbtD4WYuUm0mjjSTqWVUHER2Y2hZLhu0VdV7MjcSaGSeKiI81kTq5jO6bgg==
X-Received: by 2002:a05:600c:4f09:b0:431:2460:5574 with SMTP id 5b1f17b1804b1-4316168f23amr72052835e9.27.1729495373102;
        Mon, 21 Oct 2024 00:22:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f57fa35sm46098105e9.19.2024.10.21.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:22:52 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:22:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Troy Mitchell <troymitchell988@gmail.com>,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <1e65dbe7-0269-4c96-99be-c4eb224a5a9f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015075134.1449458-3-TroyMitchell988@gmail.com>

Hi Troy,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/dt-bindings-i2c-spacemit-add-support-for-K1-SoC/20241015-155402
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241015075134.1449458-3-TroyMitchell988%40gmail.com
patch subject: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
config: alpha-randconfig-r071-20241019 (https://download.01.org/0day-ci/archive/20241019/202410191416.NyqQCvE3-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202410191416.NyqQCvE3-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-k1.c:621 spacemit_i2c_probe() warn: passing zero to 'PTR_ERR'
drivers/i2c/busses/i2c-k1.c:622 spacemit_i2c_probe() warn: passing zero to 'dev_err_probe'

vim +/PTR_ERR +621 drivers/i2c/busses/i2c-k1.c

aede17b17b7dfb Troy Mitchell 2024-10-15  604  static int spacemit_i2c_probe(struct platform_device *pdev)
aede17b17b7dfb Troy Mitchell 2024-10-15  605  {
aede17b17b7dfb Troy Mitchell 2024-10-15  606  	struct spacemit_i2c_dev *i2c;
aede17b17b7dfb Troy Mitchell 2024-10-15  607  	struct device_node *of_node = pdev->dev.of_node;
aede17b17b7dfb Troy Mitchell 2024-10-15  608  	struct clk *clk;
aede17b17b7dfb Troy Mitchell 2024-10-15  609  	int ret = 0;
aede17b17b7dfb Troy Mitchell 2024-10-15  610  
aede17b17b7dfb Troy Mitchell 2024-10-15  611  	i2c = devm_kzalloc(&pdev->dev,
aede17b17b7dfb Troy Mitchell 2024-10-15  612  			   sizeof(struct spacemit_i2c_dev),
aede17b17b7dfb Troy Mitchell 2024-10-15  613  			   GFP_KERNEL);
aede17b17b7dfb Troy Mitchell 2024-10-15  614  	if (!i2c)
aede17b17b7dfb Troy Mitchell 2024-10-15  615  		return -ENOMEM;
aede17b17b7dfb Troy Mitchell 2024-10-15  616  
aede17b17b7dfb Troy Mitchell 2024-10-15  617  	i2c->dev = &pdev->dev;
aede17b17b7dfb Troy Mitchell 2024-10-15  618  
aede17b17b7dfb Troy Mitchell 2024-10-15  619  	i2c->base = devm_platform_ioremap_resource(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  620  	if (!i2c->base) {

This should be if (IS_ERR(i2c->base)) {

aede17b17b7dfb Troy Mitchell 2024-10-15 @621  		ret = PTR_ERR(i2c->base);
aede17b17b7dfb Troy Mitchell 2024-10-15 @622  		return dev_err_probe(&pdev->dev, ret, "failed to do ioremap");
aede17b17b7dfb Troy Mitchell 2024-10-15  623  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  624  
aede17b17b7dfb Troy Mitchell 2024-10-15  625  	i2c->irq = platform_get_irq(pdev, 0);
aede17b17b7dfb Troy Mitchell 2024-10-15  626  	if (i2c->irq < 0) {
aede17b17b7dfb Troy Mitchell 2024-10-15  627  		ret = i2c->irq;
aede17b17b7dfb Troy Mitchell 2024-10-15  628  		return dev_err_probe(&pdev->dev, ret, "failed to get irq resource");
aede17b17b7dfb Troy Mitchell 2024-10-15  629  	}
aede17b17b7dfb Troy Mitchell 2024-10-15  630  
aede17b17b7dfb Troy Mitchell 2024-10-15  631  	ret = devm_request_irq(i2c->dev, i2c->irq,
aede17b17b7dfb Troy Mitchell 2024-10-15  632  			       spacemit_i2c_irq_handler,
aede17b17b7dfb Troy Mitchell 2024-10-15  633  			       IRQF_NO_SUSPEND | IRQF_ONESHOT,
aede17b17b7dfb Troy Mitchell 2024-10-15  634  			       dev_name(i2c->dev), i2c);
aede17b17b7dfb Troy Mitchell 2024-10-15  635  
aede17b17b7dfb Troy Mitchell 2024-10-15  636  	if (ret)
aede17b17b7dfb Troy Mitchell 2024-10-15  637  		return dev_err_probe(&pdev->dev, ret, "failed to request irq");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


