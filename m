Return-Path: <linux-i2c+bounces-8259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3029DC1BD
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 10:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC90F1632BC
	for <lists+linux-i2c@lfdr.de>; Fri, 29 Nov 2024 09:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8E418858A;
	Fri, 29 Nov 2024 09:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KHsdzp7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47938183CB8;
	Fri, 29 Nov 2024 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732874086; cv=none; b=j85hn5cC0Jktg51zT7HULbe1tAx0dtOfO3H/TBhG4ZawJ3E5T1sa2zMXmIfNdNLM2/BOz9nH9AJGqdLHKACvrjW0qgwkBpWyvyXYyatiks8vvunQd6wH7LoID2KQy+qkb5pOHHTR4o+5I1leBkNRjpkj++HUIgS20YKO4aXVvlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732874086; c=relaxed/simple;
	bh=KL4bVis3gEo0B4TOmVGIBjdTbMicbca8z4NKFTxx3A4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DNdARoe6R9AFTQmqXBH3tuECVT+Z1hyRT4WexJvrxsyex52NWgyyS1GeDzVylRnywD8jbTDBH+V9LnI2NP4Ea0ATqtIv6zWQZwIoC2AAzVPoUqSFW3esz4ycWP2e/yakNwdAnl0MXhsxvXGeKL8pjghof/3DP6xgMeyXmQjAm/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KHsdzp7a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91EC0A8F;
	Fri, 29 Nov 2024 10:54:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1732874055;
	bh=KL4bVis3gEo0B4TOmVGIBjdTbMicbca8z4NKFTxx3A4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KHsdzp7a4AV03+w/uEFFdkB8i8wbNRS9goa6OVXNI3EQJkuYdVOPnpRRVWCR9b/Zm
	 sK9ah/osEiC+EcVpYqOQXJC6rWKfR/Kc/e9VFPzXd0H/DNMfsfSUg3yjct91oz76+5
	 WunRYG7+W3dPdiUFun0fky7U/aaYlqln8HvCzUKY=
Message-ID: <141bbac1-5289-4335-a566-387721439bef@ideasonboard.com>
Date: Fri, 29 Nov 2024 11:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] i2c: Support dynamic address translation
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kory Maincent <kory.maincent@bootlin.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Cosmin Tanislav <demonsingur@gmail.com>
References: <20241125-fpc202-v3-0-34e86bcb5b56@bootlin.com>
 <20241125-fpc202-v3-8-34e86bcb5b56@bootlin.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20241125-fpc202-v3-8-34e86bcb5b56@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Romain,

On 25/11/2024 10:45, Romain Gantois wrote:
> The i2c-atr module keeps a list of associations between I2C client aliases
> and I2C addresses. This represents the address translation table which is
> programmed into an ATR channel at any given time. This list is only updated
> when a new client is bound to the channel.
> 
> However in some cases, an ATR channel can have more downstream clients than
> available aliases. One example of this is an SFP module that is bound to an
> FPC202 port. The FPC202 port can only access up to two logical I2C
> addresses. However, the SFP module may expose up to three logical I2C
> addresses: its EEPROM on 7-bit addresses 0x50 and 0x51, and a PHY
> transceiver on address 0x56.
> 
> In cases like these, it is necessary to reconfigure the channel's
> translation table on the fly, so that all three I2C addresses can be
> accessed when needed.
> 
> Add an optional "dynamic_c2a" flag to the i2c-atr module which allows it to
> provide on-the-fly address translation. This is achieved by modifying an
> ATR channel's translation table whenever an I2C transaction with unmapped
> clients is requested.
> 
> Add a mutex to protect alias_list. This prevents
> i2c_atr_dynamic_attach/detach_addr from racing with the bus notifier
> handler to modify alias_list.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
>   drivers/i2c/i2c-atr.c         | 244 ++++++++++++++++++++++++++++++++----------
>   drivers/media/i2c/ds90ub960.c |   2 +-
>   include/linux/i2c-atr.h       |  13 ++-
>   3 files changed, 202 insertions(+), 57 deletions(-)

This fails with:

