Return-Path: <linux-i2c+bounces-1269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DED82B22D
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 16:53:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ADA81C244C1
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jan 2024 15:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9A74EB28;
	Thu, 11 Jan 2024 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TItDbZb+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8484CE0A
	for <linux-i2c@vger.kernel.org>; Thu, 11 Jan 2024 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704988431; x=1736524431;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eNYB9PnHuimYK9NcsIM4IFhKor4+3mjogDOh+XIWozw=;
  b=TItDbZb+rFNgTmWjKBZGYyboyL9GHYa22USEirqmUdmmB8/kCrLWHTZm
   9QX1zgiD5zi95axl3IGzUoZ+7gvQZpPY3mCDZqA1Kl6xR6zYW7qkRLi9E
   FQ67dgSaGQbGb1ESwmwciCOj5UuYjykj4X+1W/r1B5cDMpJ1FeLjebUzg
   /f1KefV68hbfHoH94oJeRIQ5rScvLCv+dzqz3OqRoNHjWaVqgG0c1MDe1
   syPuZ8nVUCfx9eJOyhmUUngEVFDMQ36p2IFWwri50F/ZpnRudWMy5/ZDC
   Wcq+1MgXqr5hK9aEdmSZoFjx2ZoDpfFqh6OzA/hwGvoxW/Q7zt4TuRbGV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="5623004"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="5623004"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 07:53:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="758801304"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="758801304"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Jan 2024 07:53:47 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNxNH-0008Q4-2m;
	Thu, 11 Jan 2024 15:53:44 +0000
Date: Thu, 11 Jan 2024 23:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Heiner Kallweit <hkallweit1@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Peter Korsgaard <peter.korsgaard@barco.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 2/4] i2c: mux: add basic support for calling
 i2c_register_spd on muxed bus segments
Message-ID: <202401112333.GUpSFOuc-lkp@intel.com>
References: <53e5c71a-d954-4211-91a1-de067451d532@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53e5c71a-d954-4211-91a1-de067451d532@gmail.com>

Hi Heiner,

