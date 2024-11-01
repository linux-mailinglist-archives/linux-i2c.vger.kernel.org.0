Return-Path: <linux-i2c+bounces-7741-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E02339B9B4A
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Nov 2024 00:52:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E5321C2118B
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDD01D151F;
	Fri,  1 Nov 2024 23:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFhUtwN9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D11CDA12;
	Fri,  1 Nov 2024 23:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730505130; cv=none; b=rRsQU8uw4uxiBxQoQc66NE37lGOOPSUmK9YBW6QCH3kNSNWCki3X4dvoHPUb/Vhe5m1pFYaR0e+pf069kSCLUyTqjhCNNOq9eDnoGePn5cZXhlZ55I9bgrGJEv1rNpMuoG8xpb5/juPhs/2pVdincFk1hvNwVIVZiByjP0C5bXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730505130; c=relaxed/simple;
	bh=3XNzd47DzJF9Xy7WSn96z+8TAU5mZRVr9fN33iaAAxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lx7uSnAEwfDMCRVwog4pchFWuNezpDBywsSEe8RKlCmhqmLMUqcBVxO3KR5Na0TJ6phjezzDXMrSNSSkQXIjIsMTQRRdh+QZt8afcYUyPqqr5s4CeC2FdI7zB2Tv86ZIrTfVMNJaUq8eMxXub//sJ9nD9mE7cg3cIrjWiq6lMoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFhUtwN9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730505128; x=1762041128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XNzd47DzJF9Xy7WSn96z+8TAU5mZRVr9fN33iaAAxk=;
  b=EFhUtwN9QYgjEujnVlEIQ3O6s5FFsM/OhDoZ8FMlqkMp6QBCha/FrXE5
   iuo1fOZn5MKn2uK7m4PelfSIki6e6cFlgzsLU5RPT6uzqR81k1v1r7rXa
   Y16AE1O80pUYhIhftWfKzatKsAuNzXrtz6yqMjh5lpMq9WlTK+f9IqscI
   5v1fr0HZe07jm4ugXIWGkgAmWTYmxRprlnjfWZhArwH3S54r9YJKcNgcM
   YDwERSzLAkix9oCC73KwNW1EzmNhUSCRzXZfJsFZ3VBYPcvVI/HnGaqJa
   O/vrV1TjIUeqhvG/fEe9S2ksZ1OkYhXxHVd/bKsZhjukHP+QJjNZwJE1U
   Q==;
X-CSE-ConnectionGUID: 1wUt/ZslQrarCVpGYYsCnA==
X-CSE-MsgGUID: yFpuAhN5SyWxyKsd0Jvfgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52846554"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52846554"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 16:52:07 -0700
X-CSE-ConnectionGUID: 1tHeiE+aQBOIkvye/cKc7A==
X-CSE-MsgGUID: CfEzt5v4Qfuq8zZgZY0/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,251,1725346800"; 
   d="scan'208";a="120574759"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Nov 2024 16:52:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t71Qx-000iBN-0J;
	Fri, 01 Nov 2024 23:52:03 +0000
Date: Sat, 2 Nov 2024 07:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
Message-ID: <202411020703.U4QYsqjF-lkp@intel.com>
References: <20241101131103.3679560-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101131103.3679560-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.12-rc5 next-20241101]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-busses-Use-y-instead-of-objs-in-Makefile/20241101-211148
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20241101131103.3679560-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] i2c: busses: Use *-y instead of *-objs in Makefile
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241102/202411020703.U4QYsqjF-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241102/202411020703.U4QYsqjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411020703.U4QYsqjF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-at91-slave.c: In function 'atmel_twi_interrupt_slave':
>> drivers/i2c/busses/i2c-at91-slave.c:28:44: error: 'struct at91_twi_dev' has no member named 'slave'
      28 |                         i2c_slave_event(dev->slave,
         |                                            ^~
   drivers/i2c/busses/i2c-at91-slave.c:34:44: error: 'struct at91_twi_dev' has no member named 'slave'
      34 |                         i2c_slave_event(dev->slave,
         |                                            ^~
   drivers/i2c/busses/i2c-at91-slave.c:44:36: error: 'struct at91_twi_dev' has no member named 'slave'
      44 |                 i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &value);
         |                                    ^~
   drivers/i2c/busses/i2c-at91-slave.c:51:36: error: 'struct at91_twi_dev' has no member named 'slave'
      51 |                 i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
         |                                    ^~
   drivers/i2c/busses/i2c-at91-slave.c:59:36: error: 'struct at91_twi_dev' has no member named 'slave'
      59 |                 i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &value);
         |                                    ^~
   drivers/i2c/busses/i2c-at91-slave.c: In function 'at91_reg_slave':
   drivers/i2c/busses/i2c-at91-slave.c:69:16: error: 'struct at91_twi_dev' has no member named 'slave'
      69 |         if (dev->slave)
         |                ^~
   drivers/i2c/busses/i2c-at91-slave.c:78:12: error: 'struct at91_twi_dev' has no member named 'slave'
      78 |         dev->slave = slave;
         |            ^~
