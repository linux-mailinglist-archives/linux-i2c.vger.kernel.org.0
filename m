Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D479043744C
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 11:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbhJVJGz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 05:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51483 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232345AbhJVJGy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 05:06:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634893477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NJGZhkxj38uYQtmuRmaa5a4QRl7cPEpIp72Xf6GYbis=;
        b=P01r7vf+j+Shx4/WX9StNxXhU5Fklnw7hrahPr3r1HoBc7ONbEJtoPkBY6ekKOzXKilkEg
        dUPC9vBhido5O6i0iYDC0C6kLyKxO5MWFvmSQ2J4kZcRIp4WBCTyv96+43BETGf6YANS/b
        MCHkPabM0T9qRYG/tUyDgBXKIbyh1mk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-qkNO34ZHN6mrUJY_XSfClQ-1; Fri, 22 Oct 2021 05:04:34 -0400
X-MC-Unique: qkNO34ZHN6mrUJY_XSfClQ-1
Received: by mail-ed1-f70.google.com with SMTP id m16-20020a056402431000b003dd2005af01so1424315edc.5
        for <linux-i2c@vger.kernel.org>; Fri, 22 Oct 2021 02:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NJGZhkxj38uYQtmuRmaa5a4QRl7cPEpIp72Xf6GYbis=;
        b=0qGWFOANQNaofzMt3gp2AM1fq4RJ6VNDAPbkjRaBw8qxqk9QAo3W7FallMj16FmIM8
         XkveceDzcBDXInE4K0kAVrjUPJHgZYD+EipXRrwZ2J6Udo/8qY06VSsZ3+bho6oXb4qh
         Oz2V/vRRQUNvJKHt6+taO3QNUxE9IYIVRWH8O7o47HYLczg+r5GBJ6MUOG5GsvaEKqZd
         lt453MoVKTXzNsWeH9uozqxk38T+G5IFvyZLmDoUMIPUR0A7/bhnQCwxClGUErBD2VnV
         iOpe+B01YgVcqzDXK2Fb/nT3DuhC2n+NELMuixiaGjhgJLJt7s3XK6ihuOAx3aU42YWb
         2xUw==
X-Gm-Message-State: AOAM530uon2G4Pw89EsrJqdhbWlNkiHvOAUE4m8LxrjksclDoPrrTqaW
        49QBbDVoqOFu90QzUhH2jyrLMi6hqUwnkEfqAupAtPdUWuuoC1EgL5yFyubamtdboLgipQzNiYK
        psfd9vUosplHCCFWQJfqG
X-Received: by 2002:a17:907:6d9f:: with SMTP id sb31mr13655309ejc.109.1634893473605;
        Fri, 22 Oct 2021 02:04:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgaLxV/q19thSWzWkPVL40Td4avhVP3W53ZxVNiGvYCe3dCcT5gMVAl5iE2ggZ3DTJDYw6TQ==
X-Received: by 2002:a17:907:6d9f:: with SMTP id sb31mr13655281ejc.109.1634893473415;
        Fri, 22 Oct 2021 02:04:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j1sm4078740edk.53.2021.10.22.02.04.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Oct 2021 02:04:32 -0700 (PDT)
Message-ID: <fd11b3fb-1f14-cd9e-c6f7-cbea0aa6548b@redhat.com>
Date:   Fri, 22 Oct 2021 11:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 05/11] clk: Introduce clk-tps68470 driver
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "Rafael J.Wysocki" <rjw@rjwysocki.net>,
        Wolfram Sang <wsa@the-dreams.de>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-6-hdegoede@redhat.com>
 <163415237957.936110.1269283416777498553@swboyd.mtv.corp.google.com>
 <4e5884d5-bcde-dac9-34fb-e29ed32f73c9@redhat.com>
 <CAHp75Ve_xqgnaCqc3oyDMWDE9kVm8HNOEcdMuDkOD9epwgfWnA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Ve_xqgnaCqc3oyDMWDE9kVm8HNOEcdMuDkOD9epwgfWnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/22/21 10:46, Andy Shevchenko wrote:
> On Thu, Oct 21, 2021 at 8:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 10/13/21 21:12, Stephen Boyd wrote:
> 
> ...
> 
>>>> +       regmap_write(clkdata->regmap, TPS68470_REG_CLKCFG1,
> 
>>>> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
>>>> +                          TPS68470_OUTPUT_A_SHIFT) |
> 
> One line, please?
> 
>>>> +                          (TPS68470_PLL_OUTPUT_ENABLE <<
>>>> +                          TPS68470_OUTPUT_B_SHIFT));
> 
> Ditto.

Ack, both fixed for v4.

Regards,

Hans

