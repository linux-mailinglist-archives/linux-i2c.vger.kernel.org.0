Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A062A4D8E1D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Mar 2022 21:28:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235899AbiCNU3u (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Mar 2022 16:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235159AbiCNU3t (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Mar 2022 16:29:49 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8E7E094
        for <linux-i2c@vger.kernel.org>; Mon, 14 Mar 2022 13:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647289717; x=1678825717;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4xWLVh6Y0J/c6z9+70Wssy2yirKlCGy2XXFFDPfN2/c=;
  b=R8VDcVewHkMBGZcpEB2SKQ6PGEdcV+6I5kO5HKr/4MmCpzSwZHTYs3vX
   BC3BdBPmNfEBm+jIWZDtGZ5ohM3pipQ+Nmm2no/5WqPJKe9KDYo/+bngn
   kTMyDdvzxvClSCW/i3c2EYl8lJITmxr9ju9L9qi89cS0cuIzQiiiY+C/t
   FYfk3xT/yv58YoYfOPhpdIKS05gHUAh4I/3/WYFqkpuO8+sGvz52GdtaA
   k2r/6hPlDTifu8HMNsPTw/hJMATkKHdGV/hfm7orwGwCoU/e59mAf3lNr
   WcUs9x33L2kDf4t/ECaj5nIa/zPF9ZaP9frrLi4GgrOV4MCwtQodr6FkX
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="280904819"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="280904819"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 13:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="515593471"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 14 Mar 2022 13:28:35 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1nTrIw-000ACw-M9; Mon, 14 Mar 2022 20:28:34 +0000
Date:   Tue, 15 Mar 2022 04:28:24 +0800
From:   kernel test robot <lkp@intel.com>
To:     Adam Honse <calcprogrammer1@gmail.com>, jdelvare@suse.de,
        linux-i2c@vger.kernel.org, jdelvare@suse.com
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c: New driver for Nuvoton SMBus adapters
Message-ID: <202203150442.qhRCXPnf-lkp@intel.com>
References: <20220313224020.9005-1-calcprogrammer1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220313224020.9005-1-calcprogrammer1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-8.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220315/202203150442.qhRCXPnf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/040a1be0d30ce2c611e30eb923d6f1b0afc44e7d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Adam-Honse/i2c-New-driver-for-Nuvoton-SMBus-adapters/20220314-064247
        git checkout 040a1be0d30ce2c611e30eb923d6f1b0afc44e7d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/i2c/busses/ drivers/mfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-nct6775.c:219:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case I2C_SMBUS_BYTE:
           ^
   drivers/i2c/busses/i2c-nct6775.c:219:2: note: insert '__attribute__((fallthrough));' to silence this warning
           case I2C_SMBUS_BYTE:
           ^
           __attribute__((fallthrough)); 
   drivers/i2c/busses/i2c-nct6775.c:219:2: note: insert 'break;' to avoid fall-through
           case I2C_SMBUS_BYTE:
           ^
           break; 
>> drivers/i2c/busses/i2c-nct6775.c:90:27: warning: unused variable 'nct6775_device_names' [-Wunused-const-variable]
   static const char * const nct6775_device_names[] = {
                             ^
   drivers/i2c/busses/i2c-nct6775.c:133:1: warning: unused function 'superio_outb' [-Wunused-function]
   superio_outb(int ioreg, int reg, int val)
   ^
   3 warnings generated.


vim +219 drivers/i2c/busses/i2c-nct6775.c

    88	
    89	/* used to set data->name = nct6775_device_names[data->sio_kind] */
  > 90	static const char * const nct6775_device_names[] = {
    91		"nct6106",
    92		"nct6775",
    93		"nct6776",
    94		"nct6779",
    95		"nct6791",
    96		"nct6792",
    97		"nct6793",
    98		"nct6795",
    99		"nct6796",
   100		"nct6798",
   101	};
   102	
   103	static const char * const nct6775_sio_names[] __initconst = {
   104		"NCT6106D",
   105		"NCT6775F",
   106		"NCT6776D/F",
   107		"NCT6779D",
   108		"NCT6791D",
   109		"NCT6792D",
   110		"NCT6793D",
   111		"NCT6795D",
   112		"NCT6796D",
   113		"NCT6798D",
   114	};
   115	
   116	#define SIO_REG_LDSEL		0x07	/* Logical device select */
   117	#define SIO_REG_DEVID		0x20	/* Device ID (2 bytes) */
   118	#define SIO_REG_SMBA		0x62	/* SMBus base address register */
   119	
   120	#define SIO_NCT6106_ID		0xc450
   121	#define SIO_NCT6775_ID		0xb470
   122	#define SIO_NCT6776_ID		0xc330
   123	#define SIO_NCT6779_ID		0xc560
   124	#define SIO_NCT6791_ID		0xc800
   125	#define SIO_NCT6792_ID		0xc910
   126	#define SIO_NCT6793_ID		0xd120
   127	#define SIO_NCT6795_ID		0xd350
   128	#define SIO_NCT6796_ID		0xd420
   129	#define SIO_NCT6798_ID		0xd428
   130	#define SIO_ID_MASK			0xFFF0
   131	
   132	static inline void
   133	superio_outb(int ioreg, int reg, int val)
   134	{
   135		outb(reg, ioreg);
   136		outb(val, ioreg + 1);
   137	}
   138	
   139	static inline int
   140	superio_inb(int ioreg, int reg)
   141	{
   142		outb(reg, ioreg);
   143		return inb(ioreg + 1);
   144	}
   145	
   146	static inline void
   147	superio_select(int ioreg, int ld)
   148	{
   149		outb(SIO_REG_LDSEL, ioreg);
   150		outb(ld, ioreg + 1);
   151	}
   152	
   153	static inline int
   154	superio_enter(int ioreg)
   155	{
   156		/*
   157		 * Try to reserve <ioreg> and <ioreg + 1> for exclusive access.
   158		 */
   159		if (!request_muxed_region(ioreg, 2, DRVNAME))
   160			return -EBUSY;
   161	
   162		outb(0x87, ioreg);
   163		outb(0x87, ioreg);
   164	
   165		return 0;
   166	}
   167	
   168	static inline void
   169	superio_exit(int ioreg)
   170	{
   171		outb(0xaa, ioreg);
   172		outb(0x02, ioreg);
   173		outb(0x02, ioreg + 1);
   174		release_region(ioreg, 2);
   175	}
   176	
   177	/*
   178	 * ISA constants
   179	 */
   180	
   181	#define IOREGION_ALIGNMENT	(~7)
   182	#define IOREGION_LENGTH		2
   183	#define ADDR_REG_OFFSET		0
   184	#define DATA_REG_OFFSET		1
   185	
   186	#define NCT6775_REG_BANK	0x4E
   187	#define NCT6775_REG_CONFIG	0x40
   188	
   189	static struct i2c_adapter *nct6775_adapter;
   190	
   191	struct i2c_nct6775_adapdata {
   192		unsigned short smba;
   193	};
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
   218			tmp_data.byte = data->byte;
 > 219		case I2C_SMBUS_BYTE:
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
