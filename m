Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521F81E3D99
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 11:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387578AbgE0JaQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 05:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387567AbgE0JaQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 05:30:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38075C061A0F;
        Wed, 27 May 2020 02:30:16 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id r10so11514975pgv.8;
        Wed, 27 May 2020 02:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2y/iPyRzYyLhAEf/uh0yrX0CJhcJ6SET+/MsJX6kaw=;
        b=b3iUSz5Btlb50npCe7UyMR7IsWPA9+4DMO1ClOEBKTbQhnnjOIGuyzlidQNPI4ocR9
         US6ChbMBYIdDbqcVqwpaG06u2FePeQ2OZFEaD/xSBJHlQYSIN5+OwCk1pk1UV1VVkbCY
         5RBUT0kJRRU1w8rnNkLbiRXAz+gRYUFnLC35oB25jz7/t2O9x62C7/86c9kqCn3+u+6T
         /GJ9/9cObulZWF6mNqb1PsqhcTs7OGAUuB03pJVd5Bn5Lzb4ry2K8vgEqUsW9DktALe9
         qAdF6WhTpRwmwzB+GnCpPoeL+O2s/Zj/7zqA1Eq3vDgf8/xV3D+m3WKhXMHPnpmy+zmJ
         GFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2y/iPyRzYyLhAEf/uh0yrX0CJhcJ6SET+/MsJX6kaw=;
        b=SdXN2AQlBD9gTn2ortoP5LqMnnG9jSQs14d8OpL2Q2mYsik+NoDwnai+p/lY99cV4n
         mT/nAWbtWtMx3ZhrASFL7k3w/ENuDiSwJhM6+V4+uukQz++QFTM5UelRjkfZy6MQ8cUF
         +UJq2AnCXtANwHyg8Z688Ne0DYf+ke4Qpg/5TWss96Pb2zd+pQz0H0e6IpGYoVjwRoFs
         +lO4eVaSAtbWd3xsaOBXRupe0ntYrTlrZntSEtMkWq0qezMAF0ABX8rMQ2Ee/pi+QIU5
         SEFTkmFQ3NFAuo/K3swxdgz55FpHnsa+jSV2HKaFnI9pxiz+sF2mjSxM1wp3RVOObXE4
         Yk9Q==
X-Gm-Message-State: AOAM531Yu9q+ORL1YBKuY4Cx9YoIBoTkpd9N0shjaM7ajmlr9JDqfZYG
        NGMbcbXuvoEafCstllUEK5BdDQxXjGuxHWB0TIQ=
X-Google-Smtp-Source: ABdhPJyTFziRopM7wF4GSqcaVtylH65nW8FdA0X1FwR99uSYlsoSIkNDcTyOmlRv7ciMfIYoQQpUqwhrK9h3iktHYhc=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr3180431pgb.203.1590571815755;
 Wed, 27 May 2020 02:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru> <20200526215528.16417-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526215528.16417-4-Sergey.Semin@baikalelectronics.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 27 May 2020 12:30:04 +0300
Message-ID: <CAHp75VdHC+fZNgc5oFbgYaNDebudDROcM_peRzOZpTVy55+tJg@mail.gmail.com>
Subject: Re: [PATCH v3 03/12] dt-bindings: i2c: Discard i2c-slave flag from
 the DW I2C example
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-mips@vger.kernel.org, linux-i2c <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 1:00 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> dtc currently doesn't support I2C_OWN_SLAVE_ADDRESS flag set in the
> i2c "reg" property. If it is the compiler will print a warning:

Shouldn't be dtc whatever tools fixed?

> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64: I2C bus unit address format error, expected "40000064"
> Warning (i2c_bus_reg): /example-2/i2c@1120000/eeprom@64:reg: I2C address must be less than 10-bits, got "0x40000064"
>
> In order to silence dtc up let's discard the flag from the DW I2C DT
> binding example for now. Just revert this commit when dtc is fixed.

Doesn't sound like a good idea. If user happens in between of these
ping-pong change, how they will know this subtle issue?

-- 
With Best Regards,
Andy Shevchenko
