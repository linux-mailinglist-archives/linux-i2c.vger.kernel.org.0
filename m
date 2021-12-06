Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3B846A892
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Dec 2021 21:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243449AbhLFUmV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 15:42:21 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:36681 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349735AbhLFUmT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 15:42:19 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0F3953201591;
        Mon,  6 Dec 2021 15:38:47 -0500 (EST)
Received: from imap47 ([10.202.2.97])
  by compute3.internal (MEProxy); Mon, 06 Dec 2021 15:38:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
         h=mime-version:message-id:in-reply-to:references:date:from:to
        :cc:subject:content-type; s=fm3; bh=3TNr3PJ/3oYhzRdj6fOfCCqXaq6X
        S1SzYqe8FZFLhCI=; b=Ef/McVGo8XcpFbF4OBT1d+iVk2aqJQc6D488HYEPU66r
        EgTR/nCkqaRUb56SKQigc29jia4AI33+HGLczy3lvMRqvDdUg0JW/b2fv21OeGci
        wS2uNnV7ghWsDhHzpD++Y/PDo0XffPW9eidRPsjmkpOj+JqF2poEwSxyR2291ezU
        KmkKTMHiWiQ/ImkLNY0mIgEuyW3mSPoth9mSZ46xjpk4SenAoTgNEM/+aogWDosc
        +/b6Z6kqElar1SmwnL9JM+SroLI8ZTqmz0n+4OnC6yaIyhPV8ZvgnnnZFOVhc+dQ
        /IlBoYzkZFdREwvIWei5CkR7oavmSPuneYicuJX7/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=3TNr3P
        J/3oYhzRdj6fOfCCqXaq6XS1SzYqe8FZFLhCI=; b=KvjWiQ/Ip6oeAbSFVYurm3
        85fcx5gis5aFWfoipd1jGeCPYpMLQYkmBSLfyyC5tCtLdCGjQdRFyhjz/DXlyZEg
        FaLzwfWr91TVKALzPZylBy7hfP6j2UBrotBet4sVveG314ecHgfjIu1s2jhEaf+m
        D25hItKVr+AXQmpE7yorL0KD8MCDwMp8AjYG2hrw2VvJ8lyFHOMgGDGFUfiOuQ3H
        ZgAalfZpEKu3iERPYORNxAmJ+P/bZZtU8DDFlEAOTe30U9Mhc39QOqqGopmcZK29
        /2eLh41L4v+DZYqtiiBthSQm7KAT8dkVZ8bLyaQIkmoMZCDBuo+6vbFPSwWH43Dw
        ==
X-ME-Sender: <xms:1nSuYYn81-224JPAlNWWa8xGnFQyY2p82Ob0ymV-qlS1SlKH1A8bnA>
    <xme:1nSuYX24GzacOulsy1W9uzT-SX_aN3vyR5PKGRelNIE3wr2PHlkA16vLXs25nH8p3
    gxej3Wmddag8O7wtIw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrjeefgddugedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuvhgv
    nhcurfgvthgvrhdfuceoshhvvghnsehsvhgvnhhpvghtvghrrdguvghvqeenucggtffrrg
    htthgvrhhnpefgieegieffuefhtedtjefgteejteefleefgfefgfdvvddtgffhffduhedv
    feekffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsvhgvnhesshhvvghnphgvthgvrhdruggvvh
X-ME-Proxy: <xmx:1nSuYWozKmKkZVG4Zx0DUNfKLGzkUAOm5jRu_B7eCgRifemF-X640w>
    <xmx:1nSuYUmMxEy6JSZSv89-SDcZ9CI3j3J4V8mBWu9khWnx0CzYybiM6w>
    <xmx:1nSuYW0VSSMOWg3z8C3seEuZZStgNW1epuyJbo0We_43FiVO8dXMog>
    <xmx:13SuYS-bKQVszMBBVIzDq8eCkQ0vXySecc-gI1RGuDxCKoGkzGSYvg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 97BD327406DA; Mon,  6 Dec 2021 15:38:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4458-g51a91c06b2-fm-20211130.004-g51a91c06
