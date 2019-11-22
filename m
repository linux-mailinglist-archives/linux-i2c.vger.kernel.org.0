Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE508106773
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 09:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfKVIDf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 03:03:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:37164 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKVIDf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 03:03:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id f129so5137189wmf.2
        for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2019 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wLk0BE1aSH237G1Tgw7p3vnCgrKdLIQM6QZZXQiln7g=;
        b=hxYWwUP6wOFR26zWqxYs5WFOVBGRnEVef33z2GPbRcJmmH/nBDWAZcqf4FLeMNmq8G
         aZ0fVbPIg7PAxY/P8KnUQl4JoTObnIdJCfUKDoli06/HsgAdyIaS3Lk5CZSQCnpwADCl
         +/182xN/e7cz+XpvSlFGZOuROwLHG69i0OgL4hpqISlKCCQGcRzs4z2zBKunma+YdYGb
         x/FTsT2/Ol9K4CWI6VIqnC7Ul5JpTbqFdZ42pdTZ1mwYhbrAs43s4/qVZhlRe3mWUU7f
         fy0831/MXxv4aFGFhI6lIi33/fGbBn8Y1qZ3/oNlZ9uihrKBMac66AlRTTSDMIdEDzAq
         PZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wLk0BE1aSH237G1Tgw7p3vnCgrKdLIQM6QZZXQiln7g=;
        b=TEc0c5lf/2R4CO3jPY8JVTUOOdU9k968nrbHBTYS3zd/X1li3eO2aB5rYgoY4/JyDB
         avRjvmePOomE4d1SpbaBjNCS/2weHN2EeJd1JW5E45z7/xMUJDFbnHwlwKUZz2BC4vxB
         GPYxcoz4Z/zHvqd08bOkq4yK7WMWHq8CtZOoZFSGC420TJoB1OysqvVUQpvrmaerzslC
         LZ6l9ZQn8eR917YMvvcYo7kOQBhqPBJle3F4PFNLiN7/StNamlIzzkeHta5T6N21GEXp
         NOsWAj5yCwUocmzBq522bn3F8rrzTQdocPHs+Du+6sSM01xMIHlcjdS7W2aYC4KaRJkU
         QK0w==
X-Gm-Message-State: APjAAAUA0DHGkx+rUvzFx9lBMYR/6OLis22pMDqmmzg1IfcDSuITKxFH
        +x8TRgi72tbjI51UgF+Wdlmd8g==
X-Google-Smtp-Source: APXvYqyJnlc5v/98AYWZ2lSJElTmJ/mbF3TcgCfwtCd5vflxc+Gk01/GEfr7YpUpdHZWT7FXsEym/A==
X-Received: by 2002:a7b:c748:: with SMTP id w8mr130691wmk.114.1574409813548;
        Fri, 22 Nov 2019 00:03:33 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id j7sm7082427wro.54.2019.11.22.00.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2019 00:03:32 -0800 (PST)
Date:   Fri, 22 Nov 2019 08:03:19 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Guenter Roeck <groeck@google.com>
Cc:     Raul E Rangel <rrangel@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Wolfram Sang <wsa@the-dreams.de>, Akshu.Agrawal@amd.com,
        Guenter Roeck <groeck@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-i2c@vger.kernel.org, Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH 4/4] platform/chrome: i2c: i2c-cros-ec-tunnel: Convert
 i2c tunnel to MFD Cell
Message-ID: <20191122080319.GC3296@dell>
References: <20191121211053.48861-1-rrangel@chromium.org>
 <20191121140830.4.Iddc7dd74f893297cb932e9825d413e7890633b3d@changeid>
 <CABXOdTeotUnO_7k9UycJ0vJEKV8pdZOjRrepDv5WVo5RmOLnEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABXOdTeotUnO_7k9UycJ0vJEKV8pdZOjRrepDv5WVo5RmOLnEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, 21 Nov 2019, Guenter Roeck wrote:

> On Thu, Nov 21, 2019 at 1:11 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > If the i2c-cros-ec-tunnel driver is compiled into the kernel, it is
> > possible that i2c-cros-ec-tunnel could be probed before cros_ec_XXX
> > has finished initializing and setting the drvdata. This would cause a
> > NULL pointer panic.
> >
> > Converting this driver over to an MFD solves the problem and aligns with
> > where the cros_ec is going.
> >
> 
> I thought the mfd maintainer objects to the use of the mfd API outside
> drivers/mfd. Did that change recently ?

It hasn't changed, although I don't see that here?

> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> > You can now see the device node lives under the mfd device.
> >
> > $ find /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/ -iname firmware_node -exec ls -l '{}' \;
> > /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/firmware_node -> ../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> > /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/firmware_node -> ../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00
> > /sys/bus/platform/devices/cros-ec-dev.0.auto/cros-ec-i2c-tunnel.12.auto/i2c-9/i2c-10EC5682:00/firmware_node -> ../../../../../../../../LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1c/PNP0C09:00/GOOG0004:00/GOOG0012:00/10EC5682:00
> >
> >  drivers/i2c/busses/i2c-cros-ec-tunnel.c | 36 +++++++++----------------
> >  drivers/mfd/cros_ec_dev.c               | 19 +++++++++++++
> >  2 files changed, 32 insertions(+), 23 deletions(-)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
