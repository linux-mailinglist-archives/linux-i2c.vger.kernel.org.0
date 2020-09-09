Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 086F82633AA
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 19:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730614AbgIIRIE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Sep 2020 13:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730393AbgIIPgz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Sep 2020 11:36:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7B6C06134A;
        Wed,  9 Sep 2020 08:36:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id u4so4102092ljd.10;
        Wed, 09 Sep 2020 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XU1ZtzBl+1dsx6yIj55gnRA9ur3suV6Xeost/94vjf4=;
        b=LwGh4anNyth/MyytVIlJfhNHjNXoiiWeSRiwuxbEl22Enwzo69J1kUgmxiFRa8kuJQ
         Od5ZbS41PBUKMr0sXT3rOrJ34xiX5lGUpiKlRZsLZvoV4lwe4Yp0oQeSeKXwOhDzXZf/
         u/PkWxKP4/VU3bh18T70yCFyKT/pWhd9WdIAbbVsL3i+Vb83WVLYVELRBxbgNf4BPaij
         C3KSsmX4EWkB8kv3OTmy+MwgOBpIXhYBkp09nKKXM0WMY4pBa9nVyTY+KWoLRttAPQPt
         pkvR3HKd0TgZ37ImaTmSYnHLBa5IGaGM2bxLHvQBwsbu8c0VMWQr6mX8AtpaaQty7mvq
         Bmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XU1ZtzBl+1dsx6yIj55gnRA9ur3suV6Xeost/94vjf4=;
        b=OjNFcuYNbwePWkCSqIKWGZJrJOIsRJY1DcxuLfRvccYW8Eni2phv62gugY+MFGDKPP
         bLEkTpfj2tW/8aO+wrdYWEqTj+Xxory3SeJfyzuGv3G1BWVAyiZRlfGzshcNFeNabfQK
         Ax7YOt1PlKY59fYGc4OxHaBQC3iWS0ZtmSBU1MzHTFb+gN8I8jACxfpDdxp9W9Ai/Pfb
         4BxroVTQ4ZnMgggp2Ej2cwRzknt5d1vfxffNnYHA4RF2oDqKPzbJRmzHNb/9oYgsCLTs
         nFETzThwPQoh7BI+Xc4I4I7X6XeDbwj91SVGbgpGKrGUVzlripkGBShtQKFuythL9l+/
         1EoQ==
X-Gm-Message-State: AOAM533UacRNqycNh0qymW+4XqwzcGVEQiaWCHD+AKDGAVGVDFGfct5n
        wq/iKEiLk65/Ci7USNF09anfAHDYvE0=
X-Google-Smtp-Source: ABdhPJwzVCRzTQ0E8502ffif0fVJTnPlR6Fvt/HW9AaMtT5L4hkrtvW9IZIKYK8m+eg+fhnS69mYhw==
X-Received: by 2002:a2e:9c9:: with SMTP id 192mr2037989ljj.197.1599665813443;
        Wed, 09 Sep 2020 08:36:53 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id t82sm645752lff.43.2020.09.09.08.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2020 08:36:52 -0700 (PDT)
Subject: Re: [PATCH v7 00/34] Improvements for Tegra I2C driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200908224006.25636-1-digetx@gmail.com>
 <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <854a0ed8-35dd-0b25-6c53-4915be0e33e9@gmail.com>
Date:   Wed, 9 Sep 2020 18:36:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vdh6bErqeO-ki2xsS9jEeoy4mKF1h0Jw_HM6UpukqH_BQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

09.09.2020 12:11, Andy Shevchenko пишет:
> On Wed, Sep 9, 2020 at 1:40 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> Hello!
>>
>> This series performs refactoring of the Tegra I2C driver code and hardens
>> the atomic-transfer mode.
> 
> I think there is still room for improvement, but let not block it, FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thank you and Michał for helping with the review! Very appreciate this!
