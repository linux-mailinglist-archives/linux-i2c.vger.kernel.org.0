Return-Path: <linux-i2c+bounces-636-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DED0080797C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 21:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DC1C1C20FD8
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Dec 2023 20:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ED14B13E;
	Wed,  6 Dec 2023 20:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aZHdcJst"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5FC193;
	Wed,  6 Dec 2023 12:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701895021; x=1733431021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TwXpWojOhICMzsUQAhDkNa70jLFpVVHewOVhowSZa7o=;
  b=aZHdcJstS5XRUr+IikgFDSUwjjW7Fi8VSs9g2Ac+OUv52c2dRkCPLQDq
   ANb6o4L3cjWe7XUFVnB0R0YboR/5JNtC9efwtmYAfLsYCx5zQ07K9hKVO
   DtUv8E+H9b0SO5VtcNVbTfkJmarOfVkxNnw2dQwk7dASje4dX24NruwCx
   kuXWSBs+ENrIcWUKQEqyC0bL9HeCnJ3GsLfWS7QcwYkZeTZxHASfaIaTc
   dsZyPR75vWaEETvsh58mTCsVh2mWyvZsVx2GxvKUkhLyCeOdgbouPbO7a
   3k3VqcqGEQqyh2ap4sPySNiz5Oun5F5xN9sQPAlcRONpZM5alwMKSB+kY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="1192491"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="1192491"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 12:37:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="12844066"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2023 12:36:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAydb-000BOg-0V;
	Wed, 06 Dec 2023 20:36:55 +0000
Date: Thu, 7 Dec 2023 04:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jensen Huang <jensenhuang@friendlyarm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: rk3x: fix potential spinlock recursion on poll
Message-ID: <202312070421.Lccd0PSI-lkp@intel.com>
References: <20231206090641.18849-1-jensenhuang@friendlyarm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206090641.18849-1-jensenhuang@friendlyarm.com>

