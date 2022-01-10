Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56753489FAF
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jan 2022 19:56:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242643AbiAJS4h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 10 Jan 2022 13:56:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242634AbiAJS4f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 10 Jan 2022 13:56:35 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9D0C06173F
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jan 2022 10:56:35 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id l10-20020a17090a384a00b001b22190e075so72871pjf.3
        for <linux-i2c@vger.kernel.org>; Mon, 10 Jan 2022 10:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F3TJb2qvODPhHuRvG+TSwWDhsfj5NbPsF0sZDWvDjV8=;
        b=VVrxc6G1UyjfjixQPFTXAnXytT0rtVC0yUleq43ySfEpyI5PXPj++eTsnK+1xNNqEj
         LRkCIdKxZvhDw5Mrzzede2zM3/eN0NUWuhXDygJyroL7kbEPLJHJezJmLnz4wtHiCAbo
         1+SO/K8OuCdYH4Pb4LKWaVOz8WzGpLCgl5L5MUMYIDvoj3sxzZaZY1ndkN3640F0GMY1
         NNoAnWdTQJFyda53AFffCr8zzLio8VOkmarztNO3E7IDdlLkd3GVqG3ypkil2mOpn7AN
         QpyB15xSueh/orIaGVePALu3OyubyN6/Xgladb9OsSJqkO35n4yzWwyqJgi5QRc2sPe3
         LTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F3TJb2qvODPhHuRvG+TSwWDhsfj5NbPsF0sZDWvDjV8=;
        b=SM6vZSbE0hshUdMJFTnToBBsFWa0VXBkKweXkhdDMw1qqRcDzpRwIzLBFq/CSlMC06
         3tdFM8e5J0P61LJyodI8GJD9/YrpcjSobeKdunlfVd1C+Kgp39Xsjxof1uXWRhqFiV8+
         8FJGrtWYl6t3eq87e1kr+C0QAILVC43qvfZV1s39Y2oYIxNiRRp9E5mbo28p6vAhDpEe
         lNehfKeQl417nk8zaJOVQKzEzigbQxvspmhWHtzFc+M27ps/xZLt8ZgLGFCoILTjQgGr
         oQfZv4jjVkgSFZaVS8U6MLrvWnvEEQvXV5gEsUJvBg9O/nhvGGliIvNN3rLiNpcFwaMQ
         0GqQ==
X-Gm-Message-State: AOAM531X9BUnrdQXdT6ZF6EG/5QohlCIaVmLjU3tU+58vzjK3COXbCGi
        NSwe1a4srWLu7jS6yHfPhsp/c1OesczhjsUDfuaHo6JXrV5JIA==
X-Google-Smtp-Source: ABdhPJx0ER/XnFGs6RwNR0p32T+YpaO4KIdMZAv76wC88OXH6TXAMO8VMymRinLrAmzAvnuo5aYWEunKKvriNsas24c=
X-Received: by 2002:a17:90a:bb05:: with SMTP id u5mr16623129pjr.64.1641840994602;
 Mon, 10 Jan 2022 10:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20210210230800.30291-2-sakari.ailus@linux.intel.com>
 <20211007022527.2448652-1-rajatja@google.com> <YW3XwDxwBsJdFslA@paasikivi.fi.intel.com>
In-Reply-To: <YW3XwDxwBsJdFslA@paasikivi.fi.intel.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Mon, 10 Jan 2022 10:55:58 -0800
Message-ID: <CACK8Z6FcBusdMMsu2vKZT8vx6yvcWS7Gh7bDyYqdB1ikspEHDA@mail.gmail.com>
Subject: Re: ACPI: scan: Obtain device's desired enumeration power state
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Robert Moore <robert.moore@intel.com>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
        devel@acpica.org, rajatxjain@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

+Bingbu Cao +arec.kao@intel.com

Hello Sakari,

On Mon, Oct 18, 2021 at 1:23 PM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Rajit,
>
> On Wed, Oct 06, 2021 at 07:25:27PM -0700, Rajat Jain wrote:
> >
> > Hello,
> >
> > Now that we have landed the ACPI object for _DSC in the spec:
> > https://lore.kernel.org/linux-acpi/CAJZ5v0gwDEjC9T7wfCqDr7R0q_ptz2nVU52_8i8noXHPEign1g@mail.gmail.com/T/
> >
> > I was wondering what is happening with the corresponding kernel patchset:
> > https://lore.kernel.org/linux-acpi/20210210230800.30291-1-sakari.ailus@linux.intel.com/T/#m24e9f51119cbe6eb39f31c097ea3941d00a0baeb
> >
> > I didn't see any pending comments, so is there a reason it did not land?
>
> Thanks for the ping.
>
> I've rebased the set and switched to _DSC so I believe it is ready to be
> merged now:
>
>         <URL:https://lore.kernel.org/linux-media/20211018121729.6357-1-sakari.ailus@linux.intel.com/T/#t>
>
> I dropped the ov5670 patch from the set to avoid a conflict, I'll get this
> merged through the media tree when the rest have landed there.


Thanks, I see that your patches series has been merged. Can you please
also line up this follow up series by Bingbu for inclusion into the
mainline kernel?

https://patchwork.kernel.org/project/linux-media/list/?series=595925

Thanks,

Rajat


>
> --
> Regards,
>
> Sakari Ailus
