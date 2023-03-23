Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF896C704F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 19:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231445AbjCWSet (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 14:34:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231273AbjCWSep (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 14:34:45 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB4D510AA5;
        Thu, 23 Mar 2023 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679596482; x=1711132482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LGy7Q84BjzZMuq5uOO+dWdMwnplCocPGQbI8I2BPrDE=;
  b=dwLmymK1tYu+MCnyJfUc5XP93yQHGAPFNhhPqgqdnS8Y38SPwSsyTJxk
   uaUNyExln5z608zgqFXMU8oJ6eUA/mZM/X6WrNkBVx2cx/dlVsBJ4HxCq
   HZCh9fB6Y9urUA8+kfGNouISSiSQcVgG/CofzkA59Se8U2+PMUHO2J1nX
   cbFfE5Gv0sYAIXHjxx1A7oIUN/sDME3tYYNdU/ae8Jz8H1Nsz3MybBV5e
   rKHulSCe3YDydlhSZjg7V3+HEeLxhAsYpHWl78y8k6VoXUyl049w38pFi
   YVsFGvLeLnM9Y7LdBHa3mSl3TL95FTExaxVUOhTGWQlExRsm3geCMiJq1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="323448768"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="323448768"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 11:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="712774241"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="712774241"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 23 Mar 2023 11:34:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfPlm-000EcS-2D;
        Thu, 23 Mar 2023 18:34:38 +0000
Date:   Fri, 24 Mar 2023 02:34:07 +0800
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
Message-ID: <202303240224.PvBra327-lkp@intel.com>
References: <20230322210227.464-4-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-4-mario.limonciello@amd.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
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
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230324/202303240224.PvBra327-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
        git checkout addff0f32acff3a5278cbbf6fffc9054ecb03e2f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240224.PvBra327-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req':
   i2c-designware-amdpsp.c:(.text+0xe0): undefined reference to `psp_send_platform_access_msg'
   aarch64-linux-ld: i2c-designware-amdpsp.c:(.text+0x16c): undefined reference to `psp_send_platform_access_msg'
   aarch64-linux-ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
   i2c-designware-amdpsp.c:(.text+0xad4): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
