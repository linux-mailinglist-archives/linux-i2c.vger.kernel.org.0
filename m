Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 976C3A60C3
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2019 07:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725895AbfICFlt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 3 Sep 2019 01:41:49 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40569 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbfICFlt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 3 Sep 2019 01:41:49 -0400
Received: from soja.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:13da])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <o.rempel@pengutronix.de>)
        id 1i51Za-0005vB-Fx; Tue, 03 Sep 2019 07:41:46 +0200
Subject: Re: [PATCH] ACPI: support for NXP i2c controller
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Chuanhua Han <chuanhua.han@nxp.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Leo Li <leoyang.li@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
References: <20190711102601.20582-1-chuanhua.han@nxp.com>
 <CAJZ5v0hY2sL+XfN_4v07_hjvoxgCAt+Q89+wNg5Pky6XKP-mqA@mail.gmail.com>
 <CAHp75VfFtMMQhetRFHrx=Ft7OWwyMqLrwP3sPjT6YVtr8xCHoQ@mail.gmail.com>
From:   Oleksij Rempel <o.rempel@pengutronix.de>
Message-ID: <896b88d4-9d1b-922b-1784-55ef9a1a1830@pengutronix.de>
Date:   Tue, 3 Sep 2019 07:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfFtMMQhetRFHrx=Ft7OWwyMqLrwP3sPjT6YVtr8xCHoQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:13da
X-SA-Exim-Mail-From: o.rempel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 02.09.19 23:16, Andy Shevchenko wrote:
> On Mon, Sep 2, 2019 at 11:58 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
>>
>> On Thu, Jul 11, 2019 at 12:35 PM Chuanhua Han <chuanhua.han@nxp.com> wrote:
>>>
>>> Enable NXP i2c controller to boot with ACPI
>>>
>>> Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
>>> Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
>>> Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
>>
>> Wolfram, any objections to this from the i2c side?
> 
> May I propose amendment(s)?
> 
>>> @@ -44,6 +44,7 @@
>>>   #include <linux/pm_runtime.h>
>>>   #include <linux/sched.h>
>>>   #include <linux/slab.h>
> 
>>> +#include <linux/acpi.h>
> 
> If it's kept in order, better to go with it. (Yes, it is as I have checked)
> However, property.h should be included instead, see below.
> 
>>>          const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
>>>                                                             &pdev->dev);
>>> +       const struct acpi_device_id *acpi_id =
>>> +                       acpi_match_device(i2c_imx_acpi_ids,
>>> +                                         &pdev->dev);
> 
> 
>>>          if (of_id)
>>>                  i2c_imx->hwdata = of_id->data;
>>> +       else if (acpi_id)
>>> +               i2c_imx->hwdata = (struct imx_i2c_hwdata *)
>>> +                               acpi_id->driver_data;
> 
> 
> The above altogher may be replaced with
> 
> const struct imx_i2c_hwdata *match;
> ...
> match = device_get_match_data(&pdev->dev);
> if (match)
>   i2c_imx->hwdata = match;
> else
> ...

Instead of "may be replaced", I would say: it should be replaced :)

>>> +               .acpi_match_table = ACPI_PTR(i2c_imx_acpi_ids),
> 
> Since there is no #ifdef guard no need to use ACPI_PTR().
> 

What iMX/(other NXP?) SoCs are with ACPI support?  Where I can get one? I would like to 
know more about it.

Kind regards,
Oleksij Rempel

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
