Return-Path: <linux-i2c+bounces-12321-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E1B29AB4
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 09:19:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D06AC2050B3
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 07:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35385271445;
	Mon, 18 Aug 2025 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zn7wyT7z"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202E338DF9
	for <linux-i2c@vger.kernel.org>; Mon, 18 Aug 2025 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755501589; cv=none; b=ga++JSRfbhBsmuzhZHfUkDWM00/UMy7HCFTxbpm8n8jQqfEU/J99uLVvs1P8KOdNe6t/1wlCyWLYCBs2RPIj/HmIO7I2o6y3qlvCRLAZ9mcxTAtLosx1/q0H4ktd5OkH7Lny0/uTfVe8z6n+pQz7h7UJK9WmsOHQK9fS4LVLF2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755501589; c=relaxed/simple;
	bh=FQTwmlOpSlpiDox1C07+RYr3g+cTRJXiQ5qNfxI4FSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HUbygOYkC3Tb1qquoLGPZLZyDBSnaQNzVbGwklANdaIaOw+s/V8WtpGACAAxTREPeBol1V8IT5LuEiRJpYebJhzzcuISRDcjfgfOhDVEYlQ/Q+mufctX8PtV1E4BoqnZZqThmkjL63zeYyJsczbn639n6GBSbS/5dNLq//dMlsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zn7wyT7z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b00a65fso18254945e9.0
        for <linux-i2c@vger.kernel.org>; Mon, 18 Aug 2025 00:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755501585; x=1756106385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3zFG+ph3piKAY7MCJLonbSvB1EXUkHi8G1gdERzBPH0=;
        b=zn7wyT7z5/PlPg5kAea3rYkRNKt98AB+Tb0R4VI/cLKBsF5HrEF7w4IBmq8M+eYi7q
         A6qPBcEGkQQbom3TC21DdE3EfEI676YlC9TvPsU/mAdD1VOpEl/WuzZtK+Ln833tDWeB
         CEH9T0Mv5p6h9z+X4S2UBWIksUR79i/NVkNYCXlCLJWW9JsdHps9LtsUSOEcUOcoxK5P
         aen3fqyvPutlHyId58Axk1HpitAAG6rRcLteufyYoeXmt9d2NHlGnQ8lW00RxZxiQk4E
         wV/Gz7MYTi2raFkN4iKXBHfJOuyGRep3NkwP+VDpO+sQAApiukB6r1U75fnxfROQ5BYI
         x+rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755501585; x=1756106385;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zFG+ph3piKAY7MCJLonbSvB1EXUkHi8G1gdERzBPH0=;
        b=C8o5XA+YGWLdyltzDQj3wHXNzpsbHQLAxF4HaV1o+Im6kLrR8/tW0AzmdADSITFab2
         RDdeXV182c0QBho3GrubhJHKHbNpvaz5jPXwJep7HD25Med7SHCZYw4gVIpSJqLHLjVB
         yQotfgfbixAutoWcwwr1IUFtPkldcxgAKwe58FhUUa50z0ci+DN4rIBLQOe8gtkf1geb
         7iiP+NRl9HTkqbjHWPBhQr0hnyorWq/TyGIaeT+tCMlY37fZcg4XfFv4lr/rSMEgLtBa
         90F1K1dHP1tEwTlKGSE1ghsUbJ6+CmsL6pzzhB8UffNArJH4MjogJAy5kX8yLqAz2b/U
         88kg==
X-Forwarded-Encrypted: i=1; AJvYcCVqZ+0nL1vH2FCnP8m7tHt3vOcqpxM8BPnrWlG+PsquoqFoRfGCz9xM8uPU8dLbK/Zu7ODLDulYxCo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3lKZifQc5livTzkYSDbwNWzG8TRS35qzjsgMeYL9UW/DCbYmI
	sUpQgpJXSjd/2/a9oVmob7fzH/XJyBIMDGf/jDjEpBN7wq/dXQSzAC02AWuv5WTuuoc=
X-Gm-Gg: ASbGncv+xCFyWqKW8NjrTHYKZlSKJOKFMqRLiKO4PqXVTuL9sHIJkKHOv726SE+jDhj
	UV+tSpP7NSRNNdDDbe7N7OW0Voinq1Zg8PrqbNeXdpTaOp/GNeE5nyIptthR2kgntY9kKEdqDWW
	eRArTwsX7iKmJNonp7oPgdFfuQ78vZc86IcR0tJWk+bprWgW4lvnwbCazojc7rwRQiueg04RC6Y
	NVFiLD0VN3Sh9vcJTuEPQuVoCRePpPTC6oLTQ/fEeGIcsaCjXWcUhjuQCYWzrk7phXd6RulAPT9
	Y5U8cExUeEIberEwQPds1KsfQ9OyMf6DKItHAt4+RD38Qra98l2CLcc+/X1XVWHORzqi5iPoGz6
	feQJhwAxf8CfpiTYiupk++yEMA0aWe1LZdfJySg==
X-Google-Smtp-Source: AGHT+IHM4h5TvUroAVFtgE7l1uKXONfdURffdRsQdfk8r4Doc4NPI78w6r1cZehK5yFOkTP2w9cGBA==
X-Received: by 2002:a05:600c:3594:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45a218095camr84039995e9.11.1755501585402;
        Mon, 18 Aug 2025 00:19:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45a209c25a1sm131087915e9.22.2025.08.18.00.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 00:19:44 -0700 (PDT)
Date: Mon, 18 Aug 2025 10:19:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mohammad Gomaa <midomaxgomaa@gmail.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	kenalba@google.com, hbarnor@chromium.org, rayxu@google.com,
	Mohammad Gomaa <midomaxgomaa@gmail.com>
