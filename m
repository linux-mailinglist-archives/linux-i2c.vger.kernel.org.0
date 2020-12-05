Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCDE2CFEC0
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Dec 2020 21:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbgLEUUt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Dec 2020 15:20:49 -0500
Received: from mga06.intel.com ([134.134.136.31]:29758 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgLEUUt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Dec 2020 15:20:49 -0500
IronPort-SDR: lqipDvwjLFOPLLJU6ERh4bq7F5wm8zzdyOSwzcLpRDdyDwC7dBdeyxUTSAYJM0I3myxVHU5Ag6
 bj2gnZKNEMdw==
X-IronPort-AV: E=McAfee;i="6000,8403,9826"; a="235141852"
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; 
   d="gz'50?scan'50,208,50";a="235141852"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2020 12:20:06 -0800
IronPort-SDR: uM6fElgBdabCFSPWDfxhMeMLTJH0fQYgJs2CA4/4udTdkzGGF1mzHjK3hiEJAYzJP5oYuMBsGo
 LNws51TtoGNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,395,1599548400"; 
   d="gz'50?scan'50,208,50";a="436150695"
Received: from lkp-server01.sh.intel.com (HELO 47754f1311fc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Dec 2020 12:20:02 -0800
Received: from kbuild by 47754f1311fc with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kle2E-0000QF-3n; Sat, 05 Dec 2020 20:20:02 +0000
Date:   Sun, 6 Dec 2020 04:19:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        bugzilla-daemon@bugzilla.kernel.org
Cc:     kbuild-all@lists.01.org, jdelvare@suse.de, wsa@kernel.org,
        benjamin.tissoires@redhat.com, rui.zhang@intel.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marc Zyngier <maz@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
Subject: Re: genirq, i2c: Provide and use generic_dispatch_irq()
Message-ID: <202012060435.A10EfOaf-lkp@intel.com>
References: <87zh2s8buh.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <87zh2s8buh.fsf@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on wsa/i2c/for-next]
[also build test WARNING on tip/irq/core linux/master linus/master v5.10-rc6 next-20201204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Gleixner/genirq-i2c-Provide-and-use-generic_dispatch_irq/20201206-023308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: nds32-randconfig-r016-20201206 (attached as .config)
compiler: nds32le-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/79d4e8b739f9018dc2d95a25baf1199fbcf1fb03
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Thomas-Gleixner/genirq-i2c-Provide-and-use-generic_dispatch_irq/20201206-023308
        git checkout 79d4e8b739f9018dc2d95a25baf1199fbcf1fb03
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=nds32 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:50,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
   kernel/irq/irqdesc.c: In function 'generic_dispatch_irq':
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/irqflags.h:159:3: note: in expansion of macro 'typecheck'
     159 |   typecheck(unsigned long, flags); \
         |   ^~~~~~~~~
   include/linux/irqflags.h:225:36: note: in expansion of macro 'raw_local_irq_save'
     225 | #define local_irq_save(flags) do { raw_local_irq_save(flags); } while (0)
         |                                    ^~~~~~~~~~~~~~~~~~
   kernel/irq/irqdesc.c:669:2: note: in expansion of macro 'local_irq_save'
     669 |  local_irq_save(&flags);
         |  ^~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops.h:14,
                    from ./arch/nds32/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
   include/linux/irqflags.h:160:9: error: lvalue required as left operand of assignment
     160 |   flags = arch_local_irq_save();  \
         |         ^
   include/linux/irqflags.h:225:36: note: in expansion of macro 'raw_local_irq_save'
     225 | #define local_irq_save(flags) do { raw_local_irq_save(flags); } while (0)
         |                                    ^~~~~~~~~~~~~~~~~~
   kernel/irq/irqdesc.c:669:2: note: in expansion of macro 'local_irq_save'
     669 |  local_irq_save(&flags);
         |  ^~~~~~~~~~~~~~
   In file included from include/linux/spinlock.h:50,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
>> include/linux/typecheck.h:12:18: warning: comparison of distinct pointer types lacks a cast
      12 |  (void)(&__dummy == &__dummy2); \
         |                  ^~
   include/linux/irqflags.h:164:3: note: in expansion of macro 'typecheck'
     164 |   typecheck(unsigned long, flags); \
         |   ^~~~~~~~~
   include/linux/irqflags.h:226:39: note: in expansion of macro 'raw_local_irq_restore'
     226 | #define local_irq_restore(flags) do { raw_local_irq_restore(flags); } while (0)
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   kernel/irq/irqdesc.c:671:2: note: in expansion of macro 'local_irq_restore'
     671 |  local_irq_restore(&flags);
         |  ^~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/bitops.h:14,
                    from ./arch/nds32/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
>> kernel/irq/irqdesc.c:671:20: warning: passing argument 1 of 'arch_local_irq_restore' makes integer from pointer without a cast [-Wint-conversion]
     671 |  local_irq_restore(&flags);
         |                    ^~~~~~
         |                    |
         |                    long unsigned int *
   include/linux/irqflags.h:165:26: note: in definition of macro 'raw_local_irq_restore'
     165 |   arch_local_irq_restore(flags);  \
         |                          ^~~~~
   kernel/irq/irqdesc.c:671:2: note: in expansion of macro 'local_irq_restore'
     671 |  local_irq_restore(&flags);
         |  ^~~~~~~~~~~~~~~~~
   In file included from include/linux/irqflags.h:16,
                    from include/asm-generic/bitops.h:14,
                    from ./arch/nds32/include/generated/asm/bitops.h:1,
                    from include/linux/bitops.h:29,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/irq.h:14,
                    from kernel/irq/irqdesc.c:10:
   arch/nds32/include/asm/irqflags.h:27:57: note: expected 'long unsigned int' but argument is of type 'long unsigned int *'
      27 | static inline void arch_local_irq_restore(unsigned long flags)
         |                                           ~~~~~~~~~~~~~~^~~~~

vim +/arch_local_irq_restore +671 kernel/irq/irqdesc.c

   654	
   655	/**
   656	 * generic_dispatch_irq - Dispatch an interrupt from an interrupt handler
   657	 * @irq:	The irq number to handle
   658	 *
   659	 * A wrapper around generic_handle_irq() which ensures that interrupts are
   660	 * disabled when the primary handler of the dispatched irq is invoked.
   661	 * This is useful for interrupt handlers with dispatching to be safe for
   662	 * the forced threaded case.
   663	 */
   664	int generic_dispatch_irq(unsigned int irq)
   665	{
   666		unsigned long flags;
   667		int ret;
   668	
   669		local_irq_save(&flags);
   670		ret = generic_handle_irq(irq);
 > 671		local_irq_restore(&flags);
   672		return ret;
   673	}
   674	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--/9DWx/yDrRhgMJTb
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--/9DWx/yDrRhgMJTb--
