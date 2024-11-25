Return-Path: <linux-i2c+bounces-8197-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F639D852C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 13:14:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FA6628C0A3
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 12:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04A0619CC37;
	Mon, 25 Nov 2024 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHwsgdsV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34A199EB7;
	Mon, 25 Nov 2024 12:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536837; cv=none; b=iVrX9TJ0+opfRAKwxviTl4WySd6iAbWogDBAOckdhUBH601DyJZuwQTeYMGzqQ+JGxXZ4zSxwOtYwkR6Bd5tTcWBhLhsbA1gv5yA3+iXD9hCvxrf0THDBaxLFWecD3GQDQS0ZJ9UR8PzEFb/D9r69DgJUKf2/ulZRUy7uEA2ef8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536837; c=relaxed/simple;
	bh=SfWhUEUrfi678nU8AT/o7gHzI7/+xswizzHwUz5Wdxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoFkLhuYcg4ZPPjB61tGLhoxJoqVVieveN5ZqrIx0INKnZRcUtwB5BGX81r79kwQIzxapiG/UqkmKLTtnSfiz3uk+F+5FsGIot2DmHtG0CXkEp6TudnQ1qwl4ti+31cSkaDoIDJIK+xAj07yezKrJLi9BKBSTYTCkbIl7YX2LzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHwsgdsV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732536835; x=1764072835;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SfWhUEUrfi678nU8AT/o7gHzI7/+xswizzHwUz5Wdxs=;
  b=kHwsgdsV/Ucn3KYefDGaZP4iA35gWE22sXfS+0aKDGzzrCJZZd0ZXAQg
   xm1ArxzhWoCYIKBwH5g++8psM/nUjj7pF00jeUULFUBWao+nzUTMqcIVy
   iFBl+ckDFC3K7siTQSsKYPFGcxClJJsiPNZhAzTplgTL+aQZVraFGUIxL
   2SjB+3gUmnNPHpgCXkbvFl6FsgtICPxu/m/yN2jGY9VOnCEy25Y4c7asb
   l9rJyhAp4AWJGPujNOBjzXPNWL4ySUDA4EzqRhiCq6pM/5SDb1XlUS5SU
   R20zz91pL3EMEHkeBabVLqeU5Yi/IAfPr2Zp8VzO5wBA5zSrQVTdXBM65
   w==;
X-CSE-ConnectionGUID: gBc9qQdARqqc4TMucYcM2g==
X-CSE-MsgGUID: tLErgYjwRruJV4OQxQFdRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32380004"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="32380004"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 04:13:54 -0800
X-CSE-ConnectionGUID: 3sPjZDDxRd6cjRs0YtBVsg==
X-CSE-MsgGUID: aOQ3YUF/QsWuP1Br+rBwpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91202907"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Nov 2024 04:13:51 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFXyO-0006K5-1b;
	Mon, 25 Nov 2024 12:13:48 +0000
Date: Mon, 25 Nov 2024 20:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/3] i2c: atr: Fix lockdep for nested ATRs
Message-ID: <202411252015.N7sBYvri-lkp@intel.com>
References: <20241122-i2c-atr-fixes-v1-2-62c51ce790be@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241122-i2c-atr-fixes-v1-2-62c51ce790be@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on adc218676eef25575469234709c2d87185ca223a]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/i2c-atr-Allow-unmapped-addresses-from-nested-ATRs/20241125-104419
base:   adc218676eef25575469234709c2d87185ca223a
patch link:    https://lore.kernel.org/r/20241122-i2c-atr-fixes-v1-2-62c51ce790be%40ideasonboard.com
patch subject: [PATCH 2/3] i2c: atr: Fix lockdep for nested ATRs
config: i386-buildonly-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411252015.N7sBYvri-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411252015.N7sBYvri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411252015.N7sBYvri-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-atr.c:60: warning: Function parameter or struct member 'orig_addrs_lock_key' not described in 'i2c_atr_chan'
>> drivers/i2c/i2c-atr.c:100: warning: Function parameter or struct member 'lock_key' not described in 'i2c_atr'


vim +60 drivers/i2c/i2c-atr.c

