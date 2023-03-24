Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4627A6C86F5
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 21:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232102AbjCXUkg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 16:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjCXUkf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 16:40:35 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE1541E288;
        Fri, 24 Mar 2023 13:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679690434; x=1711226434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QIZyQqD0ZTQusCHo6ZU0wikQoizemeejriUuniYY2Z0=;
  b=aa0+YkE9yReWxlsjvFfvN7Vy1T9eu4EY5J1InF7Enrt+4lTkimL6XF9q
   cUB+s0qYxYsyq6J1WwIsO3TcxIZCU00ataimD6pHoIC73qGk9D5oA8y1c
   izGx8u7ALW9JgmFEt/gx4/sgf8Lfq4wVW1VBJ6AWdd9MyB3AiHfaQRN/+
   EDLlV17ltQLg9LUwX3Qm+AJgk1A0UkPDvvgxxHB6Na/9ZxaV6C6/TSaU8
   SBIydRyQ1ylRv86olgpBbQMrq/WnALoQmdUXMh/bX3Y5UpAWZ3GY8MRu0
   tQZP4jy5NBgFLdXnhqmDzwBDNQ3VANGyPxwKk5NrNmiAUfL/RGgVRTIYt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="337385982"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="337385982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 13:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826389054"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="826389054"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 13:40:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfoD9-000Fdj-2B;
        Fri, 24 Mar 2023 20:40:31 +0000
Date:   Sat, 25 Mar 2023 04:40:21 +0800
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
Subject: Re: [PATCH v6 4/4] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <202303250445.xSF29gIw-lkp@intel.com>
References: <20230322210227.464-5-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230322210227.464-5-mario.limonciello@amd.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
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
patch link:    https://lore.kernel.org/r/20230322210227.464-5-mario.limonciello%40amd.com
patch subject: [PATCH v6 4/4] i2c: designware: Add doorbell support for Mendocino
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230325/202303250445.xSF29gIw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/9056f37ee3c0bd46052df6b3fb08c0ad951752a4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/crypto-ccp-Bump-up-doorbell-debug-messages-to-error/20230323-050710
        git checkout 9056f37ee3c0bd46052df6b3fb08c0ad951752a4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250445.xSF29gIw-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_mendocino':
>> i2c-designware-amdpsp.c:(.text+0x12): undefined reference to `psp_ring_platform_doorbell'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `psp_send_i2c_req_cezanne':
   i2c-designware-amdpsp.c:(.text+0x67): undefined reference to `psp_send_platform_access_msg'
   ld: drivers/i2c/busses/i2c-designware-amdpsp.o: in function `i2c_dw_amdpsp_probe_lock_support':
   i2c-designware-amdpsp.c:(.text+0x497): undefined reference to `psp_check_platform_access_status'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
