Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294278981C
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2019 09:46:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726949AbfHLHqm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Aug 2019 03:46:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41208 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbfHLHqm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Aug 2019 03:46:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so1439461wrr.8
        for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2019 00:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=pF4284ljIpOIN4c9ccgmnPIqD9kFvCl5hZxDK0Wkthk=;
        b=BrsNzy1KZefPJTH3mpVu7jgmCf4KUcGGiMgdGEsrNl4LeQbEtCEBrm7vIZDRApgXRO
         7sqIA+3G0KS7fzdoqt7yTtO7beSe8pwqmQdq+OcYtPxAHaWCvJmZpFn6xNCk2hRjC4NK
         qLxJHrXVgyi8YAywOEV06C/kGEnwthd2bkZ+egENDbUq/sesYm2Mi+T3tUVcz+m+02Lk
         tlQM4bTUrIvSrYuloUuaLM5cCSscdBfFSV/jSjhPHzSYKoIUbY+MMv4O4TIo/101ghQW
         r0NTOxNCtUjYmXaDQ+IksgMCLBYh8tvPER8Vx+nymcl7X4OJNvADz5gbSnuj5itR0Bpk
         Ja9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=pF4284ljIpOIN4c9ccgmnPIqD9kFvCl5hZxDK0Wkthk=;
        b=Rhs45q5WHhJqQCfhSoGqctJFB2UgZybMlxEk+kGff2qFSeS7AdWcDo4HAjToVrpFvZ
         l5/S4Fw/ZchvqIpr5XBogD3jOqvYVm0FeZiwdIP722JImKj/eecEJc1CpJciwTHZHHrW
         vrWPKdUltHCsxHp+lzhDpvX3c+WaKvqFtFrxU3vyQ7MftxXILWbkzjg+S7l9PEPZOhv8
         6C9p2d5SklfNFSoV7t2zuPdRUqzQPElut/88enG0It5NBDh01P0eBjgCva3UrdQB6Kb1
         m2PfeRRT3PxRdUPlWuV8/23D2ZQjDzLZQtczmx+DNazCCOTgqW9uMdl18yxe4EngP5Zk
         FOxA==
X-Gm-Message-State: APjAAAVOuG8ftzz017ipeGcAewOrcfU97nFC75UAB0JkUuAS7EhASaip
        e0aVFWVACwyELOG1GfFnM2LNxObdkxI=
X-Google-Smtp-Source: APXvYqzQRCtrNfzLc5YRiY6nl1YVaDaXWjUXk+X2aze9RrH51BJIP0Tq2x0MEoVal6soUT9WY5Rxqg==
X-Received: by 2002:adf:a1de:: with SMTP id v30mr3913854wrv.138.1565596000190;
        Mon, 12 Aug 2019 00:46:40 -0700 (PDT)
Received: from dell ([2.27.35.255])
        by smtp.gmail.com with ESMTPSA id u186sm24144588wmu.26.2019.08.12.00.46.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Aug 2019 00:46:39 -0700 (PDT)
Date:   Mon, 12 Aug 2019 08:46:38 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/14] mfd: 88pm800: convert to i2c_new_dummy_device
Message-ID: <20190812074638.GS4594@dell>
References: <20190722172623.4166-1-wsa+renesas@sang-engineering.com>
 <20190722172623.4166-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190722172623.4166-2-wsa+renesas@sang-engineering.com>
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
>  drivers/mfd/88pm800.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
