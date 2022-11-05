Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82ECD61DE04
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 21:34:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbiKEUeI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 16:34:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbiKEUeH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 16:34:07 -0400
X-Greylist: delayed 1470 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 05 Nov 2022 13:34:06 PDT
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D025F12771
        for <linux-i2c@vger.kernel.org>; Sat,  5 Nov 2022 13:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=Content-Disposition:Content-Type:MIME-Version:Message-ID:
        Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
        MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Content-Disposition:In-Reply-To:References;
        bh=VgDQXio+lCL2xTtqasxYMpWeaKa20rB9MxAAIUOhdr0=; b=o63y7PFmu+/BsxX+5oR8SGa07A
        RdEgpyUWcfqUgwIxtZnagqcjWYECVM5WMJfwZ0lFth++JutGyrh4t9MmiBTx9dudNwlAQnK3DxgSE
        qFI6iz1Jn6nL5t13m0e2Zrq97BUeHoHQdKVb9l/RE+2s1UacmU2rIEQLRNRrFt9Inwkg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1orPTN-001Ydh-Ra; Sat, 05 Nov 2022 21:08:57 +0100
Date:   Sat, 5 Nov 2022 21:08:57 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Oleksij Rempel <linux@rempel-privat.de>, kernel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        sumit.semwal@linaro.org
Cc:     linux-i2c@vger.kernel.org
Subject: IMX I2C driver and DMA mapping errors
Message-ID: <Y2bC2WrixK8EwivW@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Folks

I recently started using 6.1-rc2 on a Vybrid machine and started
getting DMA WARNING triggering, when it did not before.

I don't know the IMX I2C driver too well, so before i take a look, i
wondered if anybody had seen this issue and fixed it? I'm guessing the
DMA code has got more picky recently, and is now rejecting requests to
map vmalloc memory, when before it did not. I think the I2C client API
does not force you to use DMA friendly memory? It is up to the master
driver to use a bounce buffer if needed?

https://docs.kernel.org/i2c/dma-considerations.html

Thanks
	Andrew

[    2.163418] WARNING: CPU: 0 PID: 140 at include/linux/dma-mapping.h:331 i2c_imx_dma_xfer+0x1b8/0x264
[    2.171376] fsl-edma 40018000.dma-controller: rejecting DMA map of vmalloc memory
[    2.177622] Modules linked in:
[    2.179420] CPU: 0 PID: 140 Comm: kworker/0:3 Not tainted 6.1.0-rc2-00326-g652419504dfc-dirty #77
[    2.187046] Hardware name: Freescale Vybrid VF5xx/VF6xx (Device Tree)
[    2.192221] Workqueue: events_power_efficient sfp_timeout
[    2.196379] Backtrace: 
[    2.197553]  dump_backtrace from show_stack+0x20/0x24
[    2.201398]  r7:80647b48 r6:00000009 r5:60000013 r4:80a1ebe0
[    2.205785]  show_stack from dump_stack_lvl+0x2c/0x34
[    2.209612]  dump_stack_lvl from dump_stack+0x18/0x1c
[    2.213436]  r5:0000014b r4:80a5a73c
[    2.215735]  dump_stack from __warn+0xd4/0x120
[    2.218949]  __warn from warn_slowpath_fmt+0xa4/0xe4
[    2.222684]  r7:80647b48 r6:0000014b r5:80a5a73c r4:80a5a710
[    2.227065]  warn_slowpath_fmt from i2c_imx_dma_xfer+0x1b8/0x264
[    2.231834]  r8:0000000e r7:81195810 r6:810ef440 r5:00000001 r4:8126e0c0
[    2.237264]  i2c_imx_dma_xfer from i2c_imx_xfer_common+0x8b8/0xb00
[    2.242216]  r10:00000001 r9:00000062 r8:00000004 r7:00000000 r6:8126e0c0 r5:a0a89df8
[    2.248776]  r4:810ef440
[    2.250030]  i2c_imx_xfer_common from i2c_imx_xfer+0x50/0xb4
[    2.254452]  r10:80c03240 r9:811b1c10 r8:810ef440 r7:810ef440 r6:00000001 r5:00000002
[    2.261013]  r4:a0a89dec
[    2.262266]  i2c_imx_xfer from __i2c_transfer+0x198/0x5f0
[    2.266445]  r9:80c72da0 r8:a0a89dec r7:00000000 r6:00000002 r5:ffff8ba5 r4:810ef440
[    2.272916]  __i2c_transfer from __i2c_mux_master_xfer+0x50/0x74
[    2.277703]  r10:80c03240 r9:810ef440 r8:00000002 r7:a0a89dec r6:813f7800 r5:8181f400
[    2.284262]  r4:00000000
[    2.285515]  __i2c_mux_master_xfer from __i2c_transfer+0x198/0x5f0
[    2.290468]  r9:80c72da0 r8:a0a89dec r7:00000000 r6:00000002 r5:ffff8ba5 r4:813f7800
[    2.296938]  __i2c_transfer from i2c_transfer+0xac/0x118
[    2.301028]  r10:8123f600 r9:9fbde605 r8:00000010 r7:a0a89e5c r6:a0a89dec r5:00000002
[    2.307589]  r4:813f7800
[    2.308843]  i2c_transfer from sfp_i2c_read+0xc4/0x104
[    2.312754]  r6:81b1f200 r5:00000040 r4:00000010
[    2.316094]  sfp_i2c_read from sfp_sm_module+0x1e0/0xb80
[    2.320179]  r8:00000000 r7:9fbde600 r6:0000000c r5:805b7740 r4:81b1f200
[    2.325609]  sfp_sm_module from sfp_timeout+0x38/0x54
[    2.329432]  r10:8123f600 r9:9fbde605 r8:00000000 r7:9fbde600 r6:80cfb700 r5:81b1f2d0
[    2.335994]  r4:81b1f200
[    2.337247]  sfp_timeout from process_one_work+0x1d0/0x47c
[    2.341512]  r5:8182d100 r4:81b1f2a4
[    2.343810]  process_one_work from worker_thread+0x90/0x528
[    2.348169]  r10:80c0b4e0 r9:00000008 r8:80c72da0 r7:80c0b4f8 r6:8182d118 r5:80c0b4e0
[    2.354730]  r4:8182d100
[    2.355984]  worker_thread from kthread+0xd0/0xec
[    2.359467]  r10:00000000 r9:a0825e88 r8:8182b9c0 r7:8182d100 r6:80132b58 r5:8123f600
[    2.366030]  r4:8182b900
[    2.367283]  kthread from ret_from_fork+0x14/0x2c
[    2.370742] Exception stack(0xa0a89fb0 to 0xa0a89ff8)
[    2.374536] 9fa0:                                     00000000 00000000 00000000 00000000
[    2.381461] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.388385] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.393741]  r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:801388f0 r4:8182b900
