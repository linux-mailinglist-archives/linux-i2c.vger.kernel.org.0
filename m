Return-Path: <linux-i2c+bounces-5902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A52963FAB
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 11:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E0041C20AF4
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 09:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4D2618CC19;
	Thu, 29 Aug 2024 09:16:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CD118C33A;
	Thu, 29 Aug 2024 09:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724922971; cv=none; b=E0ecbMr6mLu885oVv/CL7FHdYe46cgMMs/FQKB/9EGtFRlgtF8+/LRWd4zBy+pEwCyhOMQK5Ieq1zt14JOmovgSLTVePxUZBk8MMuTmVKHpSudXsjdyUYZwObYQUmZ18STZ+tNQktkaZY+OAt0oxcDfqBuBbCeMppiWYcbGt8N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724922971; c=relaxed/simple;
	bh=xCDBkZb7O6CRtQvx2dqH72aOufa9musXZqVC7/rDEx8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=nlopRYnywQSRlyw3ND4Ewc4XoD0DS+4Eu98OGSRQA9xLcO2g4JerKHXjIdRweof0v/h2Vdgijrb2uN2ttzzDj9wRlMwLrlKFw6/uBNZeGfQ1VjoRzThbesazN2utR05+Pi+zCGeYPkIX2OvH5ePqBFXALwfGjgU0KGtdp4Ae8rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas11t1724922944t046t35655
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.120.181.182])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 13568882007759203019
To: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
Cc: <andi.shyti@kernel.org>,
	<jarkko.nikula@linux.intel.com>,
	<mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<rmk+kernel@armlinux.org.uk>,
	<andrew@lunn.ch>,
	<linux-i2c@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<mengyuanlou@net-swift.com>,
	<duanqiangwen@net-swift.com>,
	<stable@vger.kernel.org>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <20240823030242.3083528-4-jiawenwu@trustnetic.com> <ZsiZALjnoUpb0H_I@smile.fi.intel.com>
In-Reply-To: <ZsiZALjnoUpb0H_I@smile.fi.intel.com>
Subject: RE: [PATCH net 3/3] i2c: designware: support hardware lock for Wangxun 10Gb NIC
Date: Thu, 29 Aug 2024 17:15:42 +0800
Message-ID: <02a901daf9f4$063e8cf0$12bba6d0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gFePmA/AWrgqE+x5VSz4A==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Fri, Aug 23, 2024 10:13 PM, Andy Shevchenko wrote:
> On Fri, Aug 23, 2024 at 11:02:42AM +0800, Jiawen Wu wrote:
> > Support acquire_lock() and release_lock() for Wangxun 10Gb NIC. Since the
> > firmware needs to access I2C all the time for some features, the semaphore
> > is used between software and firmware. The driver should set software
> > semaphore before accessing I2C bus and release it when it is finished.
> > Otherwise, there is probability that the correct information on I2C bus
> > will not be obtained.
> 
> ...
> 
> >  i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
> 
> >  i2c-designware-platform-y 				:= i2c-designware-platdrv.o
> > +i2c-designware-platform-y 				+= i2c-designware-wx.o
> 
> These lines have TABs/spaces mixture. Please fix at least your entry to avoid
> this from happening.
> 
> 
> ...
> 
> >  int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
> >  #endif
> 
> ^^^
> 
> > +int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev);
> 
> See below.
> 
> ...
> 
> >  		.probe = i2c_dw_amdpsp_probe_lock_support,
> >  	},
> >  #endif
> 
> ^^^
> 
> > +	{
> > +		.probe = i2c_dw_txgbe_probe_lock_support,
> > +	},
> 
> Do we all need this support? Even if the driver is not compiled? Why?

I'll add the macro CONFIG_I2C_DESIGNWARE_WX to control it.

> ...
> 
> > +#include <linux/platform_data/i2c-wx.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/i2c.h>
> > +#include <linux/pci.h>
> 
> This is a semi-random list. Please, take your time to understand the core you
> wrote. Follow IWYU principle.
> 
> ...
> 
> > +static int i2c_dw_txgbe_acquire_lock(struct dw_i2c_dev *dev)
> > +{
> > +	void __iomem *req_addr;
> > +	u32 swsm;
> > +	int i;
> > +
> > +	req_addr = dev->ext + I2C_DW_TXGBE_MNG_SW;
> > +
> > +	for (i = 0; i < I2C_DW_TXGBE_REQ_RETRY_CNT; i++) {
> 
> Retry loops much better in a form of
> 
> 	unsigned int retries = ...;
> 	...
> 	do {
> 		...
> 	} while (--retries);
> 
> BUT... see below.
> 
> > +		writel(I2C_DW_TXGBE_MNG_SW_SM, req_addr);
> > +
> > +		/* If we set the bit successfully then we got semaphore. */
> > +		swsm = readl(req_addr);
> > +		if (swsm & I2C_DW_TXGBE_MNG_SW_SM)
> > +			break;
> > +
> > +		udelay(50);
> 
> So, can a macro from iopoll.h be utilised here? Why not?

I need to write the register first and then read it in this loop.
It does not seem to apply to the macros in iopoll.h.

> > +	}
> > +
> > +	if (i == I2C_DW_TXGBE_REQ_RETRY_CNT)
> > +		return -ETIMEDOUT;
> > +
> > +	return 0;
> > +}
> 
> > +int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev)
> > +{
> > +	struct platform_device *pdev = to_platform_device(dev->dev);
> 
> Why do you need this dance? I.o.w. how pdev is being used here?

I'll change to add the data in node property.
 


