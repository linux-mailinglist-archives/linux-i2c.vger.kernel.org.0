Return-Path: <linux-i2c+bounces-12703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4FEB46D0A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 14:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6A4188C1D3
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Sep 2025 12:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42B542ECD26;
	Sat,  6 Sep 2025 12:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS41MSDs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318C02EBB84;
	Sat,  6 Sep 2025 12:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757162986; cv=none; b=DZnRAhxyBWNO3VEtWa5GPmQlMc9poz8FtlBgWM3F0HMCJuGC/mmVAvE7KBKfyymG3GiH1gxE02wV6vqMD1HAnvFm3JUbA2WZmX2uifr2wYOFTt72yujhB0GZLXq72wFCYNgoaWy1FrDI04jc5JDBxzl0TdJgl0RqxjK4eAQWLYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757162986; c=relaxed/simple;
	bh=FGhroKiv+4xuX6AwZtAlp9mlzfwdRYEJPq+jCneMv/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c70LVnaTZeygScI6CleTW9jbTgcCaNZuwFMM+tXYkCF1cmf/pDQRDBBu9/hnYcGUnP4jVgll1MCuAoZWhUvxXXAIcXeXBO0DnYiCXDQoCf0imVVPZadcDnEViDUQ4MZsFCd6go+h1NrTgaS8G+1ysMnweEEUjhaL9mLe20Oleko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS41MSDs; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757162984; x=1788698984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGhroKiv+4xuX6AwZtAlp9mlzfwdRYEJPq+jCneMv/A=;
  b=OS41MSDsH5ON3ScEjbdBsuYnK3oOuBMfg7wVmhx1decpWoujYtxBd8qF
   k3daR5jx/m4r2aQ4oEHkKdf+tteuAvoM+ryQyTxmUlS3I9kbl2NFx+AHT
   gsQDWtjlvOivFpw8xhDB4/0BCIcMnr3k03bdXt8R6VF1lb4uAtva/q+Gi
   Liac/pqoiSFFOpzqhqM9q0BfCKs1RKLkG9SQII9C78es2D0gsA1LJejVn
   gSTIrZNNFYbROhrGwFsYpoaHkoRzqnUsYv6vWBMe7h4J5la3pklNM0aBE
   EE9GZcwBh5pOHPZ0zjXgixgPu0RpABRTN4tPKvdRTuAeCi/xC9cC98Zc1
   Q==;
X-CSE-ConnectionGUID: o4AaAuMCTne9pvH2YyNFkg==
X-CSE-MsgGUID: XsJC/ZmaTTCY0E7B3FFHjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="59563139"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="59563139"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 05:49:43 -0700
X-CSE-ConnectionGUID: bYM0iKV3TQW7Ok4R3aOEnw==
X-CSE-MsgGUID: GySrpnKUQ3a8jrCQrRq2WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="171652643"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Sep 2025 05:49:39 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uusMK-0001SJ-1J;
	Sat, 06 Sep 2025 12:49:36 +0000
Date: Sat, 6 Sep 2025 20:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	quic_vtanuku@quicinc.com
Subject: Re: [PATCH v7 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <202509062008.lSOdhd4U-lkp@intel.com>
References: <20250903073059.2151837-3-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903073059.2151837-3-quic_jseerapu@quicinc.com>

Hi Jyothi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on andi-shyti/i2c/i2c-host linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dmaengine-qcom-gpi-Add-GPI-Block-event-interrupt-support/20250903-153745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250903073059.2151837-3-quic_jseerapu%40quicinc.com
patch subject: [PATCH v7 2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250906/202509062008.lSOdhd4U-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062008.lSOdhd4U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062008.lSOdhd4U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i2c/busses/i2c-qcom-geni.c: In function 'geni_i2c_gpi_multi_desc_unmap':
>> drivers/i2c/busses/i2c-qcom-geni.c:576:42: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     576 |                                    NULL, (dma_addr_t)NULL);
         |                                          ^


vim +576 drivers/i2c/busses/i2c-qcom-geni.c

   555	
   556	/**
   557	 * geni_i2c_gpi_multi_desc_unmap() - Unmaps DMA buffers post multi message TX transfers
   558	 * @gi2c: I2C dev handle
   559	 * @msgs: Array of I2C  messages
   560	 * @peripheral: Pointer to gpi_i2c_config
   561	 */
   562	static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
   563						  struct gpi_i2c_config *peripheral)
   564	{
   565		u32 msg_xfer_cnt, wr_idx = 0;
   566		struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c->i2c_multi_desc_config;
   567	
   568		msg_xfer_cnt = gi2c->err ? tx_multi_xfer->msg_idx_cnt : tx_multi_xfer->irq_cnt;
   569	
   570		/* Unmap the processed DMA buffers based on the received interrupt count */
   571		for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
   572			wr_idx = tx_multi_xfer->unmap_msg_cnt;
   573			geni_i2c_gpi_unmap(gi2c, &msgs[wr_idx],
   574					   tx_multi_xfer->dma_buf[wr_idx],
   575					   tx_multi_xfer->dma_addr[wr_idx],
 > 576					   NULL, (dma_addr_t)NULL);
   577	
   578			if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs - 1) {
   579				kfree(tx_multi_xfer->dma_buf);
   580				kfree(tx_multi_xfer->dma_addr);
   581				break;
   582			}
   583		}
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

