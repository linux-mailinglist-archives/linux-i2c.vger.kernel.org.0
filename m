Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FAAF35AD42
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 14:27:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234262AbhDJM1s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 08:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbhDJM1s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Apr 2021 08:27:48 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F40CC061762;
        Sat, 10 Apr 2021 05:27:33 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l4so12701695ejc.10;
        Sat, 10 Apr 2021 05:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wAUm4+Tq5WvzapAJXDRjh4RvMfIroU24RNMzB6EDVKA=;
        b=OJb87g77GetOTiw2Ud+JvfL5aLB+Q3ussVgyG/GRgEFDm1vzoAXrYOWVzot68Ih+N5
         3cbdE/e3bRQ6QWEEUapTAZdSl4v62/r9Ke7oZsrB38bSuhBkdCfl4+Fj7Bxr2AkHizSz
         O2Je638NN2mJn/jkxivzpJM8sSM2KWeHyMh5cSEIHnGGCkumQWYP36hjLvTmfgBNgn5K
         D1S5l6JJPEMrMETCQa0Elqxt6NKFinIISkVYbUA6NF7m2vXEkCOepm47I/hF7cDDYyh3
         E3eFDAAmy7z6sxhPqbYHTWqDUImNmgXa6Gq6nzUGoqkenaQS/GSTwk3alzTF2xjiYz9B
         iOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wAUm4+Tq5WvzapAJXDRjh4RvMfIroU24RNMzB6EDVKA=;
        b=BFP8Lp67z866c9C3ngVjIrffdCGvDai20fNHhyugLvgNX07Y65qjjqJ/Re7oGN1fDt
         5A0bLhs+Y09mOCyleDgf1uR04TjeGYfKWz2Q3K6Wlx7hghWVoK0wpBaaKoa+BrmstEko
         r2BA/jCerSMW4w8O7oBjWeniQ7Ek7LiD5Bd2m2txc+lBK34+YBvok7BMeE+I/Rs564xU
         3TEn6wGPA+fYWGx+SdNVIZDwCwSe9Nfk5DVx074u1qq7Qv39EJUsfAbp9+JitpvPFAeq
         pSd4mt9OkoePvLI8TP/ocsmTNQWmXHctWGTdLVybZMnBuQjVllhA1G3ehvD/AFyAzqCt
         jNkw==
X-Gm-Message-State: AOAM531NSNgINx5/9zmSt/SZUEjLLf1aPEZRhSo7fTmSUzBf1RlP/ltj
        FEL7axf5/YXJZNUFi2LujOQ=
X-Google-Smtp-Source: ABdhPJx50+QL/gS4JQsI+WtGKSWUoe1GR0AOVkzjDseW1QuyV2EytrdtlG52NCacJrWjd1KBwR/4ww==
X-Received: by 2002:a17:906:4746:: with SMTP id j6mr8416221ejs.39.1618057652190;
        Sat, 10 Apr 2021 05:27:32 -0700 (PDT)
Received: from michael-VirtualBox (cbl217-132-244-50.bb.netvision.net.il. [217.132.244.50])
        by smtp.gmail.com with ESMTPSA id sb4sm2596445ejb.1.2021.04.10.05.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 05:27:31 -0700 (PDT)
Date:   Sat, 10 Apr 2021 15:27:29 +0300
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        michael.zaidman@gmail.com
Subject: Re: [bug report] HID: ft260: add usb hid to i2c host bridge driver
Message-ID: <20210410122729.GA6136@michael-VirtualBox>
References: <YHBJRvcOSaM/b0RL@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHBJRvcOSaM/b0RL@mwanda>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 09, 2021 at 03:32:06PM +0300, Dan Carpenter wrote:
> Hello Michael Zaidman,
> 
> The patch 6a82582d9fa4: "HID: ft260: add usb hid to i2c host bridge
> driver" from Feb 19, 2021, leads to the following static checker
> warning:
> 
> 	drivers/hid/hid-ft260.c:441 ft260_smbus_write()
> 	error: '__memcpy()' '&rep->data[1]' too small (59 vs 255)
> 
> drivers/hid/hid-ft260.c
>    423  static int ft260_smbus_write(struct ft260_device *dev, u8 addr, u8 cmd,
>    424                               u8 *data, u8 data_len, u8 flag)
>    425  {
>    426          int ret = 0;
>    427          int len = 4;
>    428  
>    429          struct ft260_i2c_write_request_report *rep =
>    430                  (struct ft260_i2c_write_request_report *)dev->write_buf;
>    431  
>    432          rep->address = addr;
>    433          rep->data[0] = cmd;
>    434          rep->length = data_len + 1;
>    435          rep->flag = flag;
>    436          len += rep->length;
>    437  
>    438          rep->report = FT260_I2C_DATA_REPORT_ID(len);
>    439  
>    440          if (data_len > 0)
>    441                  memcpy(&rep->data[1], data, data_len);
>                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Smatch says that this can be called from the i2cdev_ioctl_smbus()
> function.

Hi Dan,

This is an example of a false-positive static checker warning.

The maximum data size that the i2cdev_ioctl_smbus() can pass to the
i2c_smbus_xfer() is sizeof(data->block) which is (I2C_SMBUS_BLOCK_MAX + 2)
or 34 bytes. Thus, no need to check the data_len against 59 here.

Regrads,
Michael

> 
> i2cdev_ioctl_smbus()
>   --> i2c_smbus_xfer
>       --> __i2c_smbus_xfer
>           --> ft260_smbus_xfer
>               --> ft260_smbus_write
> 
>    442  
>    443          ft260_dbg("rep %#02x addr %#02x cmd %#02x datlen %d replen %d\n",
>    444                    rep->report, addr, cmd, rep->length, len);
>    445  
>    446          ret = ft260_hid_output_report_check_status(dev, (u8 *)rep, len);
>    447  
>    448          return ret;
>    449  }
> 
> regards,
> dan carpenter
