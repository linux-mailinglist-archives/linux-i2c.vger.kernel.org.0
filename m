Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 267106C72A9
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Mar 2023 22:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbjCWV7y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Mar 2023 17:59:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbjCWV7w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Mar 2023 17:59:52 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A1E18ABC;
        Thu, 23 Mar 2023 14:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679608791; x=1711144791;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MIYwnVhINEUPfIqisXDzCHTh2MVhn+l+clvK/i9lXUw=;
  b=Va+NTwX4xQo/3kYiDIl8LtbATMbPoSj6UL5Ab0O169pKbgxZJDdi/UxB
   C1RRl5WtZkWA9XPQUBk0sg24maFx/KodP0c+CWxUouUmNlyyjJzBYhpsE
   hSp2StRKfM47VMtsHjmghCISBBau+PBlODZFBCsuIhM2zsD0xgpk+nUOz
   Xz+xqTB5cI5rdHjCD/M98/GcOdvELFDak4ot10HWeiWzcGlgIebVzgFdX
   T0TOwGarvIp2v9AgIZ75nWoxLjJfmpJwI6CuZednTEHVLrKtsFDghrVf5
   4IIqqde7c42LfABrfIH/qxoPCzlv2vt5ngzo5QXswTGh1nEevXqeXVKPn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402216027"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="402216027"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="682452314"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="682452314"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Mar 2023 14:59:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pfSyH-000Ejc-0q;
        Thu, 23 Mar 2023 21:59:45 +0000
Date:   Fri, 24 Mar 2023 05:59:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ye Xiang <xiang.ye@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     oe-kbuild-all@lists.linux.dev, srinivas.pandruvada@intel.com,
        heikki.krogerus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        sakari.ailus@linux.intel.com, zhifeng.wang@intel.com,
        wentong.wu@intel.com, lixu.zhang@intel.com,
        Ye Xiang <xiang.ye@intel.com>
Subject: Re: [PATCH v6 1/6] usb: Add support for Intel LJCA device
Message-ID: <202303240545.fhNNvhZt-lkp@intel.com>
References: <20230323172113.1231050-2-xiang.ye@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323172113.1231050-2-xiang.ye@intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ye,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus brgl/gpio/for-next wsa/i2c/for-next broonie-spi/for-next linus/master v6.3-rc3 next-20230323]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ye-Xiang/usb-Add-support-for-Intel-LJCA-device/20230324-012303
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20230323172113.1231050-2-xiang.ye%40intel.com
patch subject: [PATCH v6 1/6] usb: Add support for Intel LJCA device
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230324/202303240545.fhNNvhZt-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/606c371c73fa37d233b47bd34d4789a1a157a9e4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ye-Xiang/usb-Add-support-for-Intel-LJCA-device/20230324-012303
        git checkout 606c371c73fa37d233b47bd34d4789a1a157a9e4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/usb/misc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240545.fhNNvhZt-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/usb/misc/ljca.c:133:9: error: unknown type name 'ljca_event_cb_t'
     133 |         ljca_event_cb_t notify;
         |         ^~~~~~~~~~~~~~~
   drivers/usb/misc/ljca.c: In function 'ljca_stub_notify':
   drivers/usb/misc/ljca.c:252:17: error: called object is not a function or function pointer
     252 |                 stub->event_entry.notify(stub->event_entry.context, cmd, evt_data, len);
         |                 ^~~~
   drivers/usb/misc/ljca.c: In function 'ljca_add_aux_dev':
>> drivers/usb/misc/ljca.c:498:16: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     498 |         adev = acpi_find_child_device(parent, adr, false);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                acpi_match_device
>> drivers/usb/misc/ljca.c:498:14: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     498 |         adev = acpi_find_child_device(parent, adr, false);
         |              ^
>> drivers/usb/misc/ljca.c:479:29: warning: variable 'adev' set but not used [-Wunused-but-set-variable]
     479 |         struct acpi_device *adev = NULL;
         |                             ^~~~
   drivers/usb/misc/ljca.c: At top level:
   drivers/usb/misc/ljca.c:369:12: warning: 'ljca_transfer_internal' defined but not used [-Wunused-function]
     369 | static int ljca_transfer_internal(struct ljca *ljca, u8 cmd, const void *obuf,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +498 drivers/usb/misc/ljca.c

   473	
   474	static int ljca_add_aux_dev(struct ljca_dev *dev, char *name, unsigned int id, unsigned int adr,
   475				    void *data)
   476	{
   477		struct auxiliary_device *auxdev;
   478		struct acpi_device *parent;
 > 479		struct acpi_device *adev = NULL;
   480		int ret;
   481	
   482		if (dev->auxdev_count >= ARRAY_SIZE(dev->auxdevs))
   483			return -EINVAL;
   484	
   485		auxdev = &dev->auxdevs[dev->auxdev_count];
   486		auxdev->name = name;
   487		auxdev->id = id;
   488		auxdev->dev.platform_data = data;
   489		auxdev->dev.parent = &dev->intf->dev;
   490		auxdev->dev.release = ljca_aux_release;
   491	
   492		ret = auxiliary_device_init(auxdev);
   493		if (ret)
   494			return ret;
   495	
   496		/* new auxiliary device bind to acpi device */
   497		parent = ACPI_COMPANION(&dev->intf->dev);
 > 498		adev = acpi_find_child_device(parent, adr, false);
   499		ACPI_COMPANION_SET(&auxdev->dev, adev ?: parent);
   500	
   501		ret = auxiliary_device_add(auxdev);
   502		if (ret) {
   503			dev_err(&dev->intf->dev, "failed to add auxiliary dev %s.%d\n", name, id);
   504			auxiliary_device_uninit(auxdev);
   505			return ret;
   506		}
   507	
   508		dev->auxdev_count++;
   509	
   510		return 0;
   511	}
   512	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
