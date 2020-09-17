Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D85F626DF01
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Sep 2020 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727494AbgIQPDq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Sep 2020 11:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbgIQPD2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Sep 2020 11:03:28 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AB0C06174A;
        Thu, 17 Sep 2020 08:03:08 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id w11so2557179lfn.2;
        Thu, 17 Sep 2020 08:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2to3njOhdgwuq2I1e40+Byq+xuhBorXNqPr31tThoUc=;
        b=J9O1vvrVbuKnfKsqZIgRgTDLgrPDmqrKWY+i7RAW6XcFsqSBX0b2+XLOWXun5fMkTA
         04H/gk6m1F+bLw3GztpOgaDKJhC7orQ971r+DD2MIWiBZ+5B3y/Vv7470b5QV/6BR0Ah
         khpzgNubtj12Bv5iVi5TqwMPfJVYUpi+HtpG5mREM+JA2CRziqCjzvIE8H0NaHHLyDeM
         UJoKvhtZ2IxV4NLnl28VnyXsZscVAPx4aoC3XSznGtnkg0k/nx1aYYKirLdkG1wkir9f
         Otvd7Q83VSis0Jyye0720IYiLqbznCIxAsz/G25Ky2LwBTyXK1ptIF//S6NG7YEIekE3
         KCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2to3njOhdgwuq2I1e40+Byq+xuhBorXNqPr31tThoUc=;
        b=W+u/J6VunLIH4w8pYWvrpg4eIzynrO6anXm6jrQHtJMM1oj+QRQJ8GWRgSYSL+Vl2o
         iLOF1eOS0qw2bQVKzMDJiYhqU/KfcpZC5qqysZ/cGaVj8WOmSn2Bo0YV7eG86DcwzrYd
         j6BmTrWMUaDZHlgq4YLD66e0DSez7fGzVnW1SPdIXxcl60cOD6qTP/6tgM3H4rJmIHcx
         XmJUACqwPodlYfgUaUlvsBqn2RAaCmuY+eJUmBYpgV8luBBj+kQdvcrZr+Ns7rsuXumR
         NLkKY2+YrgBHX2gtQ6EGOi/LRFajsLbDtSTcQkZxYXM7+EeKiMlQNPTBf6tTRPfeTbVL
         2gRQ==
X-Gm-Message-State: AOAM533GmIlnBRc4H+53WsChePA7rhvMa0V298aEJq+WYDlqRijj28mv
        34kVOSvwzjqOK6Sb7y8LhEaaDXmxBxM=
X-Google-Smtp-Source: ABdhPJydlsr2iB7rq7ppcGxNzHIn7O29QeEihjdv8v2bssXmptvp8ORFcdItk4FAToY1McQWvXvmog==
X-Received: by 2002:a19:606:: with SMTP id 6mr8640701lfg.407.1600354986387;
        Thu, 17 Sep 2020 08:03:06 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.googlemail.com with ESMTPSA id b27sm5313220lfq.133.2020.09.17.08.03.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 08:03:05 -0700 (PDT)
Subject: Re: [PATCH v7 21/34] i2c: tegra: Don't fall back to PIO mode if DMA
 configuration fails
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200908224006.25636-1-digetx@gmail.com>
 <20200908224006.25636-22-digetx@gmail.com> <20200917114716.GZ3515672@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b2f68a72-9117-89d1-70f3-750ddc235482@gmail.com>
Date:   Thu, 17 Sep 2020 18:03:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917114716.GZ3515672@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

17.09.2020 14:47, Thierry Reding пишет:
> On Wed, Sep 09, 2020 at 01:39:53AM +0300, Dmitry Osipenko wrote:
>> The DMA code path has been tested well enough and the DMA configuration
>> performed by tegra_i2c_config_fifo_trig() shouldn't ever fail in practice.
>> Hence let's remove the obscure transfer-mode switching in order to have a
>> cleaner and simpler code. Now I2C transfer will be failed if DMA
>> configuration fails.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/i2c/busses/i2c-tegra.c | 18 ++++++++++--------
>>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> I'm not sure that's a good idea. It's always possible that the DMA setup
> is going to break because of something that's not related to the I2C
> driver itself. Having the system completely break instead of falling
> back to PIO mode seems like it would only complicate troubleshooting any
> such issues.

That code has zero test coverage because this problem never happens in
practice, hence it should be better to have it removed. We may consider
re-adding it back if there will be a real-world incident, okay?
