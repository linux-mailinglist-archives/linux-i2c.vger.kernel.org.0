Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CBD6A520C
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Feb 2023 04:50:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjB1Du3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 Feb 2023 22:50:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjB1Du3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 27 Feb 2023 22:50:29 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3A064C19
        for <linux-i2c@vger.kernel.org>; Mon, 27 Feb 2023 19:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677556228; x=1709092228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ipBT75Jjea5vt0rmR8K8faxZwFeHocSUgcvMb1mdyBY=;
  b=XO1ppNBblFSVfq7a7D9JWS/zTYxpmkZVspDA3VeN8vRxrdRcGTOutUcu
   +u0IzYyQojRZzx8a/rXZN09nR2wExy4agbzjb4MnO4sAdG8CQFS+4O+Nt
   S6QvVwvatfoSCGGgdy8iE7wYiEToJSRFjLY+jlKcHlhm/a2wsbnM/kFTA
   w2WF+2ql4UHk4JenO540mDsOsEu+9S+ofuYAe1c+1qYYven4WItSaB0Bw
   zARMlT0ADijgc5swd20QUcgX3fdiRa/Fq+xTteIjRRvKD6PlEcq6BWshr
   L+7y4SCRWQVCUQSACZ5cIoTKWFlBWAhjdBbUeCc/wetiBPYdcTVztS1TW
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="322288275"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="322288275"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 19:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="1003079203"
X-IronPort-AV: E=Sophos;i="5.98,220,1673942400"; 
   d="scan'208";a="1003079203"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Feb 2023 19:50:15 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pWr0I-00053X-2x;
        Tue, 28 Feb 2023 03:50:14 +0000
Date:   Tue, 28 Feb 2023 11:50:13 +0800
From:   kernel test robot <lkp@intel.com>
To:     Benjamin Gray <bgray@linux.ibm.com>, linux-i2c@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
        Sven Peter <sven@svenpeter.dev>, mpe@ellerman.id.au,
        Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] i2c: Build I2C_PASEMI with COMPILE_TEST
Message-ID: <202302281135.KsarHDzl-lkp@intel.com>
References: <20230227233318.120415-2-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230227233318.120415-2-bgray@linux.ibm.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Benjamin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on ec0a1b360aec1ba0bdfad3dd69e300b028529c0d]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Gray/i2c-Build-I2C_PASEMI-with-COMPILE_TEST/20230228-073442
base:   ec0a1b360aec1ba0bdfad3dd69e300b028529c0d
patch link:    https://lore.kernel.org/r/20230227233318.120415-2-bgray%40linux.ibm.com
patch subject: [PATCH v2 2/2] i2c: Build I2C_PASEMI with COMPILE_TEST
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230228/202302281135.KsarHDzl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6f8f477a04ff9dcd1091aed71674b27c513b6b39
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Gray/i2c-Build-I2C_PASEMI-with-COMPILE_TEST/20230228-073442
        git checkout 6f8f477a04ff9dcd1091aed71674b27c513b6b39
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302281135.KsarHDzl-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-pasemi-pci.c:82:1: warning: data definition has no type or storage class
      82 | module_pci_driver(pasemi_smb_pci_driver);
         | ^~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-pasemi-pci.c:82:1: error: type defaults to 'int' in declaration of 'module_pci_driver' [-Werror=implicit-int]
>> drivers/i2c/busses/i2c-pasemi-pci.c:82:1: warning: parameter names (without types) in function declaration
   cc1: some warnings being treated as errors


vim +82 drivers/i2c/busses/i2c-pasemi-pci.c

9bc5f4f660ff3e Sven Peter 2021-10-08  81  
9bc5f4f660ff3e Sven Peter 2021-10-08 @82  module_pci_driver(pasemi_smb_pci_driver);
9bc5f4f660ff3e Sven Peter 2021-10-08  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
