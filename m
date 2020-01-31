Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93BAF14E93E
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jan 2020 08:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728099AbgAaHtz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jan 2020 02:49:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58988 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728077AbgAaHtz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jan 2020 02:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=qvr+aJIfVt71idspzkV9kXQUii4i+CIz5K3RXpmzUfo=; b=JdQN+Vq99qXLVVYptTf5dDs38
        OKEgk2bcdKACFNMPrZJ0++6lvUFEOROH7enkIJI32tYFuoDRhjP12kJAXGj5np2IhcItBU6FGAxfF
        JrYktKiYisMqPPRlNAFUnStY6pkB55Te+Jn0O/3FIb2x/xozdXzr4R3VVlGiVB9qGxdWvAwXXcXJn
        L2G41Fxoad+BNSxsMylGU8xH7KFLUYajP5/mvvveKWgWww9d5QN698r3+klTXrPU3dJfbj4QACcOX
        l5odApjPcKlYBrTg5HMdAYe/CJ/jXNotAt0HVvAK5ZOR9et+B1xzkySQfw29YHWnkr2AAGN7MEvcx
        oJE2aXRMw==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ixR3q-0004uR-4z; Fri, 31 Jan 2020 07:49:54 +0000
Subject: Re: linux-next: Tree for Jan 31 (drivers/i2c/busses/i2c-stm32f7.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20200131150606.34caeb7c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7cd84961-d1f5-03eb-2e00-8f51b2f7121d@infradead.org>
Date:   Thu, 30 Jan 2020 23:49:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131150606.34caeb7c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/30/20 8:06 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any v5.7 material to your linux-next included
> branches until after v5.6-rc1 has been released.
> 
> I am experimenting with a "make htmldocs" build at
> the end of the day, but it currently has an error:
> 
> docutils.utils.SystemMessage: Documentation/driver-api/thermal/cpu-idle-cooling.rst:95: (SEVERE/4) Unexpected section title.
> 
> Changes since 20200130:
> 
> The amdgpu tree lost its build failure.
> 
> The akpm-current tree gained a build failure due to an interaction with
> the nfsd tree for which I have revertd a commit.
> 
> Non-merge commits (relative to Linus' tree): 3654
>  3320 files changed, 145104 insertions(+), 53102 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
> I have created today's linux-next tree at
> git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> (patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
> are tracking the linux-next tree using git, you should not use "git pull"
> to do so as that will try to merge the new linux-next release with the
> old one.  You should use "git fetch" and checkout or reset to the new
> master.
> 
> You can see which trees have been included by looking in the Next/Trees
> file in the source.  There are also quilt-import.log and merge.log
> files in the Next directory.  Between each merge, the tree was built
> with a ppc64_defconfig for powerpc, an allmodconfig for x86_64, a
> multi_v7_defconfig for arm and a native build of tools/perf. After
> the final fixups (if any), I do an x86_64 modules_install followed by
> builds for x86_64 allnoconfig, powerpc allnoconfig (32 and 64 bit),
> ppc44x_defconfig, allyesconfig and pseries_le_defconfig and i386, sparc
> and sparc64 defconfig. And finally, a simple boot test of the powerpc
> pseries_le_defconfig kernel in qemu (with and without kvm enabled).
> 
> Below is a summary of the state of the merge.
> 
> I am currently merging 315 trees (counting Linus' and 78 trees of bug
> fix patches pending for the current merge release).
> 
> Stats about the size of the tree over time can be seen at
> http://neuling.org/linux-next-size.html .
> 
> Status of my local build tests will be at
> http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
> advice about cross compilers/configs that work, we are always open to add
> more builds.
> 
> Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
> Gortmaker for triage and bug fixes.
> 

on i386:

when CONFIG_I2C is not set/enabled:

../drivers/i2c/busses/i2c-stm32f7.c: In function ‘stm32f7_i2c_suspend’:
../drivers/i2c/busses/i2c-stm32f7.c:2199:44: error: ‘struct dev_pm_info’ has no member named ‘wakeup_path’
  if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
                                            ^
../drivers/i2c/busses/i2c-stm32f7.c: In function ‘stm32f7_i2c_resume’:
../drivers/i2c/busses/i2c-stm32f7.c:2218:44: error: ‘struct dev_pm_info’ has no member named ‘wakeup_path’
  if (!device_may_wakeup(dev) && !dev->power.wakeup_path) {
                                            ^


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
