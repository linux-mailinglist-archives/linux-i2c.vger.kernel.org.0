Return-Path: <linux-i2c+bounces-8131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C84479D5A57
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 08:51:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D85E1F23115
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 07:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E400188CA1;
	Fri, 22 Nov 2024 07:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwlBo9/t"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C79118990D;
	Fri, 22 Nov 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261866; cv=none; b=UwD4KYjT1mVuEhunAIH7b3rLhKKH5GPHUyjePqTf+plY2BZ0YELBY9qdOpUh6J0saWL0Flou/F8qvUE9PcebWo5hZ5yfKp/VHNmQyyeFGAc+2ezSbnkDUI8Xxf4wP/StaQcFiZH7w8MZbu2dEnPtLmIgjlURmllo04kx07PalDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261866; c=relaxed/simple;
	bh=ZZGSD+Tf9pw4+mC1CBo9amMXhYpAa31/QE57BMBPaxg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV5pnSx84fj6xvUBkGiBHuqEDxDl7DcILLbMuAhx0FQFrOVe6iSE5ohulQAd1eSKY1Zug37+vHt5kg7u/0UwXkjBdgIx0KpZA/LZxfAIWXUrCgLwfA4WLEnVY8hV6S/iQjLXoB8krrqDj2v/qexdvedBnWS392nX0psQOynCbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwlBo9/t; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732261863; x=1763797863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZZGSD+Tf9pw4+mC1CBo9amMXhYpAa31/QE57BMBPaxg=;
  b=RwlBo9/t8blxKhSMNMpR4YBxuFTHRfp65pUp9JkiwuhzG1yYixvI6fJA
   UNiMgBTdfXw46XRUntbWMNvRgtIONJ8Zu2CKA3c+iZoiHTdFEqvHwsrAX
   DxfhVEr/DqWEm9+sv7T55CfP9GA161TtpFJndnchDQgwR1Gmh7737oHt9
   R8LvP9lQ9TK6mt0NNUkLn6NYmZEFnbbA6Is+Gaim988EtxWbO+qQLEfol
   kI6992JEBRxCfEuoK4xJ69OGj7IbUWefxHcwvDj0SCOzhK6E8Cse3ZysU
   HlIUbYKJ+ooZaW+QQgBC6Jhh7ADrRSdsnrA5x0e9F5mLaw/+rWJqydYow
   Q==;
X-CSE-ConnectionGUID: motnuL3YTX2TwQYzP8PVGA==
X-CSE-MsgGUID: clmGffkJQhqlvSE2LWxzjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32156850"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32156850"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 23:51:03 -0800
X-CSE-ConnectionGUID: nBgbhrT/TK+xGGAPGMHUJQ==
X-CSE-MsgGUID: PPr96EqHTdWlSloqZgrpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="91294935"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 Nov 2024 23:51:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEORN-0003lz-2n;
	Fri, 22 Nov 2024 07:50:57 +0000
Date: Fri, 22 Nov 2024 15:50:37 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	andi.shyti@kernel.org, quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, --cc=konrad.dybcio@linaro.org,
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <202411221541.mTqJTK6J-lkp@intel.com>
References: <20241119143031.3331753-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119143031.3331753-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241120]
[also build test ERROR on linus/master]
[cannot apply to v6.12 v6.12-rc7 v6.12-rc6 v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Savaliya/i2c-i2c-qcom-geni-Serve-transfer-during-early-resume-stage/20241121-124240
base:   next-20241120
patch link:    https://lore.kernel.org/r/20241119143031.3331753-1-quic_msavaliy%40quicinc.com
patch subject: [PATCH v3] i2c: i2c-qcom-geni: Serve transfer during early resume stage
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411221541.mTqJTK6J-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221541.mTqJTK6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221541.mTqJTK6J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-qcom-geni.c:6:
   In file included from include/linux/dmaengine.h:12:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i2c/busses/i2c-qcom-geni.c:706:28: error: no member named 'usage_count' in 'struct dev_pm_info'
     706 |                         atomic_read(&dev->power.usage_count));
         |                                      ~~~~~~~~~~ ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:732:28: error: no member named 'usage_count' in 'struct dev_pm_info'
     732 |                         atomic_read(&dev->power.usage_count));
         |                                      ~~~~~~~~~~ ^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:274:19: note: expanded from macro 'dynamic_dev_dbg'
     274 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:59: note: expanded from macro '_dynamic_func_call'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:248:65: note: expanded from macro '_dynamic_func_call_cls'
     248 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:224:15: note: expanded from macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 warning and 2 errors generated.


vim +706 drivers/i2c/busses/i2c-qcom-geni.c

   692	
   693	static int geni_i2c_xfer(struct i2c_adapter *adap,
   694				 struct i2c_msg msgs[],
   695				 int num)
   696	{
   697		struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
   698		struct device *dev = gi2c->se.dev;
   699		int ret;
   700	
   701		gi2c->err = 0;
   702		reinit_completion(&gi2c->done);
   703		/* Serve I2C transfer by forced resume if Runtime PM is enbled or not */
   704		if (!pm_runtime_enabled(dev) && gi2c->suspended) {
   705			dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
 > 706				atomic_read(&dev->power.usage_count));
   707			ret = pm_runtime_force_resume(dev);
   708			if (ret)
   709				return ret;
   710		} else {
   711			ret = pm_runtime_get_sync(gi2c->se.dev);
   712			if (ret < 0) {
   713				dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
   714				pm_runtime_put_noidle(gi2c->se.dev);
   715				/* Set device in suspended since resume failed */
   716				pm_runtime_set_suspended(gi2c->se.dev);
   717				return ret;
   718			}
   719		}
   720	
   721		qcom_geni_i2c_conf(gi2c);
   722	
   723		if (gi2c->gpi_mode)
   724			ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
   725		else
   726			ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
   727	
   728		/* if Runtime PM is disabled, do force_suspend() else autosuspend the driver */
   729		if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
   730			ret = pm_runtime_force_suspend(dev);
   731			dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
   732				atomic_read(&dev->power.usage_count));
   733			if (ret)
   734				return ret;
   735		} else {
   736			pm_runtime_mark_last_busy(gi2c->se.dev);
   737			pm_runtime_put_autosuspend(gi2c->se.dev);
   738		}
   739	
   740		gi2c->cur = NULL;
   741		gi2c->err = 0;
   742		return ret;
   743	}
   744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

