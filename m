Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E838A46C02D
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 17:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239370AbhLGQFe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 11:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238825AbhLGQFd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Dec 2021 11:05:33 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA27C061574
        for <linux-i2c@vger.kernel.org>; Tue,  7 Dec 2021 08:02:03 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id b40so34576123lfv.10
        for <linux-i2c@vger.kernel.org>; Tue, 07 Dec 2021 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=0KoqMwokWoTJYma4Godv9G096meILmsJGIQ+G2Trtp4=;
        b=on6ZdQ84q52bywjrtTKbWInlYXBTL59z5uSPorIp+xOy/cD/TfzjeH1D02qvHH7M3J
         6Nva/bhOIMbtAckJQsKsw7knMPlke2EgP4Rlkh3n09jkaGQ6YnbpsRpzp9dArHfm4KJ6
         DLU/DqCjJXnM3MBRemphy33kdvkyGgr1ZI6f4VQ1RUnchMFbjvEb+SLA8/GC8PjfMJOK
         h3yGRKhOAfZ2s3L6WfIb2PRKLD0Pf5Ajg/7r2iCRuatONUI9UjxFbZpiSHcw8Pam4vhW
         gFpxLPxoFFC5MIPbQKFESOTSc3oejBp7LI2j7xo67qOSOnmmAeg2ufaG8qkA6BYzOOEN
         1D+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=0KoqMwokWoTJYma4Godv9G096meILmsJGIQ+G2Trtp4=;
        b=MSOXfPL7Uo8BFE8FWPaNsp8Ks3c3ppwKcSGypbG3Y3GzNvBw25GtiLKTjZ0gbYwzMq
         4jj115WCcqIip+3MBTmlopCJAuivMGm1iaKPm1fI3G6mgQ6tWQtpn1Erw9RuAYjt5wLI
         PaO6UP0I4nvmNDeHhdQUHs+cYTUc+7KAR2Hg2jDMwyv66ixqq0CkQC3eug7VuozIUoU7
         7qLddqVLrjLOAOjfsZ9dS68eZgDiGq098D9mU7ZsGQlopVvta4Q8Hb+ATPlqHhzuI3AH
         FIFjA2EBFY2eCHRRsEagKfhn8XnrJejuT4CgaU1wOmjbPnPswPIxKCDwiz7UgG4QwuYY
         XP9Q==
X-Gm-Message-State: AOAM533N9HPeT8nuZwTrMbceMGWHvSuNtHuDjcfxB2jpNY1nfQTyGNdT
        s5yCeMWyukzjLmpX7mRo0B3ZMwgd19oso7KWplvYAw==
X-Google-Smtp-Source: ABdhPJzBldg6RWAiZ5tB8HzosCsN0iM5UqOA8sXdpwcHt6bGKk+F1CxSGk8+iGjlB61uD3KmA8MK7co7fL4RXvMEn1g=
X-Received: by 2002:a05:6512:1113:: with SMTP id l19mr42335730lfg.184.1638892919623;
 Tue, 07 Dec 2021 08:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20211203023728.3699610-1-suichen@google.com> <YapHznDoqJ+wjx8m@kunai>
In-Reply-To: <YapHznDoqJ+wjx8m@kunai>
From:   Sui Chen <suichen@google.com>
Date:   Tue, 7 Dec 2021 08:00:00 -0800
Message-ID: <CAJOps0u=seskB-YGvLBsHantJohkEX7do-mt7YSZ6zChQMQxbg@mail.gmail.com>
Subject: Re: [RFC Patch v2 0/3] I2C statistics as sysfs attributes
To:     Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        joel@jms.id.au, andrew@aj.id.au, tali.perry1@gmail.com,
        benjaminfair@google.com, krellan@google.com, joe@perches.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 12/3/21 8:37 AM, Wolfram Sang wrote:
> On Thu, Dec 02, 2021 at 06:37:25PM -0800, Sui Chen wrote:
>> Add I2C statistics such as Bus Error counts and NACK counts as sysfs
>> attributes so they don't need to live in debugfs.
>
> What has changed since v1?
>
>  From a glimpse, none of my questions to v1 have been answered or
> addressed?
>

Apologies for missing the first email, I double-checked my mailbox
and saw it. Difference in v2 is not much, with just the
tx_complete_cnt added.

Before answering the questions please let me give some
background info:

The motivation starts with monitoring the operation of BMCs and then
applying what we learned to monitoring BMC health at scale. The BMCs
we're interested in run the OpenBMC distribution, which is characterized
by its extensive use of DBus APIs in the sensor stack and everywhere
else in the system. We had been working on some tools centered around
DBus and had discovered issues on certain systems by looking at related
metrics.

