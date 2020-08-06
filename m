Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DD423E446
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 01:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbgHFXEo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 19:04:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:48985 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725812AbgHFXEo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 19:04:44 -0400
IronPort-SDR: HBjvIqRMcoIopKA6xFe/F3hYWtjKYnXz6JxGgyeDfoD3OPcno2GrqoanYATeHnHLjdlEa/U2dK
 UVaERs+WUyiQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="140824635"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="140824635"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 16:02:31 -0700
IronPort-SDR: BhaZr2G7cHBUYGrnqOJQSuR0McxhDZkUCZHjVDO/n54TOOef5xPPs5zPAtUSamm+89VUC+FV1j
 sDTFKOJfmj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="397412936"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2020 16:02:28 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k3ou4-0001qz-4V; Thu, 06 Aug 2020 23:02:28 +0000
Date:   Fri, 7 Aug 2020 07:01:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stephen Kitt <steve@sk2.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     kbuild-all@lists.01.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
Message-ID: <202008070632.kG1Hh96e%lkp@intel.com>
References: <20200806161645.9437-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20200806161645.9437-1-steve@sk2.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bcf876870b95592b52519ed4aafcf9d95999bc9c]

url:    https://github.com/0day-ci/linux/commits/Stephen-Kitt/hwmon-pmbus-use-simple-i2c-probe-function/20200807-024648
base:    bcf876870b95592b52519ed4aafcf9d95999bc9c
config: m68k-randconfig-r032-20200805 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=m68k 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/hwmon/pmbus/adm1275.c: In function 'adm1275_probe':
>> drivers/hwmon/pmbus/adm1275.c:794:32: error: passing argument 2 of 'pmbus_do_probe' from incompatible pointer type [-Werror=incompatible-pointer-types]
     794 |  return pmbus_do_probe(client, id, info);
         |                                ^~
         |                                |
         |                                const struct i2c_device_id *
   In file included from drivers/hwmon/pmbus/adm1275.c:19:
   drivers/hwmon/pmbus/pmbus.h:479:73: note: expected 'struct pmbus_driver_info *' but argument is of type 'const struct i2c_device_id *'
     479 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
         |                                               ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
>> drivers/hwmon/pmbus/adm1275.c:794:9: error: too many arguments to function 'pmbus_do_probe'
     794 |  return pmbus_do_probe(client, id, info);
         |         ^~~~~~~~~~~~~~
   In file included from drivers/hwmon/pmbus/adm1275.c:19:
   drivers/hwmon/pmbus/pmbus.h:479:5: note: declared here
     479 | int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
         |     ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/pmbus_do_probe +794 drivers/hwmon/pmbus/adm1275.c