Mime-Version: 1.0
Message-Id: <3538e879-8548-4727-b397-c385295316c4@www.fastmail.com>
In-Reply-To: <CAK8P3a2Ag60Dw1mbTsj7XVanT6u8kQW5vqK3hAD-yon1G8qKXw@mail.gmail.com>
References: <202112061809.XT99aPrf-lkp@intel.com>
 <32ba635c-4588-4ea3-bd95-c55a33804e99@www.fastmail.com>
 <CAK8P3a2Ag60Dw1mbTsj7XVanT6u8kQW5vqK3hAD-yon1G8qKXw@mail.gmail.com>
Date:   Mon, 06 Dec 2021 21:38:25 +0100
From:   "Sven Peter" <sven@svenpeter.dev>
To:     "Arnd Bergmann" <arnd@arndb.de>
Cc:     "kernel test robot" <lkp@intel.com>,
        "Linux I2C" <linux-i2c@vger.kernel.org>, kbuild-all@lists.01.org,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        "Wolfram Sang" <wsa-dev@sang-engineering.com>,
        "Hector Martin" <marcan@marcan.st>,
        "Alyssa Rosenzweig" <alyssa@rosenzweig.io>
Subject: Re: powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:undefined
 reference to `__this_module'
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On Mon, Dec 6, 2021, at 20:47, Arnd Bergmann wrote:
> On Mon, Dec 6, 2021 at 6:02 PM Sven Peter <sven@svenpeter.dev> wrote:
>> On Mon, Dec 6, 2021, at 11:10, kernel test robot wrote:
>
>> > If you fix the issue, kindly add following tag as appropriate
>> > Reported-by: kernel test robot <lkp@intel.com>
>> >
>> > All error/warnings (new ones prefixed by >>):
>> >
>> >>> powerpc64-linux-ld: warning: orphan section `.stubs' from `drivers/i2c/busses/i2c-pasemi-core.o' being placed in section `.stubs'
>> >>> powerpc64-linux-ld: drivers/i2c/busses/i2c-pasemi-core.o:(.toc+0x0): undefined reference to `__this_module'
>>
>> This seems to be triggered by compiling one of {pci,platform} as a module and the
>> other one as built-in. That setup can only happen with COMPILE_TEST since -pci
>> is otherwise only compiled for powerpc and -platform for arm64.
>>
>> -core.c is only built once with THIS_MODULE expanding to __this_module. That will
>> fail when linking the built-in driver where THIS_MODULE should've been NULL instead.
>>
>> The most simple fix (that also has no chance of breaking anything) is probably to
>> just move
>>
>>   smbus->adapter.owner = THIS_MODULE;
>>
>> from core to both apple.c and pci.c. I'll prepare a patch later this week.
>
> I'd prefer fixing this in a better way, linking an object file into
> both vmlinux and a loadable
> module is not supported at all. 

Make sense, I didn't know that.

> Other options are:
>
> - #include the common .c file from the individual drivers (not great)
> - use Kconfig logic to prevent the broken configuration
> - use Makefile tricks to make both drivers built-in when this happens
> - make the common part a separate loadable module, exporting all the
>   global symbols.
>
> Out of these, I would prefer the last option.

Sure, I'll see when I can spare some time to do that since testing that
is going to be a bit more annoying with my current setup.

Fwiw, I2C_OCTEON and I2C_THUNDERX might have the same issue as well
with i2c-octeon-core.o. It just won't result in the same compile error
because i2c-octeon-core.c doesn't use THIS_MODULE.
It's also nothing that is likely to ever happen since those two drivers
are also never used on the same arch and it should only be possible to
create a broken configuration with COMPILE_TEST as well.



Sven
