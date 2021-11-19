Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880114570F5
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 15:46:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235073AbhKSOtj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 09:49:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:40380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234402AbhKSOtj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 19 Nov 2021 09:49:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 022A761546;
        Fri, 19 Nov 2021 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637333197;
        bh=zCcY+VFf57S76r68pFY7JNDJn5iVG1TUoLBjwC2jrB8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NaY+nuvS8ONJeAbhT5jC1TrqeOBSZc1Ss+MvcP6G2buRvoiXmZl7ogsQ/YWmy3VKW
         PyBt/uhIcxt1bqubCXpQqI2llQwULERHG6pRhYhJQ/alFbzxTh9xi6LaaBPwsit/XG
         WnHBc/Tg93vbr5VpeeSkkO2lMhL9vbVriXuPxZTtNUey0Yz7h51b7dbbpPaDAGK7zC
         vfUYn6PhacuC2+Y31govhapKzCTzkIMFJc5VymLHOJhsfHrdr9biMqJ7HeSqHYGjBi
         LAvyYq950zeeFoPuJ4++DDDmh9wvy47GhZbWJLMKzBd7MdjbGqmA7Sjop72hyfTKBh
         YsxDWqaP9p9xg==
Date:   Fri, 19 Nov 2021 15:46:20 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     benjamin.tissoires@redhat.com, aaron.jones@ftdichip.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Germain Hebert <germain.hebert@ca.abb.com>
Subject: Re: [PATCH v1] HID: ft260: fix i2c probing for hwmon devices
In-Reply-To: <20211023193957.5002-1-michael.zaidman@gmail.com>
Message-ID: <nycvar.YFH.7.76.2111191546070.16505@cbobk.fhfr.pm>
References: <20211023193957.5002-1-michael.zaidman@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, 23 Oct 2021, Michael Zaidman wrote:

> The below scenario causes the kernel NULL pointer dereference failure:
> 1. sudo insmod hid-ft260.ko
> 2. sudo modprobe lm75
> 3. unplug USB hid-ft260
> 4. plug USB hid-ft260
> 
> [  +0.000006] Call Trace:
> [  +0.000004]  __i2c_smbus_xfer.part.0+0xd1/0x310
> [  +0.000007]  ? ft260_smbus_write+0x140/0x140 [hid_ft260]
> [  +0.000005]  __i2c_smbus_xfer+0x2b/0x80
> [  +0.000004]  i2c_smbus_xfer+0x61/0xf0
> [  +0.000005]  i2c_default_probe+0xf9/0x130
> [  +0.000004]  i2c_detect_address+0x84/0x160
> [  +0.000004]  ? kmem_cache_alloc_trace+0xf6/0x200
> [  +0.000009]  ? i2c_detect.isra.0+0x69/0x130
> [  +0.000005]  i2c_detect.isra.0+0xbf/0x130
> [  +0.000004]  ? __process_new_driver+0x30/0x30
> [  +0.000004]  __process_new_adapter+0x18/0x20
> [  +0.000004]  bus_for_each_drv+0x84/0xd0
> [  +0.000003]  i2c_register_adapter+0x1e4/0x400
> [  +0.000005]  i2c_add_adapter+0x5c/0x80
> [  +0.000004]  ft260_probe.cold+0x222/0x2e2 [hid_ft260]
> [  +0.000006]  hid_device_probe+0x10e/0x170 [hid]
> [  +0.000009]  really_probe+0xff/0x460
> [  +0.000004]  driver_probe_device+0xe9/0x160
> [  +0.000003]  __device_attach_driver+0x71/0xd0
> [  +0.000004]  ? driver_allows_async_probing+0x50/0x50
> [  +0.000004]  bus_for_each_drv+0x84/0xd0
> [  +0.000002]  __device_attach+0xde/0x1e0
> [  +0.000004]  device_initial_probe+0x13/0x20
> [  +0.000004]  bus_probe_device+0x8f/0xa0
> [  +0.000003]  device_add+0x333/0x5f0
> 
> It happened when i2c core probed for the devices associated with the lm75
> driver by invoking 2c_detect()-->..-->ft260_smbus_write() from within the
> ft260_probe before setting the adapter data with i2c_set_adapdata().
> 
> Moving the i2c_set_adapdata() before i2c_add_adapter() fixed the failure.
> 
> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Signed-off-by: Germain Hebert <germain.hebert@ca.abb.com>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

