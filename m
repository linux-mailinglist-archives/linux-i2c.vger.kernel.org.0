Return-Path: <linux-i2c+bounces-5818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B9995FEF6
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 04:22:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3D6F1F22845
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 02:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DE08BEA;
	Tue, 27 Aug 2024 02:21:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8782CA9;
	Tue, 27 Aug 2024 02:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724725317; cv=none; b=cHGfETT8ybqYS5F5u/jrapp7wlrxP6InzsQopNyFNZZghgNHlKRdLPGQtWYV2G0B6NQwpuYSql9or7S4g4ATidRSp1KwIifKEHB5Nv5FzkRVrYeMLSOwtnoGJoUFYOKVsithRwgqNyl/XRwhoBiptWuvAT97YFnVIHmwvJzrpt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724725317; c=relaxed/simple;
	bh=8VBrrGu3oos3uM4w05GpcBqNhAFWmQIZAT+ADgG4gsQ=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=KSzkJrcflwQzoJBPs1DYxqU08AT2liac/kR8ITTJC9jylkb5DLcoGNDDdbEv5ar8VLGXPE4KW12FpklBx7ijfl1N+7Vxjj2+jFDjuS+PYMq6684phmW7DENhMuHXpJK7o2Zi8h8weMHQwUwkwfFu9qo6/dsJ9Lu2RSlX70EtNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas5t1724725296t961t18306
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [125.120.181.182])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 16520017505562810091
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
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch> <01d701daf75c$50db4450$f291ccf0$@trustnetic.com> <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch>
In-Reply-To: <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch>
Subject: RE: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Tue, 27 Aug 2024 10:21:36 +0800
Message-ID: <020f01daf827$d765ffd0$8631ff70$@trustnetic.com>
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
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gGW9YksAYhjRIgArI2qV7HZn86A
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Mon, Aug 26, 2024 10:34 AM, Andrew Lunn wrote:
> On Mon, Aug 26, 2024 at 10:04:42AM +0800, Jiawen Wu wrote:
> > On Mon, Aug 26, 2024 9:33 AM, Andrew Lunn wrote:
> > > On Fri, Aug 23, 2024 at 11:02:39AM +0800, Jiawen Wu wrote:
> > > > Sometimes the driver can not get the SFP information because the I2C bus
> > > > is accessed by the firmware at the same time.
> > >
> > > Please could you explain this some more. What firmware?
> >
> > It's the firmware of our ethernet devices.
> >
> > > There some registers which are clear on read. They don't work when you
> > > have multiple entities reading them.
> >
> > I'm not trying to multiple access the I2C registers, but these registers cannot
> > be accessed by other interfaces in the process of reading complete information
> > each time. So there is a semaphore needed that locks up the entire read process.
> 
> More details please.
> 
> Linux assume it is driving the hardware. Your firmware cannot be
> touching any registers which will clear on read. QSFP states that
> registers 3-31 of page 0 are all clear on read, for example. The
> firmware should also not be setting any registers, otherwise you can
> confuse Linux which assumes registers it set stay set, because it is
> controlling the hardware.
> 
> Your firmware also needs to handle that Linux can change the page. If
> the firmware changes the page, it must restore it back to whatever
> page Linux selected, etc.
> 
> The fact you are submitting this for net suggests you have seen real
> issues. Please describe what those issues are.

The error log shows:

[257681.367827] sfp sfp.1025: Host maximum power 1.0W
[257681.370813] txgbe 0000:04:00.1: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:02:02.0 (capable
of 63.008 Gb/s with 8.0 GT/s PCIe x8 link)
[257681.373364] txgbe 0000:04:00.1 enp4s0f1: renamed from eth0
[257681.434719] txgbe 0000:04:00.1 enp4s0f1: configuring for inband/10gbase-r link mode
[257681.676747] sfp sfp.1025: EEPROM base structure checksum failure: 0x63 != 0x1f
[257681.676755] sfp EE: 00000000: 03 04 07 10 00 00 01 00 00 00 00 06 67 02 00 00  ............g...
[257681.676757] sfp EE: 00000010: 1e 0f 00 00 46 69 62 65 72 53 74 6f 72 65 20 64  ....FiberStore d
[257681.676759] sfp EE: 00000020: 20 20 20 20 00 00 1b 21 53 46 50 2d 31 30 47 53      ...!SFP-10GS
[257681.676760] sfp EE: 00000030: 52 2d 38 35 20 20 20 20 41 20 20 20 03 52 00 1f  R-85    A   .R..
[257681.676762] sfp EE: 00000040: 00 81 cd 5b df 25 0a bd 40 f6 c6 ce 47 8e ff ff  ...[.%..@...G...
[257681.676763] sfp EE: 00000050: 10 d8 24 33 44 8e ff ff 10 41 b0 9a ff ff ff ff  ..$3D....A......
 
It looks like some fields are read incorrectly. For comparison, I printed the
 SFP info when it loaded correctly:

[260908.194533] sfp EE: 00000000: 03 04 07 10 00 00 01 00 00 00 00 06 67 02 00 00  ............g...
[260908.194536] sfp EE: 00000010: 1e 0f 00 00 46 69 62 65 72 53 74 6f 72 65 20 20  ....FiberStore
[260908.194538] sfp EE: 00000020: 20 20 20 20 00 00 1b 21 53 46 50 2d 31 30 47 53      ...!SFP-10GS
[260908.194540] sfp EE: 00000030: 52 2d 38 35 20 20 20 20 41 20 20 20 03 52 00 1f  R-85    A   .R..
[260908.194541] sfp EE: 00000040: 40 63 bd df 40 8e ff ff 10 41 b0 9a ff ff ff ff  @c..@....A......
[260908.194543] sfp EE: 00000050: 10 58 5b 29 41 8e ff ff 10 41 b0 9a ff ff ff ff  .X[)A....A......
[260908.198205] sfp sfp.1025: module FiberStore       SFP-10GSR-85     rev A    sn G1804125607      dc 180605

Since the read mechanism of I2C is to write the offset and read command
first, and then read the target address. I think it's possible that the different
offsets be written at the same time, from Linux and firmware.



