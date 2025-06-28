Return-Path: <linux-i2c+bounces-11681-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F9DAEC7A2
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 16:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7629E3B2033
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Jun 2025 14:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CC623CEE5;
	Sat, 28 Jun 2025 14:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9tuIMTD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9BD21E0AF;
	Sat, 28 Jun 2025 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120970; cv=none; b=guj+I5rf/SN3r+Ga6asbWYJmBkFq0AySKIMWm14q0UOGDhDDfx9x0ZhhqEoScWk6hgH12CwSwGBtuUVx7PEaBz/PTJ6nedhauva8MycfjxLvoOycPHyglJz918Z/ogDQgbZn/PaNjd/vFjBUxZB1WrgE6fvgOeFAVLYSFm8PiV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120970; c=relaxed/simple;
	bh=Fu4HeiN9Z/6hpzjj5g1RcA20CJsi7vFlMJq+ppBrBic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzgz5e1cWKdqWuZyi5uYH/JaO3gzQ6cjO7tuC2KIb/sCeWcq2W3ubQ/KgBD0Cz6GrxhntcOdMNkf1F4tnQ+yem0M+TcVq8t3H5RwKh9KqFhczonM8WH6vgldRq7ztKQ4fVCmBMLBH1aVeZEkzKsL5QOSCuQFpv+2GR0Y4GjbSLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9tuIMTD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751120969; x=1782656969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fu4HeiN9Z/6hpzjj5g1RcA20CJsi7vFlMJq+ppBrBic=;
  b=L9tuIMTDf/0DXeDjti5T2bdcQS7l+U8n6efoIGD/QZLzi07Rl0Rt2GmC
   u3MlEiO9Mg2VP85HQAtqOavSfubDlvd292cypWa8ZyBKP/y2zkgcpY8UJ
   RoSKmgjCp361clzF5bRpL//H26uKsMu3gR5btjuJegWcDDxBl4BqEjOYe
   cLMjpoKL2kEUD954zVUGmA3XhQA5qUNdkFykVkJb3QpC/kM9u1pSxWV5F
   vOaW9ih5XujVXhg0lHngLIS1IoS/omdNFscEsr9b7R3bjGb3QvGALxf7q
   yb3HkfRBNlaIFjURmXmVdX8Q5HMfATC/aSClNZG1R63KXZMrAn/PrU8QA
   Q==;
X-CSE-ConnectionGUID: MhYjaPfoR0y3OW3OSHyZgw==
X-CSE-MsgGUID: 6EdsqvOSQ0ePpB9VRq3FSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64466445"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64466445"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 07:29:28 -0700
X-CSE-ConnectionGUID: SscpZRYsR1enevzvXNn7Aw==
X-CSE-MsgGUID: gWofCdI1RxCNt16FhVRTJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="152433815"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jun 2025 07:29:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVWYV-000X6v-0g;
	Sat, 28 Jun 2025 14:29:23 +0000
Date: Sat, 28 Jun 2025 22:28:45 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor@kernel.org>, linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: microchip-core: re-fix fake detections w/
 i2cdetect
Message-ID: <202506282209.FXWbPIPz-lkp@intel.com>
References: <20250626-unusable-excess-da94ebc218e8@spud>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626-unusable-excess-da94ebc218e8@spud>

