Return-Path: <linux-i2c+bounces-3051-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFCE8ADE62
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 09:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8927B281586
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Apr 2024 07:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982A547F45;
	Tue, 23 Apr 2024 07:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g2nCNumm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F5F46441;
	Tue, 23 Apr 2024 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713857931; cv=none; b=auiBXftCscdy1v3JteyE6UXnPdDO023fsUB1RZrT0eJj5lV2XXQ6QbP+zXeaEOZ44AVWBEL0iCz7uz7rGedi0/ZODbdZJshyic8cKxewU4/L8JUzFqmk8ATaksWz1PQj5vNIH3QvGU7gWCamQaXqaBq0JwIx8wPT6V+MQ2AEBNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713857931; c=relaxed/simple;
	bh=mjRkFfdBtZbVYBPrvsjPmWl58HkXWr16xgIBP3dQroM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COuefhTOhK8DI4ss2fOuEjv8uAb0+mEcyP6subvAxUnwnFt4Xv/wA0S6q1dYcudFqWQs7E9pwGod0fmudnC0pU8PEWo9bLHx8OoSA/4XIUvV472TggvfkSVDmve/iE2brcMDUfSLkJuKQLMmq4XpcX09NUmVeRKEwaNGqwajEbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g2nCNumm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713857929; x=1745393929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mjRkFfdBtZbVYBPrvsjPmWl58HkXWr16xgIBP3dQroM=;
  b=g2nCNummvlRj+JVkPdJL1qOV+3rWgeywty2ipzANBbnJsXrpqJJhNC7x
   dGhRdKrMZSNTTUv7zqboihF8yRIa41pCGR5wGmoqMRkgLsiM8PALfGbR1
   QdhdVn+mJmY7z6GSblg/InVuNT9Rjr5AtxSwnZ3T6ufoZTK95L2gBnmWx
   axZ/DlclZSuohycmHPNp5Se6llS/di/BlqDwFb3xVT7eUAq0rvYY2Du5K
   lXp5pwMepesZQcGKV6qnCKNpwAwNpF8ae4EQ3zNICZrq10y2XAS9Y9ttD
   omYiHR2SC0iie8sQ17O7EN5NbilH9cgNWuen1tOzmGrUrFS0yOTUm+Cb1
   A==;
X-CSE-ConnectionGUID: GvO6N5AUR2yId7/OmN5Dmw==
X-CSE-MsgGUID: SWnKJNYuTzqKvj7J1LwpQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="31918033"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="31918033"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 00:38:48 -0700
X-CSE-ConnectionGUID: s/KDoHdVTiSM0XnX3bJmkw==
X-CSE-MsgGUID: mzxAigJiRoSRJZwbwrOibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="24332315"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by fmviesa006.fm.intel.com with ESMTP; 23 Apr 2024 00:38:37 -0700
Date: Tue, 23 Apr 2024 15:33:16 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Corey Minyard <minyard@acm.org>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Xiang Chen <chenxiang66@hisilicon.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Jiri Slaby <jirislaby@kernel.org>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>, Arnd Bergmann <arnd@arndb.de>,
	Jason Gunthorpe <jgg@ziepe.ca>, Tom Rix <trix@redhat.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Randy Dunlap <rdunlap@infradead.org>, Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 33/34] drivers: remove incorrect of_match_ptr/ACPI_PTR
 annotations
Message-ID: <ZidkPHp27jz0t6t3@yilunxu-OptiPlex-7050>
References: <20240403080702.3509288-1-arnd@kernel.org>
 <20240403080702.3509288-34-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403080702.3509288-34-arnd@kernel.org>

> diff --git a/drivers/fpga/versal-fpga.c b/drivers/fpga/versal-fpga.c
> index 3710e8f01be2..e6189106c468 100644
> --- a/drivers/fpga/versal-fpga.c
> +++ b/drivers/fpga/versal-fpga.c
> @@ -69,7 +69,7 @@ static struct platform_driver versal_fpga_driver = {
>  	.probe = versal_fpga_probe,
>  	.driver = {
>  		.name = "versal_fpga_manager",
> -		.of_match_table = of_match_ptr(versal_fpga_of_match),
> +		.of_match_table = versal_fpga_of_match,

For this part

Acked-by: Xu Yilun <yilun.xu@intel.com>

