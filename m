Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20942C98ED
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 09:15:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbgLAIOp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 03:14:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727614AbgLAIOp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 03:14:45 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A91ACC0613CF;
        Tue,  1 Dec 2020 00:13:58 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id i2so1222578wrs.4;
        Tue, 01 Dec 2020 00:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=masMbzOuv1i3EjLVzjUj5pmXGx6KgBwTElZ8gmcjJ2g=;
        b=tRKmuNRqD+GylV+WtOEL1U97ErHka7EYII61/sc8QbvW78gCgo9voRoDuEJchsUnMG
         q6dQTwUN9oW7h/AXDYtXkyaHLMkNfWi7ESi0/hVkNPbIo+AN/y10ak5PSfGMNnSrhmSd
         3hPvEtcdw9B3qUolhnETzidlrB0fMTiLk1XaCa8h5wcun3o5T/cAQa4EKWDbeyrlPXQS
         sbDk4afXKuCThjIo56qIikHgLZdXtRomofqftqQLBvXRAJyqZbzLmTqWbk0/5RVKBmEv
         oinjB/ldPsvo1tdG2XpE+PKZOqsNIS45WRDR/nDquPqV8mpLE8+uYqOqyLxCqOYtS0yU
         HMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=masMbzOuv1i3EjLVzjUj5pmXGx6KgBwTElZ8gmcjJ2g=;
        b=TmDNEPolHyw7v2evMiBDYq4T1OAuyiQVQQlTmrV3EMU6eDGgC/QWrKcqN6uLRISvpB
         fHHcTPMXItrq2QlNKbsKR1VENu0D/qfR3swFeAaQ24KUOo1962QS9dKZHSEBfOD2Qm5u
         sGCzA+JMMKe4NtRhb1wEFehPdXRixFfp4MoWPDf+Yy+6l+NNSztIcegj6plGymvROEce
         eXlx4YZ5s0EH0Ago40KM7dVScF8nph7+aUIJuYFdfYHJvxTFvrAdkYfGcDHXZNv+Olsp
         A8CKfl2vxXSIx02IzR/KcSD2MTUK6shABVitugEQ0+ZCcLRcVJCalHxgvxuYwoUk8rwX
         q6aQ==
X-Gm-Message-State: AOAM532WzJBM3OQLST6KhXAzlNB/Z1XpCykb5mZcoo4Qt8alrEf1i5Ul
        DsAureSO4KhRAPGHdzM+m6A=
X-Google-Smtp-Source: ABdhPJzwnCP672ZFgr/sDvpk30Nl5M04DeCqaFz2VyjzNh8vqc9OwEgtlWQOvVlgdRQCkeqx1aPX/g==
X-Received: by 2002:adf:a1c2:: with SMTP id v2mr2205179wrv.95.1606810437376;
        Tue, 01 Dec 2020 00:13:57 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id v20sm1439532wmh.44.2020.12.01.00.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 00:13:56 -0800 (PST)
Subject: Re: [PATCH 13/18] ipu3-cio2: Add functionality allowing software_node
 connections to sensors on platforms designed for Windows
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-14-djrscally@gmail.com>
 <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <40d355af-2e6e-54c7-92f8-143dafe82934@gmail.com>
Date:   Tue, 1 Dec 2020 08:13:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201130203551.GP4351@valkosipuli.retiisi.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sakari

On 30/11/2020 20:35, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the update! This is starting to look really nice!
>
> Please still see my comments below.

Thanks!

