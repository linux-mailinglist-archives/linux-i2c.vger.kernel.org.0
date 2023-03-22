Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC806C4895
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 12:07:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjCVLHk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 07:07:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjCVLHj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 07:07:39 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596A361507;
        Wed, 22 Mar 2023 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679483258; x=1711019258;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IdCbVHhNHSSogqvZ5x9/ffhe4nvBlI8kDDMSJQUeRvY=;
  b=C6XPUGwdXkv+5Xhj5nnIj05pS1DlOLYR4AaJi0fXpWx165zXniMVH7XT
   k+cwxEFjty7rtjRi/lAO07FjZ0C7bqUXFGWxYjZdPVL4pMsFZZD2RGiCm
   kbu2XaamRVW4YQLJr+LCFvs0+GEX+KHtrErnDIwL7lyH6yt5NraeLO0vj
   6prPpHhW/VOUYiCC/X39weZO25REmxxwe5cujRiRWvOMfUZIGLHOWWkYr
   4Q+jharLRTbdxlFlTkIbDUA0O1Bcn5dRYY0owr3+keChBcjwAGDlbPm9J
   zTnnMTRfkrsF6OiaskDxjSSApb1FbW5m88SL5+8GtxYdfmEseTKVomjII
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="339224437"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="339224437"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 04:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="750992315"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="750992315"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2023 04:07:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pewJZ-000DDS-2Q;
        Wed, 22 Mar 2023 11:07:33 +0000
Date:   Wed, 22 Mar 2023 19:07:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     ye.xingchen@zte.com.cn, wsa+renesas@sang-engineering.com
Cc:     oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: gpio: Use dev_err_probe()
Message-ID: <202303221842.vZAfsTBi-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230322/202303221842.vZAfsTBi-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6d20957af4d6ae04d7249889f6a52bb88a89ce29
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review ye-xingchen-zte-com-cn/i2c-gpio-Use-dev_err_probe/20230322-164142
        git checkout 6d20957af4d6ae04d7249889f6a52bb88a89ce29
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221842.vZAfsTBi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-gpio.c: In function 'i2c_gpio_get_desc':
>> drivers/i2c/busses/i2c-gpio.c:359:57: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     359 |                       "error trying to get descriptor: %d\n");
         |                                                        ~^
         |                                                         |
         |                                                         int


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
