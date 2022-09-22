Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B41605E5FD1
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Sep 2022 12:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbiIVKYb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 22 Sep 2022 06:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbiIVKYZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 22 Sep 2022 06:24:25 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89599DB94A;
        Thu, 22 Sep 2022 03:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663842262; x=1695378262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CGzsM7ZIh9Wlo6rJSidN+iAjfrDp9etHXsQ9S5OUSUo=;
  b=JghhZwYZj/BIeAnvAnLHVlbBJ4s0cBaI0p/CdjaXvjEwVXawATrIFl3C
   hYdxZjLzilqNVxcKvuKPeu2UPopeSg5gE4Sr03zae5nk2S1EuPq/oWdQ7
   QOn9A9Asul+mO5tZAzNXrEmcvF/oOc1MMURPSdHIXIqZ11brp7Swo1cXu
   wWKDApJ5k4jbGHAokF890qe/HxnrLIsWmXgmc525tO/YNAqdbonFXMFHV
   T7ylSn+oaoXEZpWq6IZZW2hlVHi+JenqOnnum6pEgAxT5k+ucqBU/IX3H
   9NWgQ3AyPgR+KTFFLHVGXnAshcuSpmijS4/P2NR2WU0elE+9fw6TxTIOG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300244717"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="300244717"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 03:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="688244436"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 22 Sep 2022 03:24:20 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1obJNT-0004b6-29;
        Thu, 22 Sep 2022 10:24:19 +0000
Date:   Thu, 22 Sep 2022 18:23:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Matt Ranostay <matt.ranostay@konsulko.com>, gupt21@gmail.com,
        jic23@kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org,
        Matt Ranostay <matt.ranostay@konsulko.com>
Subject: Re: [PATCH v4 5/5] HID: mcp2221: add ADC/DAC support via iio
 subsystem
