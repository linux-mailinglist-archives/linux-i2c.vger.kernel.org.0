Return-Path: <linux-i2c+bounces-9817-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A252A5E81B
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Mar 2025 00:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85433A6E8D
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 23:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87A21F1302;
	Wed, 12 Mar 2025 23:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GRhNrf9m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD361DE882;
	Wed, 12 Mar 2025 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821184; cv=none; b=CxmjPD0TfvBIUTq+z9rGfYohiNTShqWcdsLFb6ZoR4Hv3q6IvcrqxCfygu1Jqt1ouh1wo2Tsivae/92u4bx0ME8xbrQWQPpoOOm4G0LOWS8AYgY/0QtxaXOvQpyT0/4xI5MPnEXqjkSoVwOTutH2NI0pzHyCm674wf/RE6hpyV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821184; c=relaxed/simple;
	bh=6sf+ZmY7MxAFM7PhMCtT+W5n57HSOBeIMTJ11wI1fQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUocumbFTG2RPutBG/2iyvRHPlhIDbMg39UdpH6atHH6Xsj/vR6xwCLjVpeoKpqZjGk92YfN+ZRG9I3OQ6DzvcXatUwKH/szsBcna/j2MFO6EQ7uFR8ZfCDAoTqQyNVMlRuqKmSd+7o7ISZnRr/D6srer5xrf3obfWm+ZNd48vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GRhNrf9m; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741821183; x=1773357183;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6sf+ZmY7MxAFM7PhMCtT+W5n57HSOBeIMTJ11wI1fQU=;
  b=GRhNrf9md6Y5u25/ql67XK2P69X+VeCHmv7lcbAHBGfgqmJVveSPXc2+
   FSQG4E5qbF+nZXfFS19ssTAFbloKiB9RuEqQ/f5jL4ctEfbBHeeQy3e67
   WZ1W0kCvDvq6bTEfl4C7eTtKK4BCFHmuKK+Xqa6Ji0kHnjShifUfFCTdy
   MkU+9ArB5Pb23NjpymaVjUFbKYslLQnhRCyxmhcnimBHlA/jCCSm7kE54
   w5P4x+7UzR5ogAGKVr042R9/mKF/kuUfB/OGGBDS+4z7c+w0JZWsAkhv2
   BuKfK8G6Z3axa05u6D9N3JbvDRGtajCS3bFblze0Jezg3IPTDYqw7KcuS
   A==;
X-CSE-ConnectionGUID: 5Y+cvSZSRxKYLBkw6dkRVw==
X-CSE-MsgGUID: mftva7VGTXSNiitse3FGwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="42090150"
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="42090150"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 16:13:02 -0700
X-CSE-ConnectionGUID: 0yxVx+PaQS6nKWnQIJnihg==
X-CSE-MsgGUID: j6gb52yaT8usbBNtCEG9Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,243,1736841600"; 
   d="scan'208";a="125399758"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2025 16:13:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsVFx-0008xY-2w;
	Wed, 12 Mar 2025 23:12:57 +0000
Date: Thu, 13 Mar 2025 07:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH v12 3/3] i2c: octeon: add block-mode i2c operations
Message-ID: <202503130610.rUb3f7P4-lkp@intel.com>
References: <20250311023435.3962466-4-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311023435.3962466-4-aryan.srivastava@alliedtelesis.co.nz>