a076a860acae77 Luca Ceresoli  2023-06-19   36  
a076a860acae77 Luca Ceresoli  2023-06-19   37  /**
a076a860acae77 Luca Ceresoli  2023-06-19   38   * struct i2c_atr_chan - Data for a channel.
a076a860acae77 Luca Ceresoli  2023-06-19   39   * @adap:            The &struct i2c_adapter for the channel
a076a860acae77 Luca Ceresoli  2023-06-19   40   * @atr:             The parent I2C ATR
a076a860acae77 Luca Ceresoli  2023-06-19   41   * @chan_id:         The ID of this channel
a076a860acae77 Luca Ceresoli  2023-06-19   42   * @alias_list:      List of @struct i2c_atr_alias_pair containing the
a076a860acae77 Luca Ceresoli  2023-06-19   43   *                   assigned aliases
a076a860acae77 Luca Ceresoli  2023-06-19   44   * @orig_addrs_lock: Mutex protecting @orig_addrs
a076a860acae77 Luca Ceresoli  2023-06-19   45   * @orig_addrs:      Buffer used to store the original addresses during transmit
a076a860acae77 Luca Ceresoli  2023-06-19   46   * @orig_addrs_size: Size of @orig_addrs
a076a860acae77 Luca Ceresoli  2023-06-19   47   */
a076a860acae77 Luca Ceresoli  2023-06-19   48  struct i2c_atr_chan {
a076a860acae77 Luca Ceresoli  2023-06-19   49  	struct i2c_adapter adap;
a076a860acae77 Luca Ceresoli  2023-06-19   50  	struct i2c_atr *atr;
a076a860acae77 Luca Ceresoli  2023-06-19   51  	u32 chan_id;
a076a860acae77 Luca Ceresoli  2023-06-19   52  
a076a860acae77 Luca Ceresoli  2023-06-19   53  	struct list_head alias_list;
a076a860acae77 Luca Ceresoli  2023-06-19   54  
a076a860acae77 Luca Ceresoli  2023-06-19   55  	/* Lock orig_addrs during xfer */
a076a860acae77 Luca Ceresoli  2023-06-19   56  	struct mutex orig_addrs_lock;
f2d3b6b436282b Tomi Valkeinen 2024-11-22   57  	struct lock_class_key orig_addrs_lock_key;
a076a860acae77 Luca Ceresoli  2023-06-19   58  	u16 *orig_addrs;
a076a860acae77 Luca Ceresoli  2023-06-19   59  	unsigned int orig_addrs_size;
a076a860acae77 Luca Ceresoli  2023-06-19  @60  };
a076a860acae77 Luca Ceresoli  2023-06-19   61  
a076a860acae77 Luca Ceresoli  2023-06-19   62  /**
a076a860acae77 Luca Ceresoli  2023-06-19   63   * struct i2c_atr - The I2C ATR instance
a076a860acae77 Luca Ceresoli  2023-06-19   64   * @parent:    The parent &struct i2c_adapter
a076a860acae77 Luca Ceresoli  2023-06-19   65   * @dev:       The device that owns the I2C ATR instance
a076a860acae77 Luca Ceresoli  2023-06-19   66   * @ops:       &struct i2c_atr_ops
a076a860acae77 Luca Ceresoli  2023-06-19   67   * @priv:      Private driver data, set with i2c_atr_set_driver_data()
a076a860acae77 Luca Ceresoli  2023-06-19   68   * @algo:      The &struct i2c_algorithm for adapters
a076a860acae77 Luca Ceresoli  2023-06-19   69   * @lock:      Lock for the I2C bus segment (see &struct i2c_lock_operations)
a076a860acae77 Luca Ceresoli  2023-06-19   70   * @max_adapters: Maximum number of adapters this I2C ATR can have
a076a860acae77 Luca Ceresoli  2023-06-19   71   * @num_aliases: Number of aliases in the aliases array
a076a860acae77 Luca Ceresoli  2023-06-19   72   * @aliases:   The aliases array
a076a860acae77 Luca Ceresoli  2023-06-19   73   * @alias_mask_lock: Lock protecting alias_use_mask
a076a860acae77 Luca Ceresoli  2023-06-19   74   * @alias_use_mask: Bitmask for used aliases in aliases array
a076a860acae77 Luca Ceresoli  2023-06-19   75   * @i2c_nb:    Notifier for remote client add & del events
a076a860acae77 Luca Ceresoli  2023-06-19   76   * @adapter:   Array of adapters
a076a860acae77 Luca Ceresoli  2023-06-19   77   */
a076a860acae77 Luca Ceresoli  2023-06-19   78  struct i2c_atr {
a076a860acae77 Luca Ceresoli  2023-06-19   79  	struct i2c_adapter *parent;
a076a860acae77 Luca Ceresoli  2023-06-19   80  	struct device *dev;
a076a860acae77 Luca Ceresoli  2023-06-19   81  	const struct i2c_atr_ops *ops;
a076a860acae77 Luca Ceresoli  2023-06-19   82  
a076a860acae77 Luca Ceresoli  2023-06-19   83  	void *priv;
a076a860acae77 Luca Ceresoli  2023-06-19   84  
a076a860acae77 Luca Ceresoli  2023-06-19   85  	struct i2c_algorithm algo;
a076a860acae77 Luca Ceresoli  2023-06-19   86  	/* lock for the I2C bus segment (see struct i2c_lock_operations) */
a076a860acae77 Luca Ceresoli  2023-06-19   87  	struct mutex lock;
f2d3b6b436282b Tomi Valkeinen 2024-11-22   88  	struct lock_class_key lock_key;
a076a860acae77 Luca Ceresoli  2023-06-19   89  	int max_adapters;
a076a860acae77 Luca Ceresoli  2023-06-19   90  
a076a860acae77 Luca Ceresoli  2023-06-19   91  	size_t num_aliases;
a076a860acae77 Luca Ceresoli  2023-06-19   92  	const u16 *aliases;
a076a860acae77 Luca Ceresoli  2023-06-19   93  	/* Protects alias_use_mask */
a076a860acae77 Luca Ceresoli  2023-06-19   94  	spinlock_t alias_mask_lock;
a076a860acae77 Luca Ceresoli  2023-06-19   95  	unsigned long *alias_use_mask;
a076a860acae77 Luca Ceresoli  2023-06-19   96  
a076a860acae77 Luca Ceresoli  2023-06-19   97  	struct notifier_block i2c_nb;
a076a860acae77 Luca Ceresoli  2023-06-19   98  
3a133a4e44554b Kees Cook      2023-09-22   99  	struct i2c_adapter *adapter[] __counted_by(max_adapters);
a076a860acae77 Luca Ceresoli  2023-06-19 @100  };
a076a860acae77 Luca Ceresoli  2023-06-19  101  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

