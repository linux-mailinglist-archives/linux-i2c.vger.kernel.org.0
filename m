Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5FAB6C40FE
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 04:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjCVD0d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 23:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjCVD0b (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 23:26:31 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5936F3B3F1;
        Tue, 21 Mar 2023 20:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679455589; x=1710991589;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GIuqNFCvf6OV7Zdqv9SWVd0zQHhkyEtwtFyRkc+dPZM=;
  b=EG1c60SqB/+pD+2ISCUh4ggYyAlNP8TW+61w9iFrg/0dsbLJ/el+3153
   FxsTI9/2y9DNxTwtmhF1fS+k6F9CKFjrPX/ntpxngOKobXC7XatQHBKOu
   1iJE3a4v/EXQLYibiMfJYmSX0Ebj92Au41idOjZ5+MsWC9pqqD6dfJlHZ
   MlJFcxvdnL/wXtwlP2tsjgRATAxfTkhJS47WvJXM6mlJWW/UTIs7yez/Q
   rlvB8cv5vBUuWzWFyOKgUHX65GZymOkyDPn7yiWSo9AvD4S9soS1wVZom
   tbVUYsvGMNDm6btNTYt43jflTm4s3hq9vRkvGdehqTq6QtOVCpbm48OHU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="404001589"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="404001589"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="792374618"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="792374618"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 21 Mar 2023 20:26:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pep75-000CnS-2e;
        Wed, 22 Mar 2023 03:26:11 +0000
Date:   Wed, 22 Mar 2023 11:26:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     oe-kbuild-all@lists.linux.dev, Held Felix <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] i2c: designware: Use PCI PSP driver for
 communication
Message-ID: <202303221157.58L3rUhr-lkp@intel.com>
References: <20230321212822.5714-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321212822.5714-3-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on e6af5c0c4d32a27e04a56f29aad587e03ff427f1]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230322-053048
base:   e6af5c0c4d32a27e04a56f29aad587e03ff427f1
patch link:    https://lore.kernel.org/r/20230321212822.5714-3-mario.limonciello%40amd.com
patch subject: [PATCH v5 2/3] i2c: designware: Use PCI PSP driver for communication
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230322/202303221157.58L3rUhr-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0ddf14b7f34bfe410e49c800d855f4e0c59d6bef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230322-053048
        git checkout 0ddf14b7f34bfe410e49c800d855f4e0c59d6bef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221157.58L3rUhr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-amdpsp.c:8:10: fatal error: asm/msr.h: No such file or directory
       8 | #include <asm/msr.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +8 drivers/i2c/busses/i2c-designware-amdpsp.c

78d5e9e299e31b Jan Dabros 2022-02-08  7  
78d5e9e299e31b Jan Dabros 2022-02-08 @8  #include <asm/msr.h>
78d5e9e299e31b Jan Dabros 2022-02-08  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
