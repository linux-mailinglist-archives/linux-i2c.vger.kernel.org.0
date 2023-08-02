Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C128476C417
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 06:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjHBEXP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 00:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbjHBEXL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 00:23:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5A4AC;
        Tue,  1 Aug 2023 21:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690950190; x=1722486190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uniHFEhC0kf7c4W37qcR9vLoVyBWjgm6Wi/d7amYaug=;
  b=PjA2IpyEjgPqcYKsFC1/aMfcWCqQkR0TQFOeTI/haHfG+TwNf3GWYmFt
   GiqYu7wy1322fFbsyYMQzrBXx/jHO2UhDAqCz/UA66DvZOduHFTYYCKuU
   IZTu3WMHBQD4yqG8HpkP/X5bBjQ+dO4jhHwQeHEO3NPAflCoTY3dhQec6
   IHkGd3o9ZuRi8M/JbmDxMp4CZlfima/FVues8hfLZR1SvASKgde7Usfb2
   A1a1H7YWzJQGEZKkzcFD6tFPLHvgF+Q3DElhUHhUHXBiG1vLRW9bLNU0O
   2gbnZE+mEJ0jo1pqjjfTqzLWE9ehm02H+dq80p0hJR7Cc1lFTBGQlDIqT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369473737"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369473737"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 21:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902843405"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="902843405"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 21:23:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qR3O6-0000rT-19;
        Wed, 02 Aug 2023 04:23:06 +0000
Date:   Wed, 2 Aug 2023 12:22:23 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     oe-kbuild-all@lists.linux.dev,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202308021202.uZeI7Cnt-lkp@intel.com>
References: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801170318.82682-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Biju,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on driver-core/driver-core-testing driver-core/driver-core-next driver-core/driver-core-linus linus/master v6.5-rc4 next-20230801]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Biju-Das/drivers-fwnode-Extend-device_get_match_data-to-struct-bus_type/20230802-010931
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/20230801170318.82682-3-biju.das.jz%40bp.renesas.com
patch subject: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
config: parisc-randconfig-r026-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021202.uZeI7Cnt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021202.uZeI7Cnt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021202.uZeI7Cnt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:23:
   include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
    1038 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/i2c.h:1031:2: note: previous definition of 'i2c_of_match_device' with type 'const struct of_device_id *(const struct of_device_id *, struct i2c_client *)'
    1031 | *i2c_of_match_device(const struct of_device_id *matches,
         |  ^~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c: In function 'i2c_device_get_match_data':
>> drivers/i2c/i2c-core-base.c:146:25: error: implicit declaration of function 'i2c_of_match_device_sysfs'; did you mean 'i2c_of_match_device'? [-Werror=implicit-function-declaration]
     146 |                 match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         i2c_of_match_device
>> drivers/i2c/i2c-core-base.c:146:23: warning: assignment to 'const struct of_device_id *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     146 |                 match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
         |                       ^
   cc1: some warnings being treated as errors


vim +146 drivers/i2c/i2c-core-base.c

   128	
   129	static const void *i2c_device_get_match_data(const struct device *dev)
   130	{
   131		/* TODO: use i2c_verify_client() when it accepts const pointer */
   132		const struct i2c_client *client = (dev->type == &i2c_client_type) ?
   133						  to_i2c_client(dev) : NULL;
   134		const void *data;
   135	
   136		if (!dev->driver)
   137			return NULL;
   138	
   139		data = i2c_get_match_data_helper(to_i2c_driver(dev->driver), client);
   140		if (data)
   141			return data;
   142	
   143		if (dev->driver->of_match_table) {
   144			const struct of_device_id *match;
   145	
 > 146			match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
   147							  (struct i2c_client *)client);
   148			if (match)
   149				data = match->data;
   150		}
   151	
   152		return data;
   153	}
   154	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