A snapshot of the data we look into on a running OpenBMC system may
look like the following (a screenshot from one of the tools we're
working on):

+-------dbus-top v0.xx-----------------------------------------+
|Message Type          | msg/s |Method Call Time (us) Histogram|
|Method Call            282.91 |  1387-:                       |
|Method Return          282.91 |   227-::.                     |
|Signal                  56.98 |    37-::::::              ::  |
|Error                    0.00 |     6-::::::: ..::....::..::: |
|Total                  622.79 |1%-99% 57.00          23899.00 |
+-------------------------------------------------------+------+
|History     (Total msg/s)                              |
|-                                           -700       |
|-                                          :-525       |
|-                                     .  : :-350       |
|-                         .  ::       :  : :-175       |
|-                     .:::::::::::::::::::::-0         |
+-------------------------------------------------------+---+
| Columns 1-3 of 6                           200 sensors    |
|   mobo_pch.......   Core_xx_CPUX...   Core_xx_CPUX      > |
|   mobo_pch.......   Core_xx_CPUX...   Core_xx_CPUX      > |
|   mobo_pch.......   Core_xx_CPUX      Core_XX_CPUX      > |
|   mobo_pch.......   Core_xx_CPUX      Core_XX_CPUX ..   > |
|   cpuX_tem.......   Core_xx_CPUX      Core_XX_CPUX      > |
*************************************************************
* Destination     Sender I2C Tx/s     Sender CMD            *
* systemd         n/a                 /usr/bin/cpusensor    *
* :1.78           n/a                 (unknown)             *
* systemd         172.44              (unknown)             *
* systemd         n/a                 /usr/bin/externalsenso*
* systemd         658.28              /usr/bin/fansensor    *
* systemd         167.94              /usr/bin/hwmontempsens*
* systemd         10345.07            /usr/bin/psusensor    *
* :1.15           n/a                 ipmid                 *
* :1.59           n/a                 ipmid                 *
* systemd         n/a                 ipmid                 *
* :1.67           n/a                 /usr/libexec/kcsbridg *
* :1.26166        n/a                 (unknown)             *
* systemd         n/a                 (unknown)             *
*************************************************************

As one can see from the figure above, there are a few hundred DBus
messages flowing through different DBus peers on the system at
any given moment, with a few daemons reading sensor data via I2C and
publishing them on DBus. We observe I2C to be a large chunk of the work
the BMC is constantly doing, and actually it has been the source of a
few problems we had seen and fixed.
By the time we started  this tool, we have had enough experience
and confidence to say that I2C would be interesting for both development
and monitoring at-scale and is worth investing in.

The requirement for a stable API/ABI is mostly relevant to the
"at-scale" monitoring part. Here are the answers to the questions:

> 1) Why do you need this information? I don't think values like NACK
> count describe the health of a system. NACKs are perfectly OK in
> regular I2C communication. So, for now, I think debugfs is the better
> place. An exception might be the bus speed. Some people already had an
> interest in this.

- Because we're targeting at-scale monitoring of fleets of machines
   in large numbers with identical hardware configuration, the
   I2C counters (including NACK) can be used for apples-to-apples
   comparison, for detecting anomaly, etc., while this may not be
   applicable to a single machine.

> 2) Even when this information is kept in debugfs, we can still add
> some core helper to have a standardized structure for the created
> files. This is independent from sysfs. I don't think I want this a
> standardized ABI, currently. Unless you explain good reasons to me

- The monitoring is done in a production environment, so it is not a
   "debug" usage. Android 11 removed support for debugfs [1] due to
   unstable and undocumented API, code quality and vulnerability issues.
   We would like to follow a similar rationale for the I2C counters.

- debugfs paths may be vendor-specific, so a monitoring framework would
   need different code paths for different vendors without a stable
   method for obtaining those counters. This may be resolved by the core
   helpers, but our intention is to not use debugfs if possible.

- A monitoring system includes not only lower levels such as the kernel,
   but also higher-level standards such as Redfish, and also the OpenBMC-
   wide DBus interfaces and C++ bindings. Redfish has already committed
   to creating a new Schema that contains similar metrics; the Schemas
   is expected to be stable for a considerable amount of time. OpenBMC is
   considering adding its system-wide DBus interfaces for the I2C
   definitions to reflect the relatively stable Redfish bindings too.
   Therefore we kindly hope that the kernel interface for I2Cs can
   be similarly stable just like the other two.

For the errors found in the testing, and other potential errors in the
code: we will look into them and correct them.

Hope this may be useful,
Thanks
Sui

[1] https://source.android.com/setup/start/android-11-release#debugfs
