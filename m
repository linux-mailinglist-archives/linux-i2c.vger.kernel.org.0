Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA7235EF4D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Apr 2021 10:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348369AbhDNIOb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Apr 2021 04:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349497AbhDNIO1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Apr 2021 04:14:27 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FB6C061574
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:14:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id m3so22597695edv.5
        for <linux-i2c@vger.kernel.org>; Wed, 14 Apr 2021 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=60MgZkgdupIaq4FjE6yGCb3EuEbMNyi/9UEBc0w0nvM=;
        b=H96J3fXR0tGnZfOtZM2BuIKNda6VczXUgKYfOdRvfQe+lEge5tZpP2SaCBEuqxA3rT
         R0uIfxI6va1nia/Zv5/8OmjRzApNQY+7AdGpjdLMDe+SBbUdKu6sysOf008B6PBfA6Ua
         Zv500YeaTJ+onlB8bARq+fRHM5UZ5VTr9M+7u0gmR+J+SumG7sgJqgAJ/09+Ezr02tYy
         35W6wvDG0z3KnuKQCxCWPd4abtj4CIJtmmAkJ7qP3RWa+mg5cMeFIkDlno/Vvg22SXoQ
         l+nYWsWZh79AwcyBRRD1aAnWRdsxBQP2bEWtnNFCsZGBE7kmS1la82AqsbN3s0rjZXO7
         VnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=60MgZkgdupIaq4FjE6yGCb3EuEbMNyi/9UEBc0w0nvM=;
        b=E1ZzmzKLxKGypOibIsDCB2P91Ibr6/LevWV13z5PmUSKy5m1Fp9uENxMN1NG/KGbio
         fUgvCzrCLDcoRryvUmfhy3fgPv4gt0Q9QbryjGc/7zCuTH1bTqMxkFS8dIuzH3NBbu43
         biuAJzhkcnzQ/8y2kG8LdO89Bq18oYUvPUabA/VihE5dZlrRdN8fhg0QxrjgaeIl6gIX
         0AlF6T3Kh9djHHX+eEKroNf9wvZZt5ucoRPgECicenvL65NSOiOuSrLcHZuCGYrY1ILa
         g+Cpd6I2qmB4NbC0k+bNojmCPXWc0b6u/Ycun4kKOz64wLpnDEzOIZhrc/ggYiDERGms
         lo3w==
X-Gm-Message-State: AOAM533Dv7dHqjA5r82hiE06LHomLkSdgEHM3TKZL1Q4VjSZXjlUHCyS
        Ojzzoilyo8M96KsHSn4yGNMAwPJNXNLVpA==
X-Google-Smtp-Source: ABdhPJz/W4uA9Mok7bPfdy6oPcWnQcZgojvLSJtHh2dDav1IjtMz1LGIHMZCfkf6m9sXzwtxHqJnLg==
X-Received: by 2002:a05:6402:94b:: with SMTP id h11mr33648969edz.180.1618388045582;
        Wed, 14 Apr 2021 01:14:05 -0700 (PDT)
Received: from dell ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id e12sm11240556edv.11.2021.04.14.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 01:14:05 -0700 (PDT)
Date:   Wed, 14 Apr 2021 09:14:03 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v1 2/2] i2c: designware: Get rid of legacy platform data
Message-ID: <20210414081403.GD4869@dell>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
 <20210331154851.8456-3-andriy.shevchenko@linux.intel.com>
 <20210406104927.GA3532@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406104927.GA3532@ninjato>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 06 Apr 2021, Wolfram Sang wrote:

> On Wed, Mar 31, 2021 at 06:48:51PM +0300, Andy Shevchenko wrote:
> > Platform data is a legacy interface to supply device properties
> > to the driver. In this case we don't have anymore in-kernel users
> > for it. Just remove it for good.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Do you require an immutable branch?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
