Return-Path: <linux-i2c+bounces-11130-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D630AC201B
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 11:47:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7C6C18981CF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 May 2025 09:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E2E222581;
	Fri, 23 May 2025 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsPUVxUP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49F6226D16
	for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747993570; cv=none; b=MfQ+rM4o99otwhKKI9qRWKBIZSFsSOmatWwcHNW7fde326DkadjqAglxSEg/prqQF/ZYGKdLCSqHNRVL4LOypr/i7ffhOebxPL3lX601YewHQ6IUiQpnbgn5UgM/kithwx0U+Qh04QNfgalyMWRaItCqDPd8ZOHbBTOPeLWqyeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747993570; c=relaxed/simple;
	bh=g0CqvvMKzLeMKYjz7hRE+LMOROw08soSCEk9jR0MjeI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lusX+toYNeOImjZb1iNimWKFNPj1is0ako7qXKM4v+qO5nYAFZXfv7EOoMwiaEue6D4BX2Ot+FlDccdDvMFdhF0c2f5MVVns1xdKWsmynXBpTWXmpap23O04qyrcp9Y1dFvWayBz7ZW9tKMpceV+xhCBvBvV+TR/Vcj1xN5Sh4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsPUVxUP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfe574976so65600695e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 23 May 2025 02:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747993566; x=1748598366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=foNTOHpzt5e+CVfMRgO4/fjIO/6hBNq5r7JEJPhTgRc=;
        b=RsPUVxUPMOJVXlJCNjJXgbN6GtVcxrEogzF+Fte6ugjwsujVAqvTFTvM+oTce/F1aB
         9j9cIfEbgaM8jyZMJDqEmCfOUF/TuIoZ9nAMFwhxyG4+27+kgPsfLDyAgX9nw+b9lR36
         hiSbLqRkInPYpHc1ceHRfugACkIpX1G8yq93mD2wGeSK1W7OMG07dJrtqivgxnJMXVg0
         Kiiu3/hLwC+/inELHqvV7GQ//8NyasMB6wBCARu40nuvb6UV8NayVoMLskvBjvR6jsnT
         Ui6+8DJFQv+FTZdY9hy/HtzPOiRBUNvLVUBoPpA8fHjlYfIk2Piu08dZrNaZdn3JxXgQ
         ApNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747993566; x=1748598366;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foNTOHpzt5e+CVfMRgO4/fjIO/6hBNq5r7JEJPhTgRc=;
        b=DibtoXthVhRoP6I6XrjK4tLRBko77IVS2WxTYnesTHmWmfM9Dwya2ZLlyyD5s2/zMu
         wS5g4s5X3RjisR1rPSwYvYYrmMAB4WqAGyCpfJ6TKsFi2UIpohGajXfqecV86hhzWBXz
         4wFOJqlm78F8T3/aJg9nMfAR8PTzBxC7MrX/ab2E2Dr1DKugRx6awC4/DNCU0zX4LlN+
         wYB9OC2CiAj6F0l7ixKTB2lIyvf4eoMDNxSLbdMmjiGtJSYVZhw4TLu0aakcipC7BuZD
         +iQe85wU9Z8YYl56AZQPatcuSnsq4hLD4+sKcfC5CJxODqJEArR5JA5mcQ4isWmzFAFt
         9JBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtjoOjd7EGA5bxobKV6kAFsKdiG7nQD2YbmhpCifeGz/ESVYL+g6w4TfsPgB1LefJlp/h3vGgwf2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVn+im1hHsohJM7xhzeiN6ll0CQsv9avGYsTJUsLM9w1/QAuQ5
	jGwtuSudmemXcV6XqlzulKtFm+VGgfPoD9jRzD7fsUDSYnAXHC86lYomiVENsL1ko8s=
X-Gm-Gg: ASbGncs3Ae5mjIvb0ZhFq8fsbXljkxdsnEflC+YOKuieYIVFLy3lbdjwhIY5XTTE3xl
	14pbLY57teLIrsa2nzWcO438yaTNbowsxRMg6Q2fPh8Yoozfd5Gge12jdzQGgPdiE86Tec8q1nI
	kS+V1wmXfwtrG1py5+Sr3Rve5+D5BN5NrOZ8Ksgwzd6fxR9mSV2a3GfFbuxukRooC34PGMEFeJF
	kyZxmAY4MIXRGWeKg2/Ujq7Kl0WBQ8l7/Xozpqz+5eMU+b16Tr7MWR/RfvIfnBumCHKlv2ZYajt
	jAJf+V8G0ANIAGLbdcHE2G9yOsHvqOV+Rj0jfoQzzsYUmf9NLvVJR1ch
