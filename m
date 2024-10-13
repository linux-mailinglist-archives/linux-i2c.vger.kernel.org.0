Return-Path: <linux-i2c+bounces-7349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFBF99B9B3
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 16:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 301A81F216A4
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17270231CA8;
	Sun, 13 Oct 2024 14:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChJ2lPfz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3457C13D53F;
	Sun, 13 Oct 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728829434; cv=none; b=qRdu7sGHSIn1uDOzxBpAlKrALYNPUR2YAWiaU99FbIDfNf0D/uCb5U5FpEXF1e1lLd/Yj6CUY/menkoOVhTygLXUyqF2aKgHgmCFJw7gI6Ioz2EqZTCYvG5khvdXIX67vnEm5vLjhJEUscqFvjSC/tcQ255vxUf2ihmMLgs3f9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728829434; c=relaxed/simple;
	bh=FKCht3dlIzVrM2kuflkGByOh0ou/oMsNfmAqIRIHkC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxw7Rpo9GHJfZaTtYBYxlXI4oHjhRwIwHytoZmr0Ea8fcJl/52uphMp6nlIxU4r1t8AlNrZGH3JjqBAZho02WkaklhS8nBxPnux+YIynp7ie7LpuqaNQ6lnjm+ZcTmviIGQ+cNucCFusuEGtJt9qlswMndRavWoAHNxgfy3FkuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChJ2lPfz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728829433; x=1760365433;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FKCht3dlIzVrM2kuflkGByOh0ou/oMsNfmAqIRIHkC4=;
  b=ChJ2lPfzw7eW8uB/pt1+X1tcj0sfVaB1zecHaau5DgHhD9qGaFl55Gzn
   2LSSRhF09HvXzE9pojsYNjjtlyaflTfOW28SG8dRZ8tZ/YFRarMNyZ/Vc
   wexIXpxd6PKnLT/DykO95pk/tGbEI84gOusjpJHK2qrHiwHSaOQ5JHGu+
   2DlMEq8jtBwr/ptwglmj2Y/++mCCRYcn/Ggu4XQmdSRKVBmvyculKGWae
   wv65TWa8oTEUJUcTdXXdROXzilNah/WVKrJbtlOPh8LRZCPP7zosxzR8h
   hAMzNOIM0bbuLwArc+KU2jBpdPYjOPkng9ZjGWMD5Xb3dXYjyGD3Z1hAq
   g==;
X-CSE-ConnectionGUID: N6lJw55wROuoLE7x2vYmRQ==
X-CSE-MsgGUID: ek68X4GBRi+JdvgCKVQInQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28274912"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28274912"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 07:23:52 -0700
X-CSE-ConnectionGUID: noKSmy2fRBmO3TKwbbGiZg==
X-CSE-MsgGUID: re0+LHujTWymZkHp7H5rAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,201,1725346800"; 
   d="scan'208";a="77260600"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Oct 2024 07:23:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szzVb-000EPz-2P;
	Sun, 13 Oct 2024 14:23:47 +0000
Date: Sun, 13 Oct 2024 22:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	andi.shyti@kernel.org, quic_bjorande@quicinc.com,
	--cc=linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: oe-kbuild-all@lists.linux.dev,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <202410132233.P25W2vKq-lkp@intel.com>
References: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011121757.2267336-1-quic_msavaliy@quicinc.com>

Hi Mukesh,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.12-rc2]
[also build test ERROR on linus/master]
[cannot apply to andi-shyti/i2c/i2c-host next-20241011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mukesh-Kumar-Savaliya/i2c-i2c-qcom-geni-Serve-transfer-during-early-resume-stage/20241011-202013
base:   v6.12-rc2
patch link:    https://lore.kernel.org/r/20241011121757.2267336-1-quic_msavaliy%40quicinc.com
patch subject: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early resume stage
config: arc-randconfig-001-20241013 (https://download.01.org/0day-ci/archive/20241013/202410132233.P25W2vKq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410132233.P25W2vKq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410132233.P25W2vKq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/device.h:15,
                    from include/linux/acpi.h:14,
                    from drivers/i2c/busses/i2c-qcom-geni.c:4:
   drivers/i2c/busses/i2c-qcom-geni.c: In function 'geni_i2c_xfer':
>> drivers/i2c/busses/i2c-qcom-geni.c:711:48: error: 'struct dev_pm_info' has no member named 'usage_count'
     711 |                         atomic_read(&dev->power.usage_count));
         |                                                ^
   include/linux/dev_printk.h:129:48: note: in definition of macro 'dev_printk'
     129 |                 _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
         |                                                ^~~~~~~~~~~
   drivers/i2c/busses/i2c-qcom-geni.c:710:17: note: in expansion of macro 'dev_dbg'
     710 |                 dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
         |                 ^~~~~~~


vim +711 drivers/i2c/busses/i2c-qcom-geni.c

   696	
   697	static int geni_i2c_xfer(struct i2c_adapter *adap,
   698				 struct i2c_msg msgs[],
   699				 int num)
   700	{
   701		struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
   702		struct device *dev = gi2c->se.dev;
   703		int ret;
   704	
   705		gi2c->err = 0;
   706		reinit_completion(&gi2c->done);
   707	
   708		/* Serve I2C transfer by forced resume whether Runtime PM is enbled or not */
   709		if (!pm_runtime_enabled(dev) && gi2c->suspended) {
   710			dev_dbg(dev, "Runtime PM is disabled hence force resume, pm_usage_count: %d\n",
 > 711				atomic_read(&dev->power.usage_count));
   712			ret = geni_i2c_force_resume(gi2c);
   713			if (ret)
   714				return ret;
   715		} else {
   716			ret = pm_runtime_get_sync(dev);
   717			if (ret == -EACCES && gi2c->suspended) {
   718				dev_dbg(dev, "pm_runtime_get_sync() failed-%d, force resume\n", ret);
   719				ret = geni_i2c_force_resume(gi2c);
   720				if (ret)
   721					return ret;
   722			}
   723		}
   724	
   725		qcom_geni_i2c_conf(gi2c);
   726	
   727		if (gi2c->gpi_mode)
   728			ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
   729		else
   730			ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
   731	
   732		/* Does Opposite to Forced Resume when runtime PM was not enabled and served
   733		 * Transfer via forced resume.
   734		 */
   735		if (!pm_runtime_enabled(dev) && !gi2c->suspended) {
   736			pm_runtime_put_noidle(dev);
   737			pm_runtime_set_suspended(dev);
   738			/* Reset flag same as runtime suspend, next xfer PM can be enabled */
   739			gi2c->suspended = 0;
   740		} else {
   741			pm_runtime_mark_last_busy(gi2c->se.dev);
   742			pm_runtime_put_autosuspend(gi2c->se.dev);
   743		}
   744	
   745		gi2c->cur = NULL;
   746		gi2c->err = 0;
   747		return ret;
   748	}
   749	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

