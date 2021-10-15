Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3856542FD75
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Oct 2021 23:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243116AbhJOVe1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 15 Oct 2021 17:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243106AbhJOVeY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 15 Oct 2021 17:34:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED871C061570;
        Fri, 15 Oct 2021 14:32:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso10235964pjb.4;
        Fri, 15 Oct 2021 14:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7mOubhrR2RQv08CrV6rhgoX1qMmGl+Auy+cOu6PWiOo=;
        b=PUg6f/Uspd3O1AnBAx1fRwn6URKUCSIV+fP0eFp4rGviN/DBoSHpe42okpmTrudtVu
         6jy0ER0P3sBiJ1NnM32JcSdN5e8MSI0CPBlyHAvAXmrIMg7jKbMLr07BcZqV5fhSZez6
         go9CuOwOVmy2YEYXzZ0naOMy2fVliT0wcOkdkWOb6FykY8QEnhYaNmwN3lW+O+kX4TCJ
         nT/IwCFoAThzH5LDt66EuWtn1A4YR2gaQHHtGbDTlSzYeBREy+pYS1/SBZR8+kil7GeV
         DHYC15c2eXCR3mZp89M2zoMGYaJts8rw8j6vWKyVLOWpkXGHGocieyL0bJ2mqqVXLqrR
         DWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7mOubhrR2RQv08CrV6rhgoX1qMmGl+Auy+cOu6PWiOo=;
        b=12OlB5FKhWB/r4uPRqPD4yFUYHu1PtaPB/LtsxarnVy89jtKHeyS28kt5l55DbiuXV
         yHdO0Gtl63vzwvL9/2eg5MA4LbDsk+XopjIoxsYoZV8IhlqdAkf19GYC6qGMSRjZ+6Fm
         Pud7k0FBh28DNe6Dx3bo7LUz3ssXbo9TwRgmkdLlfcZWdocmJPC3jIYFaU3yqTg/dTdK
         NcrIR3AtwRNLH0Zq2GlPT8Ng4tJJyoIxaILnLdUQKn5l2rZ1grc/dBluReRglPbRHvu1
         jUyL7odZ9U6+qoB6n7sDxNlgZssDzWk7DBPkVD+I+nq+ik/x/CndNcFK5hSm0JLmiz6D
         Z2SQ==
X-Gm-Message-State: AOAM533KcajXaOPn1EB34QzK8MBActJip14/H3SSp/7J84UqlwuHIJwD
        FW7TGqXCo0nupU8KluNBDkw/82L/jOQ=
X-Google-Smtp-Source: ABdhPJwY7/CaGoCfO9bx61czZ1uxQTahnKVT/Y98ZPI+iZRwc4w4eyu5zBPgK0qOh+fvRrBJ/diTog==
X-Received: by 2002:a17:90a:9d81:: with SMTP id k1mr30955458pjp.153.1634333537280;
        Fri, 15 Oct 2021 14:32:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:6a02:4736:3b83:a269])
        by smtp.gmail.com with ESMTPSA id d18sm5592608pgk.24.2021.10.15.14.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 14:32:16 -0700 (PDT)
Date:   Fri, 15 Oct 2021 14:32:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     naib@xn--bimann-cta.de
Cc:     linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: I2C MSFT0001 (04F3:3072) touchpad is not recognized / registered
Message-ID: <YWnzXWAhqYuJCE2Z@google.com>
References: <20211015144714.lvp7vz7lmeku2jpj@kallisto.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211015144714.lvp7vz7lmeku2jpj@kallisto.localdomain>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Oct 15, 2021 at 04:47:14PM +0200, naib@bißmann.de wrote:
> Hello,
> 
> since I've upgraded my BIOS to a recent version, the touchpad on my laptop isn't recognized anymore. I suspect that Lenovo did change some id or specifier, that causes the touchpad to be thrown in the wrong driver category.
> 
> I am using kernel 5.15.0-rc4 on Archlinux. My hardware is Lenovo Ideapad Flex 3 11ADA05. The touchpad is from ELAN/MSFT00001? (04F3:3072). Before the mentioned BIOS upgrade, the touchpad was working with the default Archlinux kernel. Also it is currently functional while running a Windows OS. I have an old log output from dmesg [1]. I tried the following things to troubleshoot this issue:
> - Boot without hid_multitouch, hid_elants, i2c_hid, i2c_hid_acpi
> - Boot with CONFIG_MOUSE_ELAN_I2C & co.
> - Boot with blacklisting init calls and modules (see links below)
> - Tinker with i2cdetect (nothing valuable)
> 
> The touchscreen is at AMDI0010:00, the touchpad is at AMDI0010:01. While collecting i2c debug messages, I've found out that the client on the adapter does not register. The touchscreen is registering successfully, even when the corresponding multitouch drivers are missing (hid-multitouch, hid-elants). (Bare with me, since I'm just guessing things)
> # The touchscreen (ok):
> i2c_designware AMDI0010:00: using lookup tables for GPIO lookup
> i2c_designware AMDI0010:00: No GPIO consumer scl found
> i2c i2c-0: adapter [Synopsys DesignWare I2C adapter] registered
> i2c i2c-0: client [ELAN238E:00] registered with bus id i2c-ELAN238E:00
> # The touchpad (not ok):
> i2c_designware AMDI0010:01: using lookup tables for GPIO lookup
> i2c_designware AMDI0010:01: No GPIO consumer scl found
> i2c i2c-1: adapter [Synopsys DesignWare I2C adapter] registered

Since we do not see I2C client being registered in the case of touchpad
I'd start tracing drivers/i2c/i2c-core-acpi.c, functions
i2c_acpi_add_device() and i2c_acpi_get_info() to see where the failure
is. I guess the changes made ACPI descriptions not match with what Linux
expects.

Thanks.

-- 
Dmitry
