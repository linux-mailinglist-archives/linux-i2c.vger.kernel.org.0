Return-Path: <linux-i2c+bounces-9142-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132E0A16D98
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 14:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2B427A2069
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 13:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF0E1E2312;
	Mon, 20 Jan 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GDI7XxNI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DE51E1C32;
	Mon, 20 Jan 2025 13:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380666; cv=none; b=E+TyjI29/Oe5NcZg3ZcdO9oBg4/hbDRvOI1uMvb7+lfy/xcT4DLQUNUK99cGvjYFAJ19tE+PMSuVW8M22EHdtu3LFze8g9UYm8DA8fYheMNdjDm1IJ5Tjaceh+3jUjLFC+L+cYLBo2rNjF5hkx9G8WZQFvT6oxwsukcAG4gK28U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380666; c=relaxed/simple;
	bh=cgcjeJqRGJz4GlV5cJ3RHuisU44Rm/xRJru7KeMM8fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrWEH55qB+DEpbkmPGWxbvEczU6JhloGE0KEquM2woitJ3lTUduwRoFPOCehyIToNCwi0YWtPHXxeKYvRc/HrhxLHcS2bJ0DcnyW4sOUueqZstDm4OcMds5n2V66+kDUfuyLpxvdK+SB3tDVbG3jEcnIHgm07Wn3fOCAWvIGnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GDI7XxNI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737380665; x=1768916665;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cgcjeJqRGJz4GlV5cJ3RHuisU44Rm/xRJru7KeMM8fc=;
  b=GDI7XxNIZZQ1BqBLVB6SHVeBrGdkwJr4rQhcpCk2IIIL+UNZgHcLReQs
   aYGYr/cv5ts0PAa6zgNLjlCtk2K0VpOXEVAJysNxKxeFklPmQKg4WYmu9
   l9JrLWSXT02jb7e/Qgyk03VP0VSCQCgdIP7sy1UZzM2ll/d3Q4jdyrfns
   r4uQ3U1l08vKU7BanhUOrH7+12TdBe0HdPVtNAlGncd0aOG5aKXg2BiB8
   3e6XdvkWkb4Xj/mgBeEukHA651Q91Pyd24kK4gh4v1dKpSRjnoEpU9hha
   t3vnGq0fuWuGLX3q8+hWZ4EGU4bh6ylXMYOL9tynzBYP7rbfSWguuiLOq
   Q==;
X-CSE-ConnectionGUID: QXAZXx5XRuyetjo64vD4Mw==
X-CSE-MsgGUID: Xqf9imSBS6m/YGwVG9HPkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="41534325"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; 
   d="scan'208";a="41534325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 05:44:24 -0800
X-CSE-ConnectionGUID: 3FqYEmPEScyjJjUUcYzsGQ==
X-CSE-MsgGUID: NZzcij3ZT6mfY+EkgX3RUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="137417816"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jan 2025 05:44:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZs4g-000War-0f;
	Mon, 20 Jan 2025 13:44:18 +0000
Date: Mon, 20 Jan 2025 21:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v5 2/2] i2c: i2c-qcom-geni: Add Block event interrupt
 support
Message-ID: <202501202159.wLRVO16t-lkp@intel.com>
References: <20250120095753.25539-3-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120095753.25539-3-quic_jseerapu@quicinc.com>

Hi Jyothi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 55bcd2e0d04c1171d382badef1def1fd04ef66c5]

url:    https://github.com/intel-lab-lkp/linux/commits/Jyothi-Kumar-Seerapu/dmaengine-qcom-gpi-Add-GPI-Block-event-interrupt-support/20250120-180058
base:   55bcd2e0d04c1171d382badef1def1fd04ef66c5
patch link:    https://lore.kernel.org/r/20250120095753.25539-3-quic_jseerapu%40quicinc.com
patch subject: [PATCH v5 2/2] i2c: i2c-qcom-geni: Add Block event interrupt support
config: arc-randconfig-001-20250120 (https://download.01.org/0day-ci/archive/20250120/202501202159.wLRVO16t-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250120/202501202159.wLRVO16t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501202159.wLRVO16t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-qcom-geni.c:599: warning: Excess function parameter 'dev' description in 'geni_i2c_gpi_multi_desc_unmap'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
   Depends on [n]: MAILBOX [=y] && (ARCH_OMAP2PLUS || ARCH_K3)
   Selected by [m]:
   - TI_K3_M4_REMOTEPROC [=m] && REMOTEPROC [=y] && (ARCH_K3 || COMPILE_TEST [=y])


vim +599 drivers/i2c/busses/i2c-qcom-geni.c

   589	
   590	/**
   591	 * geni_i2c_gpi_multi_desc_unmap() - unmaps the buffers post multi message TX transfers
   592	 * @dev: pointer to the corresponding dev node
   593	 * @gi2c: i2c dev handle
   594	 * @msgs: i2c messages array
   595	 * @peripheral: pointer to the gpi_i2c_config
   596	 */
   597	static void geni_i2c_gpi_multi_desc_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[],
   598						  struct gpi_i2c_config *peripheral)
 > 599	{
   600		u32 msg_xfer_cnt, wr_idx = 0;
   601		struct geni_i2c_gpi_multi_desc_xfer *tx_multi_xfer = &gi2c->i2c_multi_desc_config;
   602	
   603		/*
   604		 * In error case, need to unmap all messages based on the msg_idx_cnt.
   605		 * Non-error case unmap all the processed messages.
   606		 */
   607		if (gi2c->err)
   608			msg_xfer_cnt = tx_multi_xfer->msg_idx_cnt;
   609		else
   610			msg_xfer_cnt = tx_multi_xfer->irq_cnt * QCOM_I2C_GPI_NUM_MSGS_PER_IRQ;
   611	
   612		/* Unmap the processed DMA buffers based on the received interrupt count */
   613		for (; tx_multi_xfer->unmap_msg_cnt < msg_xfer_cnt; tx_multi_xfer->unmap_msg_cnt++) {
   614			if (tx_multi_xfer->unmap_msg_cnt == gi2c->num_msgs)
   615				break;
   616			wr_idx = tx_multi_xfer->unmap_msg_cnt % QCOM_I2C_GPI_MAX_NUM_MSGS;
   617			geni_i2c_gpi_unmap(gi2c, &msgs[tx_multi_xfer->unmap_msg_cnt],
   618					   tx_multi_xfer->dma_buf[wr_idx],
   619					   tx_multi_xfer->dma_addr[wr_idx],
   620					   NULL, (dma_addr_t)NULL);
   621			tx_multi_xfer->freed_msg_cnt++;
   622		}
   623	}
   624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

