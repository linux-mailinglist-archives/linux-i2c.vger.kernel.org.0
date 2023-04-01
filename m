Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D83366D339B
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Apr 2023 21:38:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjDATim (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Apr 2023 15:38:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjDATim (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Apr 2023 15:38:42 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E8631B375;
        Sat,  1 Apr 2023 12:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680377921; x=1711913921;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JNRhm77EnZ2yyKKO3Zo8UK05mChzoj0Un0mQU53BlMc=;
  b=GOd0RJST68ow3oIbeFeOJHQduhvkEvXV440K2el0vyQvdm28o0Ugwcu/
   duLgF2Q6xin7gi+Fqx5EDj6KxCOcAFNZpgyfywb7gi7XFPuR0CxxHUyl5
   2UGJMlTMwFLkPTUJ8bjZxLReZE4zNLgKN2KrYWDZTL1/Yuoidl6aC9T+h
   /z+jz1xR3rZKeSMkELZjmTi19aSdC5Vj1WKmRBuehQIF+JBSiNluWnULG
   YIfHv6Spy5aRfQaJGqYCeP7AinfnQB0856/F1W32Blf+wJCER3SC6GoXk
   JXyhVAB2XTviAEXFr3P8bTBzh6yuVYQ4A7HD193no2Wvi/b/0Z09t4JbC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="406721509"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="406721509"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 12:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796523407"
X-IronPort-AV: E=Sophos;i="5.98,311,1673942400"; 
   d="scan'208";a="796523407"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 12:38:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pih3d-000Mzh-03;
        Sat, 01 Apr 2023 19:38:37 +0000
Date:   Sun, 2 Apr 2023 03:38:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Jan =?utf-8?B?RMSFYnJvxZs=?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     oe-kbuild-all@lists.linux.dev, Felix Held <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/6] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <202304020338.c4EJ0lmB-lkp@intel.com>
References: <20230329220753.7741-7-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329220753.7741-7-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on 9117e682b8b79f7b5e2517fd28d42757d3e8b860]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
base:   9117e682b8b79f7b5e2517fd28d42757d3e8b860
patch link:    https://lore.kernel.org/r/20230329220753.7741-7-mario.limonciello%40amd.com
patch subject: [PATCH v7 6/6] i2c: designware: Add doorbell support for Mendocino
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230402/202304020338.c4EJ0lmB-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9696fd5743f2be39fab0ac256fad8dd9eae9930d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Drop-extra-doorbell-checks/20230330-060959
        git checkout 9696fd5743f2be39fab0ac256fad8dd9eae9930d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304020338.c4EJ0lmB-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_doorbell':
>> i2c-designware-amdpsp.c:(.text+0x12): undefined reference to `psp_ring_platform_doorbell'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_cezanne':
   i2c-designware-amdpsp.c:(.text+0x67): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
   i2c-designware-amdpsp.c:(.text+0x49d): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
