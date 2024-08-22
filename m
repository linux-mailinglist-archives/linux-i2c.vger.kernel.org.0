Return-Path: <linux-i2c+bounces-5690-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0AB95BA9E
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 17:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B11A7288317
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 15:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1299E1CC8AE;
	Thu, 22 Aug 2024 15:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TC2+qnBC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EEB1C9ED5
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 15:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724341041; cv=none; b=HupKXUHh5AfpaYzbb2WlRfeTLNphDxEcsBUn96ocCMk5bU9sGEYj3zyZIuAPeD4NIsWdGmZAx5Jz3i3wBRKA0omC/+zApr8L9rE/xeuxegG4C6n5xl16Q48kj78Py4kqbVWPOR0CacldY7jjl4tbDXsBRxNsMmem677P0rNkZFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724341041; c=relaxed/simple;
	bh=UEsJcEl1gwaIMw9Wk2t1Y+j9+uYtG2UJJAonTfVMLRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sKFhIThjseGrMZnSQsm2vh3YRFfqnr1O5Hvnq8lnEiFe/lS/VcjDqwraKDbAL1VU6UnFQK5qbdRqE8Ag5jGROjUN1TBTCyOk1up2aP/qx/cpv1MoYCw5krT/zGD7UKkeobngRmpFNtaTPFRZY9qhYJiUtMJDC+gZAIS20cXVhQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TC2+qnBC; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724341040; x=1755877040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UEsJcEl1gwaIMw9Wk2t1Y+j9+uYtG2UJJAonTfVMLRQ=;
  b=TC2+qnBCKQzs3Ij4b9cImbTkt5XPvH08IXC1Ii8vIhb6XBGN0NNaEtF+
   JswKfWryqApjLWimoIScjIApcAt1aoxfO6dlxF6MgOV5OiCrgrRfvKYeF
   1lB6N+SK1AODcju0j93lJnMi8/JnlRoN81kPcLJbnXBBLTTCkPVabNdqz
   epjU51b51wkKBsrdmqGmqh60B5QlZfVS0a75BLjffkpsSOxuWa55A3U76
   5fI/sDsXYhH9DffLacyrcMhTr2qXuo+chpAcjz5z60fgGN9/7vEg717bF
   cBHGIyVlLKoCOsdTFLExmRQJltaS6W9J3xHu/LP2+YKD+yEDB/x7tim3b
   Q==;
X-CSE-ConnectionGUID: PA+VinqoTvSTgunQ0VjlLQ==
X-CSE-MsgGUID: Zbh1Ebd+Romw5bm1MmlU5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33924436"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="33924436"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 08:37:19 -0700
X-CSE-ConnectionGUID: 4QWdOsVoQ+G4RbBnR4DW5g==
X-CSE-MsgGUID: orh+OBCJR66wT8Tgkh3rIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61627814"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Aug 2024 08:37:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh9sA-000CwA-2s;
	Thu, 22 Aug 2024 15:37:14 +0000
Date: Thu, 22 Aug 2024 23:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/3] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <202408222315.iGb5Ttng-lkp@intel.com>
References: <9eb8879b-f975-41fc-a098-0ad189cc583d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eb8879b-f975-41fc-a098-0ad189cc583d@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v6.11-rc4 next-20240822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/i2c-Replace-list-based-mechanism-for-handling-auto-detected-clients/20240822-044950
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/9eb8879b-f975-41fc-a098-0ad189cc583d%40gmail.com
patch subject: [PATCH 1/3] i2c: Replace list-based mechanism for handling auto-detected clients
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240822/202408222315.iGb5Ttng-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408222315.iGb5Ttng-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408222315.iGb5Ttng-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/ppc/keywest.c: In function 'keywest_attach_adapter':
>> sound/ppc/keywest.c:69:70: error: 'struct i2c_driver' has no member named 'clients'
      69 |                       &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
         |                                                                      ^~


vim +69 sound/ppc/keywest.c

