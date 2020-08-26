Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DD9252668
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 07:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725786AbgHZFHP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 01:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbgHZFHP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Aug 2020 01:07:15 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45409C061574;
        Tue, 25 Aug 2020 22:07:15 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 67so433591pgd.12;
        Tue, 25 Aug 2020 22:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OnEPUAMoBUwu7xfZMdJc2Up3dyucpJd6NtMaD+jmDWA=;
        b=nl8HUgXoqcXLQ2EvEzCRIK1POM4fw1Pr5FsrwsqhaBUDD1y+l2lQrrHV5Lz3BL45DT
         7BjR8TCEHWN70fnA+14KYNTqwuZ/schIW0COR6e2tL/G2tXJzZ5LSq68BGMqQsylcmlH
         bAcMPOwzayrbc7h57zmKj9KzVVqRkzfbKba61phMeKA2COah9YsjISTWxNXh354jOtQz
         DneJoXJ9/GSTExwnHAqORMseJZAEmw8fxHYeeLo2HBgw9zu6sFCx9D4AK1eQTg2av1UO
         1Y6Tjy7lAuRXF/4wMKpYdv5Q+f9YSbOjtCW0jyIme0POXnOcz+tnofmJolfcvUXkubUD
         Vj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OnEPUAMoBUwu7xfZMdJc2Up3dyucpJd6NtMaD+jmDWA=;
        b=SLoXsfufqe9Ui8ul77kcIp0S4QZEWOMulgs9SQESLhoZPwOwofiLQUiAlUJCly3cGf
         g1Reveup/30Ur154Z0rxM24Yh+cb8Ufb/mmCWT9GzHCUg+OHAqFNYr/F42osTpcJlK2/
         Iw8rPgMe0Rqryixh8my/S61hkLq40Sm2ZDkLVMhHsQV/bsFSeRRH474Loj73PQhbT3S7
         mTPty7ipminml6L1WqcpctsP45MFvs6n1RJVc0pQKF72HryVTh2gHR4akJDlUvFgKWu7
         BHicj6XTJDEA0oEyvJGm4H4aLbWDdSK9NoimaPf5Wfl2eB33VDJ+Aie1ixlBdeB8R0zv
         PHKA==
X-Gm-Message-State: AOAM532Vx9LJPXGyPii8RdpfYfSWa98/+aGBAv0DbUpWGiWOqgaYp457
        X1UAdIRGDFfGqPg7RolAniw=
X-Google-Smtp-Source: ABdhPJwygEXez07TGNc2f65kvILBf2xqchEFULUNbT1zQYicO8518BqQBZs/nBZyZSdgTT9a5yu6VA==
X-Received: by 2002:a63:e24d:: with SMTP id y13mr9438833pgj.248.1598418434526;
        Tue, 25 Aug 2020 22:07:14 -0700 (PDT)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
        by smtp.gmail.com with ESMTPSA id y13sm1016677pfn.214.2020.08.25.22.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 22:07:13 -0700 (PDT)
Date:   Wed, 26 Aug 2020 14:07:11 +0900
From:   Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Subject: Re: [PATCH 1/2] i2c: consider devices with of_match_table during i2c
 device probing
Message-ID: <20200826055951.GA407@jagdpanzerIV.localdomain>
References: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826042938.3259-1-sergey.senozhatsky@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On (20/08/26 13:29), Sergey Senozhatsky wrote:
> Unlike acpi_match_device(), acpi_driver_match_device() does
> consider devices that provide of_match_table and performs
> of_compatible() matching for such devices. The key point here is
> that ACPI of_compatible() matching - acpi_of_match_device() - is
> part of ACPI and does not depend on CONFIG_OF.
> 
> Consider the following case:
> o !CONFIG_OF system
> o probing of i2c device that provides .of_match_table, but no .id_table
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
> i2c_of_match_device() depends on CONFIG_OF and, thus, is always false.
> i2c_acpi_match_device() does ACPI match only, no of_comtatible() matching
> takes place, even though the device provides .of_match_table and ACPI,
> technically, is capable of matching such device. The result is -ENODEV.
> Probing will succeed, however, if we'd use .of_match_table aware ACPI
> matching.

Or, alternatively, we can drop i2c_acpi_match_device() and use
i2c_device_match() in i2c_device_probe().

---

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 34a9609f256d..14bfc5c83f84 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -96,7 +96,6 @@ static int i2c_device_match(struct device *dev, struct device_driver *drv)
 	struct i2c_client	*client = i2c_verify_client(dev);
 	struct i2c_driver	*driver;
 
-
 	/* Attempt an OF style match */
 	if (i2c_of_match_device(drv->of_match_table, client))
 		return 1;
@@ -480,8 +479,7 @@ static int i2c_device_probe(struct device *dev)
 	 * or ACPI ID table is supplied for the probing device.
 	 */
 	if (!driver->id_table &&
-	    !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
-	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
+	    !(client && i2c_device_match(&client->dev, dev->driver))) {
 		status = -ENODEV;
 		goto put_sync_adapter;
 	}
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 94ff1693b391..8ce261167a2d 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -59,20 +59,11 @@ static inline int __i2c_check_suspended(struct i2c_adapter *adap)
 }
 
 #ifdef CONFIG_ACPI
-const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client);
 void i2c_acpi_register_devices(struct i2c_adapter *adap);
 
 int i2c_acpi_get_irq(struct i2c_client *client);
 #else /* CONFIG_ACPI */
 static inline void i2c_acpi_register_devices(struct i2c_adapter *adap) { }
-static inline const struct acpi_device_id *
-i2c_acpi_match_device(const struct acpi_device_id *matches,
-		      struct i2c_client *client)
-{
-	return NULL;
-}
 
 static inline int i2c_acpi_get_irq(struct i2c_client *client)
 {
