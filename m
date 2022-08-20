Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE67F59B09A
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Aug 2022 23:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbiHTVk2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Aug 2022 17:40:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiHTVkV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 20 Aug 2022 17:40:21 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C2027CD9;
        Sat, 20 Aug 2022 14:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661031619; x=1692567619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LOzvEj7iLKGD5rk7k/t82D26qr+7N1ucQ2gJOw8QkWw=;
  b=Gmt44B9YAQdDiMeybd6ONq3VkwI1RPDUBldukTw5CjcyOdzJLB+a40Kd
   mV0U9e5t+qbaoBWWXtuR3IYWltq3obh+hiOKbWV6CAWtDaaF+SSscRjKx
   DEW9INlYFVpl8BKW4t+CvsevILB0OfYBXZYgm0siJLZgxZ75lHV+AlhSi
   4DT8EKPylejW68Odl7qL/dgJSzAD9G0TmqeCy9eBwwi/CWTr3mw8vaOXs
   mxq/DJSiFR2qwS9ONV+Mee2uMh5x5Zml/M5k2f2V2TP4R/aRj6eat2k+E
   YA/SWSsM70dkF7NrtK4ZjQpwpD1+LuE7Fmovuae+OnBPazUZ3/IqSo62I
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10445"; a="357184689"
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="357184689"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2022 14:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,251,1654585200"; 
   d="scan'208";a="641601976"
Received: from lkp-server01.sh.intel.com (HELO 44b6dac04a33) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Aug 2022 14:40:16 -0700
Received: from kbuild by 44b6dac04a33 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1oPWCV-0003Ex-1O;
        Sat, 20 Aug 2022 21:40:15 +0000
Date:   Sun, 21 Aug 2022 05:39:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Arminder Singh <arminders208@outlook.com>,
        linux-kernel@vger.kernel.org
Cc:     llvm@lists.linux.dev, kbuild-all@lists.01.org,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Hector Martin <marcan@marcan.st>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        Arminder Singh <arminders208@outlook.com>
Subject: Re: [PATCH] i2c: pasemi: Add IRQ support for Apple Silicon
Message-ID: <202208210548.MCoIwyQl-lkp@intel.com>
References: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR01MB535838492432C910F2381F929F6F9@MN2PR01MB5358.prod.exchangelabs.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Arminder,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on powerpc/next]
[also build test WARNING on linus/master v6.0-rc1 next-20220819]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arminder-Singh/i2c-pasemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
config: riscv-randconfig-r042-20220821 (https://download.01.org/0day-ci/archive/20220821/202208210548.MCoIwyQl-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c9a41fe60ab62f7a40049c100adcc8087a47669b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/98584b2b51d808ab582798c7a50511e8c1889ced
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Arminder-Singh/i2c-pasemi-Add-IRQ-support-for-Apple-Silicon/20220821-034703
        git checkout 98584b2b51d808ab582798c7a50511e8c1889ced
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/i2c/busses/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/i2c/busses/i2c-pasemi-core.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/i2c/busses/i2c-pasemi-core.c:86:6: warning: variable 'status' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (smbus->use_irq) {
               ^~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:92:12: note: uninitialized use occurs here
                   while (!(status & SMSTA_XEN) && timeout--) {
                            ^~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:86:2: note: remove the 'if' if its condition is always true
           if (smbus->use_irq) {
           ^~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-pasemi-core.c:83:21: note: initialize the variable 'status' to silence this warning
           unsigned int status;
                              ^
                               = 0
   8 warnings generated.


vim +86 drivers/i2c/busses/i2c-pasemi-core.c

    79	
    80	static int pasemi_smb_waitready(struct pasemi_smbus *smbus)
    81	{
    82		int timeout = 10;
    83		unsigned int status;
    84		unsigned int bitmask = SMSTA_XEN | SMSTA_MTN;
    85	
  > 86		if (smbus->use_irq) {
    87			reinit_completion(&smbus->irq_completion);
    88			reg_write(smbus, REG_IMASK, bitmask);
    89			wait_for_completion_timeout(&smbus->irq_completion, msecs_to_jiffies(10));
    90			status = reg_read(smbus, REG_SMSTA);
    91		} else {
    92			while (!(status & SMSTA_XEN) && timeout--) {
    93				msleep(1);
    94				status = reg_read(smbus, REG_SMSTA);
    95			}
    96		}
    97	
    98	
    99		/* Got NACK? */
   100		if (status & SMSTA_MTN)
   101			return -ENXIO;
   102	
   103		if (timeout < 0) {
   104			dev_warn(smbus->dev, "Timeout, status 0x%08x\n", status);
   105			reg_write(smbus, REG_SMSTA, status);
   106			return -ETIME;
   107		}
   108	
   109		/* Clear XEN */
   110		reg_write(smbus, REG_SMSTA, SMSTA_XEN);
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