Subject: Re: [PATCH WIP v2] i2c: add tracepoints to aid debugging in
 i2c-core-base
Message-ID: <202508181525.GKAXMVYv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e@gmail.com>

Hi Mohammad,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Gomaa/i2c-add-tracepoints-to-aid-debugging-in-i2c-core-base/20250817-155936
base:   7e161a991ea71e6ec526abc8f40c6852ebe3d946
patch link:    https://lore.kernel.org/r/20250817-refactor-add-i2c-tracepoints-v2-1-c0bad299e02e%40gmail.com
patch subject: [PATCH WIP v2] i2c: add tracepoints to aid debugging in i2c-core-base
config: x86_64-randconfig-161-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181525.GKAXMVYv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508181525.GKAXMVYv-lkp@intel.com/

smatch warnings:
drivers/i2c/i2c-core-base.c:535 i2c_device_probe() error: uninitialized symbol 'err_reason'.

vim +/err_reason +535 drivers/i2c/i2c-core-base.c

f37dd80ac2a67e4 drivers/i2c/i2c-core.c      David Brownell           2007-02-13  491  static int i2c_device_probe(struct device *dev)
^1da177e4c3f415 drivers/i2c/i2c-core.c      Linus Torvalds           2005-04-16  492  {
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  493  	struct fwnode_handle	*fwnode = dev_fwnode(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  494  	struct i2c_client	*client = i2c_verify_client(dev);
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  495  	struct i2c_driver	*driver;
79ece9b292af6b0 drivers/i2c/i2c-core-base.c Ricardo Ribalda          2022-11-14  496  	bool do_power_on;
50c3304a5e1e521 drivers/i2c/i2c-core.c      Hans Verkuil             2008-03-12  497  	int status;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  498  	int err_reason;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  499  	bool has_id_table, has_acpi_match, has_of_match;
7b4fbc50fabb810 drivers/i2c/i2c-core.c      David Brownell           2007-05-01  500  
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  501  	if (!client)
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  502  		return 0;
51298d1257b9f0a drivers/i2c/i2c-core.c      Jean Delvare             2009-09-18  503  
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  504  	client->irq = client->init_irq;
6e76cb7dfd34a2e drivers/i2c/i2c-core-base.c Charles Keepax           2019-06-27  505  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  506  	if (!client->irq) {
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  507  		int irq = -ENOENT;
845c877009cf014 drivers/i2c/i2c-core.c      Mika Westerberg          2015-05-06  508  
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  509  		if (client->flags & I2C_CLIENT_HOST_NOTIFY) {
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  510  			dev_dbg(dev, "Using Host Notify IRQ\n");
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  511  			/* Keep adapter active when Host Notify is required */
72bfcee11cf8950 drivers/i2c/i2c-core-base.c Jarkko Nikula            2019-04-30  512  			pm_runtime_get_sync(&client->adapter->dev);
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  513  			irq = i2c_smbus_host_notify_to_irq(client);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  514  			err_reason = I2C_TRACE_REASON_HOST_NOTIFY;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  515  		} else if (is_of_node(fwnode)) {
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  516  			irq = fwnode_irq_get_byname(fwnode, "irq");
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  517  			if (irq == -EINVAL || irq == -ENODATA)
5d9424b00b577b6 drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  518  				irq = fwnode_irq_get(fwnode, 0);
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  519  			err_reason = I2C_TRACE_REASON_FROM_OF;
5763a474c887d4a drivers/i2c/i2c-core-base.c Andy Shevchenko          2025-04-16  520  		} else if (is_acpi_device_node(fwnode)) {
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  521  			bool wake_capable;
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  522  
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  523  			irq = i2c_acpi_get_irq(client, &wake_capable);
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  524  			if (irq > 0 && wake_capable)
b38f2d5d9615cf9 drivers/i2c/i2c-core-base.c Raul E Rangel            2022-09-29  525  				client->flags |= I2C_CLIENT_WAKE;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  526  			err_reason = I2C_TRACE_REASON_FROM_ACPI;
3fffd1283927342 drivers/i2c/i2c-core.c      Dmitry Torokhov          2015-08-17  527  		}

err_reason not set on else { path.

3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  528  		if (irq == -EPROBE_DEFER) {
5c52473b4496b35 drivers/i2c/i2c-core-base.c Xu Yang                  2025-05-07  529  			status = dev_err_probe(dev, irq, "can't get irq\n");
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  530  			err_reason = I2C_TRACE_REASON_EPROBE_DEFER_IRQ;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  531  			goto put_sync_adapter;
3c3dd56f760da05 drivers/i2c/i2c-core-base.c Alain Volmat             2020-04-30  532  		}
331c34255293cd0 drivers/i2c/i2c-core.c      Dmitry Torokhov          2017-01-04  533  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  534  		if (irq < 0) {
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17 @535  			trace_i2c_device_probe_debug(dev, err_reason);
                                                                                                                                          ^^^^^^^^^^

6f34be7400c68d3 drivers/i2c/i2c-core.c      Geert Uytterhoeven       2014-11-17  536  			irq = 0;
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  537  		}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  538  
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  539  		client->irq = irq;
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  540  	}
2fd36c55264926e drivers/i2c/i2c-core.c      Laurent Pinchart         2014-10-30  541  
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  542  	driver = to_i2c_driver(dev->driver);
0c2a34937f7e4c4 drivers/i2c/i2c-core-base.c Wolfram Sang             2020-06-30  543  
dc94c3bf033524a drivers/i2c/i2c-core-base.c Mohammad Gomaa           2025-08-17  544  	has_id_table = driver->id_table;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


