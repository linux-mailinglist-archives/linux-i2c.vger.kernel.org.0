Return-Path: <linux-i2c+bounces-5884-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A841963BCA
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 08:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A1828618F
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2024 06:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6022F15FA93;
	Thu, 29 Aug 2024 06:40:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCE3157488;
	Thu, 29 Aug 2024 06:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724913654; cv=none; b=qjXvvSkTc7A7wv43ou9q1DNZ+nhA2tpcvLDS6hXWUJkDcUtFwi/lEqBHS7oM8Icw6oawYfd2m3//n7xdG8WUB3ZiRUeaaKuFLN8vKW9kEGA4SYEFRzuTNRufUOzJAFd/Yw4lI56bw+H5ybfrgwNmuUkTfhBR3xmNC/ygxh2Pd8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724913654; c=relaxed/simple;
	bh=HZc4EkwuP6mDfsIJPzpkiVjvI9rRdhfz8BusHFVV/GI=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=P3hZaTdAboDDIKegiUQzEiEocaVWpxKyErnP4B7gNaqd/yYX9mcQAUpzlrdw3Xmd0wimfrVkWoiaCQvkV9XoKbg1D0icPu8EBuvXW4UPG5kyimpOq88yScaw8eGKwdG54+xol5isef80wruaWYoWaP4M5tQ19JQ7Gy9Bf9FzoYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas3t1724913623t215t26311
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.120.181.182])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 9027350068236494838
To: "'Andrew Lunn'" <andrew@lunn.ch>
Cc: <andi.shyti@kernel.org>,
	<jarkko.nikula@linux.intel.com>,
	<andriy.shevchenko@linux.intel.com>,
	<mika.westerberg@linux.intel.com>,
	<jsd@semihalf.com>,
	<davem@davemloft.net>,
	<edumazet@google.com>,
	<kuba@kernel.org>,
	<pabeni@redhat.com>,
	<rmk+kernel@armlinux.org.uk>,
	<linux-i2c@vger.kernel.org>,
	<netdev@vger.kernel.org>,
	<mengyuanlou@net-swift.com>,
	<duanqiangwen@net-swift.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch> <01d701daf75c$50db4450$f291ccf0$@trustnetic.com> <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch> <020f01daf827$d765ffd0$8631ff70$@trustnetic.com> <509abfeb-b1fb-4c53-9898-6106c8dde411@lunn.ch>
In-Reply-To: <509abfeb-b1fb-4c53-9898-6106c8dde411@lunn.ch>
Subject: RE: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Thu, 29 Aug 2024 14:40:22 +0800
Message-ID: <02a001daf9de$529edd90$f7dc98b0$@trustnetic.com>
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
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gGW9YksAYhjRIgArI2qVwHKSDtnAdofD32xvhTIUA==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Tue, Aug 27, 2024 8:19 PM, Andrew Lunn wrote:
> > > More details please.
> > >
> > > Linux assume it is driving the hardware. Your firmware cannot be
> > > touching any registers which will clear on read. QSFP states that
> > > registers 3-31 of page 0 are all clear on read, for example. The
> > > firmware should also not be setting any registers, otherwise you can
> > > confuse Linux which assumes registers it set stay set, because it is
> > > controlling the hardware.
> > >
> > > Your firmware also needs to handle that Linux can change the page. If
> > > the firmware changes the page, it must restore it back to whatever
> > > page Linux selected, etc.
> > >
> > > The fact you are submitting this for net suggests you have seen real
> > > issues. Please describe what those issues are.
> >
> > The error log shows:
> >
> > [257681.367827] sfp sfp.1025: Host maximum power 1.0W
> > [257681.370813] txgbe 0000:04:00.1: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:02:02.0
(capable
> > of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
> > [257681.373364] txgbe 0000:04:00.1 enp4s0f1: renamed from eth0
> > [257681.434719] txgbe 0000:04:00.1 enp4s0f1: configuring for inband/10gbase-r link mode
> > [257681.676747] sfp sfp.1025: EEPROM base structure checksum failure: 0x63 != 0x1f
> > [257681.676755] sfp EE: 00000000: 03 04 07 10 00 00 01 00 00 00 00 06 67 02 00 00  ............g...
> > [257681.676757] sfp EE: 00000010: 1e 0f 00 00 46 69 62 65 72 53 74 6f 72 65 20 64  ....FiberStore d
> > [257681.676759] sfp EE: 00000020: 20 20 20 20 00 00 1b 21 53 46 50 2d 31 30 47 53      ...!SFP-10GS
> > [257681.676760] sfp EE: 00000030: 52 2d 38 35 20 20 20 20 41 20 20 20 03 52 00 1f  R-85    A   .R..
> > [257681.676762] sfp EE: 00000040: 00 81 cd 5b df 25 0a bd 40 f6 c6 ce 47 8e ff ff  ...[.%..@...G...
> > [257681.676763] sfp EE: 00000050: 10 d8 24 33 44 8e ff ff 10 41 b0 9a ff ff ff ff  ..$3D....A......
> >
> > It looks like some fields are read incorrectly. For comparison, I printed the
> >  SFP info when it loaded correctly:
> >
> > [260908.194533] sfp EE: 00000000: 03 04 07 10 00 00 01 00 00 00 00 06 67 02 00 00  ............g...
> > [260908.194536] sfp EE: 00000010: 1e 0f 00 00 46 69 62 65 72 53 74 6f 72 65 20 20  ....FiberStore
> > [260908.194538] sfp EE: 00000020: 20 20 20 20 00 00 1b 21 53 46 50 2d 31 30 47 53      ...!SFP-10GS
> > [260908.194540] sfp EE: 00000030: 52 2d 38 35 20 20 20 20 41 20 20 20 03 52 00 1f  R-85    A   .R..
> > [260908.194541] sfp EE: 00000040: 40 63 bd df 40 8e ff ff 10 41 b0 9a ff ff ff ff  @c..@....A......
> > [260908.194543] sfp EE: 00000050: 10 58 5b 29 41 8e ff ff 10 41 b0 9a ff ff ff ff  .X[)A....A......
> > [260908.198205] sfp sfp.1025: module FiberStore       SFP-10GSR-85     rev A    sn G1804125607      dc 180605
> >
> > Since the read mechanism of I2C is to write the offset and read command
> > first, and then read the target address. I think it's possible that the different
> > offsets be written at the same time, from Linux and firmware.
> 
> O.K, that is bad. The SFP is totally unreliable...
> 
> You however have still not answered my question. What is the firmware
> accessing? How does it handle pages?
>
> The hack you have put in place is per i2c transaction. But accessing
> pages is likely to be multiple transactions. One to change the page,
> followed by a few reads/writes in the new page, then maybe followed by
> a transactions to return to page 0.

Do you mean the bus address A0 or A2? Firmware accesses I2C just like driver,
but it only change the page once per full transaction, during a possession of
the semaphore.  What you fear seems unlikely to happen.

> I think your best solution is to simply take the mutex and never
> release it. Block your firmware from accessing the SFP.

Firmware accesses the SFP in order to provide information to the BMC.
So it cannot simply be blocked.



