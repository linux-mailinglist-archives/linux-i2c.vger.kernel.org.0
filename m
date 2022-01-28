Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D09949FBE0
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jan 2022 15:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349324AbiA1OkB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Jan 2022 09:40:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244940AbiA1OkA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Jan 2022 09:40:00 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9005EC06173B
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:40:00 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so11110707pjt.5
        for <linux-i2c@vger.kernel.org>; Fri, 28 Jan 2022 06:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Da56eqCpT5eZsQ7VAU7ez+0LQLRQGKjBHCcbtfBfsaE=;
        b=tDNLTzTMcPDvlgGiFjaQKZbSzVTdJd/meI7qSMDnPyqBjqeVZrKQapeK/+vPZoaj7F
         dDpqXSGisnPYBbUr3TRoDmLL/RJGUYQVvOVt8ifHsR4A2PHH7Dk67VSYXGVFDjGuqDI5
         kQxAFS0+AajErsU+0ylf8/VTB2iEiKEE/FVc4N5cuXITUGCzqqXP+35f3B+6dWT90k1f
         te4R3rshoEYzC6k+jV7CIv6iar7hGaN7QqbGkhatoDA6CxAb65z/oAJ3PYJYP8ZFeSKQ
         NPoeFj7DXC4Gg2tea95DQENygBck01PKXTedXkSd37ICVpcdzp/C3E4PWRdiDuLH71Uq
         h+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Da56eqCpT5eZsQ7VAU7ez+0LQLRQGKjBHCcbtfBfsaE=;
        b=ioq7XmpkRmHoykWWYTT/ShtlWRf4/noFDOae7EGYNiibpDtZrizv3s0O2og4PdB4Hz
         vYBqdXH1NJACnXDbGbUOCeyshqk7ZH9SpgcM+VGzRi3x3P5eQvFkbHa72SHQTOv9qWQd
         lnjYPeXl+35ibn5Ucysb+fzCgGkRKK4xg6+WoqIFPxq8YOSnqmpPdkV0YMXOBM8eQWHX
         Zq3Oge9VMau0iS+PaTZu64KyfeKKb5pPITbc6T+uB5nWOxefhzp+oV/WBpSfjdueYR11
         F1H/zcu/w6ev1OkCsLMCJJouG5sUtFEaZc2zbUe/YM7+pwrsVQpdPEqlitAGOhR3Icmh
         ahrg==
X-Gm-Message-State: AOAM532nTK2Gh21S02WiDV/NJiT/hrL43wUUJiJ5+VxjTX5/wMeY6KpP
        V7d8ZXTxHxySOqX1HI4btAj0WDUO8J4699c2e7Fcpw==
X-Google-Smtp-Source: ABdhPJxIwXQ7ZpbUhLKW21kmDek5BCkLgMLBW/fdro2nwuivp4xixQ6F3zIy0pd4EGju2h/70DOhqhyE/VmftplT4x8=
X-Received: by 2002:a17:903:24d:: with SMTP id j13mr8457420plh.145.1643380800014;
 Fri, 28 Jan 2022 06:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20220120001621.705352-3-jsd@semihalf.com> <202201202353.tVXCQlqh-lkp@intel.com>
 <YemXXCsy4lBsCmDx@smile.fi.intel.com>
In-Reply-To: <YemXXCsy4lBsCmDx@smile.fi.intel.com>
From:   =?UTF-8?B?SmFuIETEhWJyb8Wb?= <jsd@semihalf.com>
Date:   Fri, 28 Jan 2022 15:39:49 +0100
Message-ID: <CAOtMz3NE8iOE9KBMP+MVC71mkFWwsiQyjJGs+5Nct3diR2k-HA@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     kernel test robot <lkp@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        kbuild-all@lists.01.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wolfram Sang <wsa@kernel.org>,
        Raul E Rangel <rrangel@chromium.org>,
        Marcin Wojtas <mw@semihalf.com>,
        Grzegorz Jaszczyk <jaz@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

czw., 20 sty 2022 o 18:12 Andy Shevchenko
<andriy.shevchenko@linux.intel.com> napisa=C5=82(a):
>
> On Thu, Jan 20, 2022 at 11:33:05PM +0800, kernel test robot wrote:
>
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    drivers/i2c/busses/i2c-designware-amdpsp.c: In function 'psp_send_cm=
d':
> > >> drivers/i2c/busses/i2c-designware-amdpsp.c:130:2: error: implicit de=
claration of function 'writeq'; did you mean 'writel'? [-Werror=3Dimplicit-=
function-declaration]
> >      130 |  writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_add=
r);
> >          |  ^~~~~~
> >          |  writel
> >    cc1: some warnings being treated as errors
>
> Adding io-64-nonatomic-lo-hi.h after io.h should fix this.

Correct, thanks! Actually io.h is directly included from
io-64-nonatomic-lo-hi.h.

Best Regards,
Jan


>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
