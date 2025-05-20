Return-Path: <linux-i2c+bounces-11085-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9137EABE4BF
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 22:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D7B1B66A47
	for <lists+linux-i2c@lfdr.de>; Tue, 20 May 2025 20:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D17528C85E;
	Tue, 20 May 2025 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwFkArGp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF0428C2CF;
	Tue, 20 May 2025 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747773095; cv=none; b=se7gdbgiiLtATVW56cK1X5kVJ++vjSZTCMeYKVkvpfoJJJLu5A/3ADG/d/WztA3YPnqBxVzhm49c4iy7ZPr7o6iMR0xYn+W4Kr8MkKwvnbxDE8Ok5NdI2bvVgRu0pomhi6pihDBeb8YyBIcTfM8nGFgEkPiiAzNyRxqxQjLSugE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747773095; c=relaxed/simple;
	bh=3GWxq42/tgSqBxgPB7yrDRaLb7a882QSAs5qQK5Arp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxSDwfZbZt0O9gNOJxCGqt3xr22Ua8ZBRVXPIXHgdWnNfzD/dlCcQ+cyiq39AIcCVIdN2UzvbGNdewZrAN0HjEakoJAvrYWZUtlWlrunzBmLhgoKuJe2toNU+s7xiFtT/HNznNSkvKQvZN1Hh2uKFiL0YW4GpikiC4b6vMhyLYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwFkArGp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747773093; x=1779309093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3GWxq42/tgSqBxgPB7yrDRaLb7a882QSAs5qQK5Arp4=;
  b=MwFkArGpeogcwVgPjgL2rJMTtRAcbp9562nAO5+Ho28kuMYAZgAPA45R
   YucRJdLLEipn66ji1PB36597lvHwlgT6I0mpng0ReYBqGVtRx+281SUfg
   2CKNbgmiiskW+rDoF7hSY782cSM8MST3TckWrwYVVVsNfc657cl7cI1H4
   XBzGphp60vK8nA9qGxFaRdqUU2OklW+eF4H0XyosxWMbcyFUlFlfnxIG2
   hjHbCredLgRrG1IBkzu/qlYfp5AiHhWZCR0YwI8Kw1oHh8tZ3VqV6H0jg
   /Rh1yTKt2H46rY/GJbY2wzAH81dPsJjRj9VG8j1ozzLiGj5Rwa85vdMSL
   A==;
X-CSE-ConnectionGUID: zq8BqAp1QEGwr3K86DZSxg==
X-CSE-MsgGUID: pKLRBb06Sc2bf3jBiEhCLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49861355"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49861355"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 13:31:32 -0700
X-CSE-ConnectionGUID: q0AcIwtGTrC78y+QjzCHfg==
X-CSE-MsgGUID: JQOZXCiKQOu/6s3LgSjiSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="176941458"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 May 2025 13:31:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHTcW-000NXg-0K;
	Tue, 20 May 2025 20:31:28 +0000
Date: Wed, 21 May 2025 04:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>, andi.shyti@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Message-ID: <202505210438.G4nfkpQ2-lkp@intel.com>
References: <20250519141918.2522-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519141918.2522-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.15-rc7 next-20250516]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/i2c-qup-Add-error-handling-in-qup_i2c_xfer_v2/20250519-222137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250519141918.2522-1-vulab%40iscas.ac.cn
patch subject: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
config: hexagon-randconfig-001-20250521 (https://download.01.org/0day-ci/archive/20250521/202505210438.G4nfkpQ2-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505210438.G4nfkpQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505210438.G4nfkpQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qup.c:1619:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1619 |         if (!ret)
         |             ^~~~
   drivers/i2c/busses/i2c-qup.c:1621:6: note: uninitialized use occurs here
    1621 |         if (err)
         |             ^~~
   drivers/i2c/busses/i2c-qup.c:1619:2: note: remove the 'if' if its condition is always true
    1619 |         if (!ret)
         |         ^~~~~~~~~
    1620 |                 err = qup_i2c_change_state(qup, QUP_RESET_STATE);
   drivers/i2c/busses/i2c-qup.c:1570:14: note: initialize the variable 'err' to silence this warning
    1570 |         int ret, err, idx = 0;
         |                     ^
         |                      = 0
   1 warning generated.


vim +1619 drivers/i2c/busses/i2c-qup.c

7545c7dba169c4 Abhishek Sahu         2018-03-12  1564  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1565  static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1566  			   struct i2c_msg msgs[],
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1567  			   int num)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1568  {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1569  	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
61f647e9d36d67 Wentao Liang          2025-05-19  1570  	int ret, err, idx = 0;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1571  
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1572  	qup->bus_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1573  	qup->qup_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1574  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1575  	ret = pm_runtime_get_sync(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1576  	if (ret < 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1577  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1578  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1579  	ret = qup_i2c_determine_mode_v2(qup, msgs, num);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1580  	if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1581  		goto out;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1582  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1583  	writel(1, qup->base + QUP_SW_RESET);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1584  	ret = qup_i2c_poll_state(qup, QUP_RESET_STATE);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1585  	if (ret)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1586  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1587  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1588  	/* Configure QUP as I2C mini core */
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1589  	writel(I2C_MINI_CORE | I2C_N_VAL_V2, qup->base + QUP_CONFIG);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1590  	writel(QUP_V2_TAGS_EN, qup->base + QUP_I2C_MASTER_GEN);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1591  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1592  	if (qup_i2c_poll_state_i2c_master(qup)) {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1593  		ret = -EIO;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1594  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1595  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1596  
eb422b539c1f39 Abhishek Sahu         2018-03-12  1597  	if (qup->use_dma) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1598  		reinit_completion(&qup->xfer);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1599  		ret = qup_i2c_bam_xfer(adap, &msgs[0], num);
eb422b539c1f39 Abhishek Sahu         2018-03-12  1600  		qup->use_dma = false;
9cedf3b2f09946 Sricharan Ramabadhran 2016-02-22  1601  	} else {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1602  		qup_i2c_conf_mode_v2(qup);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1603  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1604  		for (idx = 0; idx < num; idx++) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1605  			qup->msg = &msgs[idx];
7545c7dba169c4 Abhishek Sahu         2018-03-12  1606  			qup->is_last = idx == (num - 1);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1607  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1608  			ret = qup_i2c_xfer_v2_msg(qup, idx,
7545c7dba169c4 Abhishek Sahu         2018-03-12  1609  					!!(msgs[idx].flags & I2C_M_RD));
7545c7dba169c4 Abhishek Sahu         2018-03-12  1610  			if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1611  				break;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1612  		}
7545c7dba169c4 Abhishek Sahu         2018-03-12  1613  		qup->msg = NULL;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1614  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1615  
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1616  	if (!ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1617  		ret = qup_i2c_bus_active(qup, ONE_BYTE);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1618  
7545c7dba169c4 Abhishek Sahu         2018-03-12 @1619  	if (!ret)
61f647e9d36d67 Wentao Liang          2025-05-19  1620  		err = qup_i2c_change_state(qup, QUP_RESET_STATE);
61f647e9d36d67 Wentao Liang          2025-05-19  1621  	if (err)
61f647e9d36d67 Wentao Liang          2025-05-19  1622  		return err;
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1623  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1624  	if (ret == 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1625  		ret = num;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1626  out:
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1627  	pm_runtime_mark_last_busy(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1628  	pm_runtime_put_autosuspend(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1629  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1630  	return ret;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1631  }
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1632  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

