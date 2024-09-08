Return-Path: <linux-i2c+bounces-6358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 299719707D6
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 15:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8B441F21B88
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F646166F05;
	Sun,  8 Sep 2024 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQcGR9F4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D298161306;
	Sun,  8 Sep 2024 13:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725802343; cv=none; b=FLCJTGyDryETPtpnD/eTb3HdWDJCoOdRD6pAsPgXWeFYujxI7xEWgzBXHpdgUrJtFFQMpxkOKWrGCN9kxYLMberfZEBbGzapV8pW6j7JD27Bnaq1Y2p1zwIQGCA7txT23RKNgrI0ss5ZoeutgP3fT+7qaDOj4JSQMhadKkqB5cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725802343; c=relaxed/simple;
	bh=6bArD0WILUY5I5Fe0W9HdSzvuwHGO4vcaHpwE4fX98Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNC/Dm57kvMAoAFCR/faSshwDKPcxPY84z21njTQyFgKmk3pT7lM4R9g8NlDfuXgZZQ1/S43bExFU7XTXdrSmmrxwRSxit6BbRspc70wwNRWvY9mdgdGq8vDeiVAHLkuzUqol4AL0f5RUiqdmf1ITInqQQds1b6mU6GaJsU0ZWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQcGR9F4; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725802340; x=1757338340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6bArD0WILUY5I5Fe0W9HdSzvuwHGO4vcaHpwE4fX98Q=;
  b=LQcGR9F462GYsBm86f/M85O45aTOUBua/6w/Zbo5oOluSrERGUhKTJKr
   qbMLgFFBMYZz2ovMTZ6DzhMNs3dKNr1bQZcRYisUB4ipQ1aFLjc6/u20G
   rmoqSQ/6vuRfP0SifmfWv/UiT6NvYDkeIr5MKZ654ybFxn3aWSIiKvU01
   5xTSj17VjmmR3VLjxfH5i+9h6bLFBO7/tm9Z4krFcDNakmmmg/2ioxzKU
   O16LRmZ8Fk5tqfStzpEbnTHfkT9VFNnWAu9KS99cGHWZaLYuTcZlYRW4N
   NMdQ6vn2HRLJXRTqsl37IJO2lXZRG/62FEfT/5CQ7RRdsOnDLkwKato/s
   A==;
X-CSE-ConnectionGUID: T4piLYn9Sjy2KV1Zn6xf2w==
X-CSE-MsgGUID: UdSLXjr4RJ+Y3/+h3tbj8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35876032"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="35876032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 06:32:20 -0700
X-CSE-ConnectionGUID: s95PrwJrR3ClxUDgnyccWw==
X-CSE-MsgGUID: hu3CmFqKQx+YIIp98nYT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="89681106"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2024 06:32:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snI1X-000DZb-0i;
	Sun, 08 Sep 2024 13:32:15 +0000
Date: Sun, 8 Sep 2024 21:31:41 +0800
From: kernel test robot <lkp@intel.com>
To: kimriver liu <kimriver.liu@siengine.com>, jarkko.nikula@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev, andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com, jsd@semihalf.com,
	andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, kimriver.liu@siengine.com
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Message-ID: <202409082011.9JF6aYsk-lkp@intel.com>
References: <20240905074211.2278-1-kimriver.liu@siengine.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905074211.2278-1-kimriver.liu@siengine.com>

Hi kimriver,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc6 next-20240906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kimriver-liu/i2c-designware-fix-master-is-holding-SCL-low-while-ENABLE-bit-is-disabled/20240905-154711
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240905074211.2278-1-kimriver.liu%40siengine.com
patch subject: [PATCH] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409082011.9JF6aYsk-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409082011.9JF6aYsk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409082011.9JF6aYsk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-designware-common.c: In function '__i2c_dw_disable':
>> drivers/i2c/busses/i2c-designware-common.c:538:32: error: 'DW_IC_ENABLE_ENABLE' undeclared (first use in this function); did you mean 'DW_IC_ENABLE_STATUS'?
     538 |                 if (!(enable & DW_IC_ENABLE_ENABLE)) {
         |                                ^~~~~~~~~~~~~~~~~~~
         |                                DW_IC_ENABLE_STATUS
   drivers/i2c/busses/i2c-designware-common.c:538:32: note: each undeclared identifier is reported only once for each function it appears in


vim +538 drivers/i2c/busses/i2c-designware-common.c

   523	
   524	void __i2c_dw_disable(struct dw_i2c_dev *dev)
   525	{
   526		unsigned int raw_intr_stats;
   527		unsigned int enable;
   528		int timeout = 100;
   529		bool abort_needed;
   530		unsigned int status;
   531		int ret;
   532	
   533		regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &raw_intr_stats);
   534		regmap_read(dev->map, DW_IC_ENABLE, &enable);
   535	
   536		abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
   537		if (abort_needed) {
 > 538			if (!(enable & DW_IC_ENABLE_ENABLE)) {
   539				regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
   540				enable |= DW_IC_ENABLE_ENABLE;
   541	
   542				/*
   543				 * Wait two ic_clk delay when enabling the i2c to ensure ENABLE bit
   544				 * is already set by the driver (for 400KHz this is 25us)
   545				 * as described in the DesignWare I2C databook.
   546				 */
   547				fsleep(25);
   548			}
   549	
   550			regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
   551			ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
   552						       !(enable & DW_IC_ENABLE_ABORT), 10,
   553						       100);
   554			if (ret)
   555				dev_err(dev->dev, "timeout while trying to abort current transfer\n");
   556		}
   557	
   558		do {
   559			__i2c_dw_disable_nowait(dev);
   560			/*
   561			 * The enable status register may be unimplemented, but
   562			 * in that case this test reads zero and exits the loop.
   563			 */
   564			regmap_read(dev->map, DW_IC_ENABLE_STATUS, &status);
   565			if ((status & 1) == 0)
   566				return;
   567	
   568			/*
   569			 * Wait 10 times the signaling period of the highest I2C
   570			 * transfer supported by the driver (for 400KHz this is
   571			 * 25us) as described in the DesignWare I2C databook.
   572			 */
   573			usleep_range(25, 250);
   574		} while (timeout--);
   575	
   576		dev_warn(dev->dev, "timeout in disabling adapter\n");
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

