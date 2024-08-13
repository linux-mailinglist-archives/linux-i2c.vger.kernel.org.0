Return-Path: <linux-i2c+bounces-5329-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A568594FF32
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 09:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A8E8283E46
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 07:58:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06A0176025;
	Tue, 13 Aug 2024 07:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gw/Mo+mQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E586755884
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 07:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723535913; cv=none; b=EP+rlzHF1GRyBVvI/+VeLrAbN0AKwOXuYuzyrByBXp7QGbqoq/l57GEw91sNKH0Nr4Jm3QWLtyIhxAMUoJydGQJE2vlkVWbDxK0ien4q80MZCMEJp3ZEwrm2MfSG3UIMGrUkICSa5qTYtkahhDDme7aBuxV9tasRKu/tzv15GjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723535913; c=relaxed/simple;
	bh=jJTjQME7tCjsf3cZR4sxhuOS0caxnMLD3jgtJBmw6Zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JJhwOGDutL8GH4bvmv2SDNP2kI2jI3AxotAvd3a1yZJ2yVWS5azi9CPkamkRMQOcafpt/knRpozMzxd8csov4Ld6MvTlC07cWmxQsU/76saBZyCflMD+riYZBIjCN8zqZkIwgisOjBvwG4HShtZzle6/ixv6+SPr2QsSqJ1CwwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gw/Mo+mQ; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f032cb782dso53204961fa.3
        for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 00:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723535910; x=1724140710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2V3KFwhTBRCQs0TGLrZG9sPYqXcbuU/Y45R5EunYuwA=;
        b=Gw/Mo+mQDwnfYXg11R3lDD0TELrNTGckdXZKcHD8BGAxJaqxy1lIityQQeiabzIRSH
         3b3ilAFuyuGFEkfUDoOvZ0TK48UQOAMdIfh6JWawbyrAhHe/P1N7wTiVpiWPiksadP6h
         /jX+2Rg2UBVM8Sd0BuS7GgBRmZjI5UKMe+bdDn+ATUxzAtagJTo8hQuxBXpgC0efEwKo
         cxdApH1soegtZMqAwd2GiIkXfkS5MU4Wvy6MZ4XiG0ZtMmdftvVWVamJwIZma3/55gkt
         xvoqqsgUKz01Tf1O3wfs9sUHRZxyTTsvio5UJ1ui0c0EKcE3l/0lbCDOLP7faJEK1gYy
         xOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723535910; x=1724140710;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V3KFwhTBRCQs0TGLrZG9sPYqXcbuU/Y45R5EunYuwA=;
        b=kUqgX+cZVxKuPQKUgyiKzktqumo5OsA13bhM8+hwXUs2+RmqXHF0L96gQEf55d5j5c
         89uDgBBYCdDLlr2y6TszNzaCO/uB7YTouWP85dHASkrCGCagqCRG9YxZaEvIvvGhjB3X
         WVH4z/mlzNwZw40RCqwPlT8HdU0vKVLh3KkrrKsQDqPZoEIouHDT7eWPIQynHijYGFx7
         FptSNYFEyxt3WOTIGk3xYJ5l8WmQBiju+f44KV/JoyQxKB2Sqaei358VIV+mG6Sn907y
         6MoaFJ5uU17LUHta9fnuC3IBliadEE7xe8ysQNS5Gu5/fZZQalhxx7sfmJonr4D9HF3X
         7nLw==
X-Forwarded-Encrypted: i=1; AJvYcCVSeynLpbo8SdwgtlgjlQi7hkoBuDdnYjlX6gf7i8Z9lIm4PNaPIalVWAkmAgGsUXbYzbZOX9As1eXKUZ+LV58cQrWXv4XK8Hy4
X-Gm-Message-State: AOJu0YzCPXvwBP/CJ87L7fIAP0mm1/u1DTByekkLdvhgjf89Y9gfnKBH
	KW3WU8H4p/+0ADkDpV8hZMtLWeR+8XBxoLYt3fm0E4gMKm58PIpT51S08htPCsA=
X-Google-Smtp-Source: AGHT+IF9WYmvKOwlQKiaI4MOt8VdhhGRxPabvxUzgi6ujf//nOdvuQDnJLjNlge/OPVP3D2pzLO+oQ==
X-Received: by 2002:a2e:be0d:0:b0:2f0:198e:cf86 with SMTP id 38308e7fff4ca-2f2b717f3dcmr18292341fa.33.1723535909795;
        Tue, 13 Aug 2024 00:58:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fa4653sm47963666b.51.2024.08.13.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 00:58:28 -0700 (PDT)