5de4155bb3760f Jean Delvare       2009-04-20  28  
5de4155bb3760f Jean Delvare       2009-04-20  29  /*
5de4155bb3760f Jean Delvare       2009-04-20  30   * This is kind of a hack, best would be to turn powermac to fixed i2c
5de4155bb3760f Jean Delvare       2009-04-20  31   * bus numbers and declare the sound device as part of platform
5de4155bb3760f Jean Delvare       2009-04-20  32   * initialization
5de4155bb3760f Jean Delvare       2009-04-20  33   */
^1da177e4c3f41 Linus Torvalds     2005-04-16  34  static int keywest_attach_adapter(struct i2c_adapter *adapter)
^1da177e4c3f41 Linus Torvalds     2005-04-16  35  {
5de4155bb3760f Jean Delvare       2009-04-20  36  	struct i2c_board_info info;
04a9af2e038423 Wolfram Sang       2020-03-26  37  	struct i2c_client *client;
^1da177e4c3f41 Linus Torvalds     2005-04-16  38  
^1da177e4c3f41 Linus Torvalds     2005-04-16  39  	if (! keywest_ctx)
^1da177e4c3f41 Linus Torvalds     2005-04-16  40  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  41  
903dba1eae4927 Jean Delvare       2009-05-14  42  	if (strncmp(adapter->name, "mac-io", 6))
ac397c80de8950 Wolfram Sang       2015-05-09  43  		return -EINVAL; /* ignored */
^1da177e4c3f41 Linus Torvalds     2005-04-16  44  
5de4155bb3760f Jean Delvare       2009-04-20  45  	memset(&info, 0, sizeof(struct i2c_board_info));
75b1a8f9d62e50 Joe Perches        2021-01-04  46  	strscpy(info.type, "keywest", I2C_NAME_SIZE);
5de4155bb3760f Jean Delvare       2009-04-20  47  	info.addr = keywest_ctx->addr;
04a9af2e038423 Wolfram Sang       2020-03-26  48  	client = i2c_new_client_device(adapter, &info);
04a9af2e038423 Wolfram Sang       2020-03-26  49  	if (IS_ERR(client))
04a9af2e038423 Wolfram Sang       2020-03-26  50  		return PTR_ERR(client);
04a9af2e038423 Wolfram Sang       2020-03-26  51  	keywest_ctx->client = client;
04a9af2e038423 Wolfram Sang       2020-03-26  52  
18c4078489fe06 Takashi Iwai       2009-10-01  53  	/*
18c4078489fe06 Takashi Iwai       2009-10-01  54  	 * We know the driver is already loaded, so the device should be
18c4078489fe06 Takashi Iwai       2009-10-01  55  	 * already bound. If not it means binding failed, and then there
18c4078489fe06 Takashi Iwai       2009-10-01  56  	 * is no point in keeping the device instantiated.
18c4078489fe06 Takashi Iwai       2009-10-01  57  	 */
a7cde6d25c494e Lars-Peter Clausen 2013-09-29  58  	if (!keywest_ctx->client->dev.driver) {
18c4078489fe06 Takashi Iwai       2009-10-01  59  		i2c_unregister_device(keywest_ctx->client);
18c4078489fe06 Takashi Iwai       2009-10-01  60  		keywest_ctx->client = NULL;
18c4078489fe06 Takashi Iwai       2009-10-01  61  		return -ENODEV;
18c4078489fe06 Takashi Iwai       2009-10-01  62  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  63  	
5de4155bb3760f Jean Delvare       2009-04-20  64  	/*
5de4155bb3760f Jean Delvare       2009-04-20  65  	 * Let i2c-core delete that device on driver removal.
5de4155bb3760f Jean Delvare       2009-04-20  66  	 * This is safe because i2c-core holds the core_lock mutex for us.
5de4155bb3760f Jean Delvare       2009-04-20  67  	 */
5de4155bb3760f Jean Delvare       2009-04-20  68  	list_add_tail(&keywest_ctx->client->detected,
a7cde6d25c494e Lars-Peter Clausen 2013-09-29 @69  		      &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
^1da177e4c3f41 Linus Torvalds     2005-04-16  70  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  71  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

