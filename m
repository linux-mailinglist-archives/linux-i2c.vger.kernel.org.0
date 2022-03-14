Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739E54D790F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 02:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbiCNBTI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 13 Mar 2022 21:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiCNBTH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 13 Mar 2022 21:19:07 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123E1186F9
        for <linux-i2c@vger.kernel.org>; Sun, 13 Mar 2022 18:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647220679; x=1678756679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i/XLUQUAEKBRwQ0XGNgDcvlSlECvEVlqgIp1t3T6Pvk=;
  b=HiyAs8psEAKhzPQAbL9jur925DTx2PObjX+NXbhMwPw/gU4+D5O4yHDZ
   BkdIWUDyF28pxyFQL/MNldFVLOphTI3y3H5ZGIhMJiQlgEWOStqSpJA6f
   HtE2HJO95OJX3Rsk/ed6NS8OhkeMTsvTxUOhj2x3QAWdDXj+02b9yCEMg
   nhrMhOUtA4sCLQvyVqDo73n/YqOKTnPgLf+dlKCnKtBpew57TWRTS/fTs
   JpAnTEo3ZrRDNx2dap6KzL8rYlKapMqLhbcYJR6YdLLjwPZegMFkkCS0H
   3lJ2ikTALknV2ToDFHCSA2+n5YWzeCMTXFtVI2n8qKWXBgFDu27oc9C1v
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="256099308"
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="256099308"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2022 18:17:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,179,1643702400"; 
   d="scan'208";a="515221518"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Mar 2022 18:17:49 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTZLI-0009SC-Fw; Mon, 14 Mar 2022 01:17:48 +0000
Date:   Mon, 14 Mar 2022 09:17:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Adam Honse <calcprogrammer1@gmail.com>, jdelvare@suse.de,
        linux-i2c@vger.kernel.org, jdelvare@suse.com
