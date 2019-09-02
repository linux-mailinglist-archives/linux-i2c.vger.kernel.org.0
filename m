Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3504CA5AAE
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2019 17:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725839AbfIBPlE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Sep 2019 11:41:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:49564 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725815AbfIBPlE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Sep 2019 11:41:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 736C5AE3A;
        Mon,  2 Sep 2019 15:41:03 +0000 (UTC)
Date:   Mon, 2 Sep 2019 17:41:11 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Hans L <thehans@gmail.com>
Cc:     linux-i2c@vger.kernel.org
Subject: Re: Problems with decode-dimms
Message-ID: <20190902174111.4d412d56@endymion>
In-Reply-To: <CAFoRp-MbjNJYmGQ=Sa5htJQFT5n_hEK-_d+nHv7jmF+W=rOkeg@mail.gmail.com>
References: <CAFoRp-PH=Bjs+vSmCvA9i0X3Jw7M6zuUCew7y=A7gxNUSrRZ7g@mail.gmail.com>
        <20190902112902.6b1abf42@endymion>
        <CAFoRp-MbjNJYmGQ=Sa5htJQFT5n_hEK-_d+nHv7jmF+W=rOkeg@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 2 Sep 2019 09:56:38 -0500, Hans L wrote:
> So I ended up running:
> $ sudo su
> # echo ee1004 0x50 > /sys/bus/i2c/devices/i2c-1/new_device
> # echo ee1004 0x51 > /sys/bus/i2c/devices/i2c-1/new_device
> # echo ee1004 0x52 > /sys/bus/i2c/devices/i2c-1/new_device
> # echo ee1004 0x53 > /sys/bus/i2c/devices/i2c-1/new_device
> [Ctrl-D]
> 
> For some reason which I still don't understand, I couldn't just run
> each command directly with sudo:
> $ sudo echo eeprom 0x50 > /sys/bus/i2c/devices/i2c-1/new_device
> bash: /sys/bus/i2c/devices/i2c-1/new_device: Permission denied

Can be surprising at first but is easily explained. The shell processes
the redirection before executing the command. So it is
opening /sys/bus/i2c/devices/i2c-1/new_device as yourself, *then*
executes echo as root. What you really want to do is:

$ such sh -c "echo ee1004 0x50 > /sys/bus/i2c/devices/i2c-1/new_device"

which will force the user change to happen *before* the redirection.

-- 
Jean Delvare
SUSE L3 Support
