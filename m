Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB76479DFD1
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 08:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232571AbjIMGQD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 02:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235703AbjIMGQC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 02:16:02 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F3241735;
        Tue, 12 Sep 2023 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694585758; x=1726121758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q6pqxOR3Mh13cks40zVa2ZQwEyjZPUb2HTNygArJF60=;
  b=AajOBAXt6sfg4alcl9nv4xADScCOk4N+aZtgkRs3nZBrnfBqUkVPvltT
   SPK+uhWGQBb6X6a2oo+Se6IBdEpGnm1j4nMWOXy1cziHzRrLESAV7HEaN
   Hcm4CtrGxfMEGizBSDyr6zYpNUxXFTqlSG4FqxIvxJ5TNth/hrfPKPztD
   5YcgwRWK2IEw4foBzrD0k5xF1LdfJn6KZiUTswfb3yNIrkBHFpi8TsANP
   uODQbAcEnOWy+0HHOrsL+Jm1mjZ1/K8VlicUKJuOQYkxyI86O4bo3Qavx
   /L6fcNnd1cBUY6/u4Qhnmj3rBaGXzuU/mhj9KilHIfltqLihLhrBCeH0h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="368842293"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="368842293"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 23:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="859117332"
X-IronPort-AV: E=Sophos;i="6.02,142,1688454000"; 
   d="scan'208";a="859117332"
Received: from lkp-server02.sh.intel.com (HELO cf13c67269a2) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 23:15:52 -0700
Received: from kbuild by cf13c67269a2 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qgJ9b-00007n-08;
        Wed, 13 Sep 2023 06:15:45 +0000
Date:   Wed, 13 Sep 2023 14:12:29 +0800
From:   kernel test robot <lkp@intel.com>
To:     Wentong Wu <wentong.wu@intel.com>, gregkh@linuxfoundation.org,
        arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com
Cc:     oe-kbuild-all@lists.linux.dev, zhifeng.wang@intel.com,
        Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v16 1/4] usb: Add support for Intel LJCA device
Message-ID: <202309131427.AUBwVNBm-lkp@intel.com>
References: <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694569212-10080-2-git-send-email-wentong.wu@intel.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wentong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on broonie-spi/for-next linus/master v6.6-rc1 next-20230912]
[cannot apply to usb/usb-testing usb/usb-next usb/usb-linus]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/usb-Add-support-for-Intel-LJCA-device/20230913-094239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/1694569212-10080-2-git-send-email-wentong.wu%40intel.com
patch subject: [PATCH v16 1/4] usb: Add support for Intel LJCA device
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230913/202309131427.AUBwVNBm-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309131427.AUBwVNBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309131427.AUBwVNBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/misc/usb-ljca.c: In function 'ljca_match_device_ids':
   drivers/usb/misc/usb-ljca.c:389:27: error: implicit declaration of function 'acpi_device_uid'; did you mean 'dmi_device_id'? [-Werror=implicit-function-declaration]
     389 |         const char *uid = acpi_device_uid(adev);
         |                           ^~~~~~~~~~~~~~~
         |                           dmi_device_id
>> drivers/usb/misc/usb-ljca.c:389:27: warning: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/usb/misc/usb-ljca.c:391:13: error: implicit declaration of function 'acpi_match_device_ids'; did you mean 'ljca_match_device_ids'? [-Werror=implicit-function-declaration]
     391 |         if (acpi_match_device_ids(adev, wd->ids))
         |             ^~~~~~~~~~~~~~~~~~~~~
         |             ljca_match_device_ids
   drivers/usb/misc/usb-ljca.c: In function 'ljca_auxdev_acpi_bind':
   drivers/usb/misc/usb-ljca.c:429:16: error: implicit declaration of function 'acpi_find_child_device'; did you mean 'acpi_match_device'? [-Werror=implicit-function-declaration]
     429 |         adev = acpi_find_child_device(parent, adr, false);
         |                ^~~~~~~~~~~~~~~~~~~~~~
         |                acpi_match_device
>> drivers/usb/misc/usb-ljca.c:429:14: warning: assignment to 'struct acpi_device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     429 |         adev = acpi_find_child_device(parent, adr, false);
         |              ^
   drivers/usb/misc/usb-ljca.c:458:9: error: implicit declaration of function 'acpi_dev_for_each_child'; did you mean 'device_for_each_child'? [-Werror=implicit-function-declaration]
     458 |         acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         device_for_each_child
   cc1: some warnings being treated as errors


vim +389 drivers/usb/misc/usb-ljca.c

   385	
   386	static int ljca_match_device_ids(struct acpi_device *adev, void *data)
   387	{
   388		struct ljca_match_ids_walk_data *wd = data;
 > 389		const char *uid = acpi_device_uid(adev);
   390	
   391		if (acpi_match_device_ids(adev, wd->ids))
   392			return 0;
   393	
   394		if (!wd->uid)
   395			goto match;
   396	
   397		if (!uid)
   398			uid = "0";
   399		else
   400			uid = strchr(uid, wd->uid[0]);
   401	
   402		if (!uid || strcmp(uid, wd->uid))
   403			return 0;
   404	
   405	match:
   406		wd->adev = adev;
   407	
   408		return 1;
   409	}
   410	
   411	/* bind auxiliary device to acpi device */
   412	static void ljca_auxdev_acpi_bind(struct ljca_adapter *adap,
   413					  struct auxiliary_device *auxdev,
   414					  u64 adr, u8 id)
   415	{
   416		struct ljca_match_ids_walk_data wd = { 0 };
   417		struct acpi_device *parent, *adev;
   418		struct device *dev = adap->dev;
   419		char uid[4];
   420	
   421		parent = ACPI_COMPANION(dev);
   422		if (!parent)
   423			return;
   424	
   425		/*
   426		 * get auxdev ACPI handle from the ACPI device directly
   427		 * under the parent that matches _ADR.
   428		 */
 > 429		adev = acpi_find_child_device(parent, adr, false);
   430		if (adev) {
   431			ACPI_COMPANION_SET(&auxdev->dev, adev);
   432			return;
   433		}
   434	
   435		/*
   436		 * _ADR is a grey area in the ACPI specification, some
   437		 * platforms use _HID to distinguish children devices.
   438		 */
   439		switch (adr) {
   440		case LJCA_GPIO_ACPI_ADR:
   441			wd.ids = ljca_gpio_hids;
   442			break;
   443		case LJCA_I2C1_ACPI_ADR:
   444		case LJCA_I2C2_ACPI_ADR:
   445			snprintf(uid, sizeof(uid), "%d", id);
   446			wd.uid = uid;
   447			wd.ids = ljca_i2c_hids;
   448			break;
   449		case LJCA_SPI1_ACPI_ADR:
   450		case LJCA_SPI2_ACPI_ADR:
   451			wd.ids = ljca_spi_hids;
   452			break;
   453		default:
   454			dev_warn(dev, "unsupported _ADR\n");
   455			return;
   456		}
   457	
   458		acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
   459		if (wd.adev) {
   460			ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
   461			return;
   462		}
   463	
   464		parent = ACPI_COMPANION(dev->parent->parent);
   465		if (!parent)
   466			return;
   467	
   468		acpi_dev_for_each_child(parent, ljca_match_device_ids, &wd);
   469		if (wd.adev)
   470			ACPI_COMPANION_SET(&auxdev->dev, wd.adev);
   471	}
   472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
