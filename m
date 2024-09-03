Return-Path: <linux-i2c+bounces-6026-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A78969E3E
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 14:48:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900231C215B3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 12:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2265227;
	Tue,  3 Sep 2024 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DD8tL+9q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6011F1CA691;
	Tue,  3 Sep 2024 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725367548; cv=none; b=uSDzWLwDqbXZfrp11p5wOdT2cZtcaGWSyv4fCXGyb2EOI8U3Fz0TybfQbkBHTY4ZeXQzQMVMWXEvlUMOz+0CXfHp87WsnaMz+zmhLebYuwT2LXrIHb040NGv9+Iw7sPz7CpRAjyUmOwLSaMgaFJWIy8ED4TCcDqOQIhlniM7+eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725367548; c=relaxed/simple;
	bh=7ttKxCoE7GSMsx2WogBL9+GX/hRN6m9P0iLBenm73qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvtrtyiEZW9YzMzmLi1mNRD3ugVT3s7KEDLveOu+Wy+ovWdNObySrwKJtTSe7uj5W3OFsIW8xZIYr1pYp0/N224ZzpyC5y2rPKXx5J5qHG7cr4JDvdM1RJog6zlCfEdEYwW/1Fb9Jisu2Vn7c24Swl8q2G1rAqhvawRQYzEr6YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DD8tL+9q; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cpg6a8Dw5deggTJRHinbjwWzY46RJB0BQlkELWRuOWo=; b=DD8tL+9q5H5pKcB+Qkocv8TQo5
	IzsbaSq65KZR1IuXZyoJZM9VGQBRgVvNUYRlWGiKHm4KJ/4AUP3gCsVbFK/SHc6b6BdRhX/Aanp6y
	ySQPo+n+zk8jVYYEW/24y5MM/L3xTZLrV09zOfoBXxTl9PoU3oUbT9CLgpkI0mDNmmwY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1slSuV-006QPX-I6; Tue, 03 Sep 2024 14:45:27 +0200
Date: Tue, 3 Sep 2024 14:45:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jiawen Wu <jiawenwu@trustnetic.com>
Cc: andi.shyti@kernel.org, jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
	jsd@semihalf.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, rmk+kernel@armlinux.org.uk,
	linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
	mengyuanlou@net-swift.com, duanqiangwen@net-swift.com
Subject: Re: [PATCH net 0/3] Add I2C bus lock for Wangxun
Message-ID: <7485fc03-79c3-4797-ab9a-9026b09aac7f@lunn.ch>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
 <888f78a9-dea9-4f66-a4d0-00a57039733d@lunn.ch>
 <01d701daf75c$50db4450$f291ccf0$@trustnetic.com>
 <55ff5570-5398-48e9-bf56-d34da197d175@lunn.ch>
 <020f01daf827$d765ffd0$8631ff70$@trustnetic.com>
 <509abfeb-b1fb-4c53-9898-6106c8dde411@lunn.ch>
 <02a001daf9de$529edd90$f7dc98b0$@trustnetic.com>
 <d91674af-1682-4efe-ad15-bd64f871c1de@lunn.ch>
 <03fc01dafdca$ef952100$cebf6300$@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03fc01dafdca$ef952100$cebf6300$@trustnetic.com>

> SFP+ is used on our device.
> 
> But I don't quite understand why this lock is not sufficient. The entire
> transaction is locked, include setting the bus address and selecting pages,
> and all subsequent reads and writes on this page. Also, firmware uses this
> lock (hardware semaphore) in the same way. Neither driver nor firmware
> switches pages whiling the other is reading / writing ?
 
The standard say you cannot read past a 1/2 page boundary. So you do
one i2c transaction to write to byte 127. You then do transactions to
write/read in the range 128-255. And then you do a transaction to
write to byte 127 to set the page back, maybe.

You would need to hold the lock over all these transactions. The i2c
bus driver is too low for this, it would need to be done in the SFP
layer. The firmware would also need to do the same, hold the lock over
all the transactions, not just one.

And i said 'maybe'. It could leave the page select byte on something
other than page 0. Linux is driving the hardware... It might know it
is going to use the same page sometime later. So the firmware will
need to take the lock, read byte 127, change it to whatever it needs,
do its read/writes, and then restore the page value at 127, and then
release the lock..

Also, you have to think about the quirks. Cut/paste from sfp.c:

/* SFP_EEPROM_BLOCK_SIZE is the size of data chunk to read the EEPROM
 * at a time. Some SFP modules and also some Linux I2C drivers do not like
 * reads longer than 16 bytes.
 */
#define SFP_EEPROM_BLOCK_SIZE   16

        /* Some SFP modules (e.g. Nokia 3FE46541AA) lock up if read from
         * address 0x51 is just one byte at a time. Also SFF-8472 requires
         * that EEPROM supports atomic 16bit read operation for diagnostic
         * fields, so do not switch to one byte reading at a time unless it
         * is really required and we have no other option.
         */

/* GPON modules based on Realtek RTL8672 and RTL9601C chips (e.g. V-SOL
 * V2801F, CarlitoxxPro CPGOS03-0490, Ubiquiti U-Fiber Instant, ...) do
 * not support multibyte reads from the EEPROM. Each multi-byte read
 * operation returns just one byte of EEPROM followed by zeros. There is
 * no way to identify which modules are using Realtek RTL8672 and RTL9601C
 * chips. Moreover every OEM of V-SOL V2801F module puts its own vendor
 * name and vendor id into EEPROM, so there is even no way to detect if
 * module is V-SOL V2801F. Therefore check for those zeros in the read
 * data and then based on check switch to reading EEPROM to one byte
 * at a time.
 */

How easy it is to update your firmware each time we add a quirk? There
is no point Linux working around all the broken SFPs if your firmware
then breaks it by not doing word reads when it should, reading 128
bytes not 16, not falling back to byte reads and disabling your
equivalent of HWMON for the sensors.

	Andrew

