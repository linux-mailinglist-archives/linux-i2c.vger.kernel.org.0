Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF5C36C4F1B
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 16:13:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjCVPNG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 11:13:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231263AbjCVPND (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 11:13:03 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D563977A;
        Wed, 22 Mar 2023 08:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679497982; x=1711033982;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BPRQUKu+qBgifK27Px0rE+E2xaVa1QPMWTqx7CnVwA0=;
  b=jGmtvD3EvZbX2DsO3l7Xdi7d8DtddiK2YxQbmtfIyoOtBCOyMxUBoBOi
   UDMUGCWHA8QJvtXJ0QFwld3UrBArEVXdUztXbu4v6Oec96VBUQ4Akk6nx
   Bt2nbYM8XXzjVOawvneL3V0xe1dfqwOxaHo+Qx6SQkC5RKvm2XAW913H5
   yxUBslpfK0SPhOqMgSIdHZVLVmnaYpJvOow0akUtptuqiQR5aK9HO0Oy2
   oy0+9tROtCjFJQisuBIxB/bT7dZ1LoBzi3ZxSGNj+GGv1cVVmzdgSx0yb
   VLx4DBUrIMD5bHtl6no0ecfeTlvwmN2ENFZoovRD+IHSMIKpikEgpso+q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336743520"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336743520"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 08:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="746359567"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="746359567"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Mar 2023 08:12:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pf08o-000DQM-0W;
        Wed, 22 Mar 2023 15:12:42 +0000
Date:   Wed, 22 Mar 2023 23:12:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     ye.xingchen@zte.com.cn, wsa+renesas@sang-engineering.com
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: Use dev_err_probe()
Message-ID: <202303222240.y3A3yNqb-lkp@intel.com>
References: <202303221640559786295@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303221640559786295@zte.com.cn>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v6.3-rc3 next-20230322]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ye-xingchen-zte-com-cn/i2c-gpio-Use-dev_err_probe/20230322-164142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/202303221640559786295%40zte.com.cn
patch subject: [PATCH] i2c: gpio: Use dev_err_probe()
config: arm-randconfig-r046-20230322 (https://download.01.org/0day-ci/archive/20230322/202303222240.y3A3yNqb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/6d20957af4d6ae04d7249889f6a52bb88a89ce29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ye-xingchen-zte-com-cn/i2c-gpio-Use-dev_err_probe/20230322-164142
        git checkout 6d20957af4d6ae04d7249889f6a52bb88a89ce29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303222240.y3A3yNqb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-gpio.c:359:43: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
                         "error trying to get descriptor: %d\n");
                                                          ~^
   1 warning generated.


vim +359 drivers/i2c/busses/i2c-gpio.c

   327	
   328	static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
   329						   const char *con_id,
   330						   unsigned int index,
   331						   enum gpiod_flags gflags)
   332	{
   333		struct gpio_desc *retdesc;
   334		int ret;
   335	
   336		retdesc = devm_gpiod_get(dev, con_id, gflags);
   337		if (!IS_ERR(retdesc)) {
   338			dev_dbg(dev, "got GPIO from name %s\n", con_id);
   339			return retdesc;
   340		}
   341	
   342		retdesc = devm_gpiod_get_index(dev, NULL, index, gflags);
   343		if (!IS_ERR(retdesc)) {
   344			dev_dbg(dev, "got GPIO from index %u\n", index);
   345			return retdesc;
   346		}
   347	
   348		ret = PTR_ERR(retdesc);
   349	
   350		/* FIXME: hack in the old code, is this really necessary? */
   351		if (ret == -EINVAL)
   352			retdesc = ERR_PTR(-EPROBE_DEFER);
   353	
   354		/* This happens if the GPIO driver is not yet probed, let's defer */
   355		if (ret == -ENOENT)
   356			retdesc = ERR_PTR(-EPROBE_DEFER);
   357	
   358		dev_err_probe(dev, PTR_ERR(retdesc),
 > 359			      "error trying to get descriptor: %d\n");
   360	
   361		return retdesc;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