Date: Tue, 13 Aug 2024 10:58:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, warp5tw@gmail.com, tali.perry@nuvoton.com,
	Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com,
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
	venture@google.com, yuenn@google.com, benjaminfair@google.com,
	andi.shyti@kernel.org, wsa+renesas@sang-engineering.com,
	rand.sec96@gmail.com, kwliu@nuvoton.com, jjliu0@nuvoton.com,
	kfting@nuvoton.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
Message-ID: <d512d659-0891-4219-bc8c-bf272755e3d2@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807100244.16872-6-kfting@nuvoton.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/warp5tw-gmail-com/i2c-npcm-correct-the-read-write-operation-procedure/20240807-182210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240807100244.16872-6-kfting%40nuvoton.com
patch subject: [PATCH v1 5/7] drivers: i2c: use i2c frequency table
config: arm-randconfig-r073-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130818.FgDP5uNm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408130818.FgDP5uNm-lkp@intel.com/

New smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:1956 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1973 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21

Old smatch warnings:
drivers/i2c/busses/i2c-npcm7xx.c:752 npcm_i2c_slave_enable() error: buffer overflow 'npcm_i2caddr' 2 <= 9
drivers/i2c/busses/i2c-npcm7xx.c:1960 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)
drivers/i2c/busses/i2c-npcm7xx.c:1974 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1976 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 17 <= 21
drivers/i2c/busses/i2c-npcm7xx.c:1979 npcm_i2c_init_clk() error: buffer overflow 'smb_timing' 21 <= 21 (assuming for loop doesn't break)

vim +1956 drivers/i2c/busses/i2c-npcm7xx.c

56a1485b102ed1 Tali Perry          2020-05-27  1919  static int npcm_i2c_init_clk(struct npcm_i2c *bus, u32 bus_freq_hz)
56a1485b102ed1 Tali Perry          2020-05-27  1920  {
a946fe9698f261 Tyrone Ting         2024-08-07  1921  	struct  SMB_TIMING_T *smb_timing;
a946fe9698f261 Tyrone Ting         2024-08-07  1922  	u8   scl_table_cnt = 0, table_size = 0;
a946fe9698f261 Tyrone Ting         2024-08-07  1923  
56a1485b102ed1 Tali Perry          2020-05-27  1924  	u8   fast_mode = 0;
56a1485b102ed1 Tali Perry          2020-05-27  1925  	u32  src_clk_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1926  	u32  bus_freq_khz;
56a1485b102ed1 Tali Perry          2020-05-27  1927  
56a1485b102ed1 Tali Perry          2020-05-27  1928  	src_clk_khz = bus->apb_clk / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1929  	bus_freq_khz = bus_freq_hz / 1000;
56a1485b102ed1 Tali Perry          2020-05-27  1930  	bus->bus_freq = bus_freq_hz;
56a1485b102ed1 Tali Perry          2020-05-27  1931  
a946fe9698f261 Tyrone Ting         2024-08-07  1932  	switch (bus_freq_hz) {
a946fe9698f261 Tyrone Ting         2024-08-07  1933  	case I2C_MAX_STANDARD_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1934  		smb_timing = SMB_TIMING_100KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1935  		table_size = ARRAY_SIZE(SMB_TIMING_100KHZ);
a946fe9698f261 Tyrone Ting         2024-08-07  1936  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1937  	case I2C_MAX_FAST_MODE_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1938  		smb_timing = SMB_TIMING_400KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1939  		table_size = ARRAY_SIZE(SMB_TIMING_400KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1940  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1941  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1942  	case I2C_MAX_FAST_MODE_PLUS_FREQ:
a946fe9698f261 Tyrone Ting         2024-08-07  1943  		smb_timing = SMB_TIMING_1000KHZ;
a946fe9698f261 Tyrone Ting         2024-08-07  1944  		table_size = ARRAY_SIZE(SMB_TIMING_1000KHZ);
56a1485b102ed1 Tali Perry          2020-05-27  1945  		fast_mode = I2CCTL3_400K_MODE;
a946fe9698f261 Tyrone Ting         2024-08-07  1946  		break;
a946fe9698f261 Tyrone Ting         2024-08-07  1947  	default:
56a1485b102ed1 Tali Perry          2020-05-27  1948  		return -EINVAL;
56a1485b102ed1 Tali Perry          2020-05-27  1949  	}
56a1485b102ed1 Tali Perry          2020-05-27  1950  
a946fe9698f261 Tyrone Ting         2024-08-07  1951  	for (scl_table_cnt = 0 ; scl_table_cnt < table_size ; scl_table_cnt++)
a946fe9698f261 Tyrone Ting         2024-08-07  1952  		if (bus->apb_clk >= smb_timing[scl_table_cnt].core_clk)
a946fe9698f261 Tyrone Ting         2024-08-07  1953  			break;

The minimum smb_timing[scl_table_cnt].core_clk value is 10000000 or 20000000 so
I can't tell just from the context that we are always going to hit this break
statement.

a946fe9698f261 Tyrone Ting         2024-08-07  1954  
56a1485b102ed1 Tali Perry          2020-05-27  1955  	/* write sclfrq value. bits [6:0] are in I2CCTL2 reg */
a946fe9698f261 Tyrone Ting         2024-08-07 @1956  	iowrite8(FIELD_PREP(I2CCTL2_SCLFRQ6_0, smb_timing[scl_table_cnt].sclfrq & 0x7F),
                                                                                               ^^^^^^^^^^^^^^^^^^^^^^^^^

56a1485b102ed1 Tali Perry          2020-05-27  1957  		 bus->reg + NPCM_I2CCTL2);
56a1485b102ed1 Tali Perry          2020-05-27  1958  
56a1485b102ed1 Tali Perry          2020-05-27  1959  	/* bits [8:7] are in I2CCTL3 reg */
a946fe9698f261 Tyrone Ting         2024-08-07  1960  	iowrite8(fast_mode | FIELD_PREP(I2CCTL3_SCLFRQ8_7, (smb_timing[scl_table_cnt].sclfrq >> 7)
a946fe9698f261 Tyrone Ting         2024-08-07  1961  		 & 0x3),
56a1485b102ed1 Tali Perry          2020-05-27  1962  		 bus->reg + NPCM_I2CCTL3);
56a1485b102ed1 Tali Perry          2020-05-27  1963  
56a1485b102ed1 Tali Perry          2020-05-27  1964  	/* Select Bank 0 to access NPCM_I2CCTL4/NPCM_I2CCTL5 */
56a1485b102ed1 Tali Perry          2020-05-27  1965  	npcm_i2c_select_bank(bus, I2C_BANK_0);
56a1485b102ed1 Tali Perry          2020-05-27  1966  
56a1485b102ed1 Tali Perry          2020-05-27  1967  	if (bus_freq_hz >= I2C_MAX_FAST_MODE_FREQ) {
56a1485b102ed1 Tali Perry          2020-05-27  1968  		/*
56a1485b102ed1 Tali Perry          2020-05-27  1969  		 * Set SCL Low/High Time:
56a1485b102ed1 Tali Perry          2020-05-27  1970  		 * k1 = 2 * SCLLT7-0 -> Low Time  = k1 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1971  		 * k2 = 2 * SCLLT7-0 -> High Time = k2 / 2
56a1485b102ed1 Tali Perry          2020-05-27  1972  		 */
a946fe9698f261 Tyrone Ting         2024-08-07 @1973  		iowrite8(smb_timing[scl_table_cnt].scllt, bus->reg + NPCM_I2CSCLLT);
a946fe9698f261 Tyrone Ting         2024-08-07  1974  		iowrite8(smb_timing[scl_table_cnt].sclht, bus->reg + NPCM_I2CSCLHT);
56a1485b102ed1 Tali Perry          2020-05-27  1975  
a946fe9698f261 Tyrone Ting         2024-08-07  1976  		iowrite8(smb_timing[scl_table_cnt].dbcnt, bus->reg + NPCM_I2CCTL5);
56a1485b102ed1 Tali Perry          2020-05-27  1977  	}
56a1485b102ed1 Tali Perry          2020-05-27  1978  
a946fe9698f261 Tyrone Ting         2024-08-07  1979  	iowrite8(smb_timing[scl_table_cnt].hldt, bus->reg + NPCM_I2CCTL4);
56a1485b102ed1 Tali Perry          2020-05-27  1980  
56a1485b102ed1 Tali Perry          2020-05-27  1981  	/* Return to Bank 1, and stay there by default: */
56a1485b102ed1 Tali Perry          2020-05-27  1982  	npcm_i2c_select_bank(bus, I2C_BANK_1);
56a1485b102ed1 Tali Perry          2020-05-27  1983  
56a1485b102ed1 Tali Perry          2020-05-27  1984  	return 0;
56a1485b102ed1 Tali Perry          2020-05-27  1985  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


