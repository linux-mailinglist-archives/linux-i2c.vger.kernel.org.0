Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DC72CADED
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Dec 2020 22:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgLAVAh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Dec 2020 16:00:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgLAVAg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Dec 2020 16:00:36 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72014C0613D4;
        Tue,  1 Dec 2020 12:59:56 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id p8so4947607wrx.5;
        Tue, 01 Dec 2020 12:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=G6Fya05SQbtuXIOHk4zNyBKDK374TVvT2hVzcF95GI4=;
        b=bVvadUaveurvmRfl2/1MYWb9CwkZkFTa3lay8J9V1rV8tB1pq2CtiW4aIa2ncivzew
         lCzmWpI9v1NliuFXDr++cQrU851SgTXcfShV/wNUNO69jsrunI8k5dQPNQpBjY+c6xYx
         dbLnEDOBr2IpDR24kNoXbERD8cZdFBZTpG/vUjcuUf0TsKcg8T6DzOEgPYYu4SyV2cXr
         mlV0JHDEOW89TyEu3dZrOxAsmUxZ5Sy/l+q98LbQpQ2jruFMT6KyHrTVhXWSMSN6f+dJ
         Kyk8gEG9yZxX48Ynj2Vtt92JkW0RU0HewCTrW6w7qJDT2dXP0YKYH1fl0ZGkeeGsPANs
         RiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=G6Fya05SQbtuXIOHk4zNyBKDK374TVvT2hVzcF95GI4=;
        b=U024fpfpOZbgPQ/mYga3x8pSEEJmA/vbnFaxNaC6vsXruzXUG2DZq3dGDVtXe+GvyR
         V+3OKgdR8+rkBV14Czs1Ox0e1uy++sQXxSDbpbyBGs7R9O5MBxKsOk8MIS4UJsO1rvVu
         NlLOApGW+oZ1i2hVTUNbpzT6whYOKgnYJzqhkHRNOeA8R9hsq8gZ2drFS2uXjEx8RdMA
         IWC+r+l8Ryr1raJpgBct3DfCL5oypTWiDuy0zzbCkNqNul/+y2ntQXE8oVWWorkTQlxb
         O1+cYno+nxiOd0v1I3Oy0cV94TZ96jmErxETTIihjZ+U2Tt4PoSefM4wX+zA1IZ9y+Kx
         Ky4Q==
X-Gm-Message-State: AOAM531W04mmBLoO4kKVMuwllmC/CGbiP+stng5haBIF8ijtOlo37FbE
        81eZY6QQ5/5YDa14YaBWROcDohVr4sCtw4Rl
X-Google-Smtp-Source: ABdhPJzLhD9GshQaNK7aHyTNnMNSmsLBcyo8lW2O8ybk/7Svju/OwopJyp1z4P46k8zTT5M5kmmlLw==
X-Received: by 2002:adf:dc83:: with SMTP id r3mr6105641wrj.223.1606856395234;
        Tue, 01 Dec 2020 12:59:55 -0800 (PST)
Received: from [192.168.1.211] ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id v25sm1569303wmj.27.2020.12.01.12.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Dec 2020 12:59:54 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org, robert.moore@intel.com,
        erik.kaneda@intel.com, pmladek@suse.com, rostedt@goodmis.org,
        sergey.senozhatsky@gmail.com, linux@rasmusvillemoes.dk,
        kieran.bingham+renesas@ideasonboard.com, jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201184925.GJ4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <4181e6a6-a60f-0a2b-1b46-13a2359d8753@gmail.com>
Date:   Tue, 1 Dec 2020 20:59:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201201184925.GJ4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy

On 01/12/2020 18:49, Andy Shevchenko wrote:

>  P.S. Dan, can you drop unrelated text when replying?

Ah - sure, sorry.
> Seems we can do this, by locating intel_int3472.c under PDx86 hood and dropping
> ACPI ID table from TPS68470 MFD driver. The PMIC can be instantiated via
> i2c_acpi_new_device() (IIRC the API name).
>
> And actually it makes more sense since it's not and MFD and should not be there.
>
> (Dan, patch wise the one creates intel_int3472.c followed by another one that
>  moves ACPI ID from PMIC and introduces its instantiation via I²C board info
>  structure)

I'm mostly following this, but why would we need an i2c_board_info or
i2c_acpi_new_device()? The INT3472 entries that refer to actual tps68470
devices do have an I2cSerialBusV2 enumerated in _CRS so in their case
there's an i2c device registered with the kernel already.


I think we need those things when we get round to handling the
VCM/EEPROM that's hidden within the sensor's ACPI entry, but I've not
done any work on that yet at all.