WARNING: CPU: 1 PID: 360 at lib/list_debug.c:35 
__list_add_valid_or_report+0xe4/0x100

as the i2c_atr_create_c2a() calls list_add(), but i2c_atr_attach_addr(), 
which is changed to use i2c_atr_create_c2a(), also calls list_add().

Also, if you add i2c_atr_create_c2a() which hides the allocation and 
list_add, I think it makes sense to add a i2c_atr_destroy_c2a() to 
revert that.

There's also a memory error "BUG: KASAN: slab-use-after-free in 
__lock_acquire+0xc4/0x375c" (see below) when unloading the ub960 or 
ub953 driver. I haven't looked at that yet.

  Tomi

   316.204193] BUG: KASAN: slab-use-after-free in __lock_acquire+0xc4/0x375c
[  316.211059] Read of size 4 at addr cc44d558 by task rmmod/1505
[  316.216979]
[  316.218475] CPU: 1 UID: 0 PID: 1505 Comm: rmmod Not tainted 6.12.0+ #2
[  316.225097] Hardware name: Generic DRA74X (Flattened Device Tree)
[  316.231231] Call trace:
[  316.231262]  unwind_backtrace from show_stack+0x18/0x1c
[  316.239105]  show_stack from dump_stack_lvl+0x6c/0x8c
[  316.244232]  dump_stack_lvl from print_report+0x130/0x538
[  316.249694]  print_report from kasan_report+0x98/0xd8
[  316.254821]  kasan_report from __lock_acquire+0xc4/0x375c
[  316.260284]  __lock_acquire from lock_acquire.part.0+0x128/0x340
[  316.266357]  lock_acquire.part.0 from _raw_spin_lock+0x4c/0x5c
[  316.272247]  _raw_spin_lock from i2c_atr_release_alias+0x20/0x98 
[i2c_atr]
[  316.279235]  i2c_atr_release_alias [i2c_atr] from 
i2c_atr_bus_notifier_call+0x150/0x46c [i2c_atr]
[  316.288238]  i2c_atr_bus_notifier_call [i2c_atr] from 
notifier_call_chain+0x68/0x23c
[  316.296081]  notifier_call_chain from 
blocking_notifier_call_chain+0x5c/0x74
[  316.303192]  blocking_notifier_call_chain from bus_notify+0x3c/0x48
[  316.309539]  bus_notify from device_del+0xf0/0x514
[  316.314392]  device_del from device_unregister+0x28/0x80
[  316.319763]  device_unregister from __unregister_client+0x84/0x90
[  316.325927]  __unregister_client from device_for_each_child+0xc0/0x12c
[  316.332550]  device_for_each_child from i2c_del_adapter+0x28c/0x45c
[  316.338897]  i2c_del_adapter from i2c_atr_del_adapter+0x10c/0x250 
[i2c_atr]
[  316.345947]  i2c_atr_del_adapter [i2c_atr] from 
ub953_remove+0x48/0xcc [ds90ub953]
[  316.353637]  ub953_remove [ds90ub953] from i2c_device_remove+0x54/0xf8
[  316.360260]  i2c_device_remove from 
device_release_driver_internal+0x218/0x2a8
[  316.367553]  device_release_driver_internal from 
bus_remove_device+0x130/0x1cc
[  316.374847]  bus_remove_device from device_del+0x1f8/0x514
[  316.380401]  device_del from device_unregister+0x28/0x80
[  316.385772]  device_unregister from ub960_remove+0xb0/0x244 [ds90ub960]
[  316.392517]  ub960_remove [ds90ub960] from i2c_device_remove+0x54/0xf8
[  316.399139]  i2c_device_remove from 
device_release_driver_internal+0x218/0x2a8
[  316.406433]  device_release_driver_internal from driver_detach+0x6c/0xc4
[  316.413238]  driver_detach from bus_remove_driver+0xa0/0x134
[  316.418945]  bus_remove_driver from i2c_del_driver+0x48/0x84
[  316.424682]  i2c_del_driver from sys_delete_module+0x280/0x3cc
[  316.430572]  sys_delete_module from ret_fast_syscall+0x0/0x1c


