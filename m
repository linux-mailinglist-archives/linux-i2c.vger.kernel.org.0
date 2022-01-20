Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBE94950ED
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:05:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376399AbiATPE7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 10:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376355AbiATPE6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Jan 2022 10:04:58 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F969C061574;
        Thu, 20 Jan 2022 07:04:58 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id n10so14300925edv.2;
        Thu, 20 Jan 2022 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0B0txwt9I3zBHBA04rxL+1M1cNNBUpFyJyCl5rt6UEQ=;
        b=OaZBl8tGrO1X9a7FHGZB4cmJ4VgTU/3ItHTB79dImrklyW3lvKSD8e+ysCI/q8fTkY
         ZN/OJ9sLOdYorv2sKzI/D6kLhs/iS3ZZvdwmkCt/Bte9hVj/JLeaTa5pd0Z7LXPVtBHZ
         PTV2OqYeVGK6CUmulaU1mkya5Nx+qD6sVJbaoGkbUkw0YbABzXFkz538JiSIxTwMcc/t
         SlSOJuRSr2h6li7ph1WuwSEInBUxqmajFWtG+B8Hxn+Js0If8VxlZt+J8ffhVMW3C4ur
         iC+g6I9030SeiVxyy1EdJwlaJkyDAyvpLBlS6TAx37CzQJZmOuWcTjl9rCC+MSANkzSX
         kFhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0B0txwt9I3zBHBA04rxL+1M1cNNBUpFyJyCl5rt6UEQ=;
        b=mqS2rHgT34MivHGFR8AkkM0JsYSoo0avOhBikljCixK2zF0s4in4W8GSY8JMbOXXsH
         HRbpZ68ZiOiqJQtwiQKPYDhc+CL8L98uj75JNoNCg1gaI1nUB3cKShhuiLo45G5hnhyY
         49RAqnczOZeBIPPIvh5HOgNb9ImCc8OeSn4TZaUymELjv+s05ZGmWQ5jErowAAD58DPT
         grASC9DB7T23KXibwinnrgUhEuBe13nO+GwXiqJqZrB4mhNqdg51O2KAnYRKokaoXon2
         R9ak3gRCIPsRR5L9ySVqOSIU/aTuIn5zTtpfjshMHdtenOs8/ew2SFdNnZqBmtnT88r9
         yTLg==
X-Gm-Message-State: AOAM530RyrP1WEMspF0OZ+eUlyoN+WGmrGR87EDLxJnVgYqBMf2B7FIL
        ZGmsjsSDxQOORhifKKKAR78glRqPX2YjFtUwpHU=
X-Google-Smtp-Source: ABdhPJzZRS5c6GbMZJ3YVrg75Ha9c8GpIBK6w4XxIX4joFpc3VUWOdfDcTqr1Crv3QTvW9rKuYxr1irkQ89yZOqzfos=
X-Received: by 2002:a17:907:968c:: with SMTP id hd12mr28869417ejc.639.1642691096836;
 Thu, 20 Jan 2022 07:04:56 -0800 (PST)
MIME-Version: 1.0
References: <1642686255-25951-1-git-send-email-akhilrajeev@nvidia.com> <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
In-Reply-To: <1642686255-25951-3-git-send-email-akhilrajeev@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 20 Jan 2022 17:03:14 +0200
Message-ID: <CAHp75VehSCxszDV3UQCEnPk7OCXRabRMJEStjpCamBG6X1iaCw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] docs: firmware-guide: ACPI: Add named interrupt doc
To:     Akhil R <akhilrajeev@nvidia.com>
Cc:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Christian Koenig <christian.koenig@amd.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Len Brown <lenb@kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Wolfram Sang <wsa@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 20, 2022 at 3:45 PM Akhil R <akhilrajeev@nvidia.com> wrote:
>
> Added details and example for named interrupts in the ACPI table.

Added details and example for --> Add a detailed example of the

...

> +            Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) {
> +                0x20,

I would think of splitting this to two separate entries in between of
which the GpioInt() resource is provided. It will explicitly show that
you describe the case only for Interrupt(). Something like

  Interrupt (...) { 0x20 }
  GpioInt(...) { ... }
  Interrupt (...) { 0x24 }

But it's up to you.

> +                0x24
> +            }

...

> +The driver can call the function - device_irq_get_byname() with the device
> +and interrupt name as arguments to get the corresponding IRQ number.

Needs switch to fwnode as per comment against the previous patch.

-- 
With Best Regards,
Andy Shevchenko
