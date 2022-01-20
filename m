Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1468D494D56
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 12:47:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbiATLqE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 06:46:04 -0500
Received: from mga14.intel.com ([192.55.52.115]:61169 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231245AbiATLqD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 06:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642679163; x=1674215163;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIwdDWpAb+A6F8RyA4eUtPZ1BshyrBYZpdf/LJC/fto=;
  b=QZfZlT5/8BoGDYMfvyweaC61cDBnXuid9LNXNHycOqZhXJP6oxveMvEl
   rNfZvxxb221RzWdsr3X1yk3sHTr7jT6vybeD35pPkZ6KxcE4R6Bv3UzYm
   63SHQXk5A7PSgeZZTDsC/kEaa/uqI/dIEg9zI+vJgGwn4lg6HSZBUinQj
   mH+8mKnNpY0kzv6JVYFBggSOBUHGQ6orNIxNeqslVIpajTCR+GrGMI8nW
   JvE0ZCKvH6heXSmKyPq1Yf1fTTybsWoHl6jZArHwni1P6I9Pe5HMYCC/j
   EeMGBq2qVX9KLWVKgmnMCRrFJzKMZ+wkRg4gYiWO1HWLbPz4GUDgvpYMZ
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="245531745"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="245531745"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 03:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="477763457"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2022 03:46:00 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nAVt9-000EE8-To; Thu, 20 Jan 2022 11:45:59 +0000
Date:   Thu, 20 Jan 2022 19:44:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
Cc:     kbuild-all@lists.01.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <202201201946.aWAj339S-lkp@intel.com>
References: <20220120001621.705352-3-jsd@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120001621.705352-3-jsd@semihalf.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jan,

I love your patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linux/master rafael-pm/linux-next linus/master v5.16 next-20220120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jan-Dabros/i2c-designware-Add-support-for-AMD-PSP-semaphore/20220120-081854
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20220120/202201201946.aWAj339S-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f21a75f68baddffd9c50ffdc95d419ad7dbe3f68
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jan-Dabros/i2c-designware-Add-support-for-AMD-PSP-semaphore/20220120-081854
        git checkout f21a75f68baddffd9c50ffdc95d419ad7dbe3f68
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-amdpsp.c:3:10: fatal error: asm/msr.h: No such file or directory
       3 | #include <asm/msr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +3 drivers/i2c/busses/i2c-designware-amdpsp.c

     2	
   > 3	#include <asm/msr.h>
     4	#include <linux/i2c.h>
     5	#include <linux/psp-sev.h>
     6	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
