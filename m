Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895E4359D95
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Apr 2021 13:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbhDILlB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Apr 2021 07:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbhDILlB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Apr 2021 07:41:01 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10333C061760;
        Fri,  9 Apr 2021 04:40:48 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id q5so4043689pfh.10;
        Fri, 09 Apr 2021 04:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=toHEXdnaNBk9GHY+VmwU6VmVbCpteUHLPGolOIUVXZU=;
        b=fivWDPUPTx3qLdVc6swehdu5IUGBcWhBZBgV9JvJvG1olAGiSuV8ZX2m66fe+NJmqy
         WRFeQjrVGgVAC0MVMfCayQ2KwW1swsItadGv6JN5uX8OdSSKgBW2hROY8qwBzcLHAXYH
         +W9KLPr+5pEIB2XdW1P0ZiVnbjvdPP0Ega2bAxp5HUI7oAsnS812RNksw202p/+8HEcT
         gxN3kaMRY9id8buLOl/8g9lUq+iRkpzmOA6taKq+e3nx3UrN7phKaRHx9tJ5IKU13UbW
         pIyGUsSnsrfPktYMJS9C1F8RNXnOSpJBuawhJlBqTenBh/Qjbht16B/qYXiM00Oz3HW2
         H3qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=toHEXdnaNBk9GHY+VmwU6VmVbCpteUHLPGolOIUVXZU=;
        b=hlnBrFp44oHZ2V8ITlk5zy5KSLPwYqsr6V4UZzsoQPgITwG3+lMx5+RlXqtdBTtSKS
         9HVsGd/S5jMo88/BnpNW/O7DRUvavDp84/Tm8le12hZjU0KzOWG+oE97IoFCvx+Z3Qw6
         O/cogdmdWjue6YrMAzQHZEy0Y4h9fiEaoNSN2lDvY5xrDwxRfSnc0IDEDj9XHtmE4CkP
         ScXnvYss9WL3iPR4GjEOaQh7tUEqrxJTVYZ5FxDQtonY0FjsuAKOXM9+4ILRfcJYEh5B
         uJO6h57Nq7ZEnabQTgo+xDH7KaW8TJtCu2K8YmrpFPREeNFS6h816KfxdlVq7MHxoYFu
         Wc3A==
X-Gm-Message-State: AOAM533nEMpgtXjgYEx/UpFQ7EQxh4rQyhTX78UAnpgRYunaF6H6EGJI
        X/wUxdwaVElhCWzd0g7M/vIsqc5dvLK2zAukkAg=
X-Google-Smtp-Source: ABdhPJxZ1c6ZYJLhBGv46wgI88JUOoELcZ4LPISFJM8mX+x6+60ZX7Bk5Wv5+VjX2vsWkDom0SDStJZwibljqBZ+W6M=
X-Received: by 2002:aa7:8593:0:b029:246:c18b:ff16 with SMTP id
 w19-20020aa785930000b0290246c18bff16mr2811312pfn.40.1617968447497; Fri, 09
 Apr 2021 04:40:47 -0700 (PDT)
MIME-Version: 1.0
References: <1617880641-664-1-git-send-email-yangyicong@hisilicon.com>
 <1617880641-664-3-git-send-email-yangyicong@hisilicon.com>
 <20210408205551.GD1900@kunai> <YHAuIdwKMjZuDmXU@smile.fi.intel.com> <20210409113722.GB879@ninjato>
In-Reply-To: <20210409113722.GB879@ninjato>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 9 Apr 2021 14:40:31 +0300
Message-ID: <CAHp75VekZKo-45Pc7mp9Pfwzx=jS7L2SBhb564acWkuAo5cPAQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] i2c: core: add api to provide frequency mode strings
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Yicong Yang <yangyicong@hisilicon.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Barry Song <song.bao.hua@hisilicon.com>,
        John Garry <john.garry@huawei.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        prime.zeng@huawei.com, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 9, 2021 at 2:37 PM Wolfram Sang <wsa@kernel.org> wrote:
>
>
> > Can we add this later if needed?
> > Because in such case additionally printing bus_freq_hz will be fine, no?
>
> Yes, we can do that.
>
> > But putting max to each frequency representation in the list of strings sounds
> > good to me.
>
> It is not important to me if we are going to change that later anyhow.
> I'll leave it to you guys.

Thanks, I think the series is okay to go as is.

-- 
With Best Regards,
Andy Shevchenko
