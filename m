Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A78DE56B8F0
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 13:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238057AbiGHLvu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 07:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238019AbiGHLvt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 07:51:49 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2ACD9A69C;
        Fri,  8 Jul 2022 04:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657281108; x=1688817108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CTxPOyc/xdjMXnOWPfyNWMdQUPIw1gnfJVj5LDAB4hE=;
  b=c7aabCENBj/fW/TlITdF1qNo22rDgglE29/hIK77q0uBB1eUsbh2U2oy
   t3UgCr2L7aeXiSNZgVrP9YBuI27TB3ovOP+6gCXDRlE0b3K69D4W+kOOH
   88TlE1Lgate/8tN77NGCYbwfPDFKW48hgQUVcAqR4zxYrHzJXKp5ozbTk
   p2akyYPUyaDVdKSM+8ODXpT32QX1r9yBBP2MXPLxEa/4FYSNp6rzZZVje
   WvZoRr8kDZW5SSwbrGWNFtv5I+isHx++0sgTVqKvaNQgLpu9z1pt0FaaL
   sK8Uebi/NBpz8NTkvTczflJteAaeVVw4RuZhRLRAYPXFt3kQLDJfwGyAO
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285391730"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="285391730"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 04:51:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="920971718"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Jul 2022 04:51:46 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o9mWP-000NQc-To;
        Fri, 08 Jul 2022 11:51:45 +0000
Date:   Fri, 8 Jul 2022 19:50:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: Re: [PATCH v2 1/1] i2c: scmi: Replace open coded
 device_get_match_data()
Message-ID: <202207081957.tSlBfZYh-lkp@intel.com>
References: <20220708100216.84300-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708100216.84300-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on linus/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-scmi-Replace-open-coded-device_get_match_data/20220708-180449
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20220708/202207081957.tSlBfZYh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/c111b5704bd215394f238fa88925d6832cf2562c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Andy-Shevchenko/i2c-scmi-Replace-open-coded-device_get_match_data/20220708-180449
        git checkout c111b5704bd215394f238fa88925d6832cf2562c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-scmi.c: In function 'acpi_smbus_cmi_add':
>> drivers/i2c/busses/i2c-scmi.c:372:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     372 |         smbus_cmi->methods = device_get_match_data(&device->dev);
         |                            ^
>> drivers/i2c/busses/i2c-scmi.c:364:38: warning: unused variable 'id' [-Wunused-variable]
     364 |         const struct acpi_device_id *id;
         |                                      ^~


vim +/const +372 drivers/i2c/busses/i2c-scmi.c

   360	
   361	static int acpi_smbus_cmi_add(struct acpi_device *device)
   362	{
   363		struct acpi_smbus_cmi *smbus_cmi;
 > 364		const struct acpi_device_id *id;
   365		int ret;
   366	
   367		smbus_cmi = kzalloc(sizeof(struct acpi_smbus_cmi), GFP_KERNEL);
   368		if (!smbus_cmi)
   369			return -ENOMEM;
   370	
   371		smbus_cmi->handle = device->handle;
 > 372		smbus_cmi->methods = device_get_match_data(&device->dev);
   373		strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
   374		strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
   375		device->driver_data = smbus_cmi;
   376		smbus_cmi->cap_info = 0;
   377		smbus_cmi->cap_read = 0;
   378		smbus_cmi->cap_write = 0;
   379	
   380		acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
   381				    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
   382	
   383		if (smbus_cmi->cap_info == 0) {
   384			ret = -ENODEV;
   385			goto err;
   386		}
   387	
   388		snprintf(smbus_cmi->adapter.name, sizeof(smbus_cmi->adapter.name),
   389			"SMBus CMI adapter %s",
   390			acpi_device_name(device));
   391		smbus_cmi->adapter.owner = THIS_MODULE;
   392		smbus_cmi->adapter.algo = &acpi_smbus_cmi_algorithm;
   393		smbus_cmi->adapter.algo_data = smbus_cmi;
   394		smbus_cmi->adapter.class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
   395		smbus_cmi->adapter.dev.parent = &device->dev;
   396	
   397		ret = i2c_add_adapter(&smbus_cmi->adapter);
   398		if (ret) {
   399			dev_err(&device->dev, "Couldn't register adapter!\n");
   400			goto err;
   401		}
   402	
   403		return 0;
   404	
   405	err:
   406		kfree(smbus_cmi);
   407		device->driver_data = NULL;
   408		return ret;
   409	}
   410	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
