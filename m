Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6974476C419
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 06:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230340AbjHBEXQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 00:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjHBEXN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 00:23:13 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FBDED;
        Tue,  1 Aug 2023 21:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690950191; x=1722486191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6487yMnOXVoGa8mCicwN9RDmCnny31ff9CNYFzRXXXw=;
  b=ig+MzOnTZsCqL/IbeM+ZXgOQWQKTRx33SjYklcZVoqC/Rb3/st0e7t/g
   NjcfMqjg0Ln9bxr0sS1A5toZhq9b3rrBRM7ROQ9WHE4VX7mENfi7R4TVw
   P5CzLUhLzW2podZYt05m1covqKbIS6nCcCtlFCIkFBbM+Oi6ZmNewF5nN
   7rTgzlLizCZqNPrvC7kWIJUIhYQMYDFVztBh5mGrFGSy6uaVvU0FQWa/u
   KeQSDXpGdhcHLYOOSgRPHRuUKJY5eTshyFdHt65z76I5V+cxWppH/PWI3
   f6zFwSUPmQzzXHqlQqrq57tGrsSXCV4ioMXC4CS1yL/kz9G+cN9COFgcq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="369473746"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="369473746"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 21:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="902843404"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="902843404"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Aug 2023 21:23:07 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qR3O6-0000rV-1F;
        Wed, 02 Aug 2023 04:23:06 +0000
Date:   Wed, 2 Aug 2023 12:22:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] i2c: Add i2c_device_get_match_data() callback
Message-ID: <202308021233.ztWtV82e-lkp@intel.com>
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
config: i386-randconfig-r014-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021233.ztWtV82e-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021233.ztWtV82e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021233.ztWtV82e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/i2c-core-base.c:23:
>> include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   include/linux/i2c.h:1031:2: note: previous definition is here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
>> drivers/i2c/i2c-core-base.c:146:11: error: call to undeclared function 'i2c_of_match_device_sysfs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
                           ^
   drivers/i2c/i2c-core-base.c:146:11: note: did you mean 'i2c_of_match_device'?
   include/linux/i2c.h:1038:2: note: 'i2c_of_match_device' declared here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
>> drivers/i2c/i2c-core-base.c:146:9: error: incompatible integer to pointer conversion assigning to 'const struct of_device_id *' from 'int' [-Wint-conversion]
                   match = i2c_of_match_device_sysfs(dev->driver->of_match_table,
                         ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
   In file included from drivers/i2c/i2c-smbus.c:11:
>> include/linux/i2c.h:1038:2: error: redefinition of 'i2c_of_match_device'
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   include/linux/i2c.h:1031:2: note: previous definition is here
   *i2c_of_match_device(const struct of_device_id *matches,
    ^
   1 error generated.


vim +/i2c_of_match_device +1038 include/linux/i2c.h

  1036	
  1037	static inline const struct of_device_id
> 1038	*i2c_of_match_device(const struct of_device_id *matches,
  1039			     struct i2c_client *client)
  1040	{
  1041		return NULL;
  1042	}
  1043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
