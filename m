Return-Path: <linux-i2c+bounces-5694-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2641D95BD59
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78EFDB25ACD
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 17:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F68A1CE70F;
	Thu, 22 Aug 2024 17:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOSwlKoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A11CE704
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 17:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724347949; cv=none; b=OTVwQYwYgS+Dd0bg+tkTj+RSdZ8pTGUkySlvkLIjcJsNn/UsVw3oHkj5aeQtsHdx4VtJKYsnv567jcGAk5qEI6BNu6kYCEpJzPXiPIo9pvpM1k42EctryEEVIfjAauQRX0eMhdb3pQOBJsisOk6jfdQU5iMA7RKTegfLi9HfQN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724347949; c=relaxed/simple;
	bh=AfTrLWvJzP6sg0GLoYe91VEO5f6pKvEjMe1OPa+oUw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER9jHy6/GtKPNBn4oosg8oF5tMeR1vnexO/fmw6FgmvvxPzPFvmGMm+Ij4sLQtkbSIvI56ABUn7iNJRtaRZ/uPJkwb9KzFwoE0Lu/usxhCtId20irpGfHtbiJl1JIhKe0sb1UfEvs+suejashzgxbUleqg5hiJ9S0U7sCZjb7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOSwlKoI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724347947; x=1755883947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AfTrLWvJzP6sg0GLoYe91VEO5f6pKvEjMe1OPa+oUw0=;
  b=IOSwlKoIwYJQTG3paphGTL9nK/D4w8/NHpEvsWHee5iURk5jun6FU/Cd
   Lgde/l+s3ME6qJlcZsPBBfVBGllLomcBulJzRfHV5R2WLQyqDc7g/m34f
   ARP93z77wSFVwZuuN2R210BiiyPnmzGS3L7RIJGCi5arVDYeRXRIARBGw
   u8/9U5LfTSQPy/UsSsue1+lkPilggXXB6ddZJOjgjTI7D5IPTe5QKuShm
   4LWrevZyvYK8Zmgio9M1KMmH4yo36MhvTqUXnb42Ike93N9ph9gD9gB8Y
   07YyWjghF9gD1+cd0kv6c7+ZIkHBNfxWO8yWkOfc/N8Y9LvsVafwT0aES
   A==;
X-CSE-ConnectionGUID: NwxOWmxoQzqIW6YThRwHpQ==
X-CSE-MsgGUID: 1uj8RYnISKKbPSEdAHv+4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22595776"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="22595776"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 10:32:25 -0700
X-CSE-ConnectionGUID: pok33G5YSpq47c0tk1gJfw==
X-CSE-MsgGUID: XIKRcKBiTQiu2PljvX415Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="61552883"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Aug 2024 10:32:23 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shBfZ-000D2P-0g;
	Thu, 22 Aug 2024 17:32:21 +0000
Date: Fri, 23 Aug 2024 01:31:24 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 1/3] i2c: Replace list-based mechanism for handling
 auto-detected clients
Message-ID: <202408230125.uTXoWaqi-lkp@intel.com>
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
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240823/202408230125.uTXoWaqi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230125.uTXoWaqi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230125.uTXoWaqi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/ppc/keywest.c:10:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:25:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/powerpc/include/asm/io.h:24:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> sound/ppc/keywest.c:69:58: error: no member named 'clients' in 'struct i2c_driver'
      69 |                       &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~  ^
   5 warnings and 1 error generated.


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

