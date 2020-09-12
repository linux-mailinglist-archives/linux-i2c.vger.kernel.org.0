Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85FC8267702
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Sep 2020 03:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbgILBFH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 21:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgILBFG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Sep 2020 21:05:06 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EB9AC061573;
        Fri, 11 Sep 2020 18:05:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d6so8529097pfn.9;
        Fri, 11 Sep 2020 18:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZjXjUVmZF9Je/npmgyHHsEFigRjciCrwD+03QLzZ/B0=;
        b=W6ZkEJmfC8Hp2Py+sCcKu8LCOj9X7Q0O8/PN5c2rVsrLh4BhgWrA+U98IGJFtfZc6p
         gEChuOc0H4Tov378LjW650QLFU7shLJ8G5MdG4saCrPSky8QiieoyFrFVkmu5caHdgWe
         J0xHjiqHMO2C/1a3kEjFZdyrtnGeD1A5j/y2KM2dpcA337Ty9qSKlQfmSqdhVIwy8+lW
         CFCuMLvyyr4sc52Ym9wpjAK8BGTUhDMNsI5ev65UeC1DLtwrMEpaVpV1blvuLWrCw9bB
         ijbLSRct5z0bwS2EeF4EBPJm9VUTUohajP03DQ6u36lxjCyQzkWyiH/nrw0YGlicwClH
         XIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZjXjUVmZF9Je/npmgyHHsEFigRjciCrwD+03QLzZ/B0=;
        b=MJjNY4Di/J6asDVL0AWDAdMRVws/sIKZv8Ee+v9dDyr9wL47GSTqgbaES9q/ap7MLh
         xg6g5Kd0TQMmDYkubyg6yc9/hjPXq0mAG0bZ2l+kb/1GAIiw0yOFljZiZ7E8Kkm5iOnY
         i4+lHgiebsJVqp/RwaftVbypQFCqsamlE8mHocchKwCZS20Tk5eNe5KMFMfqpc+53qUi
         h9Ow8cYPwLoJgnl8Y46cXlXxdZ0LW70B34ERgvm184QTo8pGbUvY+rywuh/B1mmX8UAw
         XKzeYQGCQ5aR7+uuHsrGsz6qT2ZopKyEiGUADz+YgcHvE6il/4QbWzZ+DFdPkvZMiSva
         xg9A==
X-Gm-Message-State: AOAM531c1UgWDyjCbWRb5YqBC8waPP8C7YCdBQdzwJmok1nSQc82kshd
        ansqk9nEx1nBynyS4FDdD5g=
X-Google-Smtp-Source: ABdhPJygWooC9xk13M5/iFbsJviMOxZVBqjo+Y1fInOD20nCNiT+ZetxuSiqK5d1wm3yCKmCjEYZTQ==
X-Received: by 2002:aa7:9a41:: with SMTP id x1mr4416983pfj.138.1599872705690;
        Fri, 11 Sep 2020 18:05:05 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y23sm3334096pfp.65.2020.09.11.18.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 18:05:04 -0700 (PDT)
Date:   Sat, 12 Sep 2020 10:05:02 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH] i2c: do not acpi/of match device in i2c_device_probe()
Message-ID: <20200912010502.GB535@jagdpanzerIV.localdomain>
References: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 23:49), Sergey Senozhatsky wrote:
> i2c, apparently, can match the same device twice - the first
> time in ->match bus hook (i2c_device_match()), and the second
> one in ->probe (i2c_device_probe()) bus hook.
> 
> To make things more complicated, the second matching does not
> do exactly same checks as the first one. Namely, i2c_device_match()
> calls acpi_driver_match_device() which considers devices that
> provide of_match_table and performs of_compatible() matching for
> such devices. One important thing to note here is that ACPI
> of_compatible() matching (acpi_of_match_device()) is part of ACPI
> and does not depend on CONFIG_OF.
> 
> i2c_device_probe(), on the other hand, calls acpi_match_device()
> which does not perform of_compatible() matching, but instead
> i2c_device_probe() relies on CONFIG_OF API to perform of_match_table
> matching, IOW ->probe matching, unlike ->match matching, depends on
> CONFIG_OF. This can break i2c device probing on !CONFIG_OF systems
> if the device does not provide .id_table.
> 
>  i2c_device_probe()
>  ...
>    if (!driver->id_table &&
>        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
>        !i2c_of_match_device(dev->driver->of_match_table, client)) {
>        status = -ENODEV;
>        goto put_sync_adapter;
>    }
> 
> i2c_of_match_device() on !CONFIG_OF systems is always false, so we never
> perform of_match_table matching. i2c_acpi_match_device() does ACPI match
> only, no of_compatible() matching takes place, even though the device
> provides .of_match_table and ACPI is capable of matching such device.
> 
> It is not entirely clear why the device is matched again in bus
> ->probe after successful and proper matching in bus ->match. Let's
> remove ->probe matching.

Hi,

Gentle ping.

	-ss
