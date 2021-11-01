Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E6E441AB2
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Nov 2021 12:32:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232126AbhKALef (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 1 Nov 2021 07:34:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50529 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231755AbhKALef (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 1 Nov 2021 07:34:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635766321;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RYc7kj3KhIC57+jtFXvlpfVC9ikhX2Z8kNJ8F2TK81c=;
        b=Qvkxb+IV4hQN8vM+aq0+s9/M4oVUyZN5uujIcuhHwkPvKF0nTb+4bWMDAU1KqlwVi/OuB0
        07/ROhPrflbwzJakM3CVTHRLvjkqcUF/igfN0SseFCog9ga50nwMc5N18L12cjU1tqNTLl
        eZ6DIm31A8zH/pGihru0Beu/QSy1zDE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-N7i1Q2l3O3-nUE6OTsAP5w-1; Mon, 01 Nov 2021 07:32:00 -0400
X-MC-Unique: N7i1Q2l3O3-nUE6OTsAP5w-1
Received: by mail-ed1-f70.google.com with SMTP id h16-20020a05640250d000b003dd8167857aso15311393edb.0
        for <linux-i2c@vger.kernel.org>; Mon, 01 Nov 2021 04:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RYc7kj3KhIC57+jtFXvlpfVC9ikhX2Z8kNJ8F2TK81c=;
        b=VXasterRto1q2ttUZGpEnP45VVlWel96tVAzRB/qgZVMJrYXUFimHVnte5PaGeWg+e
         sIj3xYfUJ+OL4dI8tQpzEmlr4yJNPf32mTpfixv4zwA4nkih2UbutjF/pmiralYEvPj+
         aPF+d0XRn4YbgD8NNpWSjAJP6p9NJgE0HVo4uWNTujgAUr4/1BGdhjW07sttvzZaoR02
         RzbIq8qK+kVuv7JAhmC3AN6nA7vQXyQjAJowvGgujF8oNChbuz47QpJMTdpaJgpTlRLQ
         +dw7wK3zUmzyJKA/3Li4dT3HpUCFRJ3doezVjomwiFjg+YgIXkEUjRBE7hdaBYVg4Lxp
         Q7lA==
X-Gm-Message-State: AOAM531hDoU6oYjGd4G0Mg5LrMDMN87rCq8jnZHxWfY06sIcVU7t284h
        c6G5EI+hWkNd+wqy2veKB+3UKCCHT27fMX20NIlVrvElYsuV/6RuIOOclYf1bvFCfg0FRUBuhUB
        IcF9LtaROpCulQGHqE4ai
X-Received: by 2002:a05:6402:2743:: with SMTP id z3mr2848029edd.167.1635766319105;
        Mon, 01 Nov 2021 04:31:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdzg3VeYKOvszAqY+bqfDsMTo43Ia8gPNjqW9LqNEBZ2jGBaPHdiCf4pqPe8/QslsQIofAZg==
X-Received: by 2002:a05:6402:2743:: with SMTP id z3mr2848008edd.167.1635766318947;
        Mon, 01 Nov 2021 04:31:58 -0700 (PDT)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id hb14sm2906657ejc.115.2021.11.01.04.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Nov 2021 04:31:58 -0700 (PDT)
Message-ID: <08a94895-ad57-c8f2-fcb5-ff1c1637dc0d@redhat.com>
Date:   Mon, 1 Nov 2021 12:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 10/11] platform/x86: int3472: Pass
 tps68470_regulator_platform_data to the tps68470-regulator MFD-cell
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-11-hdegoede@redhat.com>
 <CAHp75VdC8i1YWZh_KXNqz_hHgHFoXQ57cce4-x3e6Ha0ZVPQag@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdC8i1YWZh_KXNqz_hHgHFoXQ57cce4-x3e6Ha0ZVPQag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 10/25/21 13:38, Andy Shevchenko wrote:
> On Mon, Oct 25, 2021 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Pass tps68470_regulator_platform_data to the tps68470-regulator
>> MFD-cell, specifying the voltages of the various regulators and
>> tying the regulators to the sensor supplies so that sensors which use
>> the TPS68470 can find their regulators.
>>
>> Since the voltages and supply connections are board-specific, this
>> introduces a DMI matches int3472_tps68470_board_data struct which
>> contains the necessary per-board info.
>>
>> This per-board info also includes GPIO lookup information for the
>> sensor GPIOs which may be connected to the tps68470 gpios.
> 
> gpios --> GPIO lines

Fixed for v5.


> ...
> 
>> +       board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
> 
>> +       if (board_data)
> 
> IIRC it's a dup. Below already incorporates this.
> 
>> +               gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_table);

Not sure what you mean here? This line *dereferences* board_data, so even if
gpiod_remove_lookup_table() already contains a NULL check for the table pointer,
we still need the board_data check to avoid dereferencing it to get
the tps68470_gpio_lookup_table member.

Regards,

Hans

