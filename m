Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3C5157AAE2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Jul 2022 02:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232935AbiGTAVA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Jul 2022 20:21:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbiGTAVA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Jul 2022 20:21:00 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB8214F68E
        for <linux-i2c@vger.kernel.org>; Tue, 19 Jul 2022 17:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658276458; x=1689812458;
  h=subject:references:in-reply-to:to:cc:from:message-id:
   date:mime-version:content-transfer-encoding;
  bh=LEVy3y/l9N32ajGDwgM3nSqiQq7GvMSKd1B6jfpuooE=;
  b=V+p6ckHIAiBPoNudYP3krdGfbYGjhIeZFaTUOUiJSaHOIqElsyc63Ual
   6kICSSJ1GKHtmtnU6qiraKlH8Xlm4x5njujNWqQ3ZjdG5IxR75wacTDYB
   s/hgpTaCVvWins9SdRfAaA678NnGKtTeNUJqSybbJul3GrBrQHGpOs+Hc
   FeV1Rjy8gCALRFKclMHmn0DoX5aQ9VrXZVXXrkKn4Rl6HBe3uTOwm4hmv
   lU92R9cVAgl2nBe7rQGTe2hEOirWVMQkoLHyOPWrEwctWFGUX+Qem/1pZ
   C4A/aeAmcjabxGOg5GgNTgpsyWC4kd0HVahrP3GTl4XyuCCqbSzBA8grZ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="269667283"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="269667283"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 17:20:58 -0700
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="625419955"
Received: from fzhai-mobl.ccr.corp.intel.com (HELO [10.255.30.167]) ([10.255.30.167])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 17:20:55 -0700
Subject: Re: [PATCH] i2c: Use u8 type in i2c transfer calls
References: <202207190634.ToyhlXSz-lkp@intel.com>
In-Reply-To: <202207190634.ToyhlXSz-lkp@intel.com>
To:     Jason Gerecke <killertofu@gmail.com>, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa-dev@sang-engineering.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        "Tobita, Tatsunosuke" <tatsunosuke.tobita@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org
From:   kernel test robot <rong.a.chen@intel.com>
X-Forwarded-Message-Id: <202207190634.ToyhlXSz-lkp@intel.com>
Message-ID: <0551a3ad-8c42-78fe-5b50-ebbc003e55e6@intel.com>
Date:   Wed, 20 Jul 2022 08:20:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


Hi Jason,

I love your patch! Yet something to improve:

