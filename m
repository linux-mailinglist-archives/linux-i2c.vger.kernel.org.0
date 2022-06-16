Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1882154DE06
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 11:19:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbiFPJTA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359311AbiFPJS7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 05:18:59 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE71856F90;
        Thu, 16 Jun 2022 02:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655371137; x=1686907137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uhuD9564WbiMR6YEyqZCv/cGg7ljX8YyLbuqxfhjXNo=;
  b=GSQEHAJFsXX96htgyQNZa2Sadhwem9qB0wfg7pQhCbccMvpJ9d/eGQJG
   hfEozg/ILlo1xE89q+Lv13Qu2k8d5vIgss8lfsAP1iBdY5OcJJcx+wxJu
   Ec5G+A4gPcK54iAVuF9vGCZdJWoXKLKoAMFma/VWFfflZHYnBINAdQIxb
   r+IqghNARErsD9iN5OlJ9oWGLb7eZf8uembTVoBnN1l2qkxDk/A/Lqvg1
   2ucLFz9tT7fBS6pdeVbRIIAMhl2KIEuw/U80iIUTJbxNY8lh5PZf2jLDK
   qHD2cQn4RCKTzGD4vSd8K5ou4BL/KlIUuQwrRFYVNGXZRl4CRuWpt5pHx
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="304647613"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="304647613"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 02:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="618816728"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Jun 2022 02:18:54 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
        (envelope-from <lkp@intel.com>)
        id 1o1leP-000OEv-OU;
        Thu, 16 Jun 2022 09:18:53 +0000
Date:   Thu, 16 Jun 2022 17:18:39 +0800
From:   kernel test robot <lkp@intel.com>
To:     frank zago <frank@zago.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>,
        Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH v6 3/4] i2c: ch341: add I2C MFD cell driver for the CH341
