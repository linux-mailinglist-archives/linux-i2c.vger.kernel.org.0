Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96BEA3DA12E
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Jul 2021 12:39:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235887AbhG2KjR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Jul 2021 06:39:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233273AbhG2KjJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Jul 2021 06:39:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DF6660720;
        Thu, 29 Jul 2021 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627555146;
        bh=bZVuBVFUJ64Ac6eCV4x63SJzQtCFqISOkoxt63NBgKo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=N7IpwIzfkkF0iQc9UkJCL5tLuVVCB5WR7b5mL6IWaIG6dKEU1Buc9yyOzINPjHwRQ
         +SYE+pL0ipcSM94O1tJhkcwmWt3k0iIIjHq6/b04azL7JboN9c/pzhmup8RBMydw3h
         lG3EjuNAospKhmwRX9qMVmLrvc5diygcaetoWwk7fm1nG52DGvtS50c5zxVdpT9dOy
         a70o868DguxQZglQdg7N2IlhtiU2g5AjCSgnQNlhGhJqB99cWSuzsqUgbNy3uhRxOE
         rpXTZEiw6YS4+TeOUB+MzQGgSO4z9pySlu8BKvFgi5avR1XEXrOjBu35+GCAh2V3Qx
         Flle/Ziw/fWwQ==
Date:   Thu, 29 Jul 2021 12:39:03 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Michael Zaidman <michael.zaidman@gmail.com>
cc:     benjamin.tissoires@redhat.com, aaron.jones@ftdichip.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] HID: ft260: fix device removal due to USB
 disconnect
In-Reply-To: <20210729102603.3844-1-michael.zaidman@gmail.com>
Message-ID: <nycvar.YFH.7.76.2107291238490.8253@cbobk.fhfr.pm>
References: <nycvar.YFH.7.76.2107281147160.8253@cbobk.fhfr.pm> <20210729102603.3844-1-michael.zaidman@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 29 Jul 2021, Michael Zaidman wrote:

> This commit fixes a functional regression introduced by the commit 82f09a637dd3
> ("HID: ft260: improve error handling of ft260_hid_feature_report_get()")
> when upon USB disconnect, the FTDI FT260 i2c device is still available within
> the /dev folder.
> 
> In my company's product, where the host USB to FT260 USB connection is
> hard-wired in the PCB, the issue is not reproducible. To reproduce it, I used
> the VirtualBox Ubuntu 20.04 VM and the UMFT260EV1A development module for the
> FTDI FT260 chip:
> 
> Plug the UMFT260EV1A module into a USB port and attach it to VM.
> 
> The VM shows 2 i2c devices under the /dev:
>     michael@michael-VirtualBox:~$ ls /dev/i2c-*
>     /dev/i2c-0  /dev/i2c-1
> 
> The i2c-0 is not related to the FTDI FT260:
>     michael@michael-VirtualBox:~$ cat /sys/bus/i2c/devices/i2c-0/name
>     SMBus PIIX4 adapter at 4100
> 
> The i2c-1 is created by hid-ft260.ko:
>     michael@michael-VirtualBox:~$ cat /sys/bus/i2c/devices/i2c-1/name
>     FT260 usb-i2c bridge on hidraw1
> 
> Now, detach the FTDI FT260 USB device from VM. We expect the /dev/i2c-1
> to disappear, but it's still here:
>     michael@michael-VirtualBox:~$ ls /dev/i2c-*
>     /dev/i2c-0  /dev/i2c-1
> 
> And the kernel log shows:
>     [  +0.001202] usb 2-2: USB disconnect, device number 3
>     [  +0.000109] ft260 0003:0403:6030.0002: failed to retrieve system status
>     [  +0.000316] ft260 0003:0403:6030.0003: failed to retrieve system status
> 
> It happens because the commit 82f09a637dd3 changed the ft260_get_system_config()
> return logic. This caused the ft260_is_interface_enabled() to exit with error
> upon the FT260 device USB disconnect, which in turn, aborted the ft260_remove()
> before deleting the FT260 i2c device and cleaning its sysfs stuff.
> 
> This commit restores the FT260 USB removal functionality and improves the
> ft260_is_interface_enabled() code to handle correctly all chip modes defined
> by the device interface configuration pins DCNF0 and DCNF1.
> 
> Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
> Acked-by: Aaron Jones (FTDI-UK) <aaron.jones@ftdichip.com>

Thanks for the respin. Queued in for-5.14/upstream-fixes.

-- 
Jiri Kosina
SUSE Labs

