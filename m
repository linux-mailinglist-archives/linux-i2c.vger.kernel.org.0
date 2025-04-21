Return-Path: <linux-i2c+bounces-10506-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 217ADA94D22
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 09:29:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900853B0ABE
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Apr 2025 07:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AEE7202F7E;
	Mon, 21 Apr 2025 07:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGdkgXa2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6918042AAF;
	Mon, 21 Apr 2025 07:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745220569; cv=none; b=FICCt+6sCOg2HwoQ0Gk1jtYxVdA7N981wWoR4fUBO5xb7dbPuXAr1QHPC7YV+YqIlXhHqEh0+mSQT/ROsycZubSk26fVH+iQItjkoFlKoKMTg7UaZA6v9IHIu/N/3N2R47P54QLMzlahiXkxWdf5agQ7gCrxYrQ2rPpMGK1Fnfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745220569; c=relaxed/simple;
	bh=01/f1NraBtWpGWUC221XvSWIgnjPGGgSGxblojkWilk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kflCrJN4Rms6fg1MsqUfDDpmILNuFRfUQBXxl31/zUYlznsPKhb72gGzMgkxP3WSdZaBDbvRwXKDaKqYKhVClBNMtHKgJFVqRdHvIaMgNJOlazHlLYqNhe1euQJu/QtKgKYfBhHBg0P7dkNc2f/0rEufAAMGCwL8o9QXjzN0TAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGdkgXa2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745220567; x=1776756567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=01/f1NraBtWpGWUC221XvSWIgnjPGGgSGxblojkWilk=;
  b=eGdkgXa2CcCBvmecogxY9gWhQsHrxq2zDSk4ussKEwip471crnxAYxP/
   kl7ZKzuYRk1ikRGHN3/CYFQtPCTgNSsuzxKHKurBDZQxx2aWzMB+g0A42
   o0+dnkgfIwM2MhU3RCY8FoCPwY/Aq/L2V9tE9dZmnfmNTnBs8FlMNrlJd
   MRWZ023ZcIeHHCnWpBn9WrkD4zJmYlD6KKYE6vAWJJj/jWG1YxeuEtbMM
   5iGWbE7Paic2MBDtsU1P2Eiw9/upA8bfXZPXIdgFO0E1D8BPxNIwXHZkB
   TApHYNmNWueANjOtDh/qIzJfSTJx05bT6SGVXT1FexwMn8CJYwrMvC5eT
   g==;
X-CSE-ConnectionGUID: 7nOz2+XGT42BqQoCWLxa0Q==
X-CSE-MsgGUID: c/C2M+pmTRiR3GOo5jpd7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46458366"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46458366"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 00:29:26 -0700
X-CSE-ConnectionGUID: oPu2/drdQy2zzZf0R09YaA==
X-CSE-MsgGUID: jIHOrVRJS62KkkGTBy1ktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131950489"
Received: from lkp-server01.sh.intel.com (HELO 9c2f37e2d822) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Apr 2025 00:29:23 -0700
Received: from kbuild by 9c2f37e2d822 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6lai-0000Ep-1f;
	Mon, 21 Apr 2025 07:29:20 +0000
Date: Mon, 21 Apr 2025 15:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troymitchell988@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troymitchell988@gmail.com>,
	Yongchao Jia <jyc0019@gmail.com>
Subject: Re: [PATCH 1/2] i2c: imx: use guard to take spinlock
Message-ID: <202504211501.MNwGdl5F-lkp@intel.com>
References: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421-i2c-imx-update-v1-1-1137f1f353d5@gmail.com>

Hi Troy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d7a0577c9db35c4cc52db90bc415ea248446472]

url:    https://github.com/intel-lab-lkp/linux/commits/Troy-Mitchell/i2c-imx-use-guard-to-take-spinlock/20250421-133753
base:   9d7a0577c9db35c4cc52db90bc415ea248446472
patch link:    https://lore.kernel.org/r/20250421-i2c-imx-update-v1-1-1137f1f353d5%40gmail.com
patch subject: [PATCH 1/2] i2c: imx: use guard to take spinlock
config: hexagon-randconfig-001-20250421 (https://download.01.org/0day-ci/archive/20250421/202504211501.MNwGdl5F-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211501.MNwGdl5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211501.MNwGdl5F-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-imx.c:1140:17: warning: unused variable 'ret' [-Wunused-variable]
                                   irqreturn_t ret;
                                               ^
   1 warning generated.


vim +/ret +1140 drivers/i2c/busses/i2c-imx.c

aa11e38ce6fe88 Darius Augulis     2009-01-30  1124  
f7414cd6923fd7 Biwen Li           2020-11-11  1125  static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
f7414cd6923fd7 Biwen Li           2020-11-11  1126  {
f7414cd6923fd7 Biwen Li           2020-11-11  1127  	struct imx_i2c_struct *i2c_imx = dev_id;
f7414cd6923fd7 Biwen Li           2020-11-11  1128  	unsigned int ctl, status;
f7414cd6923fd7 Biwen Li           2020-11-11  1129  
d3973a577b8e10 Troy Mitchell      2025-04-21  1130  	guard(spinlock_irqsave)(&i2c_imx->slave_lock);
d3973a577b8e10 Troy Mitchell      2025-04-21  1131  
f7414cd6923fd7 Biwen Li           2020-11-11  1132  	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
f7414cd6923fd7 Biwen Li           2020-11-11  1133  	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1134  
f7414cd6923fd7 Biwen Li           2020-11-11  1135  	if (status & I2SR_IIF) {
f7414cd6923fd7 Biwen Li           2020-11-11  1136  		i2c_imx_clear_irq(i2c_imx, I2SR_IIF);
d3973a577b8e10 Troy Mitchell      2025-04-21  1137  
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1138  		if (i2c_imx->slave) {
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1139  			if (!(ctl & I2CR_MSTA)) {
f89bf95632b416 Corey Minyard      2021-11-12 @1140  				irqreturn_t ret;
f89bf95632b416 Corey Minyard      2021-11-12  1141  
d3973a577b8e10 Troy Mitchell      2025-04-21  1142  				return i2c_imx_slave_handle(i2c_imx,
f89bf95632b416 Corey Minyard      2021-11-12  1143  							    status, ctl);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1144  			}
f89bf95632b416 Corey Minyard      2021-11-12  1145  			i2c_imx_slave_finish_op(i2c_imx);
05ae60bc24f765 Kevin Paul Herbert 2020-12-22  1146  		}
d3973a577b8e10 Troy Mitchell      2025-04-21  1147  
f7414cd6923fd7 Biwen Li           2020-11-11  1148  		return i2c_imx_master_isr(i2c_imx, status);
f7414cd6923fd7 Biwen Li           2020-11-11  1149  	}
f7414cd6923fd7 Biwen Li           2020-11-11  1150  
aa11e38ce6fe88 Darius Augulis     2009-01-30  1151  	return IRQ_NONE;
aa11e38ce6fe88 Darius Augulis     2009-01-30  1152  }
aa11e38ce6fe88 Darius Augulis     2009-01-30  1153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