Message-ID: <202206161751.5icAiwNf-lkp@intel.com>
References: <20220616013747.126051-4-frank@zago.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616013747.126051-4-frank@zago.net>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi frank,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on brgl/gpio/for-next wsa/i2c/for-next linus/master v5.19-rc2 next-20220615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/frank-zago/add-driver-for-the-WCH-CH341-in-I2C-GPIO-mode/20220616-094113
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
config: nios2-randconfig-r026-20220616 (https://download.01.org/0day-ci/archive/20220616/202206161751.5icAiwNf-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/46c68aee86d34ee630272146a73ad7c3147bb094
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review frank-zago/add-driver-for-the-WCH-CH341-in-I2C-GPIO-mode/20220616-094113
        git checkout 46c68aee86d34ee630272146a73ad7c3147bb094
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.3.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nios2-linux-ld: drivers/mfd/ch341-core.o: in function `ch341_usb_probe':
>> drivers/mfd/ch341-core.c:46: undefined reference to `usb_find_common_endpoints'
   drivers/mfd/ch341-core.c:46:(.text+0x8c): relocation truncated to fit: R_NIOS2_CALL26 against `usb_find_common_endpoints'
   nios2-linux-ld: drivers/mfd/ch341-core.o: in function `ch341_usb_driver_init':
>> drivers/mfd/ch341-core.c:86: undefined reference to `usb_register_driver'
   drivers/mfd/ch341-core.c:86:(.init.text+0x1c): relocation truncated to fit: R_NIOS2_CALL26 against `usb_register_driver'
   nios2-linux-ld: drivers/i2c/busses/i2c-ch341.o: in function `no_data_xfer':
>> drivers/i2c/busses/i2c-ch341.c:81: undefined reference to `usb_bulk_msg'
   drivers/i2c/busses/i2c-ch341.c:81:(.text+0xe0): relocation truncated to fit: R_NIOS2_CALL26 against `usb_bulk_msg'
>> nios2-linux-ld: drivers/i2c/busses/i2c-ch341.c:89: undefined reference to `usb_bulk_msg'
   drivers/i2c/busses/i2c-ch341.c:89:(.text+0x134): relocation truncated to fit: R_NIOS2_CALL26 against `usb_bulk_msg'
   nios2-linux-ld: drivers/i2c/busses/i2c-ch341.o: in function `ch341_i2c_xfer':
   drivers/i2c/busses/i2c-ch341.c:278: undefined reference to `usb_bulk_msg'
   drivers/i2c/busses/i2c-ch341.c:278:(.text+0x4e0): relocation truncated to fit: R_NIOS2_CALL26 against `usb_bulk_msg'
   nios2-linux-ld: drivers/i2c/busses/i2c-ch341.c:290: undefined reference to `usb_bulk_msg'
   drivers/i2c/busses/i2c-ch341.c:290:(.text+0x558): relocation truncated to fit: R_NIOS2_CALL26 against `usb_bulk_msg'
   nios2-linux-ld: drivers/i2c/busses/i2c-ch341.o: in function `ch341_i2c_probe':
   drivers/i2c/busses/i2c-ch341.c:357: undefined reference to `usb_bulk_msg'
   drivers/i2c/busses/i2c-ch341.c:357:(.text+0x778): relocation truncated to fit: R_NIOS2_CALL26 against `usb_bulk_msg'
   pahole: .tmp_vmlinux.btf: No such file or directory
   .btf.vmlinux.bin.o: file not recognized: file format not recognized

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_CH341
   Depends on HAS_IOMEM && USB
   Selected by
   - I2C_CH341 && I2C && HAS_IOMEM


vim +46 drivers/mfd/ch341-core.c

f33ee28d4d85a8 frank zago 2022-06-15  29  
f33ee28d4d85a8 frank zago 2022-06-15  30  static int ch341_usb_probe(struct usb_interface *iface,
f33ee28d4d85a8 frank zago 2022-06-15  31  			   const struct usb_device_id *usb_id)
f33ee28d4d85a8 frank zago 2022-06-15  32  {
f33ee28d4d85a8 frank zago 2022-06-15  33  	struct usb_endpoint_descriptor *bulk_out;
f33ee28d4d85a8 frank zago 2022-06-15  34  	struct usb_endpoint_descriptor *bulk_in;
f33ee28d4d85a8 frank zago 2022-06-15  35  	struct usb_endpoint_descriptor *intr_in;
f33ee28d4d85a8 frank zago 2022-06-15  36  	struct ch341_ddata *ddata;
f33ee28d4d85a8 frank zago 2022-06-15  37  	int ret;
f33ee28d4d85a8 frank zago 2022-06-15  38  
f33ee28d4d85a8 frank zago 2022-06-15  39  	ddata = devm_kzalloc(&iface->dev, sizeof(*ddata), GFP_KERNEL);
f33ee28d4d85a8 frank zago 2022-06-15  40  	if (!ddata)
f33ee28d4d85a8 frank zago 2022-06-15  41  		return -ENOMEM;
f33ee28d4d85a8 frank zago 2022-06-15  42  
f33ee28d4d85a8 frank zago 2022-06-15  43  	ddata->usb_dev = interface_to_usbdev(iface);
f33ee28d4d85a8 frank zago 2022-06-15  44  	mutex_init(&ddata->usb_lock);
f33ee28d4d85a8 frank zago 2022-06-15  45  
f33ee28d4d85a8 frank zago 2022-06-15 @46  	ret = usb_find_common_endpoints(iface->cur_altsetting, &bulk_in,
f33ee28d4d85a8 frank zago 2022-06-15  47  					&bulk_out, &intr_in, NULL);
f33ee28d4d85a8 frank zago 2022-06-15  48  	if (ret) {
f33ee28d4d85a8 frank zago 2022-06-15  49  		dev_err(&iface->dev, "Could not find all endpoints\n");
f33ee28d4d85a8 frank zago 2022-06-15  50  		return -ENODEV;
f33ee28d4d85a8 frank zago 2022-06-15  51  	}
f33ee28d4d85a8 frank zago 2022-06-15  52  
f33ee28d4d85a8 frank zago 2022-06-15  53  	ddata->ep_in = bulk_in->bEndpointAddress;
f33ee28d4d85a8 frank zago 2022-06-15  54  	ddata->ep_out = bulk_out->bEndpointAddress;
f33ee28d4d85a8 frank zago 2022-06-15  55  	ddata->ep_intr = intr_in->bEndpointAddress;
f33ee28d4d85a8 frank zago 2022-06-15  56  	ddata->ep_intr_interval = intr_in->bInterval;
f33ee28d4d85a8 frank zago 2022-06-15  57  
f33ee28d4d85a8 frank zago 2022-06-15  58  	usb_set_intfdata(iface, ddata);
f33ee28d4d85a8 frank zago 2022-06-15  59  
f33ee28d4d85a8 frank zago 2022-06-15  60  	ret = mfd_add_devices(&iface->dev, PLATFORM_DEVID_AUTO, ch341_devs,
f33ee28d4d85a8 frank zago 2022-06-15  61  			      ARRAY_SIZE(ch341_devs), NULL, 0, NULL);
f33ee28d4d85a8 frank zago 2022-06-15  62  	if (ret)
f33ee28d4d85a8 frank zago 2022-06-15  63  		return dev_err_probe(&iface->dev, ret,
f33ee28d4d85a8 frank zago 2022-06-15  64  				     "Failed to register child devices\n");
f33ee28d4d85a8 frank zago 2022-06-15  65  
f33ee28d4d85a8 frank zago 2022-06-15  66  	return 0;
f33ee28d4d85a8 frank zago 2022-06-15  67  }
f33ee28d4d85a8 frank zago 2022-06-15  68  
f33ee28d4d85a8 frank zago 2022-06-15  69  static void ch341_usb_disconnect(struct usb_interface *usb_if)
f33ee28d4d85a8 frank zago 2022-06-15  70  {
f33ee28d4d85a8 frank zago 2022-06-15  71  	mfd_remove_devices(&usb_if->dev);
f33ee28d4d85a8 frank zago 2022-06-15  72  }
f33ee28d4d85a8 frank zago 2022-06-15  73  
f33ee28d4d85a8 frank zago 2022-06-15  74  static const struct usb_device_id ch341_usb_table[] = {
f33ee28d4d85a8 frank zago 2022-06-15  75  	{ USB_DEVICE(0x1a86, 0x5512) },
f33ee28d4d85a8 frank zago 2022-06-15  76  	{ }
f33ee28d4d85a8 frank zago 2022-06-15  77  };
f33ee28d4d85a8 frank zago 2022-06-15  78  MODULE_DEVICE_TABLE(usb, ch341_usb_table);
f33ee28d4d85a8 frank zago 2022-06-15  79  
f33ee28d4d85a8 frank zago 2022-06-15  80  static struct usb_driver ch341_usb_driver = {
f33ee28d4d85a8 frank zago 2022-06-15  81  	.name       = "ch341-mfd",
f33ee28d4d85a8 frank zago 2022-06-15  82  	.id_table   = ch341_usb_table,
f33ee28d4d85a8 frank zago 2022-06-15  83  	.probe      = ch341_usb_probe,
f33ee28d4d85a8 frank zago 2022-06-15  84  	.disconnect = ch341_usb_disconnect,
f33ee28d4d85a8 frank zago 2022-06-15  85  };
f33ee28d4d85a8 frank zago 2022-06-15 @86  module_usb_driver(ch341_usb_driver);
f33ee28d4d85a8 frank zago 2022-06-15  87  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
