Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 508FF6E28B5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 18:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjDNQuv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 12:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbjDNQuu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 12:50:50 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37FE410B;
        Fri, 14 Apr 2023 09:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681491049; x=1713027049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gOE3x1iEfLs78Hp6b6MSZH6/nR9g2zasnCgn/QaH5gs=;
  b=nkelexk5vTEuxeW2cd4rNZyMy2MV+WmB8+/5m2OGX5JE5LVZ5TAIvytU
   6vQQ8n3EAkWPDLOaeHKR4fIwrE5w/H7QA3kqMsw4SAnaRQ12L9r4FEpI2
   LOY0SnESdB7HxX93t5GfeuyU1wjQbM72NoPJmyJjuXlHMyYxhGeEgt9oo
   3L2q5POnyjgr5EqtbbPrq6pn21Lail3ztNzbTSaIZX1HIhnqjOacxQkHy
   7l+e7RrUdRcLWwPGZgz10qr233bHLKHl/93TyFiolyOD8FE3T/Xjke1ll
   PeF+zVZbH7xkOmIvne4a0YjvywzAj/lUzU5co4BguRiSsTCY2IHO2wCD4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="333284200"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="333284200"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 09:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="1019636249"
X-IronPort-AV: E=Sophos;i="5.99,197,1677571200"; 
   d="scan'208";a="1019636249"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Apr 2023 09:50:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pnMdC-000ZjH-1v;
        Fri, 14 Apr 2023 16:50:38 +0000
Date:   Sat, 15 Apr 2023 00:50:26 +0800
From:   kernel test robot <lkp@intel.com>
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
Cc:     oe-kbuild-all@lists.linux.dev, linux-crypto@vger.kernel.org,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/2] i2c: designware: Add doorbell support for
 Mendocino
Message-ID: <202304150012.IieZ4vzl-lkp@intel.com>
References: <20230414144008.836-3-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414144008.836-3-mario.limonciello@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mario,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20230413]
[cannot apply to wsa/i2c/for-next linus/master v6.3-rc6 v6.3-rc5 v6.3-rc4 v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/i2c-designware-Use-PCI-PSP-driver-for-communication/20230414-224238
patch link:    https://lore.kernel.org/r/20230414144008.836-3-mario.limonciello%40amd.com
patch subject: [PATCH v9 2/2] i2c: designware: Add doorbell support for Mendocino
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230415/202304150012.IieZ4vzl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/a8ae7845f0c3fcb46f4c37508838fed08dae7eec
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/i2c-designware-Use-PCI-PSP-driver-for-communication/20230414-224238
        git checkout a8ae7845f0c3fcb46f4c37508838fed08dae7eec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150012.IieZ4vzl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-amdpsp.c: In function 'psp_send_i2c_req_doorbell':
>> drivers/i2c/busses/i2c-designware-amdpsp.c:82:15: error: too many arguments to function 'psp_ring_platform_doorbell'
      82 |         ret = psp_ring_platform_doorbell(req->type, &req->hdr.status);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/i2c/busses/i2c-designware-amdpsp.c:5:
   include/linux/psp-platform-access.h:51:5: note: declared here
      51 | int psp_ring_platform_doorbell(int msg);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/psp_ring_platform_doorbell +82 drivers/i2c/busses/i2c-designware-amdpsp.c

    77	
    78	static int psp_send_i2c_req_doorbell(struct psp_i2c_req *req)
    79	{
    80		int ret;
    81	
  > 82		ret = psp_ring_platform_doorbell(req->type, &req->hdr.status);
    83		if (ret == -EIO)
    84			return check_i2c_req_sts(req);
    85	
    86		return ret;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
