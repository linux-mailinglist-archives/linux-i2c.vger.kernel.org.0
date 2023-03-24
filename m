Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAC9B6C75F1
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 03:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjCXCgB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 22:36:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjCXCgA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 22:36:00 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D29215543;
        Thu, 23 Mar 2023 19:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679625360; x=1711161360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VBF+ycG5fs3k8LlNB8Gn3AJN3rz4Hd33qLkoXX/pOsk=;
  b=WuOyBEOshqGyeWYUSkcVOaXpwHD55GHGhuQiwVFsqwpkdF1cxT1ZLGU/
   r4Zud+K9DpeFyvIGqw3CbMuj8OZj4bRTnQNMXXRAUWjMDdJpNLrbtVmNM
   CIqMItyrLJSEmuoy0YhbCSDUM/Z2ZisTESqdjKSk4RH21JRjzdu+fIBnK
   cke2yNi1Taay0h/aZCpA8sGeeqxgMW4wv4pFxpF5aGqJsGNBgQ/ovoyqw
   y7GDD8jgU6FQv6k69AgZC7bNtFLVG/+/iqNc2I2b3GgQSlXsNnQJF0jO9
   sS2/3/QwCZ83efeGxGj4tkho6s64TeGo3621vSBmQxFN+um5k8z4zXYSK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="328089340"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="328089340"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 19:35:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="746990100"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="746990100"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Mar 2023 19:35:55 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfXHW-000Eui-1J;
        Fri, 24 Mar 2023 02:35:54 +0000
Date:   Fri, 24 Mar 2023 10:35:06 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <202303241037.WtZWjxfx-lkp@intel.com>
References: <20230322210227.464-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-4-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e6af5c0c4d32a27e04a56f29aad587e03ff427f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
base:   e6af5c0c4d32a27e04a56f29aad587e03ff427f1
patch link:    https://lore.kernel.org/r/20230322210227.464-4-mario.limonciello%40amd.com
patch subject: [PATCH v6 3/4] i2c: designware: Use PCI PSP driver for communication
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303241037.WtZWjxfx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
        git checkout addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241037.WtZWjxfx-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req':
>> i2c-designware-amdpsp.c:(.text+0x77): undefined reference to `psp_send_platform_access_msg'
   ld: i2c-designware-amdpsp.c:(.text+0xbb): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
>> i2c-designware-amdpsp.c:(.text+0x400): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