kernel test robot noticed the following build errors:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on next-20240111]
[cannot apply to linus/master v6.7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heiner-Kallweit/i2c-smbus-Prepare-i2c_register_spd-for-usage-on-muxed-segments/20240111-042152
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
patch link:    https://lore.kernel.org/r/53e5c71a-d954-4211-91a1-de067451d532%40gmail.com
patch subject: [PATCH 2/4] i2c: mux: add basic support for calling i2c_register_spd on muxed bus segments
config: i386-randconfig-053-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112333.GUpSFOuc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401112333.GUpSFOuc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401112333.GUpSFOuc-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/i2c/i2c-mux.o: in function `i2c_mux_add_adapter':
>> drivers/i2c/i2c-mux.c:434: undefined reference to `i2c_register_spd'


vim +434 drivers/i2c/i2c-mux.c

   283	
   284	int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
   285				u32 force_nr, u32 chan_id,
   286				unsigned int class)
   287	{
   288		struct i2c_adapter *parent = muxc->parent;
   289		struct i2c_mux_priv *priv;
   290		char symlink_name[20];
   291		int ret;
   292	
   293		if (muxc->num_adapters >= muxc->max_adapters) {
   294			dev_err(muxc->dev, "No room for more i2c-mux adapters\n");
   295			return -EINVAL;
   296		}
   297	
   298		priv = kzalloc(sizeof(*priv), GFP_KERNEL);
   299		if (!priv)
   300			return -ENOMEM;
   301	
   302		/* Set up private adapter data */
   303		priv->muxc = muxc;
   304		priv->chan_id = chan_id;
   305	
   306		/* Need to do algo dynamically because we don't know ahead
   307		 * of time what sort of physical adapter we'll be dealing with.
   308		 */
   309		if (parent->algo->master_xfer) {
   310			if (muxc->mux_locked)
   311				priv->algo.master_xfer = i2c_mux_master_xfer;
   312			else
   313				priv->algo.master_xfer = __i2c_mux_master_xfer;
   314		}
   315		if (parent->algo->master_xfer_atomic)
   316			priv->algo.master_xfer_atomic = priv->algo.master_xfer;
   317	
   318		if (parent->algo->smbus_xfer) {
   319			if (muxc->mux_locked)
   320				priv->algo.smbus_xfer = i2c_mux_smbus_xfer;
   321			else
   322				priv->algo.smbus_xfer = __i2c_mux_smbus_xfer;
   323		}
   324		if (parent->algo->smbus_xfer_atomic)
   325			priv->algo.smbus_xfer_atomic = priv->algo.smbus_xfer;
   326	
   327		priv->algo.functionality = i2c_mux_functionality;
   328	
   329		/* Now fill out new adapter structure */
   330		snprintf(priv->adap.name, sizeof(priv->adap.name),
   331			 "i2c-%d-mux (chan_id %d)", i2c_adapter_id(parent), chan_id);
   332		priv->adap.owner = THIS_MODULE;
   333		priv->adap.algo = &priv->algo;
   334		priv->adap.algo_data = priv;
   335		priv->adap.dev.parent = &parent->dev;
   336		priv->adap.retries = parent->retries;
   337		priv->adap.timeout = parent->timeout;
   338		priv->adap.quirks = parent->quirks;
   339		if (muxc->mux_locked)
   340			priv->adap.lock_ops = &i2c_mux_lock_ops;
   341		else
   342			priv->adap.lock_ops = &i2c_parent_lock_ops;
   343	
   344		/* Sanity check on class */
   345		if (i2c_mux_parent_classes(parent) & class & ~I2C_CLASS_DEPRECATED)
   346			dev_err(&parent->dev,
   347				"Segment %d behind mux can't share classes with ancestors\n",
   348				chan_id);
   349		else
   350			priv->adap.class = class;
   351	
   352		/*
   353		 * Try to populate the mux adapter's of_node, expands to
   354		 * nothing if !CONFIG_OF.
   355		 */
   356		if (muxc->dev->of_node) {
   357			struct device_node *dev_node = muxc->dev->of_node;
   358			struct device_node *mux_node, *child = NULL;
   359			u32 reg;
   360	
   361			if (muxc->arbitrator)
   362				mux_node = of_get_child_by_name(dev_node, "i2c-arb");
   363			else if (muxc->gate)
   364				mux_node = of_get_child_by_name(dev_node, "i2c-gate");
   365			else
   366				mux_node = of_get_child_by_name(dev_node, "i2c-mux");
   367	
   368			if (mux_node) {
   369				/* A "reg" property indicates an old-style DT entry */
   370				if (!of_property_read_u32(mux_node, "reg", &reg)) {
   371					of_node_put(mux_node);
   372					mux_node = NULL;
   373				}
   374			}
   375	
   376			if (!mux_node)
   377				mux_node = of_node_get(dev_node);
   378			else if (muxc->arbitrator || muxc->gate)
   379				child = of_node_get(mux_node);
   380	
   381			if (!child) {
   382				for_each_child_of_node(mux_node, child) {
   383					ret = of_property_read_u32(child, "reg", &reg);
   384					if (ret)
   385						continue;
   386					if (chan_id == reg)
   387						break;
   388				}
   389			}
   390	
   391			priv->adap.dev.of_node = child;
   392			of_node_put(mux_node);
   393		}
   394	
   395		/*
   396		 * Associate the mux channel with an ACPI node.
   397		 */
   398		if (has_acpi_companion(muxc->dev))
   399			acpi_preset_companion(&priv->adap.dev,
   400					      ACPI_COMPANION(muxc->dev),
   401					      chan_id);
   402	
   403		if (force_nr) {
   404			priv->adap.nr = force_nr;
   405			ret = i2c_add_numbered_adapter(&priv->adap);
   406			if (ret < 0) {
   407				dev_err(&parent->dev,
   408					"failed to add mux-adapter %u as bus %u (error=%d)\n",
   409					chan_id, force_nr, ret);
   410				goto err_free_priv;
   411			}
   412		} else {
   413			ret = i2c_add_adapter(&priv->adap);
   414			if (ret < 0) {
   415				dev_err(&parent->dev,
   416					"failed to add mux-adapter %u (error=%d)\n",
   417					chan_id, ret);
   418				goto err_free_priv;
   419			}
   420		}
   421	
   422		WARN(sysfs_create_link(&priv->adap.dev.kobj, &muxc->dev->kobj,
   423				       "mux_device"),
   424		     "can't create symlink to mux device\n");
   425	
   426		snprintf(symlink_name, sizeof(symlink_name), "channel-%u", chan_id);
   427		WARN(sysfs_create_link(&muxc->dev->kobj, &priv->adap.dev.kobj,
   428				       symlink_name),
   429		     "can't create symlink to channel %u\n", chan_id);
   430		dev_info(&parent->dev, "Added multiplexed i2c bus %d\n",
   431			 i2c_adapter_id(&priv->adap));
   432	
   433		if (muxc->register_spd)
 > 434			i2c_register_spd(&priv->adap);
   435	
   436		muxc->adapter[muxc->num_adapters++] = &priv->adap;
   437		return 0;
   438	
   439	err_free_priv:
   440		kfree(priv);
   441		return ret;
   442	}
   443	EXPORT_SYMBOL_GPL(i2c_mux_add_adapter);
   444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