Hi Jensen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jensen-Huang/i2c-rk3x-fix-potential-spinlock-recursion-on-poll/20231206-170807
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20231206090641.18849-1-jensenhuang%40friendlyarm.com
patch subject: [PATCH] i2c: rk3x: fix potential spinlock recursion on poll
config: arc-randconfig-r081-20231206 (https://download.01.org/0day-ci/archive/20231207/202312070421.Lccd0PSI-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070421.Lccd0PSI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070421.Lccd0PSI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-rk3x.c:223: warning: Function parameter or member 'irq' not described in 'rk3x_i2c'


vim +223 drivers/i2c/busses/i2c-rk3x.c

c41aa3ce938b68 Max Schwarz  2014-06-11  171  
0a6ad2f95f36bf David Wu     2016-05-16  172  /**
0a6ad2f95f36bf David Wu     2016-05-16  173   * struct rk3x_i2c - private data of the controller
0a6ad2f95f36bf David Wu     2016-05-16  174   * @adap: corresponding I2C adapter
0a6ad2f95f36bf David Wu     2016-05-16  175   * @dev: device for this controller
0a6ad2f95f36bf David Wu     2016-05-16  176   * @soc_data: related soc data struct
0a6ad2f95f36bf David Wu     2016-05-16  177   * @regs: virtual memory area
7e086c3fc2df09 David Wu     2016-05-16  178   * @clk: function clk for rk3399 or function & Bus clks for others
7e086c3fc2df09 David Wu     2016-05-16  179   * @pclk: Bus clk for rk3399
0a6ad2f95f36bf David Wu     2016-05-16  180   * @clk_rate_nb: i2c clk rate change notify
0a6ad2f95f36bf David Wu     2016-05-16  181   * @t: I2C known timing information
0a6ad2f95f36bf David Wu     2016-05-16  182   * @lock: spinlock for the i2c bus
0a6ad2f95f36bf David Wu     2016-05-16  183   * @wait: the waitqueue to wait for i2c transfer
0a6ad2f95f36bf David Wu     2016-05-16  184   * @busy: the condition for the event to wait for
0a6ad2f95f36bf David Wu     2016-05-16  185   * @msg: current i2c message
0a6ad2f95f36bf David Wu     2016-05-16  186   * @addr: addr of i2c slave device
0a6ad2f95f36bf David Wu     2016-05-16  187   * @mode: mode of i2c transfer
0a6ad2f95f36bf David Wu     2016-05-16  188   * @is_last_msg: flag determines whether it is the last msg in this transfer
0a6ad2f95f36bf David Wu     2016-05-16  189   * @state: state of i2c transfer
0a6ad2f95f36bf David Wu     2016-05-16  190   * @processed: byte length which has been send or received
0a6ad2f95f36bf David Wu     2016-05-16  191   * @error: error code for i2c transfer
0a6ad2f95f36bf David Wu     2016-05-16  192   */
c41aa3ce938b68 Max Schwarz  2014-06-11  193  struct rk3x_i2c {
c41aa3ce938b68 Max Schwarz  2014-06-11  194  	struct i2c_adapter adap;
c41aa3ce938b68 Max Schwarz  2014-06-11  195  	struct device *dev;
d032a2eb2e3b9f Julia Lawall 2018-01-02  196  	const struct rk3x_i2c_soc_data *soc_data;
c41aa3ce938b68 Max Schwarz  2014-06-11  197  
c41aa3ce938b68 Max Schwarz  2014-06-11  198  	/* Hardware resources */
c41aa3ce938b68 Max Schwarz  2014-06-11  199  	void __iomem *regs;
c41aa3ce938b68 Max Schwarz  2014-06-11  200  	struct clk *clk;
7e086c3fc2df09 David Wu     2016-05-16  201  	struct clk *pclk;
249051f49907e7 Max Schwarz  2014-11-20  202  	struct notifier_block clk_rate_nb;
58bb392dd4c7fc Jensen Huang 2023-12-06  203  	int irq;
c41aa3ce938b68 Max Schwarz  2014-06-11  204  
c41aa3ce938b68 Max Schwarz  2014-06-11  205  	/* Settings */
1ab92956d4aac5 David Wu     2016-03-17  206  	struct i2c_timings t;
c41aa3ce938b68 Max Schwarz  2014-06-11  207  
c41aa3ce938b68 Max Schwarz  2014-06-11  208  	/* Synchronization & notification */
c41aa3ce938b68 Max Schwarz  2014-06-11  209  	spinlock_t lock;
c41aa3ce938b68 Max Schwarz  2014-06-11  210  	wait_queue_head_t wait;
c41aa3ce938b68 Max Schwarz  2014-06-11  211  	bool busy;
c41aa3ce938b68 Max Schwarz  2014-06-11  212  
c41aa3ce938b68 Max Schwarz  2014-06-11  213  	/* Current message */
c41aa3ce938b68 Max Schwarz  2014-06-11  214  	struct i2c_msg *msg;
c41aa3ce938b68 Max Schwarz  2014-06-11  215  	u8 addr;
c41aa3ce938b68 Max Schwarz  2014-06-11  216  	unsigned int mode;
c41aa3ce938b68 Max Schwarz  2014-06-11  217  	bool is_last_msg;
c41aa3ce938b68 Max Schwarz  2014-06-11  218  
c41aa3ce938b68 Max Schwarz  2014-06-11  219  	/* I2C state machine */
c41aa3ce938b68 Max Schwarz  2014-06-11  220  	enum rk3x_i2c_state state;
0a6ad2f95f36bf David Wu     2016-05-16  221  	unsigned int processed;
c41aa3ce938b68 Max Schwarz  2014-06-11  222  	int error;
c41aa3ce938b68 Max Schwarz  2014-06-11 @223  };
c41aa3ce938b68 Max Schwarz  2014-06-11  224  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

