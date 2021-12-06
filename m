Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DF3446A232
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 18:06:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240532AbhLFRJM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 12:09:12 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:59081 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350301AbhLFRGn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 12:06:43 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id C34983200EFD;
        Mon,  6 Dec 2021 12:03:08 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Mon, 06 Dec 2021 12:03:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=byYu1GbWIYJ033NC4y3TtEktwVyn
        eWCDu8pihPvZcNI=; b=QGw2dwg6Sb/B8/0huKovC2C0oxgxJM1oGif5jlQA3k/+
        dJPPG1IkfRBnc3yEeLpQeXr6PJX76ndAwwN8s2Bqw0bMCrYiGSU8JtN7wp4M2RsM
        hNGhxI6QWc593F2QN7m67nAA2GqNuwOWYExvvHj6EFCoOdgX5QXDcF5SxJD7YHyX
        ot+g0tmxMi7GO8DtjQTJjcPYUGe5w9upSdvcrNB4zzoQmv45bRcejulC+01BEz2k
        3P4taeGZw98U4fk9RpuqvELH1c9+mSyjmgJj3KEe5jZ1iJQ7u05kqrIrvCwnSV1W
        oLATDZk0QFrO3ct6G0Cx+xKBLuf09p6FvFupI3ZRQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=byYu1G
        bWIYJ033NC4y3TtEktwVyneWCDu8pihPvZcNI=; b=AvSq6k62HbyBc/sa2Fx3hw
        CCAM777QFTtMSnrwGxzNGfX5pwQCVgMXvy18+rldLxYm11HrgcR9oVvwHRM3tjkr
        qiRwtYRZGyWKqqR1/5TZ7sCwK9+8Zm5DkF7h7lPYF8T62osIarVNjL542K0RWj4f
        2xGbOyzaGC6dRuHXP3DUFVyJoSZUd2ZYK38lcSuwy/4+lXF9MAsZmeDoXQgN9b0Y
        N4NfasFt3mkKPS71oMHOUzKBAGJNowN447kZRIXWvv8/iRXLwirP3ZqDqCnMlYnS
        gq7aHeY+vS//yqBraXplzNr+cK/Z93n+tCn+PHn+2fc/LgrKIcuY61jJ0+vXU+1A
        ==
X-ME-Sender: <xms:SkKuYbPriNzqjEWy3VNzK1dWtYh7Bh-ghw8UgskeJAHdbIJZOe2dSQ>
    <xme:SkKuYV9JCbVtQxOOtlO-_ZxbjibV8koHz909ho1kUnD9-HMhdZMVKlDSMAaDPSGOw
    8hq4i_sA7kk3P2w25k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgdeliecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfufhvvghn
    ucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrth
    htvghrnhepgefhjedtieevheevieejteegfeeihfejheekveejfedvvdehhfdvjeehheet
    jeeinecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdptddurdhorhhgpdhgihhthhhusg
    hushgvrhgtohhnthgvnhhtrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
    rghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:SkKuYaTv02lTRI2DNWO663IDJUh6BS98x-0fc-B8Q_0O2VE7OGn2BA>
    <xmx:SkKuYfvMneDUy0q5jVOoOpwkF0-XvFUnplEg0amE-N0v6QC3FI5vRA>
    <xmx:SkKuYTeNAUenAeBrT_cEj_K0UOwzNsXkvuC90B7TBZy0-96mtoEdzQ>
    <xmx:TEKuYUGdP-1A_bnxsz63dE-qP19FKi5YCotoa4v7CE4lMrZm6MSdWg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7C63227406DA; Mon,  6 Dec 2021 12:03:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4458-g51a91c06b2-fm-20211130.004-g51a91c06
Mime-Version: 1.0
Message-Id: <32ba635c-4588-4ea3-bd95-c55a33804e99@www.fastmail.com>
In-Reply-To: <202112061809.XT99aPrf-lkp@intel.com>
References: <202112061809.XT99aPrf-lkp@intel.com>
Date:   Mon, 06 Dec 2021 18:02:33 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "kernel test robot" <lkp@intel.com>, linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        "Wolfram Sang" <wsa-dev@sang-engineering.com>,
        "Arnd Bergmann" <arnd@arndb.de>,
        "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Subject: Re: powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:undefined
 reference to `__this_module'
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 6, 2021, at 11:10, kernel test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
> master
> head:   0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
> commit: d88ae2932df0e670610cb741fec442ad12466c03 i2c: pasemi: Add Apple 
> platform driver
> date:   8 weeks ago
> config: powerpc64-randconfig-r023-20211206 
> (https://download.01.org/0day-ci/archive/20211206/202112061809.XT99aPrf-lkp@intel.com/config)
> compiler: powerpc64-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
> -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d88ae2932df0e670610cb741fec442ad12466c03
>         git remote add linus 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout d88ae2932df0e670610cb741fec442ad12466c03
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross 
> O=build_dir ARCH=powerpc SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All error/warnings (new ones prefixed by >>):
>
>>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/i2c/busses/i2c-pasemi-core.o' being placed in section `.stubs'
>>> powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:(.toc+0x0): undefined reference to `__this_module'

This seems to be triggered by compiling one of {pci,platform} as a module and the
other one as built-in. That setup can only happen with COMPILE_TEST since -pci
is otherwise only compiled for powerpc and -platform for arm64.

-core.c is only built once with THIS_MODULE expanding to __this_module. That will
fail when linking the built-in driver where THIS_MODULE should've been NULL instead.

The most simple fix (that also has no chance of breaking anything) is probably to
just move

  smbus->adapter.owner = THIS_MODULE;

from core to both apple.c and pci.c. I'll prepare a patch later this week.

Sven
