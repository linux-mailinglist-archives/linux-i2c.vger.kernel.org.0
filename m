Return-Path: <linux-i2c+bounces-3690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE318D2213
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 18:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B97A1C226C4
	for <lists+linux-i2c@lfdr.de>; Tue, 28 May 2024 16:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5174517333A;
	Tue, 28 May 2024 16:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FMaIWg8Z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89957172BCE
	for <linux-i2c@vger.kernel.org>; Tue, 28 May 2024 16:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716915454; cv=none; b=uirESAgh7dYbDNhyo0lg/ORNMR0er2w+BcaMTVFgyBnZxHjaij4UuvmUXGpWrrrqnm5t6t3ql8Fkp4BEdLoYJH4oV9ymxvDunuEDjM8rEIfHZ6zL8nDYjVyImbwfpw+sPzC8pAPVM1JRxqXQa3+9OJu1kTxg9Qk/iJRGRmvxODI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716915454; c=relaxed/simple;
	bh=20lWxuyncauYpRPdcIP2qeiyq8Pn90Gk/tUHOS/51sw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=A5296ofB4zzW8OUGFuT9DOhYGiQ+nEUNmTjYBA1uU1c86K3o+68yY2dGmQtT1zz2OiaWdm+NgoQlKF+lIZDNQTFwM2PABuVTJ/AEmuHON2qZnLeb3d82yyYZYWH2N9uRhZbHwVvVQxdPnBkDeqxgPoYQgQ/xiEit9zIU05ZfBnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FMaIWg8Z; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: andrew@lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716915449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jNceAp37GB1si/9T0wIzhGZuQRX1PlheHnoihJOZ330=;
	b=FMaIWg8ZBt2go1CkaZdykQtMyRQWLzUq8vG5dX1s/BuhqoUK8kYWDN//VMNuJzplplQ8KU
	UotCwJMPUUHD+HUaf9QEb2kc1h/ThDL6i7kDh6wJxiHjxpl2L3ogNkU2MsEjKKGVo61l9D
	gfJpYBIKAlfY//vWE3msD2JkVLYGo3c=
X-Envelope-To: linux@armlinux.org.uk
X-Envelope-To: andi.shyti@kernel.org
X-Envelope-To: netdev@vger.kernel.org
X-Envelope-To: linux-i2c@vger.kernel.org
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: hkallweit1@gmail.com
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Message-ID: <ec7907f1-cb5a-41ab-824c-aa0b02440ada@linux.dev>
Date: Tue, 28 May 2024 12:57:25 -0400
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
Subject: [BUG] SFP I2C timeout forces link down with PHY_ERROR
To: Andrew Lunn <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>,
 Andi Shyti <andi.shyti@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>, linux-i2c@vger.kernel.org
Cc: Michal Simek <michal.simek@amd.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

I saw the following warning [1] twice when testing 1000Base-T SFP
modules:

[ 1481.682501] cdns-i2c ff030000.i2c: timeout waiting on completion
[ 1481.692010] Marvell 88E1111 i2c:sfp-ge3:16: Master/Slave resolution failed
[ 1481.699910] ------------[ cut here ]------------
[ 1481.705459] phy_check_link_status+0x0/0xe8: returned: -67
[ 1481.711448] WARNING: CPU: 2 PID: 67 at drivers/net/phy/phy.c:1233 phy_state_machine+0xac/0x2ec
<snip>
[ 1481.904544] macb ff0c0000.ethernet net1: Link is Down

and a second time with some other errors too:

[   64.972751] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
[   64.979478] cdns-i2c ff030000.i2c: xfer_size reg rollover. xfer aborted!
[   65.998108] cdns-i2c ff030000.i2c: timeout waiting on completion
[   66.010558] Marvell 88E1111 i2c:sfp-ge3:16: Master/Slave resolution failed
[   66.017856] ------------[ cut here ]------------
[   66.022786] phy_check_link_status+0x0/0xcc: returned: -67
[   66.028255] WARNING: CPU: 0 PID: 70 at drivers/net/phy/phy.c:1233 phy_state_machine+0xa4/0x2b8
<snip>
[   66.339533] macb ff0c0000.ethernet net1: Link is Down

The chain of events is:

- The I2C transaction times out for some reason (in the latter case due
  to a known hardware bug).
- mdio-i2c converts the error response to a 0xffff return value
- genphy_read_lpa sees that LPA_1000MSFAIL is set in MII_STAT1000 and
  returns -ENOLINK. This propagates up the calls stack.
- phy_check_link_status returns -ENOLINK
- phy_error_precise forces the link down with state = PHY_ERROR.

The problem with this is that although the register read fails due to a
temporary condition, the link goes down permanently (or at least until
the admin cycles the interface state).

I think some part of the stack should implement a retry mechanism, but
I'm not sure which part. One idea could be to have mdio-i2c propagate
negative errors instead of converting them to successful reads of
0xffff. But we would still need to handle that in the phy driver or in
phy_state_machine.

- Are I2C bus drivers supposed to be flaky like this? That is, are callers of
  i2c_transfer expected to handle the occasional spurious error?
- Similarly, are MDIO bus drivers allowed to be flaky?
- Is ETIMEDOUT even supposed to be recoverable? Maybe we should have
  cdns-i2c return EAGAIN instead so it gets retried by the bus
  arbitration logic in __i2c_transfer.
- ENOLINK really seems like something which we could recover from by
  resetting the phy (or even just waiting a bit). Maybe we should have
  the phy state machine just switch to PHY_NOLINK?

Of course, the best option would be to fix cdns-i2c to not be buggy, but
the hardware itself is buggy in at least one of the above cases so that
may not be practical.

--Sean