Cc:     kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c: New driver for Nuvoton SMBus adapters
Message-ID: <202203140908.OiQgTMB7-lkp@intel.com>
References: <20220313224020.9005-1-calcprogrammer1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313224020.9005-1-calcprogrammer1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Adam,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on v5.17-rc8 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Adam-Honse/i2c-New-driver-for-Nuvoton-SMBus-adapters/20220314-064247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: powerpc64-randconfig-r035-20220314 (https://download.01.org/0day-ci/archive/20220314/202203140908.OiQgTMB7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/040a1be0d30ce2c611e30eb923d6f1b0afc44e7d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Adam-Honse/i2c-New-driver-for-Nuvoton-SMBus-adapters/20220314-064247
        git checkout 040a1be0d30ce2c611e30eb923d6f1b0afc44e7d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-nct6775.c: In function 'nct6775_access':
>> drivers/i2c/busses/i2c-nct6775.c:218:31: warning: this statement may fall through [-Wimplicit-fallthrough=]
     218 |                 tmp_data.byte = data->byte;
         |                 ~~~~~~~~~~~~~~^~~~~~~~~~~~
   drivers/i2c/busses/i2c-nct6775.c:219:9: note: here
     219 |         case I2C_SMBUS_BYTE:
         |         ^~~~
   At top level:
   drivers/i2c/busses/i2c-nct6775.c:90:27: warning: 'nct6775_device_names' defined but not used [-Wunused-const-variable=]
      90 | static const char * const nct6775_device_names[] = {
         |                           ^~~~~~~~~~~~~~~~~~~~


vim +218 drivers/i2c/busses/i2c-nct6775.c

   194	
   195	/* Return negative errno on error. */
   196	static s32 nct6775_access(struct i2c_adapter *adap, u16 addr,
   197			 unsigned short flags, char read_write,
   198			 u8 command, int size, union i2c_smbus_data *data)
   199	{
   200		struct i2c_nct6775_adapdata *adapdata = i2c_get_adapdata(adap);
   201		unsigned short nuvoton_nct6793d_smba = adapdata->smba;
   202		int i, len, cnt;
   203		union i2c_smbus_data tmp_data;
   204		int timeout = 0;
   205	
   206		tmp_data.word = 0;
   207		cnt = 0;
   208		len = 0;
   209	
   210		outb_p(NCT6793D_SOFT_RESET, SMBHSTCTL);
   211	
   212		switch (size) {
   213		case I2C_SMBUS_QUICK:
   214			outb_p((addr << 1) | read_write,
   215					SMBHSTADD);
   216			break;
   217		case I2C_SMBUS_BYTE_DATA:
 > 218			tmp_data.byte = data->byte;
   219		case I2C_SMBUS_BYTE:
   220			outb_p((addr << 1) | read_write,
   221					SMBHSTADD);
   222			outb_p(command, SMBHSTIDX);
   223			if (read_write == I2C_SMBUS_WRITE) {
   224				outb_p(tmp_data.byte, SMBHSTDAT);
   225				outb_p(NCT6793D_WRITE_BYTE, SMBHSTCMD);
   226			} else {
   227				outb_p(NCT6793D_READ_BYTE, SMBHSTCMD);
   228			}
   229			break;
   230		case I2C_SMBUS_WORD_DATA:
   231			outb_p((addr << 1) | read_write,
   232					SMBHSTADD);
   233			outb_p(command, SMBHSTIDX);
   234			if (read_write == I2C_SMBUS_WRITE) {
   235				outb_p(data->word & 0xff, SMBHSTDAT);
   236				outb_p((data->word & 0xff00) >> 8, SMBHSTDAT);
   237				outb_p(NCT6793D_WRITE_WORD, SMBHSTCMD);
   238			} else {
   239				outb_p(NCT6793D_READ_WORD, SMBHSTCMD);
   240			}
   241			break;
   242		case I2C_SMBUS_BLOCK_DATA:
   243			outb_p((addr << 1) | read_write,
   244					SMBHSTADD);
   245			outb_p(command, SMBHSTIDX);
   246			if (read_write == I2C_SMBUS_WRITE) {
   247				len = data->block[0];
   248				if (len == 0 || len > I2C_SMBUS_BLOCK_MAX)
   249					return -EINVAL;
   250				outb_p(len, SMBBLKSZ);
   251	
   252				cnt = 1;
   253				if (len >= 4) {
   254					for (i = cnt; i <= 4; i++)
   255						outb_p(data->block[i], SMBHSTDAT);
   256	
   257					len -= 4;
   258					cnt += 4;
   259				} else {
   260					for (i = cnt; i <= len; i++)
   261						outb_p(data->block[i], SMBHSTDAT);
   262	
   263					len = 0;
   264				}
   265	
   266				outb_p(NCT6793D_WRITE_BLOCK, SMBHSTCMD);
   267			} else {
   268				return -EOPNOTSUPP;
   269			}
   270			break;
   271		default:
   272			dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
   273			return -EOPNOTSUPP;
   274		}
   275	
   276		outb_p(NCT6793D_MANUAL_START, SMBHSTCTL);
   277	
   278		while ((size == I2C_SMBUS_BLOCK_DATA) && (len > 0)) {
   279			if (read_write == I2C_SMBUS_WRITE) {
   280				timeout = 0;
   281				while ((inb_p(SMBHSTSTS) & NCT6793D_FIFO_EMPTY) == 0) {
   282					if (timeout > MAX_RETRIES)
   283						return -ETIMEDOUT;
   284	
   285					usleep_range(250, 500);
   286					timeout++;
   287				}
   288	
   289				//Load more bytes into FIFO
   290				if (len >= 4) {
   291					for (i = cnt; i <= (cnt + 4); i++)
   292						outb_p(data->block[i], SMBHSTDAT);
   293	
   294					len -= 4;
   295					cnt += 4;
   296				} else {
   297					for (i = cnt; i <= (cnt + len); i++)
   298						outb_p(data->block[i], SMBHSTDAT);
   299	
   300					len = 0;
   301				}
   302			} else {
   303				return -EOPNOTSUPP;
   304			}
   305	
   306		}
   307	
   308		//wait for manual mode to complete
   309		timeout = 0;
   310		while ((inb_p(SMBHSTSTS) & NCT6793D_MANUAL_ACTIVE) != 0) {
   311			if (timeout > MAX_RETRIES)
   312				return -ETIMEDOUT;
   313	
   314			usleep_range(250, 500);
   315			timeout++;
   316		}
   317	
   318		if ((inb_p(SMBHSTERR) & NCT6793D_NO_ACK) != 0)
   319			return -ENXIO;
   320	
   321		else if ((read_write == I2C_SMBUS_WRITE) || (size == I2C_SMBUS_QUICK))
   322			return 0;
   323	
   324		switch (size) {
   325		case I2C_SMBUS_QUICK:
   326		case I2C_SMBUS_BYTE_DATA:
   327			data->byte = inb_p(SMBHSTDAT);
   328			break;
   329		case I2C_SMBUS_WORD_DATA:
   330			data->word = inb_p(SMBHSTDAT) + (inb_p(SMBHSTDAT) << 8);
   331			break;
   332		}
   333		return 0;
   334	}
   335	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
