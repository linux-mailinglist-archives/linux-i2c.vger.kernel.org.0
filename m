Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DE63B9AD3
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 05:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234730AbhGBDOt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 23:14:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:50211 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234627AbhGBDOr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Jul 2021 23:14:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208617795"
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="208617795"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2021 20:12:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,316,1616482800"; 
   d="scan'208";a="409158169"
Received: from dengjie-mobl1.ccr.corp.intel.com (HELO [10.239.154.58]) ([10.239.154.58])
  by orsmga006.jf.intel.com with ESMTP; 01 Jul 2021 20:12:13 -0700
Subject: Re: [PATCH v11] i2c: virtio: add a virtio i2c frontend driver
To:     kernel test robot <lkp@intel.com>, linux-i2c@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org, wsa@kernel.org,
        wsa+renesas@sang-engineering.com, mst@redhat.com, arnd@arndb.de,
        jasowang@redhat.com, andriy.shevchenko@linux.intel.com
References: <510c876952efa693339ab0d6cc78ba7be9ef6897.1625104206.git.jie.deng@intel.com>
 <202107011701.sZA89A1D-lkp@intel.com>
From:   Jie Deng <jie.deng@intel.com>
Message-ID: <68b2b36b-f1ee-d1aa-d4a5-d45f36602be6@intel.com>
Date:   Fri, 2 Jul 2021 11:12:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <202107011701.sZA89A1D-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 2021/7/1 18:00, kernel test robot wrote:
> Hi Jie,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on wsa/i2c/for-next]
> [also build test ERROR on linux/master linus/master v5.13 next-20210630]
> [cannot apply to vhost/linux-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20210701-112619
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
> config: i386-randconfig-c021-20210630 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>          # https://github.com/0day-ci/linux/commit/e8dedd2a8577148d7655d0affe35adf34efbbf15
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Jie-Deng/i2c-virtio-add-a-virtio-i2c-frontend-driver/20210701-112619
>          git checkout e8dedd2a8577148d7655d0affe35adf34efbbf15
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     In file included from <command-line>:32:
>>> ./usr/include/linux/virtio_i2c.h:12:10: fatal error: linux/bits.h: No such file or directory
>        12 | #include <linux/bits.h>
>           |          ^~~~~~~~~~~~~~
>     compilation terminated.


I didn't see this error. Why did you say no such file? Anything wrong ?

https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/tree/include/linux/bits.h

Thank you !

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