[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linus/master v5.19-rc7 next-20220718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url: 
https://github.com/intel-lab-lkp/linux/commits/Jason-Gerecke/i2c-Use-u8-type-in-i2c-transfer-calls/20220718-233658
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git 
i2c/for-next
config: hexagon-randconfig-r026-20220718 
(https://download.01.org/0day-ci/archive/20220719/202207190634.ToyhlXSz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 
d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
         wget 
https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
-O ~/bin/make.cross
         chmod +x ~/bin/make.cross
         # 
https://github.com/intel-lab-lkp/linux/commit/9732240c23a365c0590f05ce83196869235a2ea7
         git remote add linux-review https://github.com/intel-lab-lkp/linux
         git fetch --no-tags linux-review 
Jason-Gerecke/i2c-Use-u8-type-in-i2c-transfer-calls/20220718-233658
         git checkout 9732240c23a365c0590f05ce83196869235a2ea7
         # save the config file
         mkdir build_dir && cp config build_dir/.config
         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 
O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/adc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/adc/max1363.c:1645:12: error: incompatible function pointer types assigning to 'int (*)(const struct i2c_client *, const char *, int)' from 'int (const struct i2c_client *, const u8 *, int)' (aka 'int (const struct i2c_client *, const unsigned char *, int)') [-Werror,-Wincompatible-function-pointer-types]
                    st->send = i2c_master_send;
                             ^ ~~~~~~~~~~~~~~~
>> drivers/iio/adc/max1363.c:1646:12: error: incompatible function pointer types assigning to 'int (*)(const struct i2c_client *, char *, int)' from 'int (const struct i2c_client *, u8 *, int)' (aka 'int (const struct i2c_client *, unsigned char *, int)') [-Werror,-Wincompatible-function-pointer-types]
                    st->recv = i2c_master_recv;
                             ^ ~~~~~~~~~~~~~~~
    2 errors generated.


vim +1645 drivers/iio/adc/max1363.c

a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1584  fc52692c49969e drivers/iio/adc/max1363.c 
Greg Kroah-Hartman 2012-12-21  1585  static int max1363_probe(struct 
i2c_client *client,
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1586  			 const struct i2c_device_id *id)
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1587  {
cd4361c7e2e077 drivers/staging/iio/adc/max1363_core.c Michael Hennerich 
  2012-02-22  1588  	int ret;
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1589  	struct max1363_state *st;
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1590  	struct iio_dev *indio_dev;
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1591  	struct regulator *vref;
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1592  6917e1d9af2c50 drivers/iio/adc/max1363.c 
   Sachin Kamat       2013-07-22  1593  	indio_dev = 
devm_iio_device_alloc(&client->dev,
6917e1d9af2c50 drivers/iio/adc/max1363.c              Sachin Kamat 
  2013-07-22  1594  					  sizeof(struct max1363_state));
6917e1d9af2c50 drivers/iio/adc/max1363.c              Sachin Kamat 
  2013-07-22  1595  	if (!indio_dev)
6917e1d9af2c50 drivers/iio/adc/max1363.c              Sachin Kamat 
  2013-07-22  1596  		return -ENOMEM;
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1597  a1ff6d25261315 drivers/iio/adc/max1363.c 
   Alexandru Ardelean 2021-09-26  1598  	ret = 
devm_iio_map_array_register(&client->dev, indio_dev,
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1599  					  client->dev.platform_data);
0b27d678c7fbeb drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2012-04-10  1600  	if (ret < 0)
6917e1d9af2c50 drivers/iio/adc/max1363.c              Sachin Kamat 
  2013-07-22  1601  		return ret;
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1602  3dba81ba803ca0 
drivers/staging/iio/adc/max1363_core.c Jonathan Cameron   2011-04-15 
1603  	st = iio_priv(indio_dev);
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1604  bf09cddb2cd402 drivers/iio/adc/max1363.c 
   Rohit Sarkar       2020-03-15  1605  	mutex_init(&st->lock);
7c3e8675f37503 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1606  	st->reg = devm_regulator_get(&client->dev, "vcc");
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1607  	if (IS_ERR(st->reg))
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1608  		return PTR_ERR(st->reg);
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1609  b77b8f8c20c83c drivers/staging/iio/adc/max1363.c 
   Jonathan Cameron   2012-10-06  1610  	ret = regulator_enable(st->reg);
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1611  	if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1612  		return ret;
b77b8f8c20c83c drivers/staging/iio/adc/max1363.c      Jonathan Cameron 
  2012-10-06  1613  a1ff6d25261315 drivers/iio/adc/max1363.c 
   Alexandru Ardelean 2021-09-26  1614  	ret = 
devm_add_action_or_reset(&client->dev, max1363_reg_disable, st->reg);
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1615  	if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1616  		return ret;
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1617  f84ff467c0ce5b drivers/iio/adc/max1363.c 
   Jonathan Cameron   2020-06-28  1618  	st->chip_info = 
device_get_match_data(&client->dev);
794ac821cc44e4 drivers/iio/adc/max1363.c              Julia Lawall 
  2018-05-21  1619  	if (!st->chip_info)
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1620  		st->chip_info = 
&max1363_chip_info_tbl[id->driver_data];
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1621  	st->client = client;
3dba81ba803ca0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-04-15  1622  a405b00e4470b1 drivers/iio/adc/max1363.c 
   Guenter Roeck      2013-02-03  1623  	st->vref_uv = 
st->chip_info->int_vref_mv * 1000;
55b40d37311807 drivers/iio/adc/max1363.c              Guenter Roeck 
  2014-01-27  1624  	vref = devm_regulator_get_optional(&client->dev, 
"vref");
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1625  	if (!IS_ERR(vref)) {
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1626  		int vref_uv;
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1627  a405b00e4470b1 drivers/iio/adc/max1363.c 
   Guenter Roeck      2013-02-03  1628  		ret = regulator_enable(vref);
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1629  		if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1630  			return ret;
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1631  a1ff6d25261315 drivers/iio/adc/max1363.c 
Alexandru Ardelean 2021-09-26  1632  		ret = 
devm_add_action_or_reset(&client->dev, max1363_reg_disable, vref);
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1633  		if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1634  			return ret;
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1635  a405b00e4470b1 drivers/iio/adc/max1363.c 
Guenter Roeck      2013-02-03  1636  		st->vref = vref;
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1637  		vref_uv = regulator_get_voltage(vref);
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1638  		if (vref_uv <= 0)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1639  			return -EINVAL;
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1640  a405b00e4470b1 drivers/iio/adc/max1363.c 
Guenter Roeck      2013-02-03  1641  		st->vref_uv = vref_uv;
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1642  	}
a405b00e4470b1 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1643  61bdda69222c09 drivers/iio/adc/max1363.c 
   Vivien Didelot     2013-10-20  1644  	if 
(i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20 @1645  		st->send = i2c_master_send;
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20 @1646  		st->recv = i2c_master_recv;
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1647  	} else if (i2c_check_functionality(client->adapter, 
I2C_FUNC_SMBUS_BYTE)
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1648  			&& st->chip_info->bits == 8) {
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1649  		st->send = max1363_smbus_send;
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1650  		st->recv = max1363_smbus_recv;
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1651  	} else {
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1652  		return -EOPNOTSUPP;
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1653  	}
61bdda69222c09 drivers/iio/adc/max1363.c              Vivien Didelot 
  2013-10-20  1654  cd4361c7e2e077 
drivers/staging/iio/adc/max1363_core.c Michael Hennerich  2012-02-22 
1655  	ret = max1363_alloc_scan_masks(indio_dev);
cd4361c7e2e077 drivers/staging/iio/adc/max1363_core.c Michael Hennerich 
  2012-02-22  1656  	if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1657  		return ret;
82020b0ef15de0 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2010-05-04  1658  845bd12ac78f92 
drivers/staging/iio/adc/max1363_core.c Jonathan Cameron   2011-05-18 
1659  	indio_dev->name = id->name;
8e7d967244a8ee drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-08-30  1660  	indio_dev->channels = st->chip_info->channels;
8e7d967244a8ee drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-08-30  1661  	indio_dev->num_channels = st->chip_info->num_channels;
6fe8135fccd66a drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1662  	indio_dev->info = st->chip_info->info;
6fe8135fccd66a drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1663  	indio_dev->modes = INDIO_DIRECT_MODE;
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1664  	ret = max1363_initial_setup(st);
58f0a255454dc2 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1665  	if (ret < 0)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1666  		return ret;
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1667  a1ff6d25261315 drivers/iio/adc/max1363.c 
   Alexandru Ardelean 2021-09-26  1668  	ret = 
devm_iio_triggered_buffer_setup(&client->dev, indio_dev, NULL,
7a1aeba7ed0d5a drivers/iio/adc/max1363.c              Lars-Peter Clausen 
2013-09-16  1669  					      &max1363_trigger_handler, NULL);
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1670  	if (ret)
a1ff6d25261315 drivers/iio/adc/max1363.c              Alexandru Ardelean 
2021-09-26  1671  		return ret;
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1672  6fe8135fccd66a 
drivers/staging/iio/adc/max1363_core.c Jonathan Cameron   2011-05-18 
1673  	if (client->irq) {
7c3e8675f37503 drivers/iio/adc/max1363.c              Guenter Roeck 
  2013-02-03  1674  		ret = devm_request_threaded_irq(&client->dev, 
st->client->irq,
aaf370db7dad57 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1675  					   NULL,
aaf370db7dad57 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1676  					   &max1363_event_handler,
aaf370db7dad57 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1677  					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
aaf370db7dad57 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1678  					   "max1363_event",
aaf370db7dad57 drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1679  					   indio_dev);
298cd976e07f1a drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2011-05-18  1680  440a5200347734 
drivers/staging/iio/adc/max1363_core.c Jonathan Cameron   2010-06-26 
1681  		if (ret)
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1682  			return ret;
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1683  	}
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1684  a1ff6d25261315 drivers/iio/adc/max1363.c 
   Alexandru Ardelean 2021-09-26  1685  	return 
devm_iio_device_register(&client->dev, indio_dev);
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1686  }
d1325cf45077bd drivers/staging/iio/adc/max1363_core.c Jonathan Cameron 
  2009-08-18  1687
-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
