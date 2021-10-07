Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1D64257FC
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Oct 2021 18:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233610AbhJGQcx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Oct 2021 12:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242081AbhJGQcw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Oct 2021 12:32:52 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C220C061755;
        Thu,  7 Oct 2021 09:30:58 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id y26so27619102lfa.11;
        Thu, 07 Oct 2021 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PntghZ8n41IEBKZwu1ubyDn5UXAobTnUN27Au7WdLGE=;
        b=iZ+kc59FBshBteoGO/qrCtxFvr02X7u3GnjTikCt1QT6Ywc6If91lrNioPaLW6723I
         ljnXmKxN9sDoAEhk4e5ZO7o7Tl4MnCtAK+sqXDqP+DjEI9wqVFsGmZy4G8bulUdi6Fky
         MHU8MHOVCufnD1Jux3naP2qgurHfgSkD8736QxP8eIty/Z7hVC5ULrAyO5/9TEx4FSeB
         IAg/thaQ1vZDzXHFEReZLOLZPcOvtUTAraSGbSUCOo/b23xdmb3h5nJu0Z1qpwXjzS2C
         vZCJhiX8Rbf1/bO8g5a0jtc1Rg8w0wSqzOL7fk3IszH1GBmt7lVk8LyINHrdhEfEo5Vp
         kmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PntghZ8n41IEBKZwu1ubyDn5UXAobTnUN27Au7WdLGE=;
        b=hE3MTp6FHU/eCLz0O21BN9GEt5l55jjz1XoEI8+pjq95eb11Y1P0qMGCfcbKT1e67S
         obdGvAuzo9sJ54Y35dwnLhdUPIaY6J+GsLNVJcO/61O2QJDWeoERoWHJysGmg9AeZU36
         NTLFXknLo0ziMX+G2RofU4W9q1jUikhW9xC0+TpjVoCz6zgOixoWF8wOCfWqi4TvkBcF
         H1MZtZEKfXuUiCKwe2im4C/DXC0mcqAbexzN3sezZa447S/QoRDp+fVK3bwLu+3dDbyj
         ayB2E/WjtqXU/0w/gWDrIgwkE5BgB0wO5cnoBtDEC4h87iJXa1eXn8a8AfcEPK+Rp2g0
         IMiw==
X-Gm-Message-State: AOAM530gB8yLveOq2WncvUbIlbt7u+M7/BXwr5OcbzQmOexcuokN6PDn
        8ScQL5zWjgBKQk8qjIuFjCS0cbODfNA=
X-Google-Smtp-Source: ABdhPJyNTd/LgrUJmY/linh8EkDp7cyeKNQdpUD82bNJH8koRz+dauHIvwkynGR5wf567QSorCtDyA==
X-Received: by 2002:ac2:46c1:: with SMTP id p1mr5412113lfo.7.1633624256700;
        Thu, 07 Oct 2021 09:30:56 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id s13sm3485lfp.70.2021.10.07.09.30.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:30:56 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] i2c:busses:Register PCI1XXXX adapter to I2C
 subsystem
To:     LakshmiPraveen Kopparthi <LakshmiPraveen.Kopparthi@microchip.com>
Cc:     UNGLinuxDriver@microchip.com, wsa@kernel.org,
        andriy.shevchenko@linux.intel.com, treding@nvidia.com,
        mirq-linux@rere.qmqm.pl, s.shtylyov@omp.ru,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210929062215.23905-1-LakshmiPraveen.Kopparthi@microchip.com>
 <20210929062215.23905-2-LakshmiPraveen.Kopparthi@microchip.com>
 <d39e99ff-6498-e532-e833-1c65861d566f@gmail.com>
 <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5493f2ea-4e5a-3917-4fee-08d8ef0511b5@gmail.com>
Date:   Thu, 7 Oct 2021 19:30:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <683a7136ec818d01420a5c2cbf43e13498d82740.camel@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

05.10.2021 11:50, LakshmiPraveen Kopparthi пишет:
>> Interrupt is disabled in ISR, this lock does nothing.
> 
> Ok. But there are some registers that are read and updated in the ISR
> and in the foreground.
> I will add the lock for these register access.

Please either add everything into a single patch or remove the unused code.

If you will need to add a lock, then like Michał Mirosław suggested in
the other reply, you won't need to store/restore IRQ flags in the
interrupt context.
