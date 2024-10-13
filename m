Return-Path: <linux-i2c+bounces-7348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 929B999B9A6
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 15:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EAA1281C6A
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 13:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F20140E30;
	Sun, 13 Oct 2024 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vwdl2COu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B428231CA8;
	Sun, 13 Oct 2024 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728826975; cv=none; b=XVzDJ+6yZhNyzVVdP5JjjAB95y2hr1GB2Rs+fu1CVPSiMYeB3CffHebOMQkPHXLOpRV2FUs2iYGGrbq9Sfi4KXvisAeoVfWCtv23l21OGVu7HbYf1pmHBKdu6H9l+Cx4yCfP1UMp8PAgswkaYkGmktr2Zy8ePdJjb7Zr4WSAfwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728826975; c=relaxed/simple;
	bh=XS5iblfw1egF4iIUL7nQOMVI6cY6Z0WNfAVeAajuod0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPNgNwpNyLg4dpkjPCnD6lDGgWnGWp7K3W0Ehho6aQVk7lPeY1PPgEAhxcLP6O17xbKzWovQgTOyIvXVgEUqWN1e9iCl9hrFielez/sC7l1NT5FiWZ6wwgKaDGYLtGk0VKUM+ByMRSLlTbEsgWRqXWlaJZWBR+3fxKqMpr5j8TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vwdl2COu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728826972; x=1760362972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XS5iblfw1egF4iIUL7nQOMVI6cY6Z0WNfAVeAajuod0=;
  b=Vwdl2COuTzKHuyPJhHn37kcS2gBYz0AtDjKfjwpA4Om1q5ImeVrHPYjr
   HFRil4GRHeqP6t6JODpfDUR+axdQpCPTrO/ZW5vr5/gT2fXBNemUpXqd1
   BafEYqf+rDwAx1/qu6vSDG2E0gGpICd0unkxL2VhBeI20n0W80kY0/6K7
   O4Mv9vqW3mNSmH7epaKLwGbVvn8TNvPLV8ri6EWqWt3Cv1JNgER+yr38U
   UJf4nrkkrz7c2h4+jRsTutyuB5/OfVeMu1v+crc9HSoxz5LH2/A4k7nUP
   PYjn2+8EflZ1Ivt9f3v2wf66Fm5Oi+gPEjeXKbX/OeMvk/uAPrSOTZkCd
   Q==;
X-CSE-ConnectionGUID: ZDIhcbMPTKKYuH9TPVJpQw==
X-CSE-MsgGUID: 6MnT2weFTYqi5O2CDPVH+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="27663435"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="27663435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 06:42:51 -0700
X-CSE-ConnectionGUID: LXyp+TOFRHqudCYB3U6i2w==
X-CSE-MsgGUID: lCrNGTVASvK6mJLG8hKoYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="81333291"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Oct 2024 06:42:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szyru-000EOh-2N;
	Sun, 13 Oct 2024 13:42:46 +0000
Date: Sun, 13 Oct 2024 21:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	andi.shyti@kernel.org, quic_bjorande@quicinc.com,
	--cc=linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, konrad.dybcio@linaro.org,
	quic_vdadhani@quicinc.com, vkoul@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Subject: Re: [PATCH v2] i2c: i2c-qcom-geni: Serve transfer during early
 resume stage
Message-ID: <202410132130.a2tOwnm4-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20241013 (https://download.01.org/0day-ci/archive/20241013/202410132130.a2tOwnm4-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410132130.a2tOwnm4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410132130.a2tOwnm4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qcom-geni.c:711:28: error: no member named 'usage_count' in 'struct dev_pm_info'
     711 |                         atomic_read(&dev->power.usage_count));
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
   1 error generated.


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

