Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7513339FE
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Mar 2021 11:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231785AbhCJK3V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 10 Mar 2021 05:29:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbhCJK3H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 10 Mar 2021 05:29:07 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03649C061761
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 02:29:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id t5-20020a1c77050000b029010e62cea9deso10350303wmi.0
        for <linux-i2c@vger.kernel.org>; Wed, 10 Mar 2021 02:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YOMi9qCdcZCB9oPla4gQDzyKzBrwycjnCrCwEzZDplg=;
        b=eBLp9E2jY392I9LZ8uW/Vrw4FfREdyb7m45cauuv9AQRyWujq/0d1ZX9xkxHqDMJ9W
         ftvF8R/UffPwuP1qvhL9q2PkO2YvXztXqXvfLCGpJ5CnmIq2apWlsddpPnKU83Wsfv+c
         9U8Rvtg2DrfkG+RVlx4fVtSZ0c0Le4vtH2QoQ4s64Yf1lFtNQicloX3PaaLNKzKM1H4K
         sS9R1+PNP501ZuLWjSOWFSNmpEnX6RqSnYucCl3J/SLZ3F+uY7984fAVkHAtuNAgjvp4
         mjhTrvYqVAim6+wAMeeEeikRlUrxL9RL6BGyk9OxzcI7dQJR7nzRzsmzLFcDTS3lE8DM
         hGtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YOMi9qCdcZCB9oPla4gQDzyKzBrwycjnCrCwEzZDplg=;
        b=ANLSHB8MdPwcRkGfwwVBP7aKYbUEsJfKOS2k/5/XmqAevqEHx5qbcN3U6Z4WJ2Nm+4
         qzIOhHuesPKlM2Q2F+nc5JeatHpWg7TrjlAD7vH5nmv5ftJ52Tw5/MCyKalnEbsp1wqX
         aC0agQ0nvmz9UCbn7VmAppaed4ZMmvYkQ60zvTmx2Lq2hsWCISxMSB4hzCxOQB/vB20f
         RqebIZPiE8Y8R7X9fjGEmd/EUstJYsteWBvt5hPTfXKDb6DfIwiKY62vDRQRW0rJMw4T
         rureN3qI5fE8zYYubjeffYG4kOEcNfpyCzfDNe3hlW8tM9/Uq6+gNUwMsPHZMVRKirgZ
         ILaw==
X-Gm-Message-State: AOAM533oZ2AB4r8ujoI1YU9YYkanLMV35lcJQWZRkx9pkMPfLEbuOrQf
        6f/imVgFG5sT/bVs+qria+6CJw==
X-Google-Smtp-Source: ABdhPJzeMHKCOB/tzkQt5QdUqC55pSbAcZerIE0my7lc5jnvL/rAQbZpIooFDo3a9ytU9lOD6pboMA==
X-Received: by 2002:a7b:cc1a:: with SMTP id f26mr2630238wmh.19.1615372145614;
        Wed, 10 Mar 2021 02:29:05 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id 21sm8934740wme.6.2021.03.10.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:29:05 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:29:03 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>, hdegoede@redhat.com,
        henning.schild@siemens.com
Subject: Re: [PATCH v1 4/7] mfd: lpc_ich: Factor out
 lpc_ich_enable_spi_write()
Message-ID: <20210310102903.GE701493@dell>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
 <20210308122020.57071-5-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210308122020.57071-5-andriy.shevchenko@linux.intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 08 Mar 2021, Andy Shevchenko wrote:

> Factor out duplicate code to lpc_ich_enable_spi_write() helper function.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/lpc_ich.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

You are adding way more lines than you're saving here.

It's not a horrible change, so:

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