Hi Aryan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on next-20250312]
[cannot apply to linus/master v6.14-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aryan-Srivastava/i2c-octeon-fix-return-commenting/20250311-103714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250311023435.3962466-4-aryan.srivastava%40alliedtelesis.co.nz
patch subject: [PATCH v12 3/3] i2c: octeon: add block-mode i2c operations
config: alpha-randconfig-r132-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130610.rUb3f7P4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250313/202503130610.rUb3f7P4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503130610.rUb3f7P4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-octeon-core.c:677:26: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long long [usertype] rd @@     got restricted __be64 [usertype] @@
   drivers/i2c/busses/i2c-octeon-core.c:677:26: sparse:     expected unsigned long long [usertype] rd
   drivers/i2c/busses/i2c-octeon-core.c:677:26: sparse:     got restricted __be64 [usertype]
>> drivers/i2c/busses/i2c-octeon-core.c:728:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned long long [addressable] [usertype] buf @@     got restricted __be64 [usertype] @@
   drivers/i2c/busses/i2c-octeon-core.c:728:21: sparse:     expected unsigned long long [addressable] [usertype] buf
   drivers/i2c/busses/i2c-octeon-core.c:728:21: sparse:     got restricted __be64 [usertype]

vim +677 drivers/i2c/busses/i2c-octeon-core.c

   633	
   634	/**
   635	 * octeon_i2c_hlc_block_comp_read - high-level-controller composite block read
   636	 * @i2c: The struct octeon_i2c
   637	 * @msgs: msg[0] contains address, place read data into msg[1]
   638	 *
   639	 * i2c core command is constructed and written into the SW_TWSI register.
   640	 * The execution of the command will result in requested data being
   641	 * placed into a FIFO buffer, ready to be read.
   642	 * Used in the case where the i2c xfer is for greater than 8 bytes of read data.
   643	 *
   644	 * Returns: 0 on success, otherwise a negative errno.
   645	 */
   646	static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct i2c_msg *msgs)
   647	{
   648		int ret = 0;
   649		u16 len;
   650		u64 cmd;
   651	
   652		octeon_i2c_hlc_enable(i2c);
   653		octeon_i2c_block_enable(i2c);
   654	
   655		/* Write (size - 1) into block control register */
   656		len = msgs[1].len - 1;
   657		octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
   658	
   659		/* Prepare core command */
   660		cmd = SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
   661		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   662	
   663		/* Send core command */
   664		ret = octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
   665		if (ret)
   666			return ret;
   667	
   668		cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
   669		if ((cmd & SW_TWSI_R) == 0)
   670			return octeon_i2c_check_status(i2c, false);
   671	
   672		/* read data in FIFO */
   673		octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
   674					i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
   675		for (u16 i = 0; i <= len; i += 8) {
   676			/* Byte-swap FIFO data and copy into msg buffer */
 > 677			u64 rd = cpu_to_be64(__raw_readq(i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c)));
   678	
   679			memcpy(&msgs[1].buf[i], &rd, MIN_T(u16, 8, msgs[1].len - i));
   680		}
   681	
   682		octeon_i2c_block_disable(i2c);
   683		return ret;
   684	}
   685	
   686	/**
   687	 * octeon_i2c_hlc_block_comp_write - high-level-controller composite block write
   688	 * @i2c: The struct octeon_i2c
   689	 * @msgs: msg[0] contains address, msg[1] contains data to be written
   690	 *
   691	 * i2c core command is constructed and write data is written into the FIFO buffer.
   692	 * The execution of the command will result in HW write, using the data in FIFO.
   693	 * Used in the case where the i2c xfer is for greater than 8 bytes of write data.
   694	 *
   695	 * Returns: 0 on success, otherwise a negative errno.
   696	 */
   697	static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
   698	{
   699		bool set_ext = false;
   700		int ret = 0;
   701		u16 len;
   702		u64 cmd, ext = 0;
   703	
   704		octeon_i2c_hlc_enable(i2c);
   705		octeon_i2c_block_enable(i2c);
   706	
   707		/* Write (size - 1) into block control register */
   708		len = msgs[1].len - 1;
   709		octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
   710	
   711		/* Prepare core command */
   712		cmd = SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
   713		cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
   714	
   715		/* Set parameters for extended message (if required) */
   716		set_ext = octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
   717	
   718		/* Write msg into FIFO buffer */
   719		octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
   720					i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
   721		for (u16 i = 0; i <= len; i += 8) {
   722			u64 buf = 0;
   723	
   724			/* Copy 8 bytes or remaining bytes from message buffer */
   725			memcpy(&buf, &msgs[1].buf[i], MIN_T(u16, 8, msgs[1].len - i));
   726	
   727			/* Byte-swap message data and write into FIFO */
 > 728			buf = cpu_to_be64(buf);
   729			octeon_i2c_writeq_flush(buf, i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
   730		}
   731		if (set_ext)
   732			octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
   733	
   734		/* Send command to core (send data in FIFO) */
   735		ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
   736		if (ret)
   737			return ret;
   738	
   739		cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
   740		if ((cmd & SW_TWSI_R) == 0)
   741			return octeon_i2c_check_status(i2c, false);
   742	
   743		octeon_i2c_block_disable(i2c);
   744		return ret;
   745	}
   746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

