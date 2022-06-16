Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A7954EA7D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 22:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245332AbiFPUFT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 16:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbiFPUFS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 16:05:18 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250D74E3B9;
        Thu, 16 Jun 2022 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655409918; x=1686945918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8nKn3u5HYJV1okOhvCdZ6oJQPkGSyi/IKm0G/s0MXY=;
  b=n1MTvZ9oclK3QvhFS4daltr6uY7xtpB1Ps+yc0WSUMAWNbtsgFqCIKzV
   eOuQ6a1MMJg70Cp0p0Sf4SafEFcSPJZy8s7tTGrdyTHjmo8z8KBjtuTv0
   M4YBDnSL77sY+bcH5QVcpPEeM/fMRNLudveAfdKLpfhO5MBAMXJgXdQmS
   lRElJNdS4YVEY2/4frzDg4Z6TlL1VHwzKlH8sRMHzDd0GD9fXz76dgmNB
   S6lx9QE9FodGe5tY2aweoaADlDYE3rO06uDOOclij8uDMzirKadQyqgkw
   5qTpXK5p3LDDBr7Sro+jBjutiIBko0+NzjqcFcqd+aUbtenuj2sCz9geU
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="278136270"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="278136270"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="589791945"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2022 13:05:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1vjs-000Oj3-Vy;
        Thu, 16 Jun 2022 20:05:12 +0000
Date:   Fri, 17 Jun 2022 04:04:50 +0800
From:   kernel test robot <lkp@intel.com>
To:     Quan Nguyen <quan@os.amperecomputing.com>,
        Corey Minyard <minyard@acm.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        openipmi-developer@lists.sourceforge.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Open Source Submission <patches@amperecomputing.com>,
        Phong Vo <phong@os.amperecomputing.com>,
        "Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <202206170337.0kCTfR63-lkp@intel.com>
References: <20220615090259.1121405-2-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615090259.1121405-2-quan@os.amperecomputing.com>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Quan,

I love your patch! Yet something to improve:

[auto build test ERROR on cminyard-ipmi/for-next]
[also build test ERROR on wsa/i2c/for-next v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
base:   https://github.com/cminyard/linux-ipmi for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220617/202206170337.0kCTfR63-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0feb5f0351d090633e7522dbec22de419a04b85f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
        git checkout 0feb5f0351d090633e7522dbec22de419a04b85f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ipmi_ssif_bmc.h:13:2: error: unknown type name '__u8'
           __u8    payload[IPMI_SSIF_PAYLOAD_MAX];
           ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
