Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD6E46A5F1
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 20:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348673AbhLFTvA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 14:51:00 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:34811 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348667AbhLFTu5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 14:50:57 -0500
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MAxLT-1mjYSV2OvB-00BMFO; Mon, 06 Dec 2021 20:47:26 +0100
Received: by mail-wm1-f42.google.com with SMTP id c6-20020a05600c0ac600b0033c3aedd30aso623911wmr.5;
        Mon, 06 Dec 2021 11:47:26 -0800 (PST)
X-Gm-Message-State: AOAM533hENI+IVP8xGk8xsR8SVxt7gNAajkdk2xPQjrUzND5R87OEvZD
        hFNrgjGrZ6QoDxUEn8MQlbEASWGCdZJ8gdTHUho=
X-Google-Smtp-Source: ABdhPJztNu6678Mht2pSIA0DSQ8/VKNXlr9p6a5Ci1Nw/hY77mcfRR9vOrextclxIuD5gy0eWQd4ShVxESDBOjc+AU8=
X-Received: by 2002:a1c:23d4:: with SMTP id j203mr758752wmj.35.1638820046033;
 Mon, 06 Dec 2021 11:47:26 -0800 (PST)
MIME-Version: 1.0
References: <202112061809.XT99aPrf-lkp@intel.com> <32ba635c-4588-4ea3-bd95-c55a33804e99@www.fastmail.com>
In-Reply-To: <32ba635c-4588-4ea3-bd95-c55a33804e99@www.fastmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Dec 2021 20:47:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2Ag60Dw1mbTsj7XVanT6u8kQW5vqK3hAD-yon1G8qKXw@mail.gmail.com>
Message-ID: <CAK8P3a2Ag60Dw1mbTsj7XVanT6u8kQW5vqK3hAD-yon1G8qKXw@mail.gmail.com>
Subject: Re: powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:undefined
 reference to `__this_module'
To:     Sven Peter <sven@svenpeter.dev>
Cc:     kernel test robot <lkp@intel.com>,
        Linux I2C <linux-i2c@vger.kernel.org>, kbuild-all@lists.01.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ofRCIMufLGSWtyz00T9mhugK8hDFg4OLq8o3AtCzCwGOlMGkPWE
 9zpidGz67XX6w16u0mVIuiLku73WKUblsTrIn3LsijCJ8DwOMBe4yUsboRAjC8sLtC1/KAb
 iPa6+yM/qXdgCNJlA6YcNzWJZhGId0IRcs2sgTcGJknUBdteA+VRFFUv3tt0WvId6h6yD3k
 byfrcL4x+Ea1pjhLNQQIA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QAswPbuXZQE=:2a4tBEesdPqqSE27EUuoyf
 oaHVCBjunEFqKoYz7JptPBH7+OoGuSpNxTrnMEDo0+aUAHNDUKsXoXBAoss6qaxxXSoEJ00zI
 Fyw7y1MRMS/wZDUTcdLaAMPCCCBMKPVuKtfItZfLHAlfTaSFS2WGOIvojCFOFKpaZ2Bosrg3Z
 WRQTlAaBVqZ1r394sb8aen/PwbvN+9EhsVhsKM3hyokYorSXd9gk05eIDc+f9jmNSUJAYc1hm
 rOwuBnLgjrz7jrvpMaGoj8SE7HcwZ8Qf9jzt1WFsF78ksO1NkJY43xJ36JfZpCXO79BuISMtQ
 xqEY+kKbxemv5Suja05CW76bAk2ao8VlS8Eb1CTK3JJ3EH1zGAHBQuh1SKoGPtS+WkzMd1qSi
 X7EunRYUE6MqN6D0EWq2KFAN+YUWESHg4wWoJglu4dlYv9ahpG4LioBEruQgQStlx0zB5Hz28
 /5u25+2seiPoSRdXNgYM09t4Lc2jIhjjrYRn6wO7UQ0kNFRclpJv6wwICf+1C0jqtLqwAQCDU
 C1vz5Pz/Du/XfH/aj96HESra6HUe6qxcLN+EoYsfSJJ05WQQMCGqyuuYn/7daH3XPitm67zNJ
 FZ49NhYAsw0l6XhKnFLiXnu3QOnEqM73a/s2hTdH6FPqEcR5nR/F/HmgnbOog/zeuVw0vY9Iz
 qYOzcF0KZcL942/iYS5DohwqKS4fb6niadvrqpf/iOvi4/MiJnbs7o716H6LAYNFGdB5boVAV
 x+47jzGDQVr9Q6EMgEurb2FCfG0Akno3DRe9tlvbBeDJTSgo9MXbynyT4azVglk9BUYO04Jtc
 MhJ0b2OC5g4/OucjVJo2d0BaEUZSs5wBYJeDg9zgeFdxgJLabo=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 6, 2021 at 6:02 PM Sven Peter <sven@svenpeter.dev> wrote:
> On Mon, Dec 6, 2021, at 11:10, kernel test robot wrote:

> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All error/warnings (new ones prefixed by >>):
> >
> >>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/i2c/busses/i2c-pasemi-core.o' being placed in section `.stubs'
> >>> powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:(.toc+0x0): undefined reference to `__this_module'
>
> This seems to be triggered by compiling one of {pci,platform} as a module and the
> other one as built-in. That setup can only happen with COMPILE_TEST since -pci
> is otherwise only compiled for powerpc and -platform for arm64.
>
> -core.c is only built once with THIS_MODULE expanding to __this_module. That will
> fail when linking the built-in driver where THIS_MODULE should've been NULL instead.
>
> The most simple fix (that also has no chance of breaking anything) is probably to
> just move
>
>   smbus->adapter.owner = THIS_MODULE;
>
> from core to both apple.c and pci.c. I'll prepare a patch later this week.

I'd prefer fixing this in a better way, linking an object file into
both vmlinux and a loadable
module is not supported at all. Other options are:

- #include the common .c file from the individual drivers (not great)
- use Kconfig logic to prevent the broken configuration
- use Makefile tricks to make both drivers built-in when this happens
- make the common part a separate loadable module, exporting all the
  global symbols.

Out of these, I would prefer the last option.

       Arnd
