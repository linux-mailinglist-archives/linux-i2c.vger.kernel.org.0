Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F2D237B35
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jun 2019 19:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730179AbfFFRhT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Thu, 6 Jun 2019 13:37:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:34358 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730201AbfFFRhT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Jun 2019 13:37:19 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id E5E97AF90;
        Thu,  6 Jun 2019 17:37:17 +0000 (UTC)
Date:   Thu, 6 Jun 2019 19:37:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Pali =?UTF-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
        Steven Honeyman <stevenhoneyman@gmail.com>,
        Valdis.Kletnieks@vt.edu,
        Jochen Eisinger <jochen@penguin-breeder.org>,
        Gabriele Mazzotta <gabriele.mzt@gmail.com>,
        Andy Lutomirski <luto@kernel.org>, Mario_Limonciello@dell.com,
        Alex Hung <alex.hung@canonical.com>,
        Takashi Iwai <tiwai@suse.de>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4] i2c: i801: Register optional lis3lv02d I2C device on
 Dell machines
Message-ID: <20190606193715.13e239e0@endymion>
In-Reply-To: <20190606154800.dpxl7hph5535faya@pali>
References: <20190604223303.31945-1-pali.rohar@gmail.com>
        <20190606165309.4a3c81c0@endymion>
        <20190606154800.dpxl7hph5535faya@pali>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 6 Jun 2019 17:48:00 +0200, Pali Rohár wrote:
> On Thursday 06 June 2019 16:53:09 Jean Delvare wrote:
> > This is testing that *either* bit is set. Is it what you intend to
> > achieve, or would you rather want to ensure that *all* these bits are
> > set?  
> 
> Of course, it is wrong. Thanks for catch. We should ignore apci devices
> which are not present, which are disabled or which are not functioning.
> 
> Now I looked into acpi_get_devices() implementation and it call
> acpi_ns_get_device_callback() function callback for every device. At the
> end that function calls user supplied check_acpi_smo88xx_device
> function.
> 
> And acpi_ns_get_device_callback() already ignores acpi devices which do
> not have ACPI_STA_DEVICE_PRESENT or ACPI_STA_DEVICE_FUNCTIONING flag.
> 
> According to acpi documentation when ACPI_STA_DEVICE_PRESENT is not set
> then ACPI_STA_DEVICE_ENABLED also cannot be set.
> 
> So the whole acpi_bus_get_status_handle() is not needed at all as
> acpi_get_devices() via acpi_ns_get_device_callback() already filter
> unsuitable acpi devices.
> 
> I guess that I already did this investigation in past and added comment
> "exists and is enabled" which is below near acpi_get_devices() call. But
> as I wrote this patch more then year ago I forgot about it.

Sorry for confusing you :-(

> I will remove that check. Do you have any suggestion what to write into
> comment so other readers in future would know that we do not need to
> check anything with _STA acpi method?

Well, if you manage to squeeze a short version of the above explanation
at the relevant place in the driver, that should work. Doesn't have to
be verbose really, anything that says that disabled devices will be
properly skipped for us will be good enough.

-- 
Jean Delvare
SUSE L3 Support
