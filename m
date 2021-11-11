Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2201544D8F2
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Nov 2021 16:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234065AbhKKPQZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Nov 2021 10:16:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32315 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234053AbhKKPQY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 11 Nov 2021 10:16:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636643614;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RaQiWNaeSvc1w9swWxxIumoFqnCNft3G1L1GowqGe2c=;
        b=MSDTsxISWasLMfut4FQp6aIyIIUpEvvO0BNmPqpvYRWtZ7W9JA5/1dF/GbtGN0h7O8qndi
        MWSJvnPV35hZfgjDhFJ+5IQVsn7iAzNygKXl3IVygTVOWLefw1yrooxZ9DoZEY6nJw/Nf+
        F4V2NjHbvtvYkcNwyfOft/I4/dGmF84=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-5PaQ2Gu7NLyC3KZDOO8DCQ-1; Thu, 11 Nov 2021 10:13:33 -0500
X-MC-Unique: 5PaQ2Gu7NLyC3KZDOO8DCQ-1
Received: by mail-ed1-f72.google.com with SMTP id h15-20020a056402094f00b003e51ef806a9so1481824edz.6
        for <linux-i2c@vger.kernel.org>; Thu, 11 Nov 2021 07:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RaQiWNaeSvc1w9swWxxIumoFqnCNft3G1L1GowqGe2c=;
        b=tIuRXMQc80HCDphxlIa3AZZ9XWjsxpWGgCbTDHEwZ1iQ+g55Yel3FhabAtg/0mpvZM
         I+hejADBTiN6OgkvXBBXSjFBYrKVGrdmT7Lctokqfe60lW56eeZrjgkm+huRT4lflayJ
         hbNOK5vYo0J9xow5RhwbUXMkLPD1n2oyvXadqyed1oFPm/fdb5D4qRh07NDBqkHStpDI
         14P8wU5g6+2msWrVVoTskHNSyr6GbpalGk/l+36gtEmtlSUpb7sSYnVGcPna106HV29A
         Pg0Y11wh9Sz/ThRuCeT+xwy2ABKlBeco/GE2R6NdwrBdCxb5Zf7u4ZytImKNxPIMdgBR
         shBg==
X-Gm-Message-State: AOAM533X/KfCDrxnZwqKErXq7ikPNt+nZkg/cblbnkv4brAyfXgMEEXs
        HVadKJBI7/xTzYSLMQac/NJrtk+GTxysSkSfS4n9CsvkIeNxYl+LN4uI9buWR0XJbTQLTSgBZT3
        lFWX2z79dArvw4yqWT3lJ
X-Received: by 2002:a05:6402:184c:: with SMTP id v12mr10984232edy.242.1636643612257;
        Thu, 11 Nov 2021 07:13:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsd8FhsX1gKUjz/vl5VBZUjBU0VRQilvxDGoCBMaISX6Ysxjz7/nj2uP1yoHWIQVdIILT48w==
X-Received: by 2002:a05:6402:184c:: with SMTP id v12mr10984194edy.242.1636643612058;
        Thu, 11 Nov 2021 07:13:32 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id nb4sm1606641ejc.21.2021.11.11.07.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 07:13:31 -0800 (PST)
Message-ID: <4b8f27a2-9c2f-af96-cbd2-9e4c01d37c90@redhat.com>
Date:   Thu, 11 Nov 2021 16:13:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/11] regulator: Introduce tps68470-regulator driver
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
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
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211025094119.82967-1-hdegoede@redhat.com>
 <20211025094119.82967-5-hdegoede@redhat.com>
 <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YYpmMNefsGUhqJ9W@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Sakari,

On 11/9/21 13:14, Sakari Ailus wrote:

<snip>

>> +config REGULATOR_TPS68470
>> +	tristate "TI TPS68370 PMIC Regulators Driver"
> 
> s/3/4/

Thanks fixed for the upcoming v6 of the patch-series.

Regards,

Hans


