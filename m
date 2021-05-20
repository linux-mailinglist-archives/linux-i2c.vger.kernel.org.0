Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33F838B67A
	for <lists+linux-i2c@lfdr.de>; Thu, 20 May 2021 21:01:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbhETTCd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 May 2021 15:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236456AbhETTCc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 May 2021 15:02:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6148C061763
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:10 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id i17so18693688wrq.11
        for <linux-i2c@vger.kernel.org>; Thu, 20 May 2021 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
        b=BhW/gXf8pWSAZIebe6nxATFBDBMilShlmVRZzJL0Z7cmhZ34wH8yiODRYqZmjd0Bbw
         5FLnj7yUL68hbF/XNuFKxoi0pfP4IxkJ9c+tMdT028yF+NF5NC4AbnGloFwc4U/IgJJb
         HkBmb6/op7D4qo7GUrP+MqqfwZ6YMDM+Oxk8Miamy9HC5vBwZMh5J6OxRXCPhVYondTN
         OQQCjBR3wG190MivkxGFRMZfvJSZhA+Pb19zi5r6dE1ffLHfPQK8OngnGA2VqwGj8doy
         fyt+TWfbk49ktvoZDPBPDYLY6+bP73h8SefLmUIpQlMpElMBtYVTr7MMgHl7IQ2YM0NU
         tiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2DRojMIGvqGqfd6599LIXINUCsrKqBTGuM0HeJNOCqY=;
        b=bWNOghrvW+1CY0Z8wYid+D3YKLE9mkLSP5txPCMxQJe25Y7kQ2CHsM0ngBS9bEEFDM
         rJPWNoBogqLbu3vZVHOcdgF/tbhkldJlOT8PNz5afWfaxcdI/ZCcsa1wEORgK3nm183s
         EYOsuM9BsgPgDwmT0glv50H5/d1aw23wdTdXbuoAsVlI/+e15IuGBALboZk2nxHXPuc0
         91LBtiBSbJ5fAghE/LosV1VeyCUXpDnl3xw7SVMTYv9PE0o1bWnR1igv1dMExU9QxYZ5
         lYpZmjp1FowYru+eUQ8307C+tVMt3lGa0wy8TqLf19ua5XBVI3DufylPMTqSNlH7SXM/
         ci1Q==
X-Gm-Message-State: AOAM531UmlR0fFewWeS2xVF9pfZcY71gC34Oh2A4uu69R3Rz5WpqRsJc
        r4/BQkSSd9UgDnMhgxwE4C/NyQ==
X-Google-Smtp-Source: ABdhPJyFFyrDcMhhbJFcjr+Bz0N+pSMlyvPDFQtGOrLH3IV1YMX4KzVeEjRTqSnwuhvjNtamRbprxA==
X-Received: by 2002:adf:f58e:: with SMTP id f14mr5759911wro.258.1621537269261;
        Thu, 20 May 2021 12:01:09 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id p20sm9011899wmq.10.2021.05.20.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 12:01:08 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Anders Berg <anders.berg@lsi.com>,
        Andreas Larsson <andreas@gaisler.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cedric Madianga <cedric.madianga@gmail.com>,
        Dennis Kovalev <dkovalev@ru.mvista.com>,
        Doug Anderson <dianders@chromium.org>,
        Fabio Estevam <festevam@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Maxime Coquelin <maxime.coquelin@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Max Schwarz <max.schwarz@online.de>,
        Michal Simek <michal.simek@xilinx.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peter Korsgaard <peter@korsgaard.com>,
        Peter Rosin <peda@axentia.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Rudolf Marek <r.marek@assembler.cz>,
        Sachin Verma <sachin.verma@st.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shariff Md <smohammed@nvidia.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thor Thayer <thor.thayer@linux.intel.com>,
        Tomoya MORINAGA <tomoya.rohm@gmail.com>,
        Vaibhav Gupta <vaibhavgupta40@gmail.com>,
        Vitaly Wool <vwool@ru.mvista.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 00/16] Rid W=1 warnings from I2C
Date:   Thu, 20 May 2021 20:00:49 +0100
Message-Id: <20210520190105.3772683-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (16):
  i2c: busses: i2c-nomadik: Fix formatting issue pertaining to 'timeout'
  i2c: muxes: i2c-arb-gpio-challenge: Demote non-conformant kernel-doc
    headers
  i2c: busses: i2c-ali1563: File headers are not good candidates for
    kernel-doc
  i2c: busses: i2c-altera: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-axxia: Fix formatting issue in struct and demote
    unworthy kernel-doc headers
  i2c: busses: i2c-cadence: Fix incorrectly documented 'enum
    cdns_i2c_slave_mode'
  i2c: busses: i2c-designware-master: Fix misnaming of
    'i2c_dw_init_master()'
  i2c: busses: i2c-eg20t: Fix 'bad line' issue and provide description
    for 'msgs' param
  i2c: busses: i2c-mxs: Demote barely half complete kernel-doc header
  i2c: busses: i2c-ocores: Place the expected function names into the
    documentation headers
  i2c: busses: i2c-pnx: Provide descriptions for 'alg_data' data
    structure
  i2c: busses: i2c-rk3x: Demote unworthy headers and help more complete
    ones
  i2c: busses: i2c-st: Fix copy/paste function misnaming issues
  i2c: busses: i2c-stm32f4: Remove incorrectly placed ' ' from function
    name
  i2c: busses: i2c-tegra-bpmp: Demote kernel-doc abuses
  i2c: busses: i2c-st: trivial: Fix spelling issue 'enmpty => empty'

 drivers/i2c/busses/i2c-ali1563.c           |  2 +-
 drivers/i2c/busses/i2c-altera.c            |  9 ++++-----
 drivers/i2c/busses/i2c-axxia.c             | 11 +++++------
 drivers/i2c/busses/i2c-cadence.c           |  2 +-
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-eg20t.c             |  3 ++-
 drivers/i2c/busses/i2c-mxs.c               |  2 +-
 drivers/i2c/busses/i2c-nomadik.c           |  2 +-
 drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
 drivers/i2c/busses/i2c-pnx.c               |  8 ++++----
 drivers/i2c/busses/i2c-rk3x.c              | 18 +++++++++---------
 drivers/i2c/busses/i2c-st.c                |  4 ++--
 drivers/i2c/busses/i2c-stm32f4.c           |  2 +-
 drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
 drivers/i2c/muxes/i2c-arb-gpio-challenge.c |  4 ++--
 15 files changed, 40 insertions(+), 41 deletions(-)

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Anders Berg <anders.berg@lsi.com>
Cc: Andreas Larsson <andreas@gaisler.com>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Cedric Madianga <cedric.madianga@gmail.com>
Cc: Dennis Kovalev <dkovalev@ru.mvista.com>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Adamski <krzysztof.adamski@nokia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-tegra@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>
Cc: Maxime Coquelin <maxime.coquelin@st.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Max Schwarz <max.schwarz@online.de>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Peter Rosin <peda@axentia.se>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: Rudolf Marek <r.marek@assembler.cz>
Cc: Sachin Verma <sachin.verma@st.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shariff Md <smohammed@nvidia.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thor Thayer <thor.thayer@linux.intel.com>
Cc: Tomoya MORINAGA <tomoya.rohm@gmail.com>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Wolfram Sang <wsa@kernel.org>
-- 
2.31.1

