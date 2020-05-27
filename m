Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64AB61E3ED3
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 12:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgE0KSj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 06:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgE0KSi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 06:18:38 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EE9C061A0F;
        Wed, 27 May 2020 03:18:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id c75so11581804pga.3;
        Wed, 27 May 2020 03:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EhwhFw1tES4LZGvoxz/NosIDfmflP0OU91r5bFTkb98=;
        b=SIzpvkEuQFsOG8bNh7PbCXcg58+f7d7hDswJsuYf1mwFQoAVPLwpPBYwLB5Kld98aL
         zk4hubJqwcCvwoo2mDJ8ugJ3EZwPABifi80PkNZbhxG29ap6Lv4Zc2PMfqnLqT5JuwBH
         uceu/KM2j/2mOACBpCFROhRD5Za2JFPFLzgcem3EU/CsY0GOEKH/6yKIegmaVCsdlA8b
         ELvAfKdkbO+Pyapj0EXPZdV1ByF7FFqzT+G1SBcGj0bXhV2rghRgnSO6m33MBvG1wPRj
         e4SnFHR3jGzUqRJp9E4PsaYI7eLMNoy8KnNDCF0zFlITkp5AMZTA28g179rYNQFVHZvy
         WG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EhwhFw1tES4LZGvoxz/NosIDfmflP0OU91r5bFTkb98=;
        b=pE0ASEHLHNIMy96p44mHXl7/zyvkvWSnu4xIusIrESLmZsD87HLDkFKwnxhTAYqK7N
         SleSS4wEN2qz8jZ++RI5zQC3BU29iTazFbX7MT0avBtdnlmhJoWBctIbobqD1zKkio5u
         f8mIn/I9AS9xXi5MPHYo9TeKP+jgsE3jaLjiIQvjVVkmwqXGQpYeiwK0CL7SpmqNQtdq
         FFk/3CkeFsD2VL1xtalcB6RdRi9nnKqoCteSZaI60CCFs+FGSv1RJBNMyuPhGohwGSlq
         tTRwIcZkhzpM4b8/+ELGdyFjXspOFGQpwkUA6jhlEAydd/PJChQ34RMSx992NwAKhHlG
         r1CA==
X-Gm-Message-State: AOAM530zmaFJuMjpkNluKLa4GawwUnNLUWyigFSornJrquPDp9jrbSVY
        FGMgx3imrw1d4ePC+lW6slmsHiXg8MRX8dskiPk=
X-Google-Smtp-Source: ABdhPJyCHpozKeoHK85XTSqAWyu+N2lpBygYqk3zDE/5YtgW+awwVfP/5OgHvoazlKjrN+diVc6lN3DBQ6FUKqoKPc0=
X-Received: by 2002:a63:545a:: with SMTP id e26mr1830343pgm.4.1590574718152;
 Wed, 27 May 2020 03:18:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200526215528.16417-1-Sergey.Semin@baikalelectronics.ru>
 <20200526215528.16417-12-Sergey.Semin@baikalelectronics.ru>
 <CAHp75Veygd2y8Tp28p+ZX8Hm_u975QdqatKbsNOG9tNz6HOCAg@mail.gmail.com> <20200527095034.xd52qv45nzcnkbnz@mobilestation>
In-Reply-To: <20200527095034.xd52qv45nzcnkbnz@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 27 May 2020 13:18:26 +0300
Message-ID: <CAHp75Vdv10g5Fsxp+P49SR79yzePss-2=ACTdbAD-3BGHeHAmg@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] i2c: designware: Move reg-space remapping into a
 dedicated function
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 12:50 PM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
> On Wed, May 27, 2020 at 12:26:09PM +0300, Andy Shevchenko wrote:
> > On Wed, May 27, 2020 at 4:03 AM Serge Semin
> > <Sergey.Semin@baikalelectronics.ru> wrote:

...

> > Wolfram, did my last series make your tree? I think there was a patch
> > that touched this part...
>
> Right. It is there. I'll rebase the series on top of the i2c/for-next branch.

Ah, my memory did a trick. Thank you!

-- 
With Best Regards,
Andy Shevchenko
