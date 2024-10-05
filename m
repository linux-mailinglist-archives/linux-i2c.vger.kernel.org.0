Return-Path: <linux-i2c+bounces-7230-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2A991518
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 09:37:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E17BA1C21E12
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Oct 2024 07:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CE713C8E8;
	Sat,  5 Oct 2024 07:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9627oLe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F208113B5B4;
	Sat,  5 Oct 2024 07:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728113828; cv=none; b=PUJniP3JM65XYtrJe8SU0K7PQFqLq07Yw+uRyTbp2o5Ja2osU3hdnGBBNmQTl/HqydRqFj9xVQliNU75V7RSLywL1FoUEOVGnfgkW8OMVM6C765YrsVTBZeIWxC+dOuGOm0nEY8nmUq6domRYemIJH4fQy8/aHND+Oq8DKMqjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728113828; c=relaxed/simple;
	bh=u6WMt7NaLIFTr5THXasDszPWd+K083tVONyzoKZD91Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWs+raw2FQUbGr7yoV3rpvdX6kAv283Iy9K5n/ndl/RDRWjixR9n0Z9eUsZeErWS7/PsCY3lotOGcUUfae9m7ny2YjozVFtLOMs7n4U1w0WO/xAvZLvH2E6eu3UZv/Pj0w43BuSBAMp/Erfy2mXLfxejNiBOyPGFM01f+5Isa0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9627oLe; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728113827; x=1759649827;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6WMt7NaLIFTr5THXasDszPWd+K083tVONyzoKZD91Q=;
  b=i9627oLeAM1CpzjoP+Aij3KeD3AArECDUxp/wzpZbx94L8LT5neDBtRu
   +kg04R91IV/e8IhizJCYAPIG5NgSAQTrVirsZ95xetEMDXFIPiIsYkFTk
   0j4gohhaAu84TWLiWsBsgL+S7q4PZjKrDk3rQZy0FR4qhsOl+295nKJfY
   M1QCktpjm+VA9YnUMoxkf3+utI6oys2Ojt620hXQ70CiLF/FqyPIuLM59
   Hc7BJ9PSt3yaG+4WJoY72WPz0mzpnwkOtcbH7YAoDQbehFn+JWvuDMAh4
   GKJZSxjd6ncRYB+EWuHRu4wXx3lK5DZpsKVKUcrVBl+deepMlqyAzpGD8
   A==;
X-CSE-ConnectionGUID: idA/LnU8Ry2z3bZoIylOZA==
X-CSE-MsgGUID: EFiOd8qzTdqdNyd8NeWi4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="31218606"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="31218606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 00:37:06 -0700
X-CSE-ConnectionGUID: v7tGEJ1EQsSmbuMbbEYZGg==
X-CSE-MsgGUID: i2WP+xpVR8S+46CU4OAu8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="79892116"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2024 00:37:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzLX-0002k8-2H;
	Sat, 05 Oct 2024 07:36:59 +0000
Date: Sat, 5 Oct 2024 15:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>, brendan.higgins@linux.dev,
	benh@kernel.crashing.org, joel@jms.id.au, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@codeconstruct.com.au, p.zabel@pengutronix.de,
	andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
Message-ID: <202410051547.vOL3qMOc-lkp@intel.com>
References: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002070213.1165263-3-ryan_chen@aspeedtech.com>

Hi Ryan,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.11]
[cannot apply to andi-shyti/i2c/i2c-host v6.12-rc1 linus/master next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ryan-Chen/dt-bindings-i2c-aspeed-support-for-AST2600-i2cv2/20241002-150410
base:   v6.11
patch link:    https://lore.kernel.org/r/20241002070213.1165263-3-ryan_chen%40aspeedtech.com
patch subject: [PATCH v14 2/3] i2c: aspeed: support AST2600 i2c new register mode driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051547.vOL3qMOc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051547.vOL3qMOc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/busses/i2c-ast2600.c: In function 'ast2600_i2c_setup_buff_tx':
>> drivers/i2c/busses/i2c-ast2600.c:437:41: error: implicit declaration of function 'get_unaligned_le16'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     437 |                                         get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:441:41: error: implicit declaration of function 'get_unaligned_le24'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     441 |                                         get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl
>> drivers/i2c/busses/i2c-ast2600.c:445:41: error: implicit declaration of function 'get_unaligned_le32'; did you mean 'get_unalign_ctl'? [-Wimplicit-function-declaration]
     445 |                                         get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
         |                                         ^~~~~~~~~~~~~~~~~~
         |                                         get_unalign_ctl


vim +437 drivers/i2c/busses/i2c-ast2600.c

   405	
   406	static int ast2600_i2c_setup_buff_tx(u32 cmd, struct ast2600_i2c_bus *i2c_bus)
   407	{
   408		struct i2c_msg *msg = &i2c_bus->msgs[i2c_bus->msgs_index];
   409		u32 wbuf_dword;
   410		int xfer_len;
   411		int i;
   412	
   413		cmd |= AST2600_I2CM_PKT_EN;
   414		xfer_len = msg->len - i2c_bus->master_xfer_cnt;
   415		if (xfer_len > i2c_bus->buf_size)
   416			xfer_len = i2c_bus->buf_size;
   417		else if (i2c_bus->msgs_index + 1 == i2c_bus->msgs_count)
   418			cmd |= AST2600_I2CM_STOP_CMD;
   419	
   420		if (cmd & AST2600_I2CM_START_CMD)
   421			cmd |= AST2600_I2CM_PKT_ADDR(msg->addr);
   422	
   423		if (xfer_len) {
   424			cmd |= AST2600_I2CM_TX_BUFF_EN | AST2600_I2CM_TX_CMD;
   425			/*
   426			 * The controller's buffer register supports dword writes only.
   427			 * Therefore, write dwords to the buffer register in a 4-byte aligned,
   428			 * and write the remaining unaligned data at the end.
   429			 */
   430			for (i = 0; i < xfer_len; i += 4) {
   431				switch (min(xfer_len - i, 4) % 4) {
   432				case 1:
   433					wbuf_dword = msg->buf[i2c_bus->master_xfer_cnt + i];
   434					break;
   435				case 2:
   436					wbuf_dword =
 > 437						get_unaligned_le16(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   438					break;
   439				case 3:
   440					wbuf_dword =
 > 441						get_unaligned_le24(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   442					break;
   443				default:
   444					wbuf_dword =
 > 445						get_unaligned_le32(&msg->buf[i2c_bus->master_xfer_cnt + i]);
   446					break;
   447				}
   448				writel(wbuf_dword, i2c_bus->buf_base + i);
   449			}
   450			writel(AST2600_I2CC_SET_TX_BUF_LEN(xfer_len),
   451			       i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
   452		}
   453	
   454		writel(cmd, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
   455	
   456		return 0;
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

