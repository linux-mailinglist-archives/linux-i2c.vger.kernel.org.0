Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF31A23E3D8
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 00:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgHFWLW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Aug 2020 18:11:22 -0400
Received: from mga04.intel.com ([192.55.52.120]:17633 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725998AbgHFWLW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 6 Aug 2020 18:11:22 -0400
IronPort-SDR: YR2hnkC+7Nkka4EyPSff90rR7NXRJKdwGs4hG7rM7CwvzNGb65VVjxPIhMt2Tbd/HdEjgTf0Ms
 O6MxoE5agzxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="150396105"
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="150396105"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2020 14:58:05 -0700
IronPort-SDR: M5NPqc6dPi7tthAAzj+zf9xLOv677pAWh+M/drBFDFUKfwntTq02dKfl/lBwas9qRuI4d56m1o
 vmv6idU4DKhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,443,1589266800"; 
   d="gz'50?scan'50,208,50";a="468011722"
Received: from lkp-server02.sh.intel.com (HELO 37a337f97289) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 06 Aug 2020 14:58:02 -0700
Received: from kbuild by 37a337f97289 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k3nth-0001n7-K3; Thu, 06 Aug 2020 21:58:01 +0000
Date:   Fri, 7 Aug 2020 05:57:43 +0800
From:   kernel test robot <lkp@intel.com>
To:     Stephen Kitt <steve@sk2.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] hwmon/pmbus: use simple i2c probe function
Message-ID: <202008070543.xk2BOriv%lkp@intel.com>
References: <20200806161645.9437-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zYM0uCDKw75PZbzx"
Content-Disposition: inline
In-Reply-To: <20200806161645.9437-1-steve@sk2.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--zYM0uCDKw75PZbzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephen,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bcf876870b95592b52519ed4aafcf9d95999bc9c]

url:    https://github.com/0day-ci/linux/commits/Stephen-Kitt/hwmon-pmbus-use-simple-i2c-probe-function/20200807-024648
base:    bcf876870b95592b52519ed4aafcf9d95999bc9c
config: x86_64-randconfig-a013-20200806 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 076b120bebfd727b502208601012a44ab2e1028e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install x86_64 cross compiling tool for clang build
        # apt-get install binutils-x86-64-linux-gnu
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/hwmon/pmbus/adm1275.c:794:36: error: too many arguments to function call, expected 2, have 3
           return pmbus_do_probe(client, id, info);
                  ~~~~~~~~~~~~~~             ^~~~
   drivers/hwmon/pmbus/pmbus.h:479:5: note: 'pmbus_do_probe' declared here
   int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
       ^
   1 error generated.

vim +794 drivers/hwmon/pmbus/adm1275.c

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

--zYM0uCDKw75PZbzx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
6VVjAOf2zIzRwZ+lTiAPZabwX+b8BF6ITAIA

--zYM0uCDKw75PZbzx--
