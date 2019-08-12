Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E24989829
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfHLHrb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:47:31 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51617 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfHLHra (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:47:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id 207so11241244wma.1
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=O//ZUJclnc89ssdCIp6IXRbvP5J4HOCWWkGmeHnshes=;
        b=ikjVWDKs7zk2gMXW618LuG9ZlbwJfxfKfpswwBih3LT+f2prrn2AiyQlCV64qGHTxi
         WyHbAyEiCYKAzjcgJcFR+AEkKP81o8ZGbyFTx/svYREKYKQcrxSVozbIhRtb6HP1WBZJ
         rvYEk8YMPkWtIMjxCHRfcBBDevDWHK89V4JSinDHIienpcqfb/9CHLVgapYg1A2LOGMQ
         h2oLIAjsa1aVEX5UQjhZWlREXPDWd+C5eKAAWYyOJo4RWDMczjcMT6ERA3+QJ687+Hla
         m26kWBrOBc9VBtIScu4mjoNK7ukx2VVGP92GPLZJPYdI5RMEfCn8mTAxd//cqWIV4BHR
         Nr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=O//ZUJclnc89ssdCIp6IXRbvP5J4HOCWWkGmeHnshes=;
        b=NxBD4lroe0kxVjVIvXZKjN39W23fDfck0BYswOOSZTLBUA7zksSWqwUqkG5RXCoFuv
         WY729+XYO1PMIxXJDS+F1cTQ9xTNeJrkJm6DLEu6cJAC6jpH3uBZmo2NxqMCPAzEw20r
         OzHcc80qiVGfdAwKkcZxyL8HXTJl1Bm76b8S51PZPCikF0xLDnZmzA9JfiEelLE10uXi
         vxRqmAxvsU+Abg0M3STMif1xs5MXB8vMX+LGicqN0g+VTaDV6nghNc11s32nGkLENTfI
         kuParKgF2/fWgn1pZIpLhlfRfVmRKdsazt32HSSvV8UDPj+srBqKwBF6zDd0xzMRd7cD
         amew==
X-Gm-Message-State: APjAAAVu00LmWMQLO9f1yrGr5g7GFIs7M9+53Wkl5jLeLJaJDtF8daoI
        l1b6MCqb99s3ewv2YdAASd2O7g==
X-Google-Smtp-Source: APXvYqxROLNIpJcshRuUg7v/sJFGI601/3sZPrBt9dM+9ZulYyEFFUhjIG6e2Jixa7B4FaGk4L7DMg==
X-Received: by 2002:a05:600c:2311:: with SMTP id 17mr25612596wmo.68.1565596049000;
        Mon, 12 Aug 2019 00:47:29 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id p10sm10489933wma.8.2019.08.12.00.47.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:47:28 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:47:27 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/14] mfd: max77693: convert to i2c_new_dummy_device
Message-ID: <20190812074727.GY4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-8-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-8-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 22 Jul 2019, Wolfram Sang wrote:

> Move from i2c_new_dummy() to i2c_new_dummy_device(), so we now get an
> ERRPTR which we use in error handling.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Generated with coccinelle. Build tested by me and buildbot. Not tested on HW.
> 
>  drivers/mfd/max77693.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
