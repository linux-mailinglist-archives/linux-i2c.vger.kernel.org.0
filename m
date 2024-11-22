Return-Path: <linux-i2c+bounces-8149-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D879D5EF9
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:44:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C78A3282B9A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F2EB1DE3AD;
	Fri, 22 Nov 2024 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPkuwGEY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E64171088;
	Fri, 22 Nov 2024 12:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279469; cv=none; b=uLCyV/FVBKtWNwLi7Lo/7/7Nr1ReGEKSRCGLBxeh5b+vgo1gtPlmiQrZgUBGipwBT5KILS3hemzbiDf5+aY0rQDDT2G/07mXo9oY62sjEr9pdj5/nHV+vVCLJHC9QOtrikJRFpyYYOkO8poOvqsh/ooKaxKVuZFY1Y2Tjl9/Pr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279469; c=relaxed/simple;
	bh=a6L8bDZxKPMnZtvq3uVndgDFaObpFZNFeuMCq2pyV4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0zA6SCInDKdOL9fi/cAzbZuWeEx3E8M5BYEJuZtw+R9z+8wH8bTubXVRHC82CaVvakD9yEete2pT+iS9Sk89blYrdkDELZ+MJEZy9ItB4rGSSG6qvHtxGsqq4p6gu5JU4Bm6KezwBtRjy1dAI3tKjV1GfCmxu6D2tUCeo2kgiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPkuwGEY; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732279468; x=1763815468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a6L8bDZxKPMnZtvq3uVndgDFaObpFZNFeuMCq2pyV4E=;
  b=ZPkuwGEYZFTt7BWmS2Svb3NTfSErULMS1egwVSYWUI/BG4goSjhBJsc2
   EeXan4n523cWkE5LNCMLguOofXxr8hhfxLfypqFGl4UrofMOFVq8g0kFG
   fKGtQXEABE0+5kn4AS50GZQQVpMEmgwsGwHkFhnf1fHxfcjh26cIX/x80
   wBL33+XyN8PTKUrurUDt1plKjilSYr/pHhF+iie6hXt4anpGeu8+kvD+g
   ZtRwAo7mNVdvCTjQ13Mh29jG/3CuxgwJDUalmOGiVMg/GLEysZLB/Dtyh
   Noq4K0dUUOr3J6xbdDRpJEnp20H2XM99E8zcb4zEFhY+8aNXQg7hi2/vB
   A==;
X-CSE-ConnectionGUID: rtZR4DdVQE25VoudoQs1ZA==
X-CSE-MsgGUID: s6dAJUZXTsCx/5HuTaqeBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32292108"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="32292108"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 04:44:27 -0800
X-CSE-ConnectionGUID: apjwOGZ6SnCvuUSBcXRW0Q==
X-CSE-MsgGUID: j+NhvyKuQFSawD3ZvvLQQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="95631636"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2024 04:44:25 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tET1K-0003uF-1g;
	Fri, 22 Nov 2024 12:44:22 +0000
Date: Fri, 22 Nov 2024 20:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	andi.shyti@kernel.org, quic_bjorande@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, --cc=konrad.dybcio@linaro.org,
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v3] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <202411222036.5u0o0jkd-lkp@intel.com>
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
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411222036.5u0o0jkd-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411222036.5u0o0jkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222036.5u0o0jkd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:610,
                    from include/asm-generic/bug.h:22,
                    from arch/m68k/include/asm/bug.h:32,
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
                    from drivers/i2c/busses/i2c-qcom-geni.c:4:
   drivers/i2c/busses/i2c-qcom-geni.c: In function 'geni_i2c_xfer':
>> drivers/i2c/busses/i2c-qcom-geni.c:706:48: error: 'struct dev_pm_info' has no member named 'usage_count'
     706 |                         atomic_read(&dev->power.usage_count));
         |                                                ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:705:17: note: in expansion of macro 'dev_dbg'
     705 |                 dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
         |                 ^~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:732:48: error: 'struct dev_pm_info' has no member named 'usage_count'
     732 |                         atomic_read(&dev->power.usage_count));
         |                                                ^
   include/linux/dynamic_debug.h:224:29: note: in definition of macro '__dynamic_func_call_cls'
     224 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:250:9: note: in expansion of macro '_dynamic_func_call_cls'
     250 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:9: note: in expansion of macro '_dynamic_func_call'
     273 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:9: note: in expansion of macro 'dynamic_dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:731:17: note: in expansion of macro 'dev_dbg'
     731 |                 dev_dbg(dev, "Runtime PM is disabled hence force suspend, pm_usage_count: %d\n",
         |                 ^~~~~~~


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

