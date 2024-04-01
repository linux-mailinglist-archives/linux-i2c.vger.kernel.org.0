Return-Path: <linux-i2c+bounces-2702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12134893B71
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 15:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A39711F21C45
	for <lists+linux-i2c@lfdr.de>; Mon,  1 Apr 2024 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C643F9C3;
	Mon,  1 Apr 2024 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pnw59EUG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685B33F8E0;
	Mon,  1 Apr 2024 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711978158; cv=none; b=sjFLIwibqdNwfD1YRwZiuQJJfOYKUO+fwYNrhc5n2n7sPdQYMUd/EPbSaAPvtIkXTrnRwJgcelZIv9b4yv1wHtfEqjHv96UjJtDOjFMG/9MbHUfKO/jKJwa1YEnJoWuJwRObfGDmRRWlWMowHAptamDTUc/G+JvejjaKz/rV/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711978158; c=relaxed/simple;
	bh=sq7Bn6wHg2fsxeLVlMSLN4jO8+oiDlZLwdERkhcHRHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vk2DehBlUHn7vDcN9vCIAp3CmUmPxFHh1cvXNVE2r+8RWPvrQW/Oq8UW24Yjee7pyTtN2N02jRMTALuTui4p4WNHAQjTKxr8iR/LDCw4VM68fttJ07TchFoIONkCLX13c4+uqBJbmuKI6OgGmMSWOpbgjMB5W2egdjHUZERh4T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pnw59EUG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711978156; x=1743514156;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sq7Bn6wHg2fsxeLVlMSLN4jO8+oiDlZLwdERkhcHRHU=;
  b=Pnw59EUGDUnSBlvXLLE6xyRIzgk79PA8s15kOghsdA0mZHeGVL434lZE
   Bm4TJd1IZRcSQHI36r6msb4QJSKQ2tScEay2MoWQx1ZpQEjTUIC04JrTh
   Ibk/zZEKmK6TrfRYgDgCparb0fZi7+gfHoDoGklABOpSxqBCaHvDns/3x
   EqirMflh8stWEglH7XohbiHqzIwPFRPa28XHZR2yWgySZwNrvisrY6LO7
   sYiM467Ma9wcLRnjURqvDzCLUadbAawdbVDZ7g4E4gpV5hE5pe35ivMz1
   ibdpA2tNVAnlc4YJraKLgdiDt7MdGhosXeiG4hxFVEu3D6Pwhw8qZeaDa
   g==;
X-CSE-ConnectionGUID: 3nR/7qWFR8ymThs5VWMQwg==
X-CSE-MsgGUID: iWH8UVkKQA+DbWnsaxrGAg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7693452"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="7693452"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 06:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000"; 
   d="scan'208";a="17533802"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2024 06:29:13 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrHip-0000Kn-0C;
	Mon, 01 Apr 2024 13:29:11 +0000
Date: Mon, 1 Apr 2024 21:28:46 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Malgujar <pmalgujar@marvell.com>, andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, sgarapati@marvell.com,
	cchavva@marvell.com, jannadurai@marvell.com,
	Piyush Malgujar <pmalgujar@marvell.com>
Subject: Re: [PATCH v5 1/4] i2c: thunderx: Clock divisor logic changes
Message-ID: <202404012108.N5Bs6Axl-lkp@intel.com>
References: <20240401063229.2112782-2-pmalgujar@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401063229.2112782-2-pmalgujar@marvell.com>

Hi Piyush,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.9-rc2 next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Piyush-Malgujar/i2c-thunderx-Clock-divisor-logic-changes/20240401-143524
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240401063229.2112782-2-pmalgujar%40marvell.com
patch subject: [PATCH v5 1/4] i2c: thunderx: Clock divisor logic changes
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240401/202404012108.N5Bs6Axl-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404012108.N5Bs6Axl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404012108.N5Bs6Axl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i2c/busses/i2c-octeon-core.c:22:
   drivers/i2c/busses/i2c-octeon-core.h: In function 'octeon_i2c_is_otx2':
>> drivers/i2c/busses/i2c-octeon-core.h:225:23: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
     225 |         u32 chip_id = FIELD_GET(PCI_SUBSYS_MASK, pdev->subsystem_device);
         |                       ^~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +225 drivers/i2c/busses/i2c-octeon-core.h

   214	
   215	#define PCI_SUBSYS_DEVID_9XXX	0xB
   216	#define PCI_SUBSYS_MASK		GENMASK(15, 12)
   217	/**
   218	 * octeon_i2c_is_otx2 - check for chip ID
   219	 * @pdev: PCI dev structure
   220	 *
   221	 * Returns true if the device is an OcteonTX2, false otherwise.
   222	 */
   223	static inline bool octeon_i2c_is_otx2(struct pci_dev *pdev)
   224	{
 > 225		u32 chip_id = FIELD_GET(PCI_SUBSYS_MASK, pdev->subsystem_device);
   226	
   227		return (chip_id == PCI_SUBSYS_DEVID_9XXX);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

