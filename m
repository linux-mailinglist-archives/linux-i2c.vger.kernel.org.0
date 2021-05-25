Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F019E390C45
	for <lists+linux-i2c@lfdr.de>; Wed, 26 May 2021 00:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233003AbhEYWb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 May 2021 18:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233006AbhEYWbw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 May 2021 18:31:52 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E546FC06175F;
        Tue, 25 May 2021 15:30:20 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id y184-20020a1ce1c10000b02901769b409001so13689279wmg.3;
        Tue, 25 May 2021 15:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ImUYHFvGSG+UrisbbQQW/hinj6UPUJsUvMf4oZNIFsA=;
        b=SwctXnartSe2t2ZlKSoo30DfkWjkfVtq7EsUA/jcoOH6nwfSXeVbedwXKpNDSuY6qv
         ggiMy4pWugBTe/FHagZhPTQchGAoV0N4381sQ3s5J1xPmpzzNH5vdrFALbqqWIl7TWYL
         Xetc46DIIqJuKLAdcugWgB5J/hGdMTtbFg1YbgKFicGqA8YDvbpDGDwUTESR6KaA7VeJ
         xq6xAyvL/ZMW3cgRPaw6cPGyDaWRViNAjC8uDAsjYInJQ4SKALvvo/PJ8BnFYYq+I9AQ
         BzKL24iUNNEUv0Ihp9+L6rPlR1jcW1sK+4wZfAncs/mFJJ5O7rzdS/ia/CL7b75yhzti
         wJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ImUYHFvGSG+UrisbbQQW/hinj6UPUJsUvMf4oZNIFsA=;
        b=bcWR0SN+cBMhdjzZs12VKKUZA4HDVdj2W+GdZ9NDKGV7VZHrwOCWFh1NKz8C4hpcvJ
         stANGZsu2ykp2fyJph95bs7AIe8KuJZIrs316kt62P/ynOBrSviS5GgVCs6uEiSEFr7B
         wS5IfhaJT/ar3hOJlTqRSZJ8h0DluXxhSDf+peLL2fHmteRG8wfPVR2dT2PRtKzNYGUM
         /lYqV9ZzXYoYbLU1vm6LLju1HUM4IT6ECTL70En65pnfInRlgmZlh+y4Hf34qFxoZgaG
         tJDXYXqVYwyaKMbWai1h0eY9BVBV+E/eDt7gpB/dRNkA3WwiSlKwSvxD+dS9n4Z6rZa5
         cpng==
X-Gm-Message-State: AOAM532fZwgnmQM1QYeTskvq1UzYGJNy873otbnzI+lQKi76A4jVrKt+
        ODeP08rVY8J5JcDUpqnnH3Q=
X-Google-Smtp-Source: ABdhPJwBtSv7vOz68pleY5h0sjS0TVpkGdHqMZuuNaP2llMqMtEV0PT0QcNqQbMlqUtP34+PhCH/+Q==
X-Received: by 2002:a05:600c:1909:: with SMTP id j9mr26561626wmq.100.1621981819605;
        Tue, 25 May 2021 15:30:19 -0700 (PDT)
Received: from [192.168.1.211] ([91.110.20.117])
        by smtp.gmail.com with ESMTPSA id s5sm12569464wmh.37.2021.05.25.15.30.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 May 2021 15:30:19 -0700 (PDT)
Subject: Re: [PATCH v4 6/8] gpiolib: acpi: Add acpi_gpio_get_io_resource()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-7-djrscally@gmail.com>
 <YKeiD8LawbyhnDZn@smile.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
Message-ID: <cff64c37-8c2c-f24f-cf95-e540065899df@gmail.com>
Date:   Tue, 25 May 2021 23:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKeiD8LawbyhnDZn@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 21/05/2021 13:05, Andy Shevchenko wrote:
> On Thu, May 20, 2021 at 03:09:26PM +0100, Daniel Scally wrote:
>> Add a function to verify that a given acpi_resource represents an IO
>> type GPIO resource, and return it if so.
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


Thanks Andy, and same for 1/8