87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  464  
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  465  static int adm1275_probe(struct i2c_client *client,
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  466  			 const struct i2c_device_id *id)
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  467  {
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  468  	s32 (*config_read_fn)(const struct i2c_client *client, u8 reg);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  469  	u8 block_buffer[I2C_SMBUS_BLOCK_MAX + 1];
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  470  	int config, device_config;
3b33ca41227a54 drivers/hwmon/adm1275.c       Guenter Roeck                           2011-06-30  471  	int ret;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  472  	struct pmbus_driver_info *info;
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  473  	struct adm1275_data *data;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  474  	const struct i2c_device_id *mid;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  475  	const struct coefficients *coefficients;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  476  	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  477  	int tindex = -1;
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  478  	u32 shunt;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  479  
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  480  	if (!i2c_check_functionality(client->adapter,
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  481  				     I2C_FUNC_SMBUS_READ_BYTE_DATA
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  482  				     | I2C_FUNC_SMBUS_BLOCK_DATA))
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  483  		return -ENODEV;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  484  
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  485  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, block_buffer);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  486  	if (ret < 0) {
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  487  		dev_err(&client->dev, "Failed to read Manufacturer ID\n");
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  488  		return ret;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  489  	}
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  490  	if (ret != 3 || strncmp(block_buffer, "ADI", 3)) {
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  491  		dev_err(&client->dev, "Unsupported Manufacturer ID\n");
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  492  		return -ENODEV;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  493  	}
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  494  
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  495  	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, block_buffer);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  496  	if (ret < 0) {
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  497  		dev_err(&client->dev, "Failed to read Manufacturer Model\n");
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  498  		return ret;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  499  	}
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  500  	for (mid = adm1275_id; mid->name[0]; mid++) {
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  501  		if (!strncasecmp(mid->name, block_buffer, strlen(mid->name)))
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  502  			break;
3b33ca41227a54 drivers/hwmon/adm1275.c       Guenter Roeck                           2011-06-30  503  	}
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  504  	if (!mid->name[0]) {
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  505  		dev_err(&client->dev, "Unsupported device\n");
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  506  		return -ENODEV;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  507  	}
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  508  
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  509  	if (id->driver_data != mid->driver_data)
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  510  		dev_notice(&client->dev,
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  511  			   "Device mismatch: Configured %s, detected %s\n",
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  512  			   id->name, mid->name);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  513  
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  514  	if (mid->driver_data == adm1272 || mid->driver_data == adm1278 ||
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  515  	    mid->driver_data == adm1293 || mid->driver_data == adm1294)
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  516  		config_read_fn = i2c_smbus_read_word_data;
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  517  	else
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  518  		config_read_fn = i2c_smbus_read_byte_data;
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  519  	config = config_read_fn(client, ADM1275_PMON_CONFIG);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  520  	if (config < 0)
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  521  		return config;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  522  
6d1d41c075a1a5 drivers/hwmon/pmbus/adm1275.c Chu Lin                                 2020-07-09  523  	device_config = config_read_fn(client, ADM1275_DEVICE_CONFIG);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  524  	if (device_config < 0)
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  525  		return device_config;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  526  
8b313ca7f1b982 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-22  527  	data = devm_kzalloc(&client->dev, sizeof(struct adm1275_data),
8b313ca7f1b982 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-22  528  			    GFP_KERNEL);
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  529  	if (!data)
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  530  		return -ENOMEM;
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  531  
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  532  	if (of_property_read_u32(client->dev.of_node,
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  533  				 "shunt-resistor-micro-ohms", &shunt))
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  534  		shunt = 1000; /* 1 mOhm if not set via DT */
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  535  
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  536  	if (shunt == 0)
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  537  		return -EINVAL;
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  538  
87102808d03948 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-09-30  539  	data->id = mid->driver_data;
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  540  
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  541  	info = &data->info;
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  542  
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  543  	info->pages = 1;
1061d8518f8bde drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-06-25  544  	info->format[PSC_VOLTAGE_IN] = direct;
1061d8518f8bde drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-06-25  545  	info->format[PSC_VOLTAGE_OUT] = direct;
1061d8518f8bde drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-06-25  546  	info->format[PSC_CURRENT_OUT] = direct;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  547  	info->format[PSC_POWER] = direct;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  548  	info->format[PSC_TEMPERATURE] = direct;
c83529c17e1204 drivers/hwmon/pmbus/adm1275.c Adamski, Krzysztof (Nokia - PL/Wroclaw  2019-05-29  549) 	info->func[0] = PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
c83529c17e1204 drivers/hwmon/pmbus/adm1275.c Adamski, Krzysztof (Nokia - PL/Wroclaw  2019-05-29  550) 			PMBUS_HAVE_SAMPLES;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  551  
c576e30cd0c981 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-09  552  	info->read_word_data = adm1275_read_word_data;
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  553  	info->read_byte_data = adm1275_read_byte_data;
c576e30cd0c981 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-09  554  	info->write_word_data = adm1275_write_word_data;
c576e30cd0c981 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-09  555  
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  556  	switch (data->id) {
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  557  	case adm1075:
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  558  		if (device_config & ADM1275_IOUT_WARN2_SELECT)
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  559  			data->have_oc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  560  		else
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  561  			data->have_uc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  562  		data->have_pin_max = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  563  		data->have_vaux_status = true;
c5e6763667ffc9 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-08-02  564  
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  565  		coefficients = adm1075_coefficients;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  566  		vindex = 0;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  567  		switch (config & ADM1075_IRANGE_MASK) {
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  568  		case ADM1075_IRANGE_25:
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  569  			cindex = 1;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  570  			pindex = 3;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  571  			break;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  572  		case ADM1075_IRANGE_50:
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  573  			cindex = 2;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  574  			pindex = 4;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  575  			break;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  576  		default:
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  577  			dev_err(&client->dev, "Invalid input current range");
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  578  			break;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  579  		}
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  580  
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  581  		info->func[0] |= PMBUS_HAVE_VIN | PMBUS_HAVE_PIN
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  582  		  | PMBUS_HAVE_STATUS_INPUT;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  583  		if (config & ADM1275_VIN_VOUT_SELECT)
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  584  			info->func[0] |=
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  585  			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
927112696654f4 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-24  586  		break;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  587  	case adm1272:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  588  		data->have_vout = true;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  589  		data->have_pin_max = true;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  590  		data->have_temp_max = true;
7d45deb31bec39 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2019-06-12  591  		data->have_power_sampling = true;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  592  
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  593  		coefficients = adm1272_coefficients;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  594  		vindex = (config & ADM1275_VRANGE) ? 1 : 0;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  595  		cindex = (config & ADM1272_IRANGE) ? 3 : 2;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  596  		/* pindex depends on the combination of the above */
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  597  		switch (config & (ADM1275_VRANGE | ADM1272_IRANGE)) {
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  598  		case 0:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  599  		default:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  600  			pindex = 4;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  601  			break;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  602  		case ADM1275_VRANGE:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  603  			pindex = 5;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  604  			break;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  605  		case ADM1272_IRANGE:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  606  			pindex = 6;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  607  			break;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  608  		case ADM1275_VRANGE | ADM1272_IRANGE:
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  609  			pindex = 7;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  610  			break;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  611  		}
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  612  		tindex = 8;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  613  
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  614  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  615  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  616  
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  617  		/* Enable VOUT if not enabled (it is disabled by default) */
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  618  		if (!(config & ADM1278_VOUT_EN)) {
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  619  			config |= ADM1278_VOUT_EN;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  620  			ret = i2c_smbus_write_byte_data(client,
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  621  							ADM1275_PMON_CONFIG,
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  622  							config);
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  623  			if (ret < 0) {
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  624  				dev_err(&client->dev,
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  625  					"Failed to enable VOUT monitoring\n");
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  626  				return -ENODEV;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  627  			}
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  628  		}
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  629  
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  630  		if (config & ADM1278_TEMP1_EN)
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  631  			info->func[0] |=
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  632  				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  633  		if (config & ADM1278_VIN_EN)
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  634  			info->func[0] |= PMBUS_HAVE_VIN;
4ff0ce227a1e65 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2018-03-10  635  		break;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  636  	case adm1275:
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  637  		if (device_config & ADM1275_IOUT_WARN2_SELECT)
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  638  			data->have_oc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  639  		else
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  640  			data->have_uc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  641  		data->have_vout = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  642  
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  643  		coefficients = adm1275_coefficients;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  644  		vindex = (config & ADM1275_VRANGE) ? 0 : 1;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  645  		cindex = 2;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  646  
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  647  		if (config & ADM1275_VIN_VOUT_SELECT)
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  648  			info->func[0] |=
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  649  			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  650  		else
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  651  			info->func[0] |=
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  652  			  PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  653  		break;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  654  	case adm1276:
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  655  		if (device_config & ADM1275_IOUT_WARN2_SELECT)
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  656  			data->have_oc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  657  		else
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  658  			data->have_uc_fault = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  659  		data->have_vout = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  660  		data->have_pin_max = true;
9048539b7cd6ca drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  661  
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  662  		coefficients = adm1276_coefficients;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  663  		vindex = (config & ADM1275_VRANGE) ? 0 : 1;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  664  		cindex = 2;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  665  		pindex = (config & ADM1275_VRANGE) ? 3 : 4;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  666  
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  667  		info->func[0] |= PMBUS_HAVE_VIN | PMBUS_HAVE_PIN
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  668  		  | PMBUS_HAVE_STATUS_INPUT;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  669  		if (config & ADM1275_VIN_VOUT_SELECT)
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  670  			info->func[0] |=
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  671  			  PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  672  		break;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  673  	case adm1278:
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  674  		data->have_vout = true;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  675  		data->have_pin_max = true;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  676  		data->have_temp_max = true;
7d45deb31bec39 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2019-06-12  677  		data->have_power_sampling = true;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  678  
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  679  		coefficients = adm1278_coefficients;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  680  		vindex = 0;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  681  		cindex = 1;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  682  		pindex = 2;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  683  		tindex = 3;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  684  
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  685  		info->func[0] |= PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  686  			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  687  
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  688  		/* Enable VOUT if not enabled (it is disabled by default) */
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  689  		if (!(config & ADM1278_VOUT_EN)) {
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  690  			config |= ADM1278_VOUT_EN;
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  691  			ret = i2c_smbus_write_byte_data(client,
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  692  							ADM1275_PMON_CONFIG,
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  693  							config);
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  694  			if (ret < 0) {
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  695  				dev_err(&client->dev,
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  696  					"Failed to enable VOUT monitoring\n");
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  697  				return -ENODEV;
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  698  			}
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  699  		}
2b3d0c19537c1b drivers/hwmon/pmbus/adm1275.c Yi Li                                   2016-10-17  700  
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  701  		if (config & ADM1278_TEMP1_EN)
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  702  			info->func[0] |=
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  703  				PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  704  		if (config & ADM1278_VIN_EN)
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  705  			info->func[0] |= PMBUS_HAVE_VIN;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  706  		break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  707  	case adm1293:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  708  	case adm1294:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  709  		data->have_iout_min = true;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  710  		data->have_pin_min = true;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  711  		data->have_pin_max = true;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  712  		data->have_mfr_vaux_status = true;
7d45deb31bec39 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2019-06-12  713  		data->have_power_sampling = true;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  714  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  715  		coefficients = adm1293_coefficients;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  716  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  717  		voindex = 0;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  718  		switch (config & ADM1293_VIN_SEL_MASK) {
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  719  		case ADM1293_VIN_SEL_012:	/* 1.2V */
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  720  			vindex = 0;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  721  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  722  		case ADM1293_VIN_SEL_074:	/* 7.4V */
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  723  			vindex = 1;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  724  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  725  		case ADM1293_VIN_SEL_210:	/* 21V */
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  726  			vindex = 2;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  727  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  728  		default:			/* disabled */
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  729  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  730  		}
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  731  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  732  		switch (config & ADM1293_IRANGE_MASK) {
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  733  		case ADM1293_IRANGE_25:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  734  			cindex = 3;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  735  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  736  		case ADM1293_IRANGE_50:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  737  			cindex = 4;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  738  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  739  		case ADM1293_IRANGE_100:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  740  			cindex = 5;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  741  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  742  		case ADM1293_IRANGE_200:
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  743  			cindex = 6;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  744  			break;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  745  		}
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  746  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  747  		if (vindex >= 0)
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  748  			pindex = 7 + vindex * 4 + (cindex - 3);
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  749  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  750  		if (config & ADM1293_VAUX_EN)
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  751  			info->func[0] |=
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  752  				PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  753  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  754  		info->func[0] |= PMBUS_HAVE_PIN |
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  755  			PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  756  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  757  		break;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  758  	default:
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  759  		dev_err(&client->dev, "Unsupported device\n");
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  760  		return -ENODEV;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  761  	}
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  762  
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  763  	if (voindex < 0)
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  764  		voindex = vindex;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  765  	if (vindex >= 0) {
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  766  		info->m[PSC_VOLTAGE_IN] = coefficients[vindex].m;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  767  		info->b[PSC_VOLTAGE_IN] = coefficients[vindex].b;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  768  		info->R[PSC_VOLTAGE_IN] = coefficients[vindex].R;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  769  	}
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  770  	if (voindex >= 0) {
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  771  		info->m[PSC_VOLTAGE_OUT] = coefficients[voindex].m;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  772  		info->b[PSC_VOLTAGE_OUT] = coefficients[voindex].b;
68a403823600fc drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-03-17  773  		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  774  	}
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  775  	if (cindex >= 0) {
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  776  		/* Scale current with sense resistor value */
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  777  		info->m[PSC_CURRENT_OUT] =
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  778  			coefficients[cindex].m * shunt / 1000;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  779  		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  780  		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  781  	}
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  782  	if (pindex >= 0) {
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  783  		info->m[PSC_POWER] =
6e5c06ad94115e drivers/hwmon/pmbus/adm1275.c Kun Yi                                  2018-10-17  784  			coefficients[pindex].m * shunt / 1000;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  785  		info->b[PSC_POWER] = coefficients[pindex].b;
904b296f308dc7 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-04  786  		info->R[PSC_POWER] = coefficients[pindex].R;
5cf231a346fb80 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2011-07-14  787  	}
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  788  	if (tindex >= 0) {
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  789  		info->m[PSC_TEMPERATURE] = coefficients[tindex].m;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  790  		info->b[PSC_TEMPERATURE] = coefficients[tindex].b;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  791  		info->R[PSC_TEMPERATURE] = coefficients[tindex].R;
709066acdd12c3 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2015-07-05  792  	}
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  793  
8b313ca7f1b982 drivers/hwmon/pmbus/adm1275.c Guenter Roeck                           2012-02-22 @794  	return pmbus_do_probe(client, id, info);
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  795  }
83f7649c52871d drivers/hwmon/adm1275.c       Guenter Roeck                           2011-03-17  796  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--UlVJffcvxoiEqYs2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--UlVJffcvxoiEqYs2--