Hi Conor,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Conor-Dooley/i2c-microchip-core-re-fix-fake-detections-w-i2cdetect/20250627-001626
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250626-unusable-excess-da94ebc218e8%40spud
patch subject: [PATCH v2] i2c: microchip-core: re-fix fake detections w/ i2cdetect
config: riscv-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250628/202506282209.FXWbPIPz-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250628/202506282209.FXWbPIPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506282209.FXWbPIPz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-microchip-corei2c.c:510:6: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
           if (ret < 0)
               ^~~
   drivers/i2c/busses/i2c-microchip-corei2c.c:438:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +/ret +510 drivers/i2c/busses/i2c-microchip-corei2c.c

   428	
   429	static int mchp_corei2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned short flags,
   430					   char read_write, u8 command,
   431					   int size, union i2c_smbus_data *data)
   432	{
   433		struct i2c_msg msgs[2];
   434		struct mchp_corei2c_dev *idev = i2c_get_adapdata(adap);
   435		u8 tx_buf[I2C_SMBUS_BLOCK_MAX + 2];
   436		u8 rx_buf[I2C_SMBUS_BLOCK_MAX + 1];
   437		int num_msgs = 1;
   438		int ret;
   439	
   440		msgs[CORE_I2C_SMBUS_MSG_WR].addr = addr;
   441		msgs[CORE_I2C_SMBUS_MSG_WR].flags = 0;
   442	
   443		if (read_write == I2C_SMBUS_READ && size <= I2C_SMBUS_BYTE)
   444			msgs[CORE_I2C_SMBUS_MSG_WR].flags = I2C_M_RD;
   445	
   446		if (read_write == I2C_SMBUS_WRITE && size <= I2C_SMBUS_WORD_DATA)
   447			msgs[CORE_I2C_SMBUS_MSG_WR].len = size;
   448	
   449		if (read_write == I2C_SMBUS_WRITE && size > I2C_SMBUS_BYTE) {
   450			msgs[CORE_I2C_SMBUS_MSG_WR].buf = tx_buf;
   451			msgs[CORE_I2C_SMBUS_MSG_WR].buf[0] = command;
   452		}
   453	
   454		if (read_write == I2C_SMBUS_READ && size >= I2C_SMBUS_BYTE_DATA) {
   455			msgs[CORE_I2C_SMBUS_MSG_WR].buf = tx_buf;
   456			msgs[CORE_I2C_SMBUS_MSG_WR].buf[0] = command;
   457			msgs[CORE_I2C_SMBUS_MSG_RD].addr = addr;
   458			msgs[CORE_I2C_SMBUS_MSG_RD].flags = I2C_M_RD;
   459			num_msgs = 2;
   460		}
   461	
   462		if (read_write == I2C_SMBUS_READ && size > I2C_SMBUS_QUICK)
   463			msgs[CORE_I2C_SMBUS_MSG_WR].len = 1;
   464	
   465		switch (size) {
   466		case I2C_SMBUS_QUICK:
   467			msgs[CORE_I2C_SMBUS_MSG_WR].buf = NULL;
   468			return 0;
   469		case I2C_SMBUS_BYTE:
   470			if (read_write == I2C_SMBUS_WRITE)
   471				msgs[CORE_I2C_SMBUS_MSG_WR].buf = &command;
   472			else
   473				msgs[CORE_I2C_SMBUS_MSG_WR].buf = &data->byte;
   474			break;
   475		case I2C_SMBUS_BYTE_DATA:
   476			if (read_write == I2C_SMBUS_WRITE) {
   477				msgs[CORE_I2C_SMBUS_MSG_WR].buf[1] = data->byte;
   478			} else {
   479				msgs[CORE_I2C_SMBUS_MSG_RD].len = size - 1;
   480				msgs[CORE_I2C_SMBUS_MSG_RD].buf = &data->byte;
   481			}
   482			break;
   483		case I2C_SMBUS_WORD_DATA:
   484			if (read_write == I2C_SMBUS_WRITE) {
   485				msgs[CORE_I2C_SMBUS_MSG_WR].buf[1] = data->word & 0xFF;
   486				msgs[CORE_I2C_SMBUS_MSG_WR].buf[2] = (data->word >> 8) & 0xFF;
   487			} else {
   488				msgs[CORE_I2C_SMBUS_MSG_RD].len = size - 1;
   489				msgs[CORE_I2C_SMBUS_MSG_RD].buf = rx_buf;
   490			}
   491			break;
   492		case I2C_SMBUS_BLOCK_DATA:
   493			if (read_write == I2C_SMBUS_WRITE) {
   494				int data_len;
   495	
   496				data_len = data->block[0];
   497				msgs[CORE_I2C_SMBUS_MSG_WR].len = data_len + 2;
   498				for (int i = 0; i <= data_len; i++)
   499					msgs[CORE_I2C_SMBUS_MSG_WR].buf[i + 1] = data->block[i];
   500			} else {
   501				msgs[CORE_I2C_SMBUS_MSG_RD].len = I2C_SMBUS_BLOCK_MAX + 1;
   502				msgs[CORE_I2C_SMBUS_MSG_RD].buf = rx_buf;
   503			}
   504			break;
   505		default:
   506			return -EOPNOTSUPP;
   507		}
   508	
   509		mchp_corei2c_xfer(&idev->adapter, msgs, num_msgs);
 > 510		if (ret < 0)
   511			return ret;
   512	
   513		if (read_write == I2C_SMBUS_WRITE || size <= I2C_SMBUS_BYTE_DATA)
   514			return 0;
   515	
   516		switch (size) {
   517		case I2C_SMBUS_WORD_DATA:
   518			data->word = (rx_buf[0] | (rx_buf[1] << 8));
   519			break;
   520		case I2C_SMBUS_BLOCK_DATA:
   521			if (rx_buf[0] > I2C_SMBUS_BLOCK_MAX)
   522				rx_buf[0] = I2C_SMBUS_BLOCK_MAX;
   523			/* As per protocol first member of block is size of the block. */
   524			for (int i = 0; i <= rx_buf[0]; i++)
   525				data->block[i] = rx_buf[i];
   526			break;
   527		}
   528	
   529		return 0;
   530	}
   531	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