Message-ID: <202209221851.IOfsmA0z-lkp@intel.com>
References: <20220921063026.89619-6-matt.ranostay@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921063026.89619-6-matt.ranostay@konsulko.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Matt,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on next-20220921]
[cannot apply to hid/for-next wsa/i2c/for-next linus/master v6.0-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Ranostay/HID-mcp2221-iio-support-and-device-resource-management/20220921-143207
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: hexagon-randconfig-r023-20220921 (https://download.01.org/0day-ci/archive/20220922/202209221851.IOfsmA0z-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9576b88476cb586e6d9f8ef77969f1acd5e4a241
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matt-Ranostay/HID-mcp2221-iio-support-and-device-resource-management/20220921-143207
        git checkout 9576b88476cb586e6d9f8ef77969f1acd5e4a241
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hid/hid-mcp2221.c:879:10: error: no member named 'dac_scale' in 'struct mcp2221'
                                   mcp->dac_scale = tmp + 4;
                                   ~~~  ^
   drivers/hid/hid-mcp2221.c:881:10: error: no member named 'dac_scale' in 'struct mcp2221'
                                   mcp->dac_scale = 5;
                                   ~~~  ^
>> drivers/hid/hid-mcp2221.c:886:10: error: no member named 'adc_scale' in 'struct mcp2221'
                                   mcp->adc_scale = tmp - 1;
                                   ~~~  ^
   drivers/hid/hid-mcp2221.c:888:10: error: no member named 'adc_scale' in 'struct mcp2221'
                                   mcp->adc_scale = 0;
                                   ~~~  ^
   4 errors generated.


vim +879 drivers/hid/hid-mcp2221.c

   720	
   721	/*
   722	 * MCP2221 uses interrupt endpoint for input reports. This function
   723	 * is called by HID layer when it receives i/p report from mcp2221,
   724	 * which is actually a response to the previously sent command.
   725	 *
   726	 * MCP2221A firmware specific return codes are parsed and 0 or
   727	 * appropriate negative error code is returned. Delayed response
   728	 * results in timeout error and stray reponses results in -EIO.
   729	 */
   730	static int mcp2221_raw_event(struct hid_device *hdev,
   731					struct hid_report *report, u8 *data, int size)
   732	{
   733		u8 *buf, tmp;
   734		struct mcp2221 *mcp = hid_get_drvdata(hdev);
   735	
   736		switch (data[0]) {
   737	
   738		case MCP2221_I2C_WR_DATA:
   739		case MCP2221_I2C_WR_NO_STOP:
   740		case MCP2221_I2C_RD_DATA:
   741		case MCP2221_I2C_RD_RPT_START:
   742			switch (data[1]) {
   743			case MCP2221_SUCCESS:
   744				mcp->status = 0;
   745				break;
   746			default:
   747				mcp->status = mcp_get_i2c_eng_state(mcp, data, 2);
   748			}
   749			complete(&mcp->wait_in_report);
   750			break;
   751	
   752		case MCP2221_I2C_PARAM_OR_STATUS:
   753			switch (data[1]) {
   754			case MCP2221_SUCCESS:
   755				if ((mcp->txbuf[3] == MCP2221_I2C_SET_SPEED) &&
   756					(data[3] != MCP2221_I2C_SET_SPEED)) {
   757					mcp->status = -EAGAIN;
   758					break;
   759				}
   760				if (data[20] & MCP2221_I2C_MASK_ADDR_NACK) {
   761					mcp->status = -ENXIO;
   762					break;
   763				}
   764				mcp->status = mcp_get_i2c_eng_state(mcp, data, 8);
   765	#if IS_REACHABLE(CONFIG_IIO)
   766				memcpy(&mcp->adc_values, &data[50], sizeof(mcp->adc_values));
   767	#endif
   768				break;
   769			default:
   770				mcp->status = -EIO;
   771			}
   772			complete(&mcp->wait_in_report);
   773			break;
   774	
   775		case MCP2221_I2C_GET_DATA:
   776			switch (data[1]) {
   777			case MCP2221_SUCCESS:
   778				if (data[2] == MCP2221_I2C_ADDR_NACK) {
   779					mcp->status = -ENXIO;
   780					break;
   781				}
   782				if (!mcp_get_i2c_eng_state(mcp, data, 2)
   783					&& (data[3] == 0)) {
   784					mcp->status = 0;
   785					break;
   786				}
   787				if (data[3] == 127) {
   788					mcp->status = -EIO;
   789					break;
   790				}
   791				if (data[2] == MCP2221_I2C_READ_COMPL) {
   792					buf = mcp->rxbuf;
   793					memcpy(&buf[mcp->rxbuf_idx], &data[4], data[3]);
   794					mcp->rxbuf_idx = mcp->rxbuf_idx + data[3];
   795					mcp->status = 0;
   796					break;
   797				}
   798				mcp->status = -EIO;
   799				break;
   800			default:
   801				mcp->status = -EIO;
   802			}
   803			complete(&mcp->wait_in_report);
   804			break;
   805	
   806		case MCP2221_GPIO_GET:
   807			switch (data[1]) {
   808			case MCP2221_SUCCESS:
   809				if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
   810					(data[mcp->gp_idx + 1] == MCP2221_ALT_F_NOT_GPIOD)) {
   811					mcp->status = -ENOENT;
   812				} else {
   813					mcp->status = !!data[mcp->gp_idx];
   814					mcp->gpio_dir = data[mcp->gp_idx + 1];
   815				}
   816				break;
   817			default:
   818				mcp->status = -EAGAIN;
   819			}
   820			complete(&mcp->wait_in_report);
   821			break;
   822	
   823		case MCP2221_GPIO_SET:
   824			switch (data[1]) {
   825			case MCP2221_SUCCESS:
   826				if ((data[mcp->gp_idx] == MCP2221_ALT_F_NOT_GPIOV) ||
   827					(data[mcp->gp_idx - 1] == MCP2221_ALT_F_NOT_GPIOV)) {
   828					mcp->status = -ENOENT;
   829				} else {
   830					mcp->status = 0;
   831				}
   832				break;
   833			default:
   834				mcp->status = -EAGAIN;
   835			}
   836			complete(&mcp->wait_in_report);
   837			break;
   838	
   839		case MCP2221_SET_SRAM_SETTINGS:
   840			switch (data[1]) {
   841			case MCP2221_SUCCESS:
   842				mcp->status = 0;
   843				break;
   844			default:
   845				mcp->status = -EAGAIN;
   846			}
   847			complete(&mcp->wait_in_report);
   848			break;
   849	
   850		case MCP2221_GET_SRAM_SETTINGS:
   851			switch (data[1]) {
   852			case MCP2221_SUCCESS:
   853				memcpy(&mcp->mode, &data[22], 4);
   854	#if IS_REACHABLE(CONFIG_IIO)
   855				mcp->dac_value = data[6] & GENMASK(4, 0);
   856	#endif
   857				mcp->status = 0;
   858				break;
   859			default:
   860				mcp->status = -EAGAIN;
   861			}
   862			complete(&mcp->wait_in_report);
   863			break;
   864	
   865		case MCP2221_READ_FLASH_DATA:
   866			switch (data[1]) {
   867			case MCP2221_SUCCESS:
   868				mcp->status = 0;
   869	
   870				/* Only handles CHIP SETTINGS subpage currently */
   871				if (mcp->txbuf[1] != 0) {
   872					mcp->status = -EIO;
   873					break;
   874				}
   875	
   876				/* DAC scale value */
   877				tmp = (data[6] >> 6) & 0x3;
   878				if ((data[6] & BIT(5)) && tmp)
 > 879					mcp->dac_scale = tmp + 4;
   880				else
   881					mcp->dac_scale = 5;
   882	
   883				/* ADC scale value */
   884				tmp = (data[7] >> 3) & 0x3;
   885				if ((data[7] & BIT(2)) && tmp)
 > 886					mcp->adc_scale = tmp - 1;
   887				else
   888					mcp->adc_scale = 0;
   889	
   890				break;
   891			default:
   892				mcp->status = -EAGAIN;
   893			}
   894			complete(&mcp->wait_in_report);
   895			break;
   896	
   897		default:
   898			mcp->status = -EIO;
   899			complete(&mcp->wait_in_report);
   900		}
   901	
   902		return 1;
   903	}
   904	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
