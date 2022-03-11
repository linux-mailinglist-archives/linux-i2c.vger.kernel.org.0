Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E16A4D5B8D
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Mar 2022 07:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233190AbiCKGWe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Mar 2022 01:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiCKGWd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 11 Mar 2022 01:22:33 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF83E15C9F2;
        Thu, 10 Mar 2022 22:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646979690; x=1678515690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6emc1AFaB06kmmYCtXfN6YMM1b/mUxC5G7/GppPZ660=;
  b=YIlaxrtEw/9cNxsT1kbuBQia6gjx7A09OVlIVNAS7k+5t+u5KYiQ12cS
   wju/76C1BhLfY5VuvST7Q8dVt3d/Ni4acFiZVEPQoCWB86HTolsIN9x3r
   +s23jn0S9OxWVoG4qPMbpezRbtFZ10ExQFTBcLDPrpPjR3b1QyOeoevea
   /JvyT+AYvNM44veU+6vAAXtsioiyUkXm2S+WgNTbvgLhqknQ3vUshGsGg
   hyRLd1Zzi5B3TO8E4euhJFraLEroQlBVWYLp6AFIm/XOrpxo8jaAMC0kb
   QRhe8WVwAPLp1tLi3XEo5oEwEEyGNBC128ZHUltL11sg/2sw/AE51zvIm
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318734799"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="318734799"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 22:21:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="688975479"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2022 22:21:24 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nSYeS-0005vr-24; Fri, 11 Mar 2022 06:21:24 +0000
Date:   Fri, 11 Mar 2022 14:20:44 +0800
From:   kernel test robot <lkp@intel.com>
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org
Cc:     kbuild-all@lists.01.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <202203111440.hG9yioyl-lkp@intel.com>
References: <20220310114119.13736-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310114119.13736-2-quan@os.amperecomputing.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Quan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on wsa/i2c/for-next cminyard-ipmi/for-next v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Quan-Nguyen/Add-SSIF-BMC-driver/20220310-194342
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git 3dd9a926ec2308e49445f22abef149fc64e9332e
config: mips-randconfig-s031-20220310 (https://download.01.org/0day-ci/archive/20220311/202203111440.hG9yioyl-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/a977225b8997c2fdb51eddeee79de36075d3ce4d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-SSIF-BMC-driver/20220310-194342
        git checkout a977225b8997c2fdb51eddeee79de36075d3ce4d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefined
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefined
   builtin:0:0: sparse: this was the original definition
>> drivers/char/ipmi/ssif_bmc.c:181:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/char/ipmi/ssif_bmc.c:181:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/char/ipmi/ssif_bmc.c:181:27: sparse:     got unsigned int ( * )( ... )

vim +181 drivers/char/ipmi/ssif_bmc.c

   171	
   172	/*
   173	 * System calls to device interface for user apps
   174	 */
   175	static const struct file_operations ssif_bmc_fops = {
   176		.owner		= THIS_MODULE,
   177		.open		= ssif_bmc_open,
   178		.read		= ssif_bmc_read,
   179		.write		= ssif_bmc_write,
   180		.release	= ssif_bmc_release,
 > 181		.poll		= ssif_bmc_poll,
   182	};
   183	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
