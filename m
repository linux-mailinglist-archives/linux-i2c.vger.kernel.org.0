Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521AA495185
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jan 2022 16:34:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376708AbiATPeX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Jan 2022 10:34:23 -0500
Received: from mga03.intel.com ([134.134.136.65]:20497 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1376720AbiATPeM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 20 Jan 2022 10:34:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642692852; x=1674228852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n+GetYetQGtM9v9Xh074y3oGpFYRrqSTlExUCAYVQi0=;
  b=Gty5Av4pog4DP1SuWeyNZiSNKG4jzw8jO0FubRHgkOUuxl3AM07c3Xd1
   Z+Iam7NyD1MpA51u4/9yi3UBDZNxR7n49uwEVdHj9gGX0Tc8nLQv3u3rD
   HxjEQxY64mwjjObKlRht6giMR6iBaQ79DlKZUYH4TEyj2Yj/yI6btOFau
   +O0IPNqzLBrvilfsafU0/JXcOexeWUYAOHSS6hoA6+4V4e0KL/Z3llgCV
   s1RdKp19PKgOg/7WW9tdoYKysuYLVoH6leJvQQ2Vrm6kpjCQO+UcfOIpO
   vBKhCIGbmeMUoOpjRguIGk0H4cygFTYj3lghrrZafy1FhIElDEOS51Zch
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10232"; a="245333831"
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="245333831"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2022 07:34:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,302,1635231600"; 
   d="scan'208";a="672562952"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2022 07:34:07 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nAZRu-000EOc-DV; Thu, 20 Jan 2022 15:34:06 +0000
Date:   Thu, 20 Jan 2022 23:33:05 +0800
From:   kernel test robot <lkp@intel.com>
To:     Jan Dabros <jsd@semihalf.com>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, jarkko.nikula@linux.intel.com
Cc:     kbuild-all@lists.01.org, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, hdegoede@redhat.com,
        wsa@kernel.org, rrangel@chromium.org, mw@semihalf.com,
        jaz@semihalf.com
Subject: Re: [PATCH 2/2] i2c: designware: Add AMD PSP I2C bus support
Message-ID: <202201202353.tVXCQlqh-lkp@intel.com>
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
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220120/202201202353.tVXCQlqh-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/f21a75f68baddffd9c50ffdc95d419ad7dbe3f68
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jan-Dabros/i2c-designware-Add-support-for-AMD-PSP-semaphore/20220120-081854
        git checkout f21a75f68baddffd9c50ffdc95d419ad7dbe3f68
        # save the config file to linux build tree
        mkdir build_dir
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-amdpsp.c: In function 'psp_send_cmd':
>> drivers/i2c/busses/i2c-designware-amdpsp.c:130:2: error: implicit declaration of function 'writeq'; did you mean 'writel'? [-Werror=implicit-function-declaration]
     130 |  writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
         |  ^~~~~~
         |  writel
   cc1: some warnings being treated as errors


vim +130 drivers/i2c/busses/i2c-designware-amdpsp.c

   117	
   118	static int psp_send_cmd(struct psp_i2c_req *req)
   119	{
   120		struct psp_mbox *mbox = (struct psp_mbox *)mbox_iomem;
   121		union psp_mbox_cmd_reg cmd_reg = {0};
   122	
   123		if (psp_check_mbox_recovery(mbox))
   124			return -EIO;
   125	
   126		if (psp_wait_cmd(mbox))
   127			return -EBUSY;
   128	
   129		/* Fill address of command-response buffer */
 > 130		writeq((uintptr_t)__psp_pa((void *)req), &mbox->i2c_req_addr);
   131	
   132		/* Write command register to trigger processing */
   133		cmd_reg.fields.mbox_cmd = PSP_I2C_REQ_BUS_CMD;
   134		writel(cmd_reg.val, &mbox->fields.val);
   135	
   136		if (psp_wait_cmd(mbox))
   137			return -ETIMEDOUT;
   138	
   139		if (psp_check_mbox_sts(mbox))
   140			return -EIO;
   141	
   142		return 0;
   143	}
   144	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