X-Google-Smtp-Source: AGHT+IFeXuzRSP3te/4kJrabY82cymAda1Ah/IMjxYAHTLxROVr9nV9wVlqZWpQQfGQ7Ndx2j/Asnw==
X-Received: by 2002:a05:600c:3114:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-442fd6445bdmr296392075e9.17.1747993566028;
        Fri, 23 May 2025 02:46:06 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f6f062fcsm131130745e9.15.2025.05.23.02.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:46:05 -0700 (PDT)
Date: Fri, 23 May 2025 12:46:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Wentao Liang <vulab@iscas.ac.cn>,
	andi.shyti@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Message-ID: <202505221445.quJVHqSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519141918.2522-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/i2c-qup-Add-error-handling-in-qup_i2c_xfer_v2/20250519-222137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250519141918.2522-1-vulab%40iscas.ac.cn
patch subject: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
config: powerpc64-randconfig-r071-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221445.quJVHqSz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202505221445.quJVHqSz-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-qup.c:1621 qup_i2c_xfer_v2() error: uninitialized symbol 'err'.

vim +/err +1621 drivers/i2c/busses/i2c-qup.c

191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1565  static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1566  			   struct i2c_msg msgs[],
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1567  			   int num)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1568  {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1569  	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
61f647e9d36d67 Wentao Liang          2025-05-19  1570  	int ret, err, idx = 0;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1571  
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1572  	qup->bus_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1573  	qup->qup_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1574  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1575  	ret = pm_runtime_get_sync(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1576  	if (ret < 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1577  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1578  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1579  	ret = qup_i2c_determine_mode_v2(qup, msgs, num);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1580  	if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1581  		goto out;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1582  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1583  	writel(1, qup->base + QUP_SW_RESET);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1584  	ret = qup_i2c_poll_state(qup, QUP_RESET_STATE);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1585  	if (ret)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1586  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1587  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1588  	/* Configure QUP as I2C mini core */
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1589  	writel(I2C_MINI_CORE | I2C_N_VAL_V2, qup->base + QUP_CONFIG);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1590  	writel(QUP_V2_TAGS_EN, qup->base + QUP_I2C_MASTER_GEN);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1591  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1592  	if (qup_i2c_poll_state_i2c_master(qup)) {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1593  		ret = -EIO;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1594  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1595  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1596  
eb422b539c1f39 Abhishek Sahu         2018-03-12  1597  	if (qup->use_dma) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1598  		reinit_completion(&qup->xfer);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1599  		ret = qup_i2c_bam_xfer(adap, &msgs[0], num);
eb422b539c1f39 Abhishek Sahu         2018-03-12  1600  		qup->use_dma = false;
9cedf3b2f09946 Sricharan Ramabadhran 2016-02-22  1601  	} else {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1602  		qup_i2c_conf_mode_v2(qup);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1603  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1604  		for (idx = 0; idx < num; idx++) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1605  			qup->msg = &msgs[idx];
7545c7dba169c4 Abhishek Sahu         2018-03-12  1606  			qup->is_last = idx == (num - 1);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1607  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1608  			ret = qup_i2c_xfer_v2_msg(qup, idx,
7545c7dba169c4 Abhishek Sahu         2018-03-12  1609  					!!(msgs[idx].flags & I2C_M_RD));
7545c7dba169c4 Abhishek Sahu         2018-03-12  1610  			if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1611  				break;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1612  		}
7545c7dba169c4 Abhishek Sahu         2018-03-12  1613  		qup->msg = NULL;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1614  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1615  
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1616  	if (!ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1617  		ret = qup_i2c_bus_active(qup, ONE_BYTE);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1618  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1619  	if (!ret)
61f647e9d36d67 Wentao Liang          2025-05-19  1620  		err = qup_i2c_change_state(qup, QUP_RESET_STATE);

if ret was already set then err isn't initialized.

61f647e9d36d67 Wentao Liang          2025-05-19 @1621  	if (err)
                                                            ^^^
Uninitialized.  In production obviously the only sane choice is
CONFIG_INIT_STACK_ALL_ZERO but I really encourage developers to set
CONFIG_INIT_STACK_ALL_PATTERN=y so that we catch these sorts of
bugs in testing.

61f647e9d36d67 Wentao Liang          2025-05-19  1622  		return err;
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1623  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1624  	if (ret == 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1625  		ret = num;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1626  out:
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1627  	pm_runtime_mark_last_busy(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1628  	pm_runtime_put_autosuspend(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1629  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1630  	return ret;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1631  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


