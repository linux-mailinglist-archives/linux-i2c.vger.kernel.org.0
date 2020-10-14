Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7959628DA97
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Oct 2020 09:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725984AbgJNHkw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Oct 2020 03:40:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:55491 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725970AbgJNHkw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 14 Oct 2020 03:40:52 -0400
IronPort-SDR: fSGt/wB75aOuobnwbbesUV918oHAAz07Tbzbiu5ALydcFmWUek+fQykZRsLkeEte80mf38yezH
 l0hJVSnn8QFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="250753573"
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="gz'50?scan'50,208,50";a="250753573"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2020 00:40:51 -0700
IronPort-SDR: URFGnFrCGZqPjDE+yUG7dz17PCf9l3EmNz67aA14ljBklIGFlThNCY2R0xIjn+5Lj+p8njNhYf
 ZHfLml5Wr6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,374,1596524400"; 
   d="gz'50?scan'50,208,50";a="420764911"
Received: from lkp-server01.sh.intel.com (HELO 77f7a688d8fd) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2020 00:40:48 -0700
Received: from kbuild by 77f7a688d8fd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kSbOx-00005d-FA; Wed, 14 Oct 2020 07:40:47 +0000
Date:   Wed, 14 Oct 2020 15:39:51 +0800
From:   kernel test robot <lkp@intel.com>
To:     Michael Wu <michael.wu@vatics.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        Morgan Chang <morgan.chang@vatics.com>,
        Dean Hsiao <dean.hsiao@vatics.com>,
        Paul Chen <paul.chen@vatics.com>,
        Michael Wu <michael.wu@vatics.com>
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Message-ID: <202010141551.Y4x2qiN1-lkp@intel.com>
References: <20201014052532.3298-1-michael.wu@vatics.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20201014052532.3298-1-michael.wu@vatics.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Michael,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on v5.9 next-20201013]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Michael-Wu/i2c-designware-fix-slave-omitted-IC_INTR_STOP_DET/20201014-132759
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: riscv-randconfig-r036-20201014 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project e7fe3c6dfede8d5781bd000741c3dea7088307a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/6bb28b0fda0a3f133918077bbfb1c6fe4809bf30
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Michael-Wu/i2c-designware-fix-slave-omitted-IC_INTR_STOP_DET/20201014-132759
        git checkout 6bb28b0fda0a3f133918077bbfb1c6fe4809bf30
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=riscv 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:564:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inw(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:55:76: note: expanded from macro 'inw'
   #define inw(c)          ({ u16 __v; __io_pbr(); __v = readw_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           ~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:88:76: note: expanded from macro 'readw_cpu'
   #define readw_cpu(c)            ({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:36:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:572:9: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return inl(addr);
                  ^~~~~~~~~
   arch/riscv/include/asm/io.h:56:76: note: expanded from macro 'inl'
   #define inl(c)          ({ u32 __v; __io_pbr(); __v = readl_cpu((void*)(PCI_IOBASE + (c))); __io_par(__v); __v; })
                                                                           ~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:89:76: note: expanded from macro 'readl_cpu'
   #define readl_cpu(c)            ({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
                                                                                        ^
   include/uapi/linux/byteorder/little_endian.h:34:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:580:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outb(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:58:68: note: expanded from macro 'outb'
   #define outb(v,c)       ({ __io_pbw(); writeb_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:91:52: note: expanded from macro 'writeb_cpu'
   #define writeb_cpu(v, c)        ((void)__raw_writeb((v), (c)))
                                                             ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:588:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outw(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:59:68: note: expanded from macro 'outw'
   #define outw(v,c)       ({ __io_pbw(); writew_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:92:76: note: expanded from macro 'writew_cpu'
   #define writew_cpu(v, c)        ((void)__raw_writew((__force u16)cpu_to_le16(v), (c)))
                                                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:596:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outl(value, addr);
           ^~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:60:68: note: expanded from macro 'outl'
   #define outl(v,c)       ({ __io_pbw(); writel_cpu((v),(void*)(PCI_IOBASE + (c))); __io_paw(); })
                                                                 ~~~~~~~~~~ ^
   arch/riscv/include/asm/mmio.h:93:76: note: expanded from macro 'writel_cpu'
   #define writel_cpu(v, c)        ((void)__raw_writel((__force u32)cpu_to_le32(v), (c)))
                                                                                     ^
   In file included from drivers/i2c/busses/i2c-designware-slave.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:10:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:13:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1017:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-designware-slave.c:181:42: error: expected ';' after expression
                           dev->status = STATUS_WRITE_IN_PROGRESS
                                                                 ^
                                                                 ;
>> drivers/i2c/busses/i2c-designware-slave.c:195:22: error: use of undeclared identifier 'STATUS_IDEL'
                   if (dev->status != STATUS_IDEL) {
                                      ^
   7 warnings and 2 errors generated.

vim +181 drivers/i2c/busses/i2c-designware-slave.c

   151	
   152	/*
   153	 * Interrupt service routine. This gets called whenever an I2C slave interrupt
   154	 * occurs.
   155	 */
   156	
   157	static int i2c_dw_irq_handler_slave(struct dw_i2c_dev *dev)
   158	{
   159		u32 raw_stat, stat, enabled, tmp;
   160		u8 val = 0, slave_activity;
   161	
   162		regmap_read(dev->map, DW_IC_ENABLE, &enabled);
   163		regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_stat);
   164		regmap_read(dev->map, DW_IC_STATUS, &tmp);
   165		slave_activity = ((tmp & DW_IC_STATUS_SLAVE_ACTIVITY) >> 6);
   166	
   167		if (!enabled || !(raw_stat & ~DW_IC_INTR_ACTIVITY) || !dev->slave)
   168			return 0;
   169	
   170		stat = i2c_dw_read_clear_intrbits_slave(dev);
   171		dev_dbg(dev->dev,
   172			"%#x STATUS SLAVE_ACTIVITY=%#x : RAW_INTR_STAT=%#x : INTR_STAT=%#x\n",
   173			enabled, slave_activity, raw_stat, stat);
   174	
   175		if (stat & DW_IC_INTR_RX_FULL) {
   176			if (dev->status != STATUS_WRITE_IN_PROGRESS) {
   177				if (dev->status != STATUS_IDLE)
   178					i2c_slave_event(dev->slave, I2C_SLAVE_STOP,
   179							&val);
   180	
 > 181				dev->status = STATUS_WRITE_IN_PROGRESS
   182				i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_REQUESTED,
   183						&val);
   184			}
   185	
   186			regmap_read(dev->map, DW_IC_DATA_CMD, &tmp);
   187			val = tmp;
   188	
   189			if (!i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED,
   190					     &val))
   191				dev_vdbg(dev->dev, "Byte %X acked!", val);
   192		}
   193	
   194		if (stat & DW_IC_INTR_RD_REQ) {
 > 195			if (dev->status != STATUS_IDEL) {
   196				dev->status = STATUS_IDLE;
   197				i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   198			}
   199	
   200			if (slave_activity) {
   201				regmap_read(dev->map, DW_IC_CLR_RD_REQ, &tmp);
   202				regmap_read(dev->map, DW_IC_CLR_RX_UNDER, &tmp);
   203	
   204				dev->status = STATUS_READ_IN_PROGRESS;
   205				i2c_slave_event(dev->slave, I2C_SLAVE_READ_REQUESTED,
   206						&val);
   207				regmap_write(dev->map, DW_IC_DATA_CMD, val);
   208			}
   209		}
   210	
   211		if (stat & DW_IC_INTR_RX_DONE) {
   212			i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &val);
   213			regmap_read(dev->map, DW_IC_CLR_RX_DONE, &tmp);
   214	
   215			dev->status = STATUS_IDLE;
   216			i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   217		}
   218	
   219		if (stat & DW_IC_INTR_STOP_DET) {
   220			if (dev->status != STATUS_IDLE) {
   221				dev->status = STATUS_IDLE;
   222	
   223				i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &val);
   224			}
   225		}
   226	
   227		return 1;
   228	}
   229	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--LQksG6bCIzRHxTLp
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICDukhl8AAy5jb25maWcAjDzLdts4svv+Cp30Zu5iEj/Secw9XoAkKKFFEjRASnY2PIrM
JLptWz6Sku78/a0C+ADIoia9SJtVBaBQKNQLgH7/7fcZ+37aP21Ou+3m8fHn7Gv9XB82p/ph
9mX3WP/vLJKzTBYzHoniNRAnu+fv/7w57I7bH7M/Xn98ffHvw/bDbFkfnuvHWbh//rL7+h2a
7/bPv/3+WyizWMyrMKxWXGkhs6rgd8XNq+3j5vnr7Ed9OALd7PLq9cXri9m/vu5O/3nzBv59
2h0O+8Obx8cfT9XLYf9/9fY0q99/qa+37x6+1A/1h4c/3n+4/PxwcXHx/u3l9vqh3ry/+PDh
+uL95u3/vGpHnffD3ly0wCQaw4BO6CpMWDa/+ekQAjBJoh5kKLrml1cwvNvHgumK6bSay0I6
jXxEJcsiLwsSL7JEZLxHCXVbraVa9pBioTgDxrJYwj9VwTQiQdC/z+Zm2R5nx/r0/aUXvchE
UfFsVTEFcxKpKG6ur4C8HV2muUg4LIsuZrvj7Hl/wh46IciQJe2EX72iwBUr3ekGpQDJaZYU
Dn3EY1YmhWGGAC+kLjKW8ptX/3reP9ewgh1/+l6vRB66rHW4XGpxV6W3JS85SbBmRbiopvGl
5okISBQrQd0JgSzYioMooVtDAeyBJJJ2DWDBZsfvn48/j6f6qV+DOc+4EqFZT72Q615aLiYV
c8UKFDSJFtmfPJxGhwuR+5oTyZSJzIdpkVJE1UJwhbO6H3eeaoGUk4jROAuWRaBRTc9eU50z
pTndnemKB+U81oD8fVY/P8z2XwYiJeUGKiSaUVXfr1mkEDR1qWWpQm6VbzSsoeArnhW6XcVi
9wSGiVrIQoTLSmYcFtHpKpPV4hPupNQsTqdDAMxhDBmJkNAk20oA024bC43LJCHV0qAptRTz
RaW4Bg5T2JauAEezcTaQ4jzNC+g140SnLXolkzIrmLp3GW2QZ5qFElq1Mg3z8k2xOf41OwE7
sw2wdjxtTsfZZrvdf38+7Z6/DqQMDSoWmj6EMcvdyCuhigEaV5OUV6Aj4EeGXGskL0gitKK6
YIWmJqNFv9Dw0dmsSGgWJDxyRf0Lk+ysPvAvtEzaDW+EpMJypgmtA4FWgOsZgY+K34FyOVqo
PQrTZgDCaZqmje4TqBGojDgFLxQLCZ5AiknS7wQHk3EOXoHPwyARuvBxMcvAKd68ezsGVgln
8c3lOx+jC7sRXK0wg8gwQMkS6zhguzJuNA3c1fOl3xnJpf3DMZvLTtFl6LIglgvoFbYf6UjR
NcZg/kVc3FxduHDUhZTdOfjLq34ziaxYgj+N+aCPy+uhKdPhAoRsDFqrUXr7rX74/lgfZl/q
zen7oT4acDNjAjuISmDwy6sPTrAyV7LMtTvrlKfhnJixJbVM9R3ETKjKx/SxSKyrAMz4WkTF
gugRtj3ZZzNSLiI9AqooZd4YFhzD9vjEFWkOYDk0943BsHnEVyKkY4qGAjoZ2psBt1zFBGNB
Hk+3Me7R2fES7WSDYoU3TwynwNuC4aO5XPBwmUtYXvQahVSU/bf6hOGdGcPtHuIeWKyIg60P
WcEjarV4wpxwIkiWKDbjhZWzeOabpdCbddNOeKiiav7JjWoAEADgyoMkn/wVBtDdJ3LShlhO
o95OoT7pgpphICV6ucY69LINK5mDHxafeBVLZVZaqpRlISXkIbWGP5wlhviySIbfYPtDnhcm
nUKL5kg5j/uPoYcwgRLothMk6TkvUjCNVR/Ieis8Asc2zvIiAROG28CDDAfQgrkJgqPCAYNw
EKMdZ4QSUsTBJ+xtN75c8QYcpvlduHD647n0JiHmGUtiR90Mmy7AhH6xZ4eYkMQ8hKxKJdwM
kUUrAew3MnJsD5jEgCklXEkvkeQ+1WNI5Qm4gxrR4CYqxMpf4fGqwHg8ilybaISEmld1sW27
HuHlxdvWPzRpe14fvuwPT5vnbT3jP+pniFkYuIgQoxYIHvtQxO+xk5gxTBYJ+lWtUuBODpK2
xuf84ohOuJfaAW08SesYZrGsqAKTKvdGKmF0cqeTMqDsXSIDR3egNaykmvM25vP6XpRxDFlO
zgBvZsvAihKdpinLDcG6KjM0doIlsMU9hYNAIhaQ+s9JifmJfdvvu7eBm84oocPVIPkxQ6sM
jCYkqpBeZjeXH84RsLubq7deh1VapTLydnuaUuHVJ8ggKnC1145tXjHT7831x057Gsgf73oI
iE/GMTjcm4t/PlzY/zwmY9gBsKEqnmG8PZjimoFimPiHJdWiBGuWBAMSXea5VIVulRRGNOvl
rHTBwqUNDRtiN45GMKSZwMZcj/Ft7OVZNQfY7eDKeFubmw3IYC+LAFJ/VDTPZ3YEukzH0MWa
Q9bn8JLPCxQRxMwrDuaoiw8xIARX7TBvY8N9CEv4WG+bWl2v2xJiSRED09QmASRmYN5mANiS
Z5G6Lzipwv5QZqz8cXNCCzA7/Xyp3dHNoqnV9ZUgRm+Q7946/iBEFU1gq0aJKa30jrhDsOye
2poyKkFc2pZVXPvN7vLFvUatu5q7JiF1gpFMmUjxpttSC1nkSWniR0d/StgYo3zLbi7IIKuw
XY3j95eX/QGrrjnssKFQbAPjEnJ/A3YyJjro28c53chfBdclePlCO8NP1eXFBWlSAXX1xwUh
ZEBcX1wMyiLQC017c93vfht+LhSWAzxt4yHa+3PepU9nkPtgD2T7F9Q9x5WFaWSqra9e9c09
Squm+78hPQI/tflaP4GbGveTp54pT62doQKhFHIzJxBa34JNWHNV8TgWoUAX5zqadoWmGPCK
vpvD9tvuBPsLZv3vh/oFGpPM/lmmeQWOjSee+QMRwwa+B/vGkxhLwYNAwmw7YwoXUi7Hpgg2
hqlkNfXpgQXGRBIMPIZFUt1PICMBqQTQsHw4tjZOqKk26xsixFF8TsIx1rXWvYrKdNQxDk8J
hMISkVhP1mhkBU68cGM+Q2HGBw9fwPSkuvG9jgvvFdzDwKeSGaVQpnv4G49UzOosvfDUoCeK
ZZQbRfcJShpBbMPUcJ6wAs1ccx6Cb3CMmTWj2kR+oD5GUo51TjA0CIC5NVNegm5jtusrCAlM
WD7gSZoEB9z6kqsMF2B95+wPx7W54WFXw52HcvXvz5sjmMO/rE14Oey/7B5tobETNZI1A0x5
G1RQQ2ajNN6E6314dmYkT4R4HIUOQmReffYXt7BTBEkx9+GOKI1f0Bh092dazap4oZv1d5Bl
hlhMYlRO29CUGeKHa9w07ZBuz+3+JL1D62lV2B0aTRS4W0oxP4dG3VFcU6lAQ2Ej7lRojRrf
VUMqkZpg0GW+zEBzQevv00AmNP+FEmlLt8TsbHJgbSuvCZhJv2ISoKpSOqazy17OmCKgV4Jt
JjIj6HA52BddPAsJRwq2V6XOeZJRDdsYhCzXmWuO1FpDRDOBNDtpAtftgzQVcu0ERN232VP8
n3r7/bT5/Fibk+OZSfBOjvcJRBanBTh2JfKC6L7BY8Tvia4H00V+i4fFps8JQ6k42n8yYphi
2sworZ/2h5+z9Iz7b9ITp2ABgCqDyBP9ne/PdJ6ArcsLI2sTPH40/3nZkOK4vJ4lx2C0YlGk
qmKY92USErKqySutnmJxSOuby94Cc5aFDKKpvtmnXMrk5qn7DMrI+bqOZYLffVTDFfqQqUOS
ORYueRYuUqaG6orrmhfc+g3mWc5p6Xaz4+5UOR4gz3Hf+0A+gOllAEIoeNYGDGYts/r09/7w
F5hlZxH7GYKD4lS5Fnbknbc/YXuFqW8/ABYJRrnowi0LwUdTOfZhhXQAd7FK/S+wZXPproYB
YmxDarvB6jKA4DIR4f00jT1vpnI82wWGhRoiQz1gR+Rofnt1wSWA4NHlsAGdGyLKTf2au6Up
B2gE2o8hrCb0Ry25rWaGjLy2AGgWrbDiGlVKljYocxvHIsDNwscqPRoix7AW82pK84HI9N+Q
smLRz6bDgc8LpOYEJkwYOKjIw+RZPvyuokWYD2aAYCxA51PMI4FiKie4NjspdyvrFgL7CBQ0
Le/8xYXOII3NeOKy0LWgagT3GRhduRR+/GGbrAoqsUdcGTkDOfBYlsNuANSzNbF+SMcW0ziI
CKgVtVz6Km6ARvkb/nzMWDoGPGUTwhyj9nmnom7DDhkI2pl1BGH5X0nWkMmtpaTivI5mAX+5
W7dHaPjzbMv7wA30O/iKz5km4NmqF1sHxEK2qetRLCRnx4eoXxI93nO2IEYXCcRVUmiiRRRa
GYwkHM0JaBA4kVF3g6mRhVMRtwgjDHKVWgro7yxewTQJMbTolq+bV99+fn7cvHL5TaM/tH82
BdvvHR1Y54PV9jHVssR7ZFgaoGcD+o431TAVxiDgLA2EMybhA9ub5oJMbYG0S6bd9hbY7Ry3
pfXm+0ONnh5CuVN9GF1HJLpqIopzPOBfoDxLzyr5KDybd9AxLklmUnLHlMb2tH9wO6IBQ0cQ
G3jTdXoxdw3iCdG7dKZYQc7GpYoLb897OKHI20ouSaAg/0PX602ux8NcAiF1lenJUbQgHROQ
FJ24n6j1agU+T0rwn5Tzh04y5rMG382cfVjK9G3JFYu4tx7W3Q/WwgKbdZpYCOC9TAd3kRxk
6HHVnWj5QipQHSb7Nzc4J7E4n0kkJEGCNjWGcUbLshi7ZIDJ4E/FYx92W8qC+SDF8c7icH62
8jPJCWQM1O0PREHYNuwMvfIEtQ0lhw0K2Ep31HFAr2N3nQIYm3Fn0sPjbLt/+rx7rh9mT3u8
NeMkgW7TqkmCvKanzeFrfTrSJgird0zN+WjlKUqr2md7yfBMfyLuGxPH1nSd7dGoDqd3G0Hu
bKunc3TgWFI9EjOk39tv9bSsUnOrF9Ph4j6nwk+CmjLHYyqbMU0KwxJhxkCfcp11Pl5srslU
ExArz2IawOR5gsWCqtpD1cur5g5yvtKz02HzfMTjICxGnvbb/ePscb95mH3ePG6et5gDN8dF
zkVx0x2WnSUuzCDd6FAQpE/yYinYAkNrL4fpcBZBdjwVqjskOvTTnX6+x/Ym23A+SjmxuoGs
lRrLOKF8XkOfhMMuYjmEyFU8BCXBuCHCiNEjyt5ZlF6MydMz5Dwajpnd3jw5kgLbOiksvejV
6YPTJj3TJrVtRBbxO18HNy8vj7ut0f7Zt/rxZdzWc8kNt3HYHVCL/D9nYrneM0MorJiJbd96
Ht7a/xbu+XLjAwyGDiAaZ2+aEh6N6BPSvTKf7tH4LpIVO9JEoh53vY7iSGgxCiJHhC677oYE
lMg7L+fBh4dYFto5AuPQB0gv3PLoKU9gCVKWzRM+7EmxtZFPe/n/jAZQUgyUiOb0vcxBADtJ
Z1FIzoPJsk+QE1KKQpNFGtXFv2dhKKLjdA7SNKmQ7Oqcle+orkfjWfDwYmiLLGIVQsQYTGDa
Vp24J7nu59QcsC8227+8O/ttx3Sfg1ZOIzTpTuUWvqoomGN8GWb+HRODapJeW1yqFikLMckl
765OkOsFu/ylfoePIvwWv8jBuZFVRKlWIfLQK4bAN15hEWzoen2SUN3nBX251eCHxaj+vk1B
xc/Jlbsu+NU9znGYM/DVNTV717TbPTX8rsQ8BQXIpMy9044Gm6rhgb2pqWk2iM8QRE5slbCs
+nBxdUmnRBEPMzIMSxLncBs+nCttrGCJdxcFbzSzPE84IuhS+xWlHAnLg14e+UJmfqIiOOfI
+h+kN+FFdwXe7Mzb7/X3GjbWm+ZC/+CQu6GvwuB2urdqUQRDyRpwPHGq1hLkirwu26JNYfzW
LygjXLm3VVugjgMKeDsGFvx2VI428IC6P99LQI85gRB/DCwYzmsMnyvunYy18EgPy14DAvi/
e0rYtVNqDExvzeDE9PQyGMp7vMwLuZxIiwz+lpJniFflqInFtxZ3Tqpsycc9UqMsFoSoc8Gp
qcLAgDkzbHsWSDCN1yzOtMRDJ2oNrRcYFxUfN8fj7ksTy3pZfxUmg8NIAOB9DBEO54SIIjRx
8gRrSGHOhd76QkJ4vB4PU15fudNoQObqE30O3hCcK9BaJvSK9jQuAV1H7vhN5PrMNO2rlfE0
8f3CeO4JXpMbrhhiTEY+dZXEnPEYijOMsLAYLhSAbCVgSvmQYM78utbctFKSulfetkmFIqwH
YjRLwYecaYr3JYh22VQZrZ0Gj6aqhe3IIp06ITToZYBd+GuCCHMleQSFWegxFB0xxT391skZ
OpUDH2FEEfPxELZGaY6hRw3mrBi0gC5M91ioG/DVoM44tYai2crD9kXYXj84Y39iETsv5qPQ
c7xRpvFNlsT39XSGAhEbRDYsWhFDyJxnK70WoPUua6vmWJ1myhTU/QN3s5KeKBFSzbXnlgwM
TdbkKU6Vaec0bqHVwP4bTu3BhwNOrjFzxLLb4EzkVhUTJWwcKtTU0bLKnZmo2DwEduvZd/n4
2SB21/jgMWJ0ao9Ahe839X3lP0AKbodn2Xgtzf4Mg38vZXaqj/4zaMPDsrC3Nbt8akQ+QLj3
W/roOYUU3MzGXmqGPKw+zdTmYbfvCoROOZtB0OoEvfBVRSxl+CRm5Xt6JR0roOwlBzMEu3sN
ge9zw+xD/WO3rWcPh90P+5yo16Cl0PSx1ju8kkNvgPyWFwtOvbYJ2H0o0wrv/caRtzkdzCKi
PPA9S105n52A41PZxMNzav+zGNRE5U5ZsIU0v+5QJdK9yNRh+6y6FfXdkry+CS2WobMkulCc
pZX52QUn0FwLxRN7Z6qfSTzHjONyHP60iOe6fjjOTvvZ5xqkhMX6B7wuN4Pk1hD0CtRCsFhu
znPM+2bztPGi5wEfHD15n80bHfOA5eaDM914KZKpEPTj4B7Lx9zceh4H0B/zySpLyIQTeODX
WOYGOj7+c7Gl9s6nQp4vqqlfGMliquac21Bg5K96QLIeHsi1EP/1Z6TBUvm3/sCEAU/eU0Xz
hnjFEhHh+6O7VAwu3Bl8qp30PGYikStXm2AzFlImzjG5rRfZPRN1m76zRng/P3R/V2Hw0fx2
iCaBzmuaTpaANrcmwQJTMgUs03nqdWcg1Mu+DmceZ2i2oqtAPhneyv0lYvotsEdY5WRFBkWQ
6oGgpn6DBXG3pVBLPZjaeAd4WF2UtLYiUkj63Btx4CyncZAORSS2fTIFVCOzg7Dt/vl02D/i
LxQQvgP7jgv4d+pREhLgbwu1KjMt8jt8fnk34iGqj7uvz+vNoTbsmAM+3R2c+V1Ea0g7mf0x
o0luUgjsBg6jrZOeGcreRd5/BgnsHhFdj1lp79ROU1mONw81vrk16F68R+c80J9WyCIO2voL
c/vz/dUlJ0ja09H/OnL35Ile+U4r+PPDy373POS14llkHlmSw3sNu66Of+9O22+/oGd63cSq
BaffNZ/vze0sZIreDYrlIvLzjv6R127bWNKZHF5BL+0DmAVPctcse+DK3E11f3prVaR5PHjF
bWFVivdSyKIuyyKGD3o8q6LsQLFQ6Zopbn8CbDSLeHd4+hvVGw+i3bPAeG0eo7isdyBzJT7C
Xz1x3M1doVg3mn2/N2pnnn7ZqRMT6enalyRu6Dfk1KmVm1clWPSl3xR0gsQoJlJiKoVrCPhK
Tfw+hyXA63ZNN5ASppJ8kAte5VZq54Kec/kR2zN9n4VtL1ih8O5a2mYtdvJ34BSf/z9nz7Ll
Nq7jr9Rqzr2LnrYkP+TFXdCSbCulV4myLddGJ92pmdSZVCcnlZ7p/vsBSMriA7Qys0h3GYAo
kgJBAARAI5NB/h7yMHFgHKwb2Ic1s0DB9RoON1jpAi+B8yzmmbgv16uIjQ0C56ao3TpN5JHW
1RSNGcxyE6y111kPUXsh8azSGmOuo8yFrMHOqw9XnW08y1SmoP75rmwIbd2Wdd/pCQ7oi8GS
AuUg528yko75YKk2U8qq1rKmedagECZ0RYJDpdsY+AutojE3QweXWHlIoEgmlY/m7Z4g0klO
u554Q0nWVEk77TPVRoWceo+pFp2HQwGLmTeYfaU3MGSsLa406rHefTAA6bViZW50QMQZGdkl
ADM4rxZGgfEbHsjaMzCXTAzSR4Cac8HorAyw0lCJdSRndS4zaq834FJHeH3/3eUznlW8bjlY
IjwqzovQLHaSrsIVGF5NTe/sIOTKK46Y7vKRVV1dkrgu35dCTlKn2gnfRiFfLgKdz2HZgQF8
ajEnv8U8GVo4HmE1F5R7jjUp34LhyQozjIoX4XaxoI4pJSpcaItQTVYHmNXKSFwfUbtjsNlQ
+esjgejHdqFZt8cyWUcr7SQx5cE6DvXWkUNhyEOWNJGqKkS9omVmvrmm9zjCezqEFOrtwNN9
Rhqd54ZVueaWSEK9UESWwbZRuhFjEj6wLtQOLCag5kJSwCI7MDO+TiHA9F/HG+qgVBFso6Rf
Oy/ZRn2/XBscJBF52g3x9thknPL0KKIsA7thqUtwa6CaON1tgoXDy7JY5MtfH98f8j/ef3z/
803UsXn/DLrDJy0E78vrHy8Pn2Bpvn7DP3XVskOTi5Tr/492qfUutt03EmNs3gzDWRhqeM1U
zfSPHy9fHkAgPvzbw/eXL6IkMGEmnOvGuzvda0LbSLLq8kSJiSw5mv7mnMMGXCRYVSuhDU5B
0na891Ic2Y5VbGA52WNDhMo6KehWVg5AZw0gcpDnFFO1E+IBTUc9YVqiw0d44v8QRNvlwz9A
/3y5wL9/UrMNem+GCg45tBE5VDW/0h/k3ms0x4/MU7TPNuvW0Px3dZU6VYv0fYPEYAcPJ58R
lD2dRIEkWnHO9x5nGh69ZIzeiEqW4BEU3WDjRZ17HwZVQY+nZwdKpS9O5+BJ1oP+cduqnMYF
f/G6oN/WnegOAnw4iy/W1qCAeZ4+Zx0dcyvdp4MVHjN1qihtJ8YoRVo7psb0nko7gzvMn76C
mHv97U8UD1wa0Uwrh2AY5aO/5Ccf0ZyUWObBcm+C4ZqCMInADNQZ+wy7n3lMP03ttTnWNZnh
MbXHUtZ0WWLqWQKEErbd56RSpDdwyMyllnVBFPgCB8aHCpa0ObzkaGgtRZ7UvgSn6dEuM4sX
g+1TeTxmaq/o+NwgSvZsNpqB3B0/xNyzppZapnEQBIOPYxvkuyicaRNES9XljGQBYF0ajt2t
DT8J64qQnpiuCLwIeg0ixjfLc5/71NatEQ0nIUO1i2OyvpL2sEzhMrl+t6QrYO4SzGnyrOtd
1dOTkfjYp8sPdRV5G6OXHb/yLitt80h/cIahYMAJM0vZ7Sp2/xnl+zQ0EJb4QjxuD53zkzGv
3fFUoa8JJmRo6NAcneQ8T7I7eISTRtN6aIr86WS7GR2k1QlilMes4OYRmwINHb0Gbmj609/Q
NA9O6NmegQJYm0InJzMatUdEwQ1jKR2yMq9yUlhNKs6sFEszJwysOxV06qP2lDpFm15UhPRJ
OIfP7akrq7WXladClFSdOD8LZ/uePasrBaaJFJChajDwqoItqkS3ry0Z3JYOdX0wS8YeSE+m
9sjxxC5ZTgrkPA5XfU+jqs5Mw88CUg4ieGHTLWgBnR9ojRPgnoWa975HAOF5CWJ8zS19PQOE
7xnP8eK+DBY0J+UHWlh/KGe+VMnac1aYnr1z6ZMv/NGTdsEfrzO7dwlvYVVt8HFZ9MvBU/of
cCvHZNex/HIXvffFL479yZPW5LZHHsdLejNE1IqWixIFb6SdrI/8GVp1rFm6P7WzZKskjD+s
6eNRQPbhErA0GmZ7s4xmlBDxVp4JN/40exyrWidZUY8RXjONXFvzefgdLDycss9YUc30qmKd
3ScFog0aHkdxOKMxYQB3m5v6LA89fH7uDzPrRgRPVXVpxj7vZ7aGyhxTPvSYKfF/EcZxtF2Y
e1L4OM9c1Rm0AmODFKXg0ows1K89WD8aPQb6emYzlpWYYCSHvDKT8I9gUACDkxN+zfBobp/P
GGZNVnEGf+nNwjedUxCeivpgRpw8FSzqe1rDeiq8ui+02WfV4EM/kZX09Y6c0PtVGurlU8I2
sH2hp49uVOFPzKM8P2FgXAZzS2Lbcpan2tSYm3a9WM4spjZDI9JQcuIg2npKkCCqqz2V++Ng
vZ17GTAS46TK0GJcrFFlRELut8hZCaqXER3GcQu37VPiySx7IjuCd8G0e/hnCAS+pz8KwIc9
ssIMv/McY6+NdLdtuIiCuaeMdQc/t549AlDBduZbc9gODBnQ5IkvYgdpt0HgsQERuZyT07xO
YEXjLXPkNHdixzKG15WYnjf/6U7m7U6saa5l5jkbRfbIaHdkgtHDlWcnyqnq6nonrlXdgDFs
mAeXZOiLg7WA3We77HjqDHEsITNPmU/kQ9KA5oQ1fHhGj72z/KZum2dzL4GfQ3vMPfmWiAUV
Ez5r5ynbMTZ7yZ8rs06chAyXlY/hbgTRnMdEnqHpjatTNdbnfumpaIoC5tpHs09Tz0lF3nhk
OirY926hgc/jizuVeiuqndvtqqRTJ5uGFsTcsl2FQ/b49f3HL++vn14eTnw3niUIqpeXTypE
GDFj5Dr79PEbpnM7ZykXS1aNUcrDhcyURfLJ4VrK7YTCdYY/FH7eCYIE7MqnD5mNlnoIro7S
XGsEdnRPEKjRfPWgWhDmhgCq8bSO/n5tzksyd1RvdDLdKCSmHHvnVDc2CHTLzHpZBu629VNI
PcBVR+hhTTq889A/X1N9x9dRwgucVcLfIxj48lqy/gGPwr68vL8/7L5//fjpN7y9bYqkkOfg
Iubd4PIfX2FyX1QLiCBOKmab1zjedxRV9ujf9qmUIAh4Tm82IudERWzThj9PicPIP779+cN7
5plX8gLTqQ0EDEVGLlOJ3O8xGMbOOZA4TJnx1dSSFPLeyEe6qpEkKVnX5v2jjFITgzi9v3z/
gvP8ilfK/MfH382aQuqxGos6kxH9kuBDfTXSkyQ0OyPwzQZixsCbPoW+GHj5wGN23dWsNU46
RhiINHq30Aia1SqktzWTKI5/hojSoieS7nFH9/OpCxarmV4gzWaWJgw8joobTaoy1dp1vLpP
WTxCf++THBqP8W5QCO7MZprqErZeBnRGrE4UL4OZTyHZeGZsZRyFtDAwaKIZGhBLm2i1nSFK
6CCsiaBpg9Dj2hppquzSeY6MbzSYuYj+uJnXKdNr5sPVRbrP+VFdVTXTYldf2MUTkzdRnapZ
jgJLoqH1sRtJ/sTXniOuaSZAiNGnIBMvleHQ1afkCJD7lH032+2ENWByzXRql9AbzMQHHehN
JelJ0USt4eZDwNBw2mUqsXfCTyWBrL6BU3GHCDq/2m4ofUjikytrmBFxW8vbLEBryENaDkuS
M+/7nlHniBKPIsRtGKw41mBp7ZnWJzrULe5sUVxdkqPgI2RgFcPyfm8uIkop8jTXO3uDJ/Wu
pS2FG8lhH1LlLyZ8qyuLBngoScwpB8Fb1h3Re6EOM70Q1Q3F8zS7YGp2SzzXlWlCNSecmeTI
JWoIydiCG9UFb/urqTeW7CDOLaie4oUUdbvzoXZ4n4fbIsdka3p0lzyFH/oSu+Gej1l1PFF8
On18vloEAdEbVIHk9Tluu31D5qHe8A1HChWF6D4+oUFDvM9gTU8Wpr3h9zxn652tqIkSXoay
KiG4oDDGJWG0cNSp8gbslTmqI6tAe6f3JY3sEYuKzRE1WDSaTGVURFIqAtuBmWkUlFODRnHI
wcwnK9EqaZzzxJ4slm6CZU9DzXBRA2NkdihMmz/XFeb+CvHldlHYz7jzOKLbINuVLFgtHO07
6hfD7tSBTuG2jFrNZr2N1LvvGAx9vA1XQ11ZlxcodBJEmzgamksr33THPClL0OzI288kXuiR
uyxr9GWrodIMS+y0bicE9pz7hK8kShqYxp/qJ+tykUfUZfSWe7NKQP5UitI7qMe++7B1uyzS
YUunRKpBc82Ef+DemMpgQdkjEovxowXet6m+sT2pbdadpgkh1kfD16swiH9u0vomXPSwJqnt
TbV3KfDIQ34pm1lP0lx2J4oVJd6NQnXBJEz2q8U6ivDmP3ukgItXm6X9zuZSjvzmWtuAc1jK
nL7HeLHCjpELQ/BkW3esveIJMjKut6WUbRerUC0xpyeIXUcSe+cDXMCUCfrh/kdK+yJa0iqs
pADFO1xv/YNOShZhVMgbCRbSz0Kl7TlcA2eMMs4dHxKsVyPBnc5Jys1PULbiSjnPcleUbZkv
nVhtAbS0TR1l7dASVlJKp0DtF1oxyhEi9qXaees+oM1DhaQ0K4mKFm5bkeeWboFcGV4B6Z3+
+P2TSObMf60f0I9lJEYZJV7ET/yvSn6Z3N4C0SS5ZasY6CLfAdpubSxoagBVAK3P8lGv42Fp
VSMzG2mTQb7Qbr3Z3W9ZujXIoZysKTmwMrMuvFWQoeKrVWwEdY2Ygv5EN3xWnoLFI80TN6J9
GS8sEuVPpb7olG9COC6l1+/zx+8ff8dzByc/rusM4XT2XQO1hQ2ju2peZZnP5AXK+v7/Cqfr
jotUJLCculrdoCcTTF6+v378ormOta8FWp7IYEz0KyMUIg5XCxIICkXTgmrbZam6RpHTdMF6
tVqw4QzqGrOu9NbJ9mhvUdufTpTIPAVPh0pGI4zSHzoi61nr60+ZVaCfkVd4a1RVK0Ie+L+W
FLbFyzDL7EZCvkjcIpZ6vH86IeNNBpN99sZYGJNxmSVpuzCOPafgkqzei5IMWE3EkXnV1z9+
wWYAIjhLHFUQuUSqKdCEI++BvE5yt0M49CInFUZFobYkF6jxjt3qB067nRTavabaoUiSqvec
Zo4UwTrnG48DTBEpkf2hY4e5b6xI58jyfb/uPQ5vRaIOjxs+2xhrPXEiEt02/v0A0HteDEUz
9w5BlVf7IuvnSBMMwMA7ZdP8kCcg7Oizp5G5YDk/BxHt0R8/UmPni43JdqbwtLirTLq2kE44
l7cq4DpR0cKTinbzIncdrZ9Ww8HDnlX9XPuCDU8YDOBpUd1CbxlHZrex/AQWCLBXkihLgcOF
xm0NBkB4KFx1tNGlEr4SN9VsVD6bMkcXR1qYRc8BKgrDpEy/+kXCMaVYOuAN1XjC8a71ZQ8K
KhnfIJ19e0ZGuQs6rmW4SgCIBas3F6wDmtYHu5NordZ7k3rnvHlCHy+g0lWpmThzA4prrUCB
Kj2hPxPhji0jWgOaaORXIUY9kSTwwauDrmGiPxyWHP1+GJeva4B6tHATxlQBuwT+Nb4ZaKg2
xCM5l1uAcdWbgN95wshf1oBD0uraz4gBC8eOzdBRIL7yKhM+AQJbnc615TBAtGiPXq4JqotY
18tzp9Ctw10UPTfh0u3ViDEtTAdr+NhgXyiuVo2QESaqNhE9ueHrvX7DgqsWazaV+qLtiXfi
rklZM8dRN9CqdIMEDHchTK44JYL5r02wvAzKgh2B1Dh0B6C8llKWufjzy4/Xb19e/oJu48uT
z6/fyB7AvriT5o4oE5xVB4P7VLPOSbCDNq7EHMFFlyyjxdpFNAnbrpaBD/EXgcgrlNwuos0O
JlBcz+mnL4s+adTdvWNC+73JMudClYpC+8QzHVyV9rl9d/blP79+f/3x+e3dmvjiUMuLio03
ILhJqAyuCcuMG0DMd9zeezMCsf7N9OlVYa8H6CfAP399/zFT20u+Ng9WHvXjhl/Th+k3fH8H
X6abFR0coNCY2+rF544hrCO55+ATkU2e97QtLqSdONryeIIRL2L+gftPXhKe89Vq6585wK8j
WsVV6O3a47QD9Dn3uL0lDmQuLYr+fv/x8vbwGxZGkh/84R9vwAlf/n54efvt5RPGJP6qqH4B
S+l3WBD/tHkiQVF5Ry6kGc8PlSh3pvY0GmmVzLWwowVnCyWdhAxFRKKszM6h2bRSdC3IIC83
kSVm69YkeMxKFBgGrBZxGOaYYF16u9s+Rv6vyPPSqZmnoT2VF7O/YE/6AxR7oPlVruaPKm7U
s4o7VnNQN11ruP7xWYo+1Y7GGHqYnleqWMOxKmTqKPdbC5AqOGPPmsRhzR4sa+WdIFkKzpup
NpGg9Jwh8ZZp0XbwW/f1gmkJViUHiCrLPbFGeiHBhrqC2pp1QxGC1DO6XYbQzP2CmNlSfnxX
d0CN0twJqsPHpfFtvggDtPH/MqXIxMEetWOV1bMx7/vNHMG4Jq2RXZR3yxgGVgMlV65CmhXt
EFj1zYC2teWIR5RHDolTc2GU78yuItCs+wPAGpZIXl3ttpuehT2VTodIzIURUb5GSzwJYhDs
i9AcgPTFmKRlr5dTQ0iv0pd00BhZr8Ger9VT2QyHJ4eTZGWIiS809catzoNdmPRGpG/G+xAl
QxliRIyiyX2xqIgu6rrZ4RVi3lpbSNUV2TrsPb4dfEnByAxowRx2ETqzSOKRmz8MvVqeeHC9
fOotelmAv7xiKSmtFjM0gNq2zr5N4xZoaboGHv76+3/ZupaKiVb5BhhtW/lueVax0iCNQZR/
esXqiCDfRavv/65LYvdlY3dHvdcpyqgQgyjSr9eNziv8/hQ9qsv7EzxmusexJfiLfoWBkCLV
6dLYFcajTRgScDxP3mqXPym4OA0NXXiZNGHEF7FpIDpYY73bWH3Rjzie4wV8BBPeCPpgtTAS
Xm6YrtxTIuP2WhGCoVfVGzHy0NuFiyNnt/8yh9glL9EOZS59wpebIlq5DwjEVusQilTjZjwF
AF2Jd1grV13SsArCkaLeW/rV+EjePtl515I3PHJb6GT8yvfcbEurbK5DRZjuYjJ+X96+fv/7
4e3jt2+gyIpXOCdH4rnNsu/lPvNmwNUWqV9eIyxkuen5+pte8Mqyv62H8JTG98S+w/8tggU9
ykmbtNCt7a4V4GNxoQLNBE5k556dedvFa77prdGXWfUchBsLylnJVmkI/FLvTs7U3DllUPia
Wg7jd050f5MAXpJ0Gy3trtn7oPxaZTrs1WUuo0Xv54CbESSgL399A4nscoZKCrD5Iq0aZ9oP
WNXcO/GSNRf2FCM07J1pFO4Pj6UwEXjyBBQBhrt457pr8iSMg4XtQLAmQy6jffoTkxTaY1OB
bRZ0l24Wq9CeUIAGcRg787BLYZRBeaGSTuRaE2EzzreQppp/dqRUvPethFB2PouQyXe42xvV
riZdBlP5Pwrgt8HCGY5C0A4ISfFU9vHa27CMurLWyynZBUuHJWUMkQvcbpfGynKZ4lYq3mEW
66N2secEUXFuPojCSp4skZEok1ShJ4RCxF6lSRTaKdJaFXpqAKj53uV22CyC9dL5RuLcd+vJ
x9ZEAJVQLtFJFMWx/ZGanNf6VVBS/LUMvlxkC5OxSPZ04ueOxeoTOxza7MA85a9lq8mjfv+c
qDkuZir45X9elQOAsBAuwXgxFSbqkFJ/Ikl5uIxD/SUTJrgY/oAJ5dEZJgJ+yHWWJfqrj4N/
+fjfL/YQlOfhmLXUWc2NgGP56jcHjMPSlTUTEXsRmPmZou00MYNBEUS+R9ceRBhZc3hDgTZJ
sqzxuMczadJQnG1SeDsBqCHxHMybdJTw1ClWei1pHbGJFz5EQCPibLH0zloWbEixYjKTZhCI
u2/Ymbx1R+CwFLquwE9A10DScLYKaOPwz84KQiBIiy4Jt+ZOqqPLbu1LpNPJfu5dStEjhyNx
xGlzm+G5GhYQNg6mFL2GJV6O5d9LqwXj3fzUNMXV7pGEutdbGdjjpSRDS5uUSULXPmZpglcT
goi6Th0Zg+wb+wZPFdSL4uBER+coCvEkffiKt1s4aIVEp8YBeRO0uMXauHdbdRLvhoy3yxWl
MI0kIrR+Gs0NfAkXgWZljnBcd2tDwdIxMS1uDBL6oMcgofWlkaTIDmCVkVdyjyRcvwR5nCcD
KAtKWcDx8d1TuOn1AnwWwvRT2Mhj+kTNz4hOu+HU4FVkHNn7/mSAkhxRORc6wSp0hwpwzCmh
vpLAEE2OOQCKizVoHA/7U1YMB3YybjhXLQL/BxtDSbUwoQcT6trq2PMxE8DFiHW2IBBFE2+E
tXsb7Ijxpj9PbQouuEtTdNHaU9dO61qwXG02dxZpmnXiZErSrldr7eBhakVk9egLecQB8yyD
FaWLGRS6+0dHhKvN/zJ2JT2O29p6/35FrR7uXVxA1KwHZCFLsq2Upliyy90bo9KpJIV0uoIe
LtL//vGQGkjqo5xeFNrnOxzE8ZA8gy3XyEMxCRSOgJe7bnQCeHeAWVbvPD9aV0MchRyUYjxd
ReuhJUac3OF8th5Fk/IaWvlOQ+B4aImYSj0NfGEM0Kg5Zz1zHIvH3+nz5Wl4q+XyJEkCJWqE
2G9ULSv+83YpNY8Dkjg+hx2BI5rm+evrf1+QHvUYliOPPKYUqtB9pqjmaPQY0WvmuMwGBLqq
oQrhs5/Og+3xNR6L5pjKw+CEUzgSLlejphiiKwPhUAjwbIDPtOVUh+7VlfOE2KpC4YhsJUe4
tblouRmgpc+i0GUw6bW87dOGdCH5Ac/i3GvOhrS+t1mGa4eOEBOe9/KefJWQAsS4mymlbVUq
LJpXycvg8ZbW2NJ04tlHjJ+TkDKOyhG7+wOq4D4KvCjA90YTz6G3qSVLfDKyNHydmCUN/OB7
HkgqWI/YQxWwuK/Xw4MDrtPXqOoHLqUhsU/BXZhOKlMgwXhiOZbHkHlgtJa7Oi1q2FW7urME
G5hZ6ALcIpLPPEMcoUr/mPlb04vLNCfmoghIVdkUqSrUzIDYcwIbEKGPHCGLBZrJhYPWEJiA
RYsU8VgA1mMCXIYr6ruuawH8wJJVaCncDUHhJMvwf+sUBIROCAoRCEtQLwooRHuqypFEMFOP
aQdtHUGDleIxhWiHE4CXwI8KQ99FXS8gKFZrHPa6J6iGWefRHryqyJCFAdzLM/XMMvdeHXqg
T2u033Cqh7qG05GUqMB4RtTRVndWdYxGGz8UQ2qAi4i3pICqhrOJiwaQ6qEmSQLX83GrcMjf
3vwlz1bjdVkceWjaEeC7sGGbIZN3m2U/WA1PRtZs4JMKScIqRxSBJYQD/EQPZhUBiQOGYNNl
NT/koiqLd60E7fZdbeh5z0lqHOxaFQLdCA6LHT+vdntsqDVvSbdsv+9gyWXTd+fTrez6bnv3
L09e4G7KMJwjdkIgkpenrg9kdEAT6asw5lIDHu8uPx+jByNtD4li6w4VxYtzge1svJjBxh1X
d+RrSF/L0cdxxHVoRcYZcyzYak65XMZgtBLi+74t4ziMt9ai7lrwfQkm5udT3+F76eZA4EyB
F0bIocPEcs7yRDO/VwEXAde8K5gLd5z3VWi3Zxw/6am+I8n1x4GBPZqT0cbIyd7fqC4cyLZX
wS0l6lnYrwu+U28t5gWXpX0HrNEccJkDdg0OhHSRCT6m7jM/qsEAnZAELHwS23loI++zYxBe
r2TtUavaEBqOl3MBeVuTuh+GPkLyX1/XXPJAp9yMuXEesxhhfRS7NiBiqIopb8nY4gNvWTVT
F7o0URmQiMLpnouG3JBFYJcZjnUWgOky1B1z4GwRCH4F0Vi2VgjO4DvwPE3I5h7AGQIGBatL
mYZxuHVQuwzMZbBLLkPswre7ieEp9qLIO6C0BMVs+1xPPMk/4XGR8ozGAeasoMPtRSK0dJFe
273iK74ZDFtSguQJG1s78Dl53LogkCzFcQ/Tixcc/HZD8hmMGL021Jwohv34TG7ap/Rdex4A
JC1Whe0axZ7bVUUOuMjzpFBVpUycFTxp6klfwc9fP/z+y9tvD93nl6+vf768ffv6cHj778vn
T2+GpsCUvDsVY963Q6up/OgZrlzFLu3Z7oc5P/TgIe9bl6ZbtPPlHZECLBqK0vkOylbncbeK
lno0qy7TyDJietmUQ5aq3qZJE88JE1i78fFvo+TRNh4lfl+Wwk3ORurJjY5S9eUaWypCbiXP
n0Bjn5pgCBnqBjrfetcrLG1Sy9qsLfmzQl+aVmUdMYfdnnKLAUnoOU7R70yGEZYaZQQqleWT
IXXZSJzUn/7z8/OXl1+W0Zo9f/5FG6TkHSfbHE08Q4tJBLm8a/u+3GnuQ3rVqoGz9MKI5ruW
KivJCzpOPaE6UYYgJUx4nlBSLvNtxYbX2YXNorSzy+oUlkDAaiUQlgy/fvv0gTTjJx82q8eM
ep8bCyFRprdsbWQRvfcihrbBCdQUMGrxjC/VHvXs08GNIwcVLPz4kd2K5vF+gY5Vpt9QEyT8
sTrQ7ETAk4KkMiopQ/EKi2j6mzPRTQ3xhWbjNT1giYYmtXGGLihm1AvMNhfkeDORHoJpIaOL
WtEr4rH7anTVrCaq5DOu+JrVjEKXVtlayQKx1dY0Sphp3ip7pkqdRDukQ0GWIOIZwGjxjFH0
JLO5R7IZyQhwrPuwc0M3MTM8liEXPlduiZcnxSG7dWlfZugKiEBejrSOnJNUHadabG4J66E3
S6qMdP1sNv+PafP+ltVtDlcQ4pgtNLV0cdzVOMrrggZmewhy6Njm3fRUr/etYs2h95agW1y/
LwxQgXeB9Sf9mR77qEtGOE6cyJzCQs8IZBUnSbRVQ45jl+wCH/jJ09bGBCbRqsii2btsV+MB
V7wXXgBQGAOxCuj6RkSivV+nzFogy2oweYhM8wxQRx/UI3lUkF654hCFrVWLVVSoDZgffMqC
IYB3qAJ9jFWVUEGScpJZdl9kKytXFS79KLyu3BoKqA6gArLAHt/FfExrz3np7hqMDWBLRSrv
k8jPf7x++Pz28vHlw9fPb59eP3x5kCrx5RRXAgrtxGJ17y3RVcS2ScP5n5eo1XrSQNRaZyCT
Sc8Lrrehz2xBJYix6rzEOutIjyiO9YWB51zV5uA0DLxIf4U5gbbsSW0XhuaVhKLVziDp1qVk
1p/5vqJK3RmzRehzLJYoCkcQ2vbFyehh1dhEj0PbDFJsIdZUF2bG6ZZHU41lteFzhG8PnnYn
MzxVvuNZR/7kxnYt5T1VzI08w9OBGBa1F+gK0KLszAvixNoIwqrD/NjLNQ7wHagop82OTXqA
xmZCDBzNcr4DIhJ6JsgWM3EWySyGGKJR6oA5SGKbQLbaMoXFCbrFnUFjinGa7zgrGtmyAJru
dEehy9FhVsULnI2hNVvHqEt3e6ylWdPVqMCE6GZQehp3veYPJJpZ124yM9UzWxnOTQf5eV9Q
vd7YDlPLuXp86lm+ZXEtbXgsWIB9eSVXj201kHaE6qB2ZiHPXWfpB68/11BBeWEmn6vC4f/M
jkrlotuBLyzKl88QHf5iVZ9Ah8S5ECXLAy+JISKPexAaJ06Vt2wL591KquRqhytM4uAJJ5bC
JE52my23jDeQfhxy9zIQQxl8iHoGBblnphQHeOSZ6x8whf+ICW3NGovLYJcJBHbWPm0CL9AV
PQ00tmitL2xWPeKFpeyrxHPQXqrxhG7EUjSK+S4TerCXSGaJGExDiIvTxJF7xWn4nm9pDSkA
bX5CJfc9WCaHwihEhSqHLlAsoQGUezSeybITYXHowzoJKHSs5dIp607Hjseue7WLDRscs+rJ
9tCWB0I3xB0z6hDeqynniuH9isrTMS5G2qraBbYQXypTHAfolU9nwet43f0UJZZu5GdNxiwV
W1kxQZYALvXzIXaFjJI8SENm2n5gGTjTqXOzPt3+/L5gjoN7tLvwVcfiGdfgitEhwuBJbDV9
wgYmC4cIjE3uVzYLEVwUtuUivbKCjMQp+E5h47F4syiSpXCbWVX6FxblKLzGqgOFyIVjr+fJ
nBAuzByKXR8OZgFFDYJIHYTxMYu/ZDox3mkuYnPx5YzOxCe0Z6nFdNS0YIllfAqUwYhQBpNx
+Fyh98aEZPO3paD5UGn7EDpa2mohzoib2V909zYLYJ5DNESeWkCZ8lhxf0JV6a7cKS9Ap8w4
fp7I65gmYFalxdj2lE0hdrDCmsDJ4y96Ks8Ks2QRGlfQT+pxa6aS4Ks5zBVZHCNP11YSkZ7O
VV/ExAArRiyntGz6Y5q3T1Y2WfRY7Opd6fD5+a/f6Q5p5R7rckjJQ+pS0ZFAOy75fex/YKHy
Ggw8zaectsRTmE9fKlnQ95+f/3x5+Pnbr7+S4zYlwZj33rBUGPOByUS63fOHPz6+/vb714f/
faiy3BqrlmO3rEr7fuzh5VsJqfy947i+OzjataaA6t6NvcMeiq2CYbjwA/RPyhsVUcuqTFz3
uiZ66psaEYe8df1ap10OB9f33NQ3a4Nc/StwWvdemOwPjiYjjZ8ROOxx76C9gRiO19gLIr0a
7VDzsaqeGslOtyoPx8HSmAs+3witEL7fam+gMyAft9D7qcai2nIuyHTzDyCxjjxJnQ9Q7Fo9
ZcWyegzVIC7H2aEIQooFJ6jReO6Gc1xr4dBzsGtUgwtJogpLFwfBFXaivO0FbToLEfADpk3v
Tt1sz+VL+Rfe6lHVobrtci4eRKhu6Sm7Zk2De3u8KNouttA8J99bYya+1QI75dy35yZXlBjo
563t+9Urho6QyhCfZiWa7b2WYZNLj/M6qctqnZDXqfR9uYZO6VNd5qVO/FFz0jFRplhVqmPu
Xla7qM+VTqzLa3EiSFMMk5UjMv40gcov+q4nO54E2ZJs9JnIS23aU2/UhO9lWXrK+x88V6WP
2+Wtrfj6qd+Pipqc2uy2tyi4c/xSnHYtha9dRVVQ62V4PZ1IU2qz0Gyobpe0KvOUvBJaMr0A
x6n0PcVPZ9JbsrVR3Z19h4lIInpvp1kS3Ug6yoxRI3RberOc/FzXOHiFyIwcZFrReuhS5PVK
1l+GkRExifSayKqDWo8+KzS3uwDkjS5cIC/KfXKsrTo9zVkcWwxwCR7K0hZLZoaFKw5L0Bpi
Oscxs+imj7AlpvsEW9zWCPjJoojPsd0QRxYrQxp5qcMPeXa4Lg3dLQ1ur+8OBY7PJ1L3vmtx
bTHCoS36jpgU17296Dw9VelGix2E4rUVrtJ3m8ll9vgRaM7eDsvs7XjdNngjl2uoHSuyY+th
PTuCyyYvLd6gF9hyb7sw5D/ezcHebVMWdo6i6ZlnEXcW3D5uQIg4dcfIe/tUJdA+R7loy6KN
XqO4MFVs8++rMNiLeGxPB+ZanN+JkdNW9t6vrqEf+oV9d+LbrzVEE4eb2rUEJJAL4/VosZsj
iaHshjK3qEQSXhee/bM4mthLFqjlyUTuEZZwAWJfLNPY3VhHRvzO+iye7trePjUuV9dm7sTR
d/XeWCil8+X8P+m3X17fNA0RMQ5TOVjg8XdO9T9GEi4gplXVknP998UPoa/to5rDbCK0xsbO
CXKH1KNIjcjkz0kXGldsQ9u1VXt4txJDWhHRgheAZG25TZJeKKxVXT6eWpKp2qHV0V1WCxXq
0u1vT8eyHypT6lViJnAmKyY/Rir2vGUPon0ffn37/LD//PLy5cPzx5eHrDvPXrOztz//fPuk
sL79RS/KX0CS/zM7txcSJHmChpHLVZY+LdetQUD9U4+B9JzzSY6xvrfk1nd5ucdQYa9Cme3L
ypTjCS3rq6jHGTuj3GxfY8F0yXVC6DLSSLAdDmSRh/VY5ESRQ9ngWkq0PcNgqgpXl54oSlBF
rOu2IA7RgBvlSPwflMRHcJody1bGGGsofFuaoVzr4ZGLbtmlh3ZEI1Pf7mlCVsVFBL5aZUK4
Rfde4Wj3qAKEjK7OT+0OXpHqrLwObTe6ktOuQVW2pgUnDgNUcoC1ovhxGT/278iHfZE93q/a
6jQ2QSIUzlyucKYH+WRDXE/nhpfedltM0wGRC85bbLJkzkSGAiUd+7a4pRGT/LHvudTOP9zW
PFqKfXmqxfonIgzaN1gtLdVqzw90+SragTXJqRjSsrnlQiWHD+0r7v/JsgRrOnL5gfM9PIu1
Q41buqkfCVOZZY9mQ6sdQsH4ikZuXlqKYj+Yu4zCNy2mqwa8DvvukFoWsvfX25DXYHWhSFDj
9j02jhiMwJ2VuoVbZlGap+fbeSgr8JmEscg8Ty/I1YqEG4iukr9CdY8uCho5jmtBmK4kbGK3
49PGkJy5ZL3WuTz6zIFW+gqDZiC80P0AV+zRDwL7qWFkCRn0N6Ew+KhBHgMvDiE9CFAtqywI
df+4E7TL3Ti0uD2deYZbn8GYMyODoak+k3svqPSXXR3a+nbJ4dtyDWwAaBa6cahQOwogAON4
BGzDRcLQkZLGYatL5GEgDGylYQdmKoPlKyLLXBwxM76Qgl6vsV1jfeHzGPS7qXL4zFKG50Mb
+Jkh8CrPAXUn3xcuEHfzNHIZHOa5YfRjwEUfMTTWON3FtS/62GPQD4HC4IK5KOm4U0YMLo+H
oQ7RMl02TUsx1xwvRPWs02sSO9ihh8riBVFqTR9sro2CJYysqRMXuqrQSkczYkJwW81onz/Z
UF1nQ6+v/b5G8PR1nLCQVIz5RpxW0BIXMVOM6yGt1jXiR00WxnAsERTFic0dmsqVgFE/AriZ
JhCOKQI19TMDsGdJoC1LzwnBpB0B25I6wdjaT+XirQhH6oTdb0bJZqt+wNy/LfkTdD97wQVz
59MUrgmnim/BYG6fBr64xuMIX1XoNATh5hJEDDjbIIzBdijpeEKdhsgBvSrI9gpymYvAzTpG
DOzlgmzLtz8MVeBAc8eZpTzUKT93gCPliOCxPaOn4lAjmaYva36yvqX8b7kvdTfmC89pPx4c
pNS+UU98B9P3tes5oF0ICJGMPAJ43E2gZe5x2A9C/E4/8wyp59qvUycWiwHowlLe+nTraD6k
vRsE4AMFEFqAKAJjkwNkJYaBiF1RUwjI3RpZnIPL5EBWGLj04bMEAPs0iaMEFlddPNdJy8z1
7spaKu/2KjlzeuwKFvcFdq/+Zq2I4c56p/NaxMmFCcaW1Lny7Mp8uHEPvZe6brR9YTH0Unjd
KohYAvjp5zxlnrd9bBNmR9AXuMbhg6Z/quOAwW8jBOptawxg2BE9BqOf0yMGFn+ioz2I6Giz
EHQo3BFi8+mosNxZEgTLnQ+X0xsmjbY2QGJAGx2nxw5uS07HO8OIWUY4KbJCrTqNAQ45Qu5I
o4Jl67hJDBH+INPBoYLEFjdzE0ufxrHFZdPE877yrNr5M4+4RUvCbuOlbJLLI2gvMXOQ5QIU
oaVNw3bSEImlTXqOA7zcNGvtDMThwgsOCW0vJEOXknvo1GiW8V5Tv/DTipYyCOkxwWu9BdYB
KZIcTml3NND5AXC8bDyWuXbVOrIR2XzMFJGyMTvdYhpJ9ADbarL5mVMhTtUjzef2mJW3qhwG
/mlFk5epcjVOOHgeIPK5orjOZqRrhYH/t7HpIBIu/FUd0/52zHIjc0sKqUokGoKY6EuUe9uZ
3v3+/cvrh+ePD9XzdxzIvGk7keE1K0ochJhQ4V7rYvvEIT1eWrOyc2Nv1MMoJM0PBVYhGN51
WwrrLe+v/qkcLF5S6hqaHBc1FxWF3uHCOdLk28JqHMo4mP3X1w9/AD9JU9pz06f7ggIxnevZ
p4Oa9Pj25SuOK76uyFDua374x981Mf1Yl9mpbW5ebPEwMDGeAmiR1hRPpIqqvM3TL6l5jWi3
Pf97XKa2gtTnipfUVq12ahEMuxPpvDYF5zo+UWSO5lCs5zpnReNU5JCmA3MTvBNIhsZz3CBB
Hhwl3nuhNE420pFbUqiwLipOqgCu5nphocMdQTaIfmMtaSfHYT5Tg38IelGxwHU8RzW9F4DQ
bneMXATRRURv9Wmklg398c9ootqmzlRHjQckqNLsb9UKMsiqtQTdF4zMnvx+mC1ARN1ocyQH
wezG1foVhvb4RIz12FhLdWHsnhkOPbNBJq8GQzroFncCtZoTzGhgdlaeZsz1e0d3oy5r8ASN
Lgha3AfoudEDi7MaD4MXqK4+5UA3Y8zKnpUWrauqDFlKFmu26gxVFiTa8U/mNrlZWo/P4G+D
+DjkbpiYVS97j+0rjyVmP4yAe52DUy/LhdD5+Pnj66c//sX+LXad02EncF79bxS286H/6+XD
K9+FaP8f15iHf/Eft+FYNof636sFZ1eVzSNW3RK4dIBjx+vqyvvM1n7kh8H4wJ4kiXdDYTSI
dHwzOTNeT1bdK9RMdiN0py5znNzkmH3eH2qPn43hujx8fv3tN7QwD3xpP9iM3dIsK8gjYckl
K6zHXfK/TblLG6RyUvC5giSv05DJPQekycnDnrCvU1MsVMv+zhkUW7El1U3qpS0NT7TZ5Qbf
yJqi6nW0VWIuyvjnfBc/cGTp2fxJxP7hNOUoKDSjiG1OLbT1biWn6eFyu+pKacHXj+oC7981
P9XdLe+07ISN0pGyu9WHWtE6WgCtilQ9w0HPSNWadmS06WxzvDAqa2IiGDE6CO1vnazU3EfZ
x9eXT1+1YZj27xp+2lk1idr5pk7JlN/uvJ+07BSlB8pvX2ouPp8E1RhSPPWtbi+kzMOFNTzA
R7a+qPZUCTxPRqZjkZphDkZJ2qjqPLz+n7Kna04dR/b9/gpqnnarZnawMQYe5sHYBjyxwbEM
IXlxcRLOCbUBcoHUTvbX35bkj265nTP34VQO3W1ZllqtVqs/1tsgEmnsocqbi8BxRrgKsvQB
84QfRTLeDi/61APmLbUxUBSF8ObcLMhCajJSbxoXup5o3QDG8KIQUSjFsbt5FBgKqwsFhCAo
rdOqITIJ3pp99yZIeX7YqDyu5nNaV5e+Ptfz91tv8fm+v/y26f342IPKzjgG/Yy06vg8Cx/N
uhq5B0KFzXHcVNIzIEUapYghFzLUxI9R6BT8ABFXxKuVrDbdIpR+vKmH17LeUoxGalirjLmE
LUTAE1fpF7uQE2c8ZHFGzj6EEdFwgIsNGijsV0FRFpGVFOfwJhNKxHpDIBI/8MMRDX81sHye
Ekwk7L5MC5iS+WuXmUeP1DkyuJfymiMi2PjDjkfLvERfP67zUCUJXYF6vGawUtlRXTyATrOM
V/5da535b2c4DYvzx4XLO6zC78g+qiHKKZSMmJCR+bpXNRB2zTqurwSqQ7Ks4wirKHed6R8o
exfblfpBL4qnqy3dfHV4dJEseLlT7flTtmR72aLycqwsBNn+eL7t3y/nZ+78m4XJKg9ljCC7
NTAP60bfj9cf7bHNUlBGUCIF+VPJYBOmlIK51IK7MRJgYpGgrnpIelJvqTIO9SHKmtyXZ1DV
H2TtbyZov6ZWb2/xk4DB+Yf4vN72x97q1PNfD+//7F2lzv/98IysLDqRwPHt/APA0mccj3eV
UIBB6+egwf1L52NtrM4ecDnvXp7Px67nWLyuMbpNf2882e/Pl+i+q5GfkSraw7+SbVcDLZxC
3n/s3qBrnX1n8c0Eg1ZW2yq3Bzif/WU0RLXWjb/+A4VEc0/UXrl/a76r9tNEuorPsvC+6k35
k5RTqHQxjZIFFCpb92oZhIm3JMoTJkvDTLnwLju8nQmtjBSVgaI/paxz9f28TTgKGUKYfGVg
DngzIEW4CZfIbzrc5r46Z6oGwr9uz+dTu1wEIVbV2FUY99FElJkyTfhMeKAQ9M23aoMRErUl
mKvqzNAMBmxq8YagygBNEWbuqQqcL4ckzXgJz/LxZDTwWs2IZDjEhpgSXJnQMeskINCzR6ar
Ed7IZB1O0PlneB9rYIU/ZcH0/Ejg5kkWYaVRtpUPUuLvZtFMUVFweegHlYDrof7vTLDPtEjV
W4VcQzWJjUng6GVmACnBFXl5PPSen/dv+8v5uL8RLvXgiGS5dp/c7FVA7j7QC7bxABfmLAE0
5WkFJDFwCjiyWwCWyqhen3i2TUvFJ57TUVpsmvjAnMq+whW2CTwbX9oH3gDf1QMvZEHfNQET
A4BTB99tRUBcTBSgM6Wtxna5nNxt/T/vLN7qnvgDG1cJTRJvJMuD45saDepKJ1tiaZJiABrp
BwE0dlgna8BMhkPLTMSkoSYAmTqTrQ/TNSQA1x5iNyvfK+386Ch4B8cs9vIdMFNv2MdbosHi
mu1PO9BXerdz7+Xw43DbvfVAZIOcNheBdj6DtRTnHmbFUX9iZaiTALFsh66VkcVeHgHCdl3S
mD2xSFP2xDaasjty4MsK6Ky7BSBcetrSkCKayUS2VSBd55MlHXFdA8zIJXmhFWRc8A4nEsmm
/5OIiUVGYITN3/B7PB4R/IRGSkgI66cuEdgf1wsmjkuaipQRUefhb9rTRUq6kq9L9HjcUQTb
92VePoum9ld3WWXp71qeyAocsK8RaLjU0XjAYnno60zH6G5/7Ax4h5DFdtRRuF1f7nR0VtbQ
dHA+VgXAZgYFmLgmgOZoB92iz3qQ65rKdLVqWEcNB8AZRWgRZuAOjNdOXL5Yjp8OdOWZhhhA
RtlLhJlg0S4LKj1ZesxIE6pkSSdXLL21LDDLvEFrR+ZUqxPgRup99b1E3VadyLKI+IlrCDaE
0Ro4gGlm3LLaVVf3RaB00GQVtKupIkkryyB0NZGrt/bHFtfjCjkgl5QV1BH9jnqMmsKyrQHP
MiW+PxZ8cvfq+bHo0yxYJcK1hGtzIlPhoVFaNlZDR5MOlzmNHg8c7uaoRLq4LkP5FnWZabwn
j31nyC6Gzcy1+iZ7lgfAbWt2qn3vqz0O74Kzy/l064UnWi9M6otZCLtvHH7VPHq4tBO8v8F5
0thHxwO6cSwS37GHfLtNA7o7r/uj8oUR+9PVqOHn5TGss3RRVjTkhbeiCZ9WDFGtGIYuPlnp
31RzLWFGon7fF2NWIkXePb0EShMx6pMqr34w6Bv6koaZLuEKqLMv8YsUvivKInmemqd85Fcq
sH64eRpPtsScZ46x9jg7vJSAHjBDmWkBWzJ4AnzgSERTJlV9lTY8ibR6DjWKzykiLZ9brHkv
qXYT5JyTG6/lcUS7MXDlxGiTQLl+YCntNNfz2uJQl8pGasqQT4ArEZjh4LdjW/S342I1Bn5P
jKaHE7uD4yVu0I3r8/Z8QLm2k3U4skvsmKit8re5HiR04nacMgA5GhKlGX6PSZM6ghk3N3I7
ezsa9Ts/cjTpVEoHHbV0QUqN2TJFQbrKVfYHfJEpHMdmvQVy33Jx2kmpP7nY+yhx7QHdFEGx
GXbkZJSorsrFoMg4I/bSRGImuHIg7C7wAf2xrVxoDPBwiCNVNWw0oGV7S6jbkRBJb1BAwV/E
frV+tMcqiI+Xj+Pxs7RaNqtKLUttUVSJ7fC4mThtl+McHFqUtQmm8X41u1Dmxd3/78f+9PzZ
E5+n2+v+eviv9IIJAvF7Gsd1Ehp1HTLfn/aX3e18+T04XG+Xw7cPefGMBcRkWJ5jyDVKx3O6
sufr7rr/LQay/UsvPp/fe/+A9/6z973u1xX1i+yNwcwxYn8wpiyUXXbk//uaJv/vl8NDpOeP
z8v5+nx+30Nfqp28OZYJy+2P+3+0rE18KHOFIzJSGadcIla3mdCJ8OtdfG65rd/mTq9gxBYy
23rChnMN3kwaGN1kENysWJmuB/12TR/Kz3kxf8xWxQCOqSwn53M46hADR/cA6218v3u7vSL1
qYJebr1sd9v3kvPpcKPzMQsdh6Zc1iBO4kkrct8iRZA0xMbLi30fQuIu6g5+HA8vh9sn4pam
M4k9YKt+BovcQvvoQh4U6LlwkQubLXe+yNc2jrWJRsQuJX/bZNhbHdSSDNbyTTrNHfe768dl
f9yDevwBH2wsTsmsDhsvWeIoIyvQaNheHw5rYpkmkcHnEcPnUcXniHdXYjzCc1lBzCJdNZxX
F+6SLU5GEi03ReQnDixP7GSDoLRvBEPVNMDAOnLVOqJXBATFaiCYglP+YpG4gUBelBRu9JHi
iLwwnxv4ZKvp5hHcgJzgIo6MO4sK2mxh2t9Q5UFmJOufQSGM0iResJYGHJb5YrlyEefFAxkA
SPguDcRk0GFjV8iu2KnpwhqxO5JEYH3YTwa2NSZ9liDWaxoQ2s26+e3ihSt/u9gGPU9tLyVJ
bTQEPrPfJ/mCVEFYC8aAjY6tDhgitid9IxMOwdm8IUMhLVZ/+1N4Mvck/v4szfrDDkWwep12
aWeV0myIE1XEG5hkx0cXeCCyQby3DHcSxtlZlyvPksHQ9aiv0hxYAoneFL5AeeiTWRSRZfEp
ZgDhkBsLkd8NBnyoV16sN5HAOeVrkBEoWIPJas99MXAsxwCMbG4Kc5ilIVvaS2HGiPMkYDSi
5i4RO0O2fsdaDK2xjT34/GXskAovGjJAo7wJk9jtk6O8guBQ603sWngtPcHU2NVFXimAqLDQ
Tny7H6f9TV+SMGLkTgUzfpLf+Ch3158Qm2p515Z48yXecWqguRU1CHoH5c0HZpnGxB8MbYdj
jFLqqmaU/tQS8NWrv0JLn3IDXTHDIvGHYwdNuYEwN0kT3REjXlJlyYCoURTe1XaJ7SpVy85r
U87+/W3/F7FiKKvNmliHCGGp5Dy/HU4tZkEbHINXBJVLfO+33vW2O73AafC0p28vM8mjm2qE
VNkYs3Wa8+hchkzJDOc8WjyKmUCousN8t8qN9QSqKxxcX+Dfj483+P/7+XpQZStb60TtGI7M
FIgH8O80QY5K7+cbqAQH5lZ+aOOaeYGApY4rvXvboUNsDRJAM9xoEHt546dO3yiZCyCLlV8S
M8TB6Yq0j6sc5WlsngI6PpD9eJiIG/r2OEknVrVDdTSnH9EH58v+KnUrRpZN077bV2lKkWtA
arOKdBAvQL5SJ6ZU8PvSIsX23chPrb5RQi1JY8tqXcKbaF5KABJEIb3UF0O34xZQogbcJJeS
Ls1C0ZZ/CsqaTDWG7qJDB/PeIrX7LjFcP6UeqGwuK5Za09MosafD6Qcza2IwGQzpqjKJy4k/
/3U4ynOZXG8vB7menxk2UOoX1YqiwMtkPHNYbPAamlo2tdelvB96NgtGI6ePzG4im/XRrim2
kwHdzAAy5JPmwJNEpZTKwKDfkQh/Ew8HcX/bZqx6tL8ck9Kf9np+k3FhP3WKsMXEMNTYwrLN
A0Htaftls3pT2B/fpQWMLleqhvc9EPlhwuWslhbWyXhApF6UFPkizJKVv1qnOCglibeTvosD
SjVkgK2lCZwPkGlJ/R5hRe9RYMZRv+2AdGBgjYcuZlfuI5tvXOZTfmaT0AyVr5jwAXkRww+9
uVGQkVBXgnRy70XsB75q4oiRMppqlhvAcvgpUMV9jok0Un1oObZjpLxMrs6rUXbfe349vLcr
ggFGep3jM2gxi3AhNy+QvuJA1/Qpi4S/kdoBzuWrOlOkcURP3+abEaelsoxOV9w+iMAwV1lz
s1Uc0zouWvQsHnvi49tVudg2H1QlbAd00zkELJIIVM6AoKd+UtzJOs1rMbXpk/IJH4Zg6YdF
vsoy4oqKkapFHLqEcMKLN1x6BUkjuSBKtuPkXr6dti3LBsWow0eMTLdeYY+XSbEQeL4ISn4P
4RrZKeUt00qIgF/rpelitQyLJEhct8P2IAlXfhiv5C1eFpjVFypZSCap7qP0MJbx5w2X+VPq
TzLtyNAtMXFaX26m+8v38+WoBOxRWzq5SKivyBDLeZ1ZMpwW+3mnl8v58IJE9TLIVlGAmb+i
qfUbD1m7liBtEuOnKVZKoPQ4EYFHi52Wpd5DGXfRDjdYPPRul92z2rDNNQ+igZ79E11joJh6
wEqsDaCigP4VOBk8IPRFEQGJ1TorC7iv4tB8V4ldhF6WT0OPT6qhA0vzBctVzMdVr5e5pon1
TYe6pBmIG3XNzHyeyk+dzLOaWJg3rSaFv+G2xpqqTomNLzUqZOSHjmkIrnCJ5y+2K5t5cppF
wTwkioDuyiwLw6ewxLNDWfYGhkCW/ZQbNOeWod6ShXOZcr3umMwFT+B0RIIZ7yMxE+zSldk3
4O3bxo6KDrtMzpK1dBKcjyY2sYiWYGE5fS67hUTTtA4SUseFtU/ZraiQNClWKU5mH6229Jfc
tIyXiDhKaAERAGiHsbJiLGHtDP6/DH0uizxM0TLHXuigIxT3ay+Qqc2ZeLEcJCLI0nxNi+gl
K5Gzi8cIldAXr4c30JOUkEYTUNZeC2E+pQ8rSQggQSsRwVT4qNZduJWB8DMS2F7BiqmMs4Oh
5fQrGctcSDwo+1j3WAbSW+7RxCNOK2CHzR5Ts0IcptjA3p9z0QwzocOimzcGJiDSACMdwswz
6e7Xq5wIHgUolmGuotDUnM+MSJmK32TNvJL+wcuWZAg02FAtNTCHlU/eOEvyYsOZDzTGNhrw
czRz3jpfzYQDQ4LsjApW4A1pBuNQ0Pn1AcR50enY5xmJB13BVMTeo1FJUB8/ds+vRhVcoQo6
sExcUmsd4Lr/eDn3vgMPt1i4rFuI1CMJkJkxcrImFRiWUxxkIZfJ5S7MlrgZY5+uc2TNo7m3
zKWm6c1JILP8U41lo5a0e44WMCjZiu/hXXAW41UT4K+HVXb3czr2ViWIiSIAP9u5JyodaBn5
ug5IoxZpULGUgWVx9KSqNNZpBDhryKp4uMffT8SOdlbbP39c5NG5lfLgLnxEAy5/wa50v4Y3
tet+pGEmIhgMWFZACMtrzn19nq2BJtAtIyYtBUqJYZnhsQgWhSzror4Z80Xor6WwKYIkFOoQ
o6qyUFOyJum4XNLIrlKbuSeZSwojWZVlEcYpu5mXFR5Rdzy0d8Qi+eMX6Qzzcv7P6dfP3XH3
69t59/J+OP163X3fQzuHl18Pp9v+h5yKX7+9f/9Fz87d/nLav/Ved5eXvbIFNbOE8oj1DqBg
H3Zvh//uqEuO76s1IsUK7C2gCS2jHBaKLCuC7i1YqqcwI3F3CiiLBt0B+y15vQfReHFcvYi9
qCaE5bswUkYKqgpj1cBSh/KKRupiiIS/IuDHqEJ3D3HtjGkukXrgJNeuKtXKv3y+38695/Nl
34PTzuv+7R17emli+Kq5h3VNArbb8NALWGCbVNz5UbrAm6aBaD+y8HBaCQRsk2Z4j2xgLGFd
77TV8c6eeF2dv0vTNvUd1harFkDzY0hBo/HmTLslvP2A0juOPHURREKVM1JpW1qPzmeWPSal
iEvEch3zQGIrKOGp+svpqRqv/gStLsLyXYRLv/UalVSgOrx/fHs7PP/27/1n71lx6w9ZOvqz
xaSZ8FrtBG1OCf3260KfJcwC4THfCsJyE9rDoTVpqSfex+1V3no87277l154Uh2WV0r/Odxe
e971en4+KFSwu+2wFlM17bPpL8qZwiUFqwcWsKt5dj9dxY8WSYVeL7t5JCyb2K2rJRbeR1xh
4fr7Fx6IrE01D1PlGHk8v+DMUlU3pn7rzf5s2oblGTegrH9o3Y1p66vj7IH5ntWMSzVaMyjT
xS2zHmDbfsi89lJdLuoxbq1imWY1X7dnR+YMq8dvsbu+dg0fyZ9VibTEa3PqlvuMjaasbuz2
11v7DZk/sNvNKXB7WLaljDVHeBp7d6H9xShrgvagwntyqy9z+LfEDyvOO9k5CZy2VAyGTF/h
6LvwlF2UjRAsZUYSWDjLNwJjV70GbA9dhvMAMWBdt6qVtvCsVmsAtIcu03NADNlI2gY/4JZz
wnnEVEh5DJyu2tthPs8sGtpaIh5SoxNaXB3eX4n5pRYz7UkHmM6bYTbtLdfTiFddK4rM59xa
ay5bPajkUua8VYgqmq8lfrwkjOPIYxDygGCkJkS4NiNKqNveb5hhmKm/zDDcLbwnL/hqGIQX
C+8rxqrEf5u5wrC924KSkJKbiZpznBZtHrZHCQ6RNKcXhTcD+D9lFdh3eaNMlftqnGaxh1NE
VoL9adWCjZ22vhM/tXsMsEVbwj0JpXbo69Td6eV87C0/jt/2l8rFn+uetxRR4aec+hhkUxWd
uuYxCyOpIMF15I1DJHp/bCNawD8jeUwJ5bVX+tjCSnWw8Kiju4H6SW9qslpB/6KpjL16N6nU
qYARW3BY/WL7l92UyTXNE8vb4dtlByeky/njdjgxe6p0x+WkknLT1dtUdeH3FU2bzQCnlx16
3Pyohqj7yxRNrUp+2ZeGjEVzUkfCq10UVGNZ8tr6iuSr1yPFp/tDGx3060/u3PbYypSeeEyS
UFpHlD1FJlFH9rQGma6ncUkj1tOSrLkEaQjzNMFUzCu3w/6k8MMsj2aRL+3aplE7vfPFWNpj
NxIrGyspjphiVGWibJ7X/Cv9zL+rE4IuiH09/DhpF4Tn1/3zv+E0j+7glLEO26AyYvdt48Uf
v/yCLEEaH25zeR3VfFOXVWm1DLzs0XwfT62bhmXi38WRyHniyhD7Nz669DbqWtZxtAy9rMhk
kk9iWZb+AbzzzzQCrUdm30Q8U93xL8O8LAqBzK9ZECHtGmY4CeHEm0xlAs/GrUFZ87y43Wbq
R0W0SujhwYdDHQhrArJcLFaAKVu6sV9E+RrfoWpNnawaALB2VJMEFkY4feRuwQiBw7TuZQ9d
3KIpYIj5dl2ip/v01wg7eE3bZxMfRaC2DyPAAsEq6fj4kgaUBqmOaJe6TwyVt5sm/EkKJthk
lE5CoS1NBVSUpmUCRS0juMNSg6rC9E9Ss/0DJYZpRoG5t26fCnINqH8X2zGRuyVUuVmkvPdj
SRJ5HRG/Jd7L+ATjDTpfwDL6ikaAlOQOaiV66v/Z+pwy82QJbMahmD9hVyWEmALCZjHxE843
Vi1oZc31dAaYeisRKz8CEbAJ4bsykrDYE3L5Y3cNDZI3mwURCxJOMpypqyGZQdoLgqzIC9eB
lYV6qhIe+bGXSX+JRUgdjCR2uVpWCJnRKSU3NrJd6R3UcWsj5rH+VLQG0zWcanGXg3sk8Zaw
JoiqGj8VuYejorJ7qTagR5I0InFT8GMWoI9YRYFyIICTKgkollcjy/n/VXZlvY3bQPiv5LEF
2iBZBD0e8iBLtK3VQVlHnPRFSLNGYGyTBrFT7M/vHDp4DIXdhwWynLFEUsM5P5IBRTfBTh2r
4X7IVNeKR2NXKEZzS61v78fX81eGY74cTs9+dYlqsBkdympZIG6OIxeBNhkWQrj0ud7kYI/y
KdX8e5Bj16Wqvb2ZJm9wJbwn3My9WGndjl1JVB4FjvF+KKMijX1ZkDlCYBhwqFYaPS5V18Bu
nqxOP4N/YHhXuuGJGr5TcIangPH4z+HX8/FlcAtOxPrE7e/+9+B3DdGB1wbilHSxsq4jMqhN
laey3TSYkn1Ur2Xdt0nAmY3rtAqcha5KyroXHaYWtso+PHjgWdcwd1TOv/3j+s9PttRXoGwQ
6xUo1tYQT9EbgEtk2CoEZYICKiHGysXj9Wig4PdRTbZImyJqYyO+dynU016X+YM/p2uNcK11
V/JPojzFHT9ispCU3T4CTcXjrzQBH0wAgdkeetdeRRkdtwjKSvY6v1egSPwoH3B8GpVDcvj7
4/kZa2vp6+n8/vEyHNc/rshokxJEoN4ZOm5unAp8LAa3V9+uJS4+QkZ+AtMwTd8hPhQde3sW
GmFmGtLk+9754D4bVoWIs0AkUVA4pgdiAdU0YGT/4DtmsA5C7f3uHk/lrDIr/YUUCTuwaiKr
XkoNEItElTgSJq/wPOUAIJMYECCxQCY5LZQ4A2hvhm4Z+5K+S07sSURciMpdHYU9u7Xu1pof
ZtaGECSCIRweKRSAL/EDkZHsuAzFxcfofSmaKCLCemt06WCnbAqIAUQFZQiY4DBjjTy0/skF
om7v73051qvPSi4LkYQN0wq+Vg5KwP/5SAnrPKrjdw3jb2a1C4o6GYiqTIJ62xnBXdFXm5bW
ufON7wq/c8CNFRsfteRy1bLHbLwTYpNN4CYOYip1UXQDLnOJj0/yJYTCknyxrkVXVszYMSQj
i3Bd+fkkpiIOieWIxCj9S5HLy+GOC3+Yl4PblWaLWwbc6gTxX+h/306/XODBKR9vrPC3j6/P
phsHb44RiaF1ZYK+zGaENXZGzoyJ6Pnprr29mrxYHWddZZ4UOUqSXrc+0XLW8MDPwmSkd0h5
jCDz0Msrc3rwZf22K/FSwyYTP+d+B+YX7HmipXCA1B6/xTrSZHFyGZcFRvbLB90HKCkyXl3B
KISotjNHbZQhNqVDeo0rIPilMqXcbWGcZMJC9qy3fzq9HV+xuA0De/k4H74d4I/D+eny8vJn
I/+kxzsVNxSP+Lc5VTVeoTPAT6U9UfgEHIyrJDA67Fp1b6ZxBzEf7p3wTMfE7gx7v2da34DN
riIXGW+/dt84QECLTN11wkJsS1Tlv3cgBB8GQTTGFE2uVOUOZpgxLjeM1wvZ78RNNQhdHoEh
syRP412MD3/gg0+ih0YAnA/zvG5yfxH81ZVYYANx5VyUYIDYgAU01Fd2Hb48nh8v0Gd4wkyo
F9dgVtWdq2podNWhJG+jCcCkL3vXs/pBE1v2SdRGGOHh5m3PtbCWfaDHbj9iCLnAl0qd4zm4
+hZ3lloYtY35ZafRAjPdRjA2z1EPEMyfCONGllqtezonc5QYg4YmjCKiSZ1/unZeUMsYbKSp
XTMBrecdldbYvEW5GyKWWohVjITLFtR8zs5Jq8ZNbSI3piTL+KHV0oojD2kKxGgshmGyqXzL
scxDrX1BOw1gQjE97rAgQprmETkpWjPWLTYGNOXam+DZRkR4IpwvPe/H09N/lvyYmZz2cDrj
ykZ7FONVGI/PxgkGWVeayTT6L38aE53Nza6C4VZ1T93yJM5ho7lwL0cbOMZ1iBkTjXjVzxxc
G/5HITNZ0Pg1fYnwE6U3qxYv1JKfbX4Vilenji25vVms7zzXDhw6aGZh6CurLIr80noCycIa
C84ZispQV5/FPEtaObfBPgqWnRqQrTBLkZZ0G12YI/j71aj/ybaEP329QmzNAl1hSKFzjXdQ
Bbko0wHeXL/8MNCJqCmCdLazv90sF4Zo4Ft1n3TF0sxw5pXh4yI0fuBq4spKCFF7BoRWvDmK
yJSoXBv7tbFxlbZO6npsBsHNZagMB+mde3+6Sb2nRH2YjvtN1uAvhTlqrEFRgLcwnw6gwqam
iQQFYDHOCn8eMDKxGwlIESPcw2GuvGnEmuwW88mw7q3teCnEtPDwfgXWY1tEtRTb0iPWaV2A
t2NtJeTPTZtixIwwEmwtOi5jKg+LBKOm69Cgm41n/XkivOy2LY+0+cHdrsHaQBVxBLK3JPNU
TQ6EweNDggxACzqhi6bKA/ZzZeJ/bGXKMmmYAQA=

--LQksG6bCIzRHxTLp--
