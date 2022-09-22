Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04C645E6B71
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 21:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbiIVTFc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 15:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbiIVTFa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 15:05:30 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FFB7C9949;
        Thu, 22 Sep 2022 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663873525; x=1695409525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9hTR12KVYSG4WSUvy2XMfzfpJCVSwEHiEJ4NpOyo/so=;
  b=dDoRlO8vZN5kXxAtZpOonOAGwVHBQRd3GKsHYHLe49AUTS2heFqKgp8A
   1K2qr7Zgi6E68f7a49Q68kBwo48BInLRlg49GI5E0tSqX5faS33w2LgjE
   uKffByCwwfvhNV9HxMCzloTKzQnUCubTDGL/ZSZqEMaIP99kEC0iMb6Up
   TfeKws9vJDbFPfptxsPJgKaiWJPkZ+08iJQ2ZbwJJgysp246BLLIcMFgV
   BAUlqkaKZAoTc1CfHFHpmUdCz5y6B1SHVToH2xPcHN4nPyzloOsvy+M9c
   d7YG5U5XlUOTOI+5xw+mPzqiWGvomi4Vk3NPCEtSX8TEM/4YDjq5FM9kx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364410518"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="364410518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 11:59:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597568053"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 11:59:36 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obRQ7-0004sq-2c;
        Thu, 22 Sep 2022 18:59:35 +0000
Date:   Fri, 23 Sep 2022 02:58:59 +0800
From:   kernel test robot <lkp@intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
        WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/5] i2c: core: Pick i2c bus number from ACPI if present
Message-ID: <202209230228.LIiHRmuw-lkp@intel.com>
References: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be5cd69c7c58d44ca119d4ca692d95a2ae924533.1663835855.git.zhoubinbin@loongson.cn>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Binbin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: hexagon-randconfig-r041-20220922 (https://download.01.org/0day-ci/archive/20220923/202209230228.LIiHRmuw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/749fc796eb66dc42c209c6a5808c6b2a5e47fbb6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Binbin-Zhou/i2c-ls2x-Add-support-for-the-Loongson-2K-LS7A-I2C/20220922-194252
        git checkout 749fc796eb66dc42c209c6a5808c6b2a5e47fbb6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:1568:12: error: call to undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   status = acpi_evaluate_integer(ACPI_HANDLE(dev->parent),
                            ^
   drivers/i2c/i2c-core-base.c:1568:12: note: did you mean 'acpi_evaluate_object'?
   include/acpi/acpixf.h:550:8: note: 'acpi_evaluate_object' declared here
                               acpi_evaluate_object(acpi_handle object,
                               ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
           static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
                              ^
   1 error generated.


vim +/acpi_evaluate_integer +1568 drivers/i2c/i2c-core-base.c

  1540	
  1541	/**
  1542	 * i2c_add_adapter - declare i2c adapter, use dynamic bus number
  1543	 * @adapter: the adapter to add
  1544	 * Context: can sleep
  1545	 *
  1546	 * This routine is used to declare an I2C adapter when its bus number
  1547	 * doesn't matter or when its bus number is specified by an dt alias.
  1548	 * Examples of bases when the bus number doesn't matter: I2C adapters
  1549	 * dynamically added by USB links or PCI plugin cards.
  1550	 *
  1551	 * When this returns zero, a new bus number was allocated and stored
  1552	 * in adap->nr, and the specified adapter became available for clients.
  1553	 * Otherwise, a negative errno value is returned.
  1554	 */
  1555	int i2c_add_adapter(struct i2c_adapter *adapter)
  1556	{
  1557		struct device *dev = &adapter->dev;
  1558		acpi_status status;
  1559		unsigned long long id;
  1560	
  1561		if (dev->of_node) {
  1562			id = of_alias_get_id(dev->of_node, "i2c");
  1563			if (id >= 0) {
  1564				adapter->nr = id;
  1565				return __i2c_add_numbered_adapter(adapter);
  1566			}
  1567		} else if (dev->parent->fwnode) {
> 1568			status = acpi_evaluate_integer(ACPI_HANDLE(dev->parent),
  1569							"_UID", NULL, &id);
  1570			if (ACPI_SUCCESS(status) && (id >= 0)) {
  1571				adapter->nr = id;
  1572				return __i2c_add_numbered_adapter(adapter);
  1573			}
  1574		}
  1575	
  1576		mutex_lock(&core_lock);
  1577		id = idr_alloc(&i2c_adapter_idr, adapter,
  1578			       __i2c_first_dynamic_bus_num, 0, GFP_KERNEL);
  1579		mutex_unlock(&core_lock);
  1580		if (WARN(id < 0, "couldn't get idr"))
  1581			return id;
  1582	
  1583		adapter->nr = id;
  1584	
  1585		return i2c_register_adapter(adapter);
  1586	}
  1587	EXPORT_SYMBOL(i2c_add_adapter);
  1588	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
