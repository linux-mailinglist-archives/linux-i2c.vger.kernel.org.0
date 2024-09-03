Return-Path: <linux-i2c+bounces-6014-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A741F9693AD
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 08:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABA7A284583
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 06:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0811D0DE6;
	Tue,  3 Sep 2024 06:32:10 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF72E3EB;
	Tue,  3 Sep 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725345129; cv=none; b=hIUehsqk7NzhRa8OBYdbrwyCG2U/TGiXnjVAm6gHJ9mDCFEa1BUwCEu+tGHOt21a0vKDS2TXfZ90T0Kx8fltmD/gyDYMunBmfSIkfuvSnGglp04SjKYKZ9unOCjkwveRj0WL7ICCRWSognfI5aWYRT9HLeYQ2a37HAwf4rOfCC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725345129; c=relaxed/simple;
	bh=TQJ7arkdIBp5yX+vuXqYFlQY5ccrRvnjonclOD81gd0=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=hPqz9MzeoPVJT5Z9ffZBIMOBSfekufRZ2PLpdlJ4GyBHM9eIo6ZtXzBt964djFg42WzYpbPD+5BUj7c/4hcPZhbvO+dWgz3FA8mOCqSrLNzpShbLTq2XTY35CCbIgisrB7qszDJ9ECd7Pc2j8y1vH6anC0tDSMJGOHGbykOG3Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid:Yeas4t1725345101t318t42991
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [36.24.207.154])
X-QQ-SSF:00400000000000F0FVF000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 10604168048739067028
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
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com> <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch> <01d701daf75c$50db4450$f291ccf0$@trustnetic.com> <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch> <020f01daf827$d765ffd0$8631ff70$@trustnetic.com> <509abfeb-b1fb-4c53-9898-6106c8dde411@lunn.ch> <02a001daf9de$529edd90$f7dc98b0$@trustnetic.com> <d91674af-1682-4efe-ad15-bd64f871c1de@lunn.ch>
In-Reply-To: <d91674af-1682-4efe-ad15-bd64f871c1de@lunn.ch>
Subject: RE: [PATCH net 0/3] Add I2C bus lock for Wangxun
Date: Tue, 3 Sep 2024 14:31:40 +0800
Message-ID: <03fc01dafdca$ef952100$cebf6300$@trustnetic.com>
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
Thread-Index: AQH8I/V4PrHZ+O/IFu6cfIurHK/3+gGW9YksAYhjRIgArI2qVwHKSDtnAdofD30BqZdG0QHWvGUmsaUz5dA=
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

On Thu, Aug 29, 2024 11:28 PM, Andrew Lunn wrote:
> > > O.K, that is bad. The SFP is totally unreliable...
> > >
> > > You however have still not answered my question. What is the firmware
> > > accessing? How does it handle pages?
> > >
> > > The hack you have put in place is per i2c transaction. But accessing
> > > pages is likely to be multiple transactions. One to change the page,
> > > followed by a few reads/writes in the new page, then maybe followed by
> > > a transactions to return to page 0.
> >
> > Do you mean the bus address A0 or A2? Firmware accesses I2C just like driver,
> > but it only change the page once per full transaction, during a possession of
> > the semaphore.  What you fear seems unlikely to happen.
> 
> What sort of SFP is this? QSFP byte 127 selects the page for addresses
> 128-255. Paged 0 and 3 are mandatory, pages 1 and 2 are optional.
>
> SFP+ also uses byte 127 in the same way:
> 
> 10.3 Optional Page Select Byte [Address A2h, Byte 127]
> 
> In order to provide memory space for DWDM and CDR control functions
> and for other potential extensions, multiple Pages can be defined for
> the upper half of the A2h address space. At startup the value of byte
> 127 defaults to 00h, which points to the User EEPROM. This ensures
> backward compatibility for transceivers that do not implement the
> optional Page structure. When a Page value is written to byte 127,
> subsequent reads and writes to bytes 128-255 are made to the relevant
> Page.
> 
> This specification defines functions in Pages 00h-02h. Pages 03-7Fh
> are reserved for future use. Writing the value of a non-supported Page
> shall not be accepted by the transceiver. The Page Select byte shall
> revert to 0 and read / write operations shall be to the unpaged A2h
> memory map.
> 
> ethtool allows you to access more than page 0.
> 
> ethtool -m|--dump-module-eeprom|--module-info devname [raw on|off]
>         [hex on|off] [offset N] [length N] [page N] [bank N] [i2c N]
> 
> > > I think your best solution is to simply take the mutex and never
> > > release it. Block your firmware from accessing the SFP.
> >
> > Firmware accesses the SFP in order to provide information to the BMC.
> > So it cannot simply be blocked.
> 
> Then you have a design problem. And i don't think locking the I2C bus
> per transaction is sufficient.

SFP+ is used on our device.

But I don't quite understand why this lock is not sufficient. The entire
transaction is locked, include setting the bus address and selecting pages,
and all subsequent reads and writes on this page. Also, firmware uses this
lock (hardware semaphore) in the same way. Neither driver nor firmware
switches pages whiling the other is reading / writing ?