>
> On Mon, Nov 30, 2020 at 01:31:24PM +0000, Daniel Scally wrote:
>> Currently on platforms designed for Windows, connections between CIO2 and
>> sensors are not properly defined in DSDT. This patch extends the ipu3-cio2
>> driver to compensate by building software_node connections, parsing the
>> connection properties from the sensor's SSDB buffer.
>>
>> Suggested-by: Jordan Hand <jorhand@linux.microsoft.com>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>> Changes since RFC v3:
>>
>> 	- Removed almost all global variables, dynamically allocated
>> 	the cio2_bridge structure, plus a bunch of associated changes
>> 	like 
>> 	- Added a new function to ipu3-cio2-main.c to check for an 
>> 	existing fwnode_graph before calling cio2_bridge_init()
>> 	- Prefixed cio2_bridge_ to any variables and functions that
>> 	lacked it
>> 	- Assigned the new fwnode directly to the sensor's ACPI device
>> 	fwnode as secondary. This removes the requirement to delay until
>> 	the I2C devices are instantiated before ipu3-cio2 can probe, but
>> 	it has a side effect, which is that those devices then grab a ref
>> 	to the new software_node. This effectively prevents us from
>> 	unloading the driver, because we can't free the memory that they
>> 	live in whilst the device holds a reference to them. The work
>> 	around at the moment is to _not_ unregister the software_nodes
>> 	when ipu3-cio2 is unloaded; this becomes a one-time 'patch', that
>> 	is simply skipped if the module is reloaded.
>> 	- Moved the sensor's SSDB struct to be a member of cio2_sensor
>> 	- Replaced ints with unsigned ints where appropriate
>> 	- Iterated over all ACPI devices of a matching _HID rather than
>> 	just the first to ensure we handle a device with multiple sensors
>> 	of the same model.
>>
>>  MAINTAINERS                                   |   1 +
>>  drivers/media/pci/intel/ipu3/Kconfig          |  18 ++
>>  drivers/media/pci/intel/ipu3/Makefile         |   1 +
>>  drivers/media/pci/intel/ipu3/cio2-bridge.c    | 260 ++++++++++++++++++
>>  drivers/media/pci/intel/ipu3/cio2-bridge.h    | 108 ++++++++
>>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  27 ++
>>  drivers/media/pci/intel/ipu3/ipu3-cio2.h      |   6 +
>>  7 files changed, 421 insertions(+)
>>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.c
>>  create mode 100644 drivers/media/pci/intel/ipu3/cio2-bridge.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 9702b886d6a4..188559a0a610 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -8927,6 +8927,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
>>  M:	Yong Zhi <yong.zhi@intel.com>
>>  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
>>  M:	Bingbu Cao <bingbu.cao@intel.com>
>> +M:	Dan Scally <djrscally@gmail.com>
>>  R:	Tianshu Qiu <tian.shu.qiu@intel.com>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>> diff --git a/drivers/media/pci/intel/ipu3/Kconfig b/drivers/media/pci/intel/ipu3/Kconfig
>> index 82d7f17e6a02..2b3350d042be 100644
>> --- a/drivers/media/pci/intel/ipu3/Kconfig
>> +++ b/drivers/media/pci/intel/ipu3/Kconfig
>> @@ -16,3 +16,21 @@ config VIDEO_IPU3_CIO2
>>  	  Say Y or M here if you have a Skylake/Kaby Lake SoC with MIPI CSI-2
>>  	  connected camera.
>>  	  The module will be called ipu3-cio2.
>> +
>> +config CIO2_BRIDGE
>> +	bool "IPU3 CIO2 Sensors Bridge"
>> +	depends on VIDEO_IPU3_CIO2
>> +	help
>> +	  This extension provides an API for the ipu3-cio2 driver to create
>> +	  connections to cameras that are hidden in SSDB buffer in ACPI. It
>> +	  can be used to enable support for cameras in detachable / hybrid
>> +	  devices that ship with Windows.
>> +
>> +	  Say Y here if your device is a detachable / hybrid laptop that comes
>> +	  with Windows installed by the OEM, for example:
>> +
>> +	  	- Microsoft Surface models (except Surface Pro 3)
>> +		- The Lenovo Miix line (for example the 510, 520, 710 and 720)
>> +		- Dell 7285
>> +
>> +	  If in doubt, say N here.
>> diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
>> index 429d516452e4..933777e6ea8a 100644
>> --- a/drivers/media/pci/intel/ipu3/Makefile
>> +++ b/drivers/media/pci/intel/ipu3/Makefile
>> @@ -2,3 +2,4 @@
>>  obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
>>  
>>  ipu3-cio2-y += ipu3-cio2-main.o
>> +ipu3-cio2-$(CONFIG_CIO2_BRIDGE) += cio2-bridge.o
>> diff --git a/drivers/media/pci/intel/ipu3/cio2-bridge.c b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> new file mode 100644
>> index 000000000000..fd3f8ba07274
>> --- /dev/null
>> +++ b/drivers/media/pci/intel/ipu3/cio2-bridge.c
>> @@ -0,0 +1,260 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/* Author: Dan Scally <djrscally@gmail.com> */
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/property.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +#include "cio2-bridge.h"
>> +
>> +/*
>> + * Extend this array with ACPI Hardware ID's of devices known to be working.
>> + * Do not add a HID for a sensor that is not actually supported.
>> + */
>> +static const char * const cio2_supported_devices[] = {
>> +	"INT33BE",
>> +	"OVTI2680",
> I guess we don't have the known-good frequencies for the CSI-2 bus in
> firmware?
You mean link-frequencies? Indeed I can't see it anywhere in the buffers
from ACPI
> One option would be to put there what the drivers currently use. This
> assumes the support for these devices is, well, somewhat opportunistic but
> I guess there's no way around that right now at least.
>
> As the systems are laptops, they're likely somewhat less prone to EMI
> issues to begin with than mobile phones anyway.

Ah I guess that's a good point...and then add it as a property along
with the rest.


Ack to the other comments; I'll make those changes.


