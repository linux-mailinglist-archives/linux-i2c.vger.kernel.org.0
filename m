Return-Path: <linux-i2c+bounces-5819-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77AE95FF09
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 04:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51063B219AC
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 02:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26ECA10A1E;
	Tue, 27 Aug 2024 02:27:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BD42F22;
	Tue, 27 Aug 2024 02:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724725623; cv=none; b=ffPFsSvvkQe5ni6kDDafepsAVT9WKw0Tez0KbAZkv1HOTbBNZVD9TgHiWEyhAvnblJt6a5QkItpsO2yIuDOHekGMtPpBXZA5WcyP5Jvfqerg3EUvhOqCcHLs0uAA6nbpPk1g2FEymAeIac5JtM5lMWKnZxJ3wVFgvCkZoZEPc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724725623; c=relaxed/simple;
	bh=mJpuWRN2/KVNYIZc4DMCkFGWK3cbP0/fORT0G8AUU80=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=MuUc7QOTVhFdNGLVLaKrl+QbX0fMaXX6D8qhMtV+MsAmApKyUZFfRAhNoOMWsuPuqMYxuj5L7pvXbjfQhSGRMnP82GuXV2rPYBm14zsToCIhqL9op+gT9FjC9PWnbh+00PvW4wy7Y32qDkpBlUUA/aHJose4vKVDSz/TD8hc4P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas11t1724725598t810t55324
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.120.181.182])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 5366385585134687173
To: "'Jarkko Nikula'" <jarkko.nikula@linux.intel.com>,
	<andi.shyti@kernel.org>,
	<andriy.shevchenko@linux.intel.com>,
	<mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<rmk+kernel@armlinux.org.uk>,
	<piotr.raczynski@intel.com>,
	<andrew@lunn.ch>,
	<linux-i2c@vger.kernel.org>,
	<netdev@vger.kernel.org>
Cc: <mengyuanlou@net-swift.com>,
	<duanqiangwen@net-swift.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <cacbd4a1-1e7f-4067-95ad-215dde7eedcc@linux.intel.com>
In-Reply-To: <cacbd4a1-1e7f-4067-95ad-215dde7eedcc@linux.intel.com>
Subject: RE: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Tue, 27 Aug 2024 10:26:37 +0800
Message-ID: <021001daf828$8b4cd6e0$a1e684a0$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gIePC5ksecWBcA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Fri, Aug 23, 2024 7:05 PM, Jarkko Nikula wrote:
> Hi
> Hi
> 
> On 8/23/24 6:02 AM, Jiawen Wu wrote:
> > Sometimes the driver can not get the SFP information because the I2C bus
> > is accessed by the firmware at the same time. So we need to add the lock
> > on the I2C bus access. The hardware semaphores perform this lock.
> >
> > Jiawen Wu (3):
> >    net: txgbe: add IO address in I2C platform device data
> >    i2c: designware: add device private data passing to lock functions
> >    i2c: designware: support hardware lock for Wangxun 10Gb NIC
> >
> I was wondering the Fixes tag use in the series. Obviously patchset is
> not fixing a regression so question is what happens when issue occurs?
> 
> I don't think e.g. failing I2C transfer with an error code yet qualifies
> backporting into Linux stable?

Ah, I think this was a leftover bug from when I added Wangxun NIC support
in I2C designware, so I added a fix tag.