>> drivers/i2c/busses/i2c-at91-slave.c:79:14: error: 'struct at91_twi_dev' has no member named 'smr'; did you mean 'imr'?
      79 |         dev->smr = AT91_TWI_SMR_SADR(slave->addr);
         |              ^~~
         |              imr
   In file included from arch/m68k/include/asm/bug.h:32,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/i2c/busses/i2c-at91-slave.c:9:
   drivers/i2c/busses/i2c-at91-slave.c: In function 'at91_unreg_slave':
   drivers/i2c/busses/i2c-at91-slave.c:93:21: error: 'struct at91_twi_dev' has no member named 'slave'
      93 |         WARN_ON(!dev->slave);
         |                     ^~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   drivers/i2c/busses/i2c-at91-slave.c:97:12: error: 'struct at91_twi_dev' has no member named 'slave'
      97 |         dev->slave = NULL;
         |            ^~
   drivers/i2c/busses/i2c-at91-slave.c:98:14: error: 'struct at91_twi_dev' has no member named 'smr'; did you mean 'imr'?
      98 |         dev->smr = 0;
         |              ^~~
         |              imr
   drivers/i2c/busses/i2c-at91-slave.c: At top level:
>> drivers/i2c/busses/i2c-at91-slave.c:118:5: error: redefinition of 'at91_twi_probe_slave'
     118 | int at91_twi_probe_slave(struct platform_device *pdev,
         |     ^~~~~~~~~~~~~~~~~~~~
   In file included from drivers/i2c/busses/i2c-at91-slave.c:13:
   drivers/i2c/busses/i2c-at91.h:185:19: note: previous definition of 'at91_twi_probe_slave' with type 'int(struct platform_device *, u32,  struct at91_twi_dev *)' {aka 'int(struct platform_device *, unsigned int,  struct at91_twi_dev *)'}
     185 | static inline int at91_twi_probe_slave(struct platform_device *pdev,
         |                   ^~~~~~~~~~~~~~~~~~~~
>> drivers/i2c/busses/i2c-at91-slave.c:135:6: error: redefinition of 'at91_init_twi_bus_slave'
     135 | void at91_init_twi_bus_slave(struct at91_twi_dev *dev)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-at91.h:184:20: note: previous definition of 'at91_init_twi_bus_slave' with type 'void(struct at91_twi_dev *)'
     184 | static inline void at91_init_twi_bus_slave(struct at91_twi_dev *dev) {}
         |                    ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-at91-slave.c: In function 'at91_init_twi_bus_slave':
   drivers/i2c/busses/i2c-at91-slave.c:138:41: error: 'struct at91_twi_dev' has no member named 'smr'; did you mean 'imr'?
     138 |         if (dev->slave_detected && dev->smr) {
         |                                         ^~~
         |                                         imr
   drivers/i2c/busses/i2c-at91-slave.c:139:56: error: 'struct at91_twi_dev' has no member named 'smr'; did you mean 'imr'?
     139 |                 at91_twi_write(dev, AT91_TWI_SMR, dev->smr);
         |                                                        ^~~
         |                                                        imr

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +28 drivers/i2c/busses/i2c-at91-slave.c

9d3ca54b550ca0 Juergen Fitschen 2019-02-22   14  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   15  static irqreturn_t atmel_twi_interrupt_slave(int irq, void *dev_id)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   16  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   17  	struct at91_twi_dev *dev = dev_id;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   18  	const unsigned status = at91_twi_read(dev, AT91_TWI_SR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   19  	const unsigned irqstatus = status & at91_twi_read(dev, AT91_TWI_IMR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   20  	u8 value;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   21  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   22  	if (!irqstatus)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   23  		return IRQ_NONE;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   24  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   25  	/* slave address has been detected on I2C bus */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   26  	if (irqstatus & AT91_TWI_SVACC) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   27  		if (status & AT91_TWI_SVREAD) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  @28  			i2c_slave_event(dev->slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   29  					I2C_SLAVE_READ_REQUESTED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   30  			writeb_relaxed(value, dev->base + AT91_TWI_THR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   31  			at91_twi_write(dev, AT91_TWI_IER,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   32  				       AT91_TWI_TXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   33  		} else {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   34  			i2c_slave_event(dev->slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   35  					I2C_SLAVE_WRITE_REQUESTED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   36  			at91_twi_write(dev, AT91_TWI_IER,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   37  				       AT91_TWI_RXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   38  		}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   39  		at91_twi_write(dev, AT91_TWI_IDR, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   40  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   41  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   42  	/* byte transmitted to remote master */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   43  	if (irqstatus & AT91_TWI_TXRDY) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   44  		i2c_slave_event(dev->slave, I2C_SLAVE_READ_PROCESSED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   45  		writeb_relaxed(value, dev->base + AT91_TWI_THR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   46  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   47  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   48  	/* byte received from remote master */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   49  	if (irqstatus & AT91_TWI_RXRDY) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   50  		value = readb_relaxed(dev->base + AT91_TWI_RHR);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   51  		i2c_slave_event(dev->slave, I2C_SLAVE_WRITE_RECEIVED, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   52  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   53  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   54  	/* master sent stop */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   55  	if (irqstatus & AT91_TWI_EOSACC) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   56  		at91_twi_write(dev, AT91_TWI_IDR,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   57  			       AT91_TWI_TXRDY | AT91_TWI_RXRDY | AT91_TWI_EOSACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   58  		at91_twi_write(dev, AT91_TWI_IER, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   59  		i2c_slave_event(dev->slave, I2C_SLAVE_STOP, &value);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   60  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   61  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   62  	return IRQ_HANDLED;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   63  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   64  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   65  static int at91_reg_slave(struct i2c_client *slave)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   66  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   67  	struct at91_twi_dev *dev = i2c_get_adapdata(slave->adapter);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   68  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  @69  	if (dev->slave)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   70  		return -EBUSY;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   71  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   72  	if (slave->flags & I2C_CLIENT_TEN)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   73  		return -EAFNOSUPPORT;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   74  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   75  	/* Make sure twi_clk doesn't get turned off! */
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   76  	pm_runtime_get_sync(dev->dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   77  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   78  	dev->slave = slave;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  @79  	dev->smr = AT91_TWI_SMR_SADR(slave->addr);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   80  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   81  	at91_init_twi_bus(dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   82  	at91_twi_write(dev, AT91_TWI_IER, AT91_TWI_SVACC);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   83  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   84  	dev_info(dev->dev, "entered slave mode (ADR=%d)\n", slave->addr);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   85  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   86  	return 0;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   87  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   88  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   89  static int at91_unreg_slave(struct i2c_client *slave)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   90  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   91  	struct at91_twi_dev *dev = i2c_get_adapdata(slave->adapter);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   92  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   93  	WARN_ON(!dev->slave);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   94  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   95  	dev_info(dev->dev, "leaving slave mode\n");
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   96  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  @97  	dev->slave = NULL;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   98  	dev->smr = 0;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22   99  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  100  	at91_init_twi_bus(dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  101  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  102  	pm_runtime_put(dev->dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  103  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  104  	return 0;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  105  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  106  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  107  static u32 at91_twi_func(struct i2c_adapter *adapter)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  108  {
d6d5645e5fc123 Jean Delvare     2024-05-31  109  	return I2C_FUNC_SLAVE;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  110  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  111  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  112  static const struct i2c_algorithm at91_twi_algorithm_slave = {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  113  	.reg_slave	= at91_reg_slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  114  	.unreg_slave	= at91_unreg_slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  115  	.functionality	= at91_twi_func,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  116  };
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  117  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22 @118  int at91_twi_probe_slave(struct platform_device *pdev,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  119  			 u32 phy_addr, struct at91_twi_dev *dev)
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  120  {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  121  	int rc;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  122  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  123  	rc = devm_request_irq(&pdev->dev, dev->irq, atmel_twi_interrupt_slave,
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  124  			      0, dev_name(dev->dev), dev);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  125  	if (rc) {
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  126  		dev_err(dev->dev, "Cannot get irq %d: %d\n", dev->irq, rc);
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  127  		return rc;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  128  	}
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  129  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  130  	dev->adapter.algo = &at91_twi_algorithm_slave;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  131  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  132  	return 0;
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  133  }
9d3ca54b550ca0 Juergen Fitschen 2019-02-22  134  
9d3ca54b550ca0 Juergen Fitschen 2019-02-22 @135  void at91_init_twi_bus_slave(struct at91_twi_dev *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

