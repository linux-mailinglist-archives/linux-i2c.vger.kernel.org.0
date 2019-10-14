Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA296D65A6
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 16:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732376AbfJNOzj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 10:55:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:36918 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731121AbfJNOzj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 10:55:39 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8EE99BE43;
        Mon, 14 Oct 2019 14:55:37 +0000 (UTC)
Date:   Mon, 14 Oct 2019 16:55:52 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, Linux I2C <linux-i2c@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 3/4] i2c: smbus: Add a way to instantiate SPD EEPROMs
 automatically
Message-ID: <20191014165552.1e8ddedc@endymion>
In-Reply-To: <201910141823.bXxWHSkl%lkp@intel.com>
References: <20191014113950.1f989ba6@endymion>
        <201910141823.bXxWHSkl%lkp@intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 14 Oct 2019 18:21:50 +0800, kbuild test robot wrote:
> Hi Jean,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [cannot apply to v5.4-rc3 next-20191011]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Jean-Delvare/Instantiate-SPD-EEPROMs-at-boot-on-x86/20191014-174252
> config: sparc64-allmodconfig (attached as .config)
> compiler: sparc64-linux-gcc (GCC) 7.4.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # save the attached .config to linux build tree
>         GCC_VERSION=7.4.0 make.cross ARCH=sparc64 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from drivers/i2c/i2c-core-base.c:24:0:
>    include/linux/i2c-smbus.h: In function 'i2c_register_spd':
> >> include/linux/i2c-smbus.h:52:9: warning: 'return' with a value, in function returning void  
>      return 0;
>             ^
>    include/linux/i2c-smbus.h:50:13: note: declared here
>     static void i2c_register_spd(struct i2c_adapter *adap)
>                 ^~~~~~~~~~~~~~~~
>    In file included from drivers/i2c/i2c-core-base.c:24:0:
>    At top level:
>    include/linux/i2c-smbus.h:50:13: warning: 'i2c_register_spd' defined but not used [-Wunused-function]
> 
> vim +/return +52 include/linux/i2c-smbus.h
> 
>     46	
>     47	#if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
>     48	void i2c_register_spd(struct i2c_adapter *adap);
>     49	#else
>     50	static void i2c_register_spd(struct i2c_adapter *adap)
>     51	{
>   > 52		return 0;  
>     53	}
>     54	#endif
>     55	

Fixed, thanks Elliot.

-- 
Jean Delvare
SUSE L3 Support
