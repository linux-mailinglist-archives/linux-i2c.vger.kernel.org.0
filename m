Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B327FB4BAE
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfIQKNV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 06:13:21 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58317 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfIQKNV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 06:13:21 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1iAATo-0001d0-WF; Tue, 17 Sep 2019 12:13:05 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1iAATn-00039w-53; Tue, 17 Sep 2019 12:13:03 +0200
Date:   Tue, 17 Sep 2019 12:13:03 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-mediatek@lists.infradead.org,
        Sascha Hauer <kernel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
Message-ID: <20190917101303.t5otztdus7y3ayau@pengutronix.de>
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
 <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
 <20190913215809.GA11833@bogus>
 <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Geert,

On Tue, Sep 17, 2019 at 11:40:25AM +0200, Geert Uytterhoeven wrote:
> Hi Rob, Uwe,
> 
> On Fri, Sep 13, 2019 at 11:58 PM Rob Herring <robh@kernel.org> wrote:
> > On Sat, 24 Aug 2019 15:28:46 +0200, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=          wrote:
> > > Referencing device tree nodes from a property allows to pass arguments.
> > > This is for example used for referencing gpios. This looks as follows:
> > >
> > >       gpio_ctrl: gpio-controller {
> > >               #gpio-cells = <2>
> > >               ...
> > >       }
> > >
> > >       someothernode {
> > >               gpios = <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
> > >               ...
> > >       }
> > >
> > > To know the number of arguments this must be either fixed, or the
> > > referenced node is checked for a $cells_name (here: "#gpio-cells")
> > > property and with this information the start of the second reference can
> > > be determined.
> > >
> > > Currently regulators are referenced with no additional arguments. To
> > > allow some optional arguments without having to change all referenced
> > > nodes this change introduces a way to specify a default cell_count. So
> > > when a phandle is parsed we check for the $cells_name property and use
> > > it as before if present. If it is not present we fall back to
> > > cells_count if non-negative and only fail if cells_count is smaller than
> > > zero.
> > >
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> This is now commit e42ee61017f58cd9 ("of: Let of_for_each_phandle fallback
> to non-negative cell_count") in robh/for-next, which causes a lock-up when
> booting a shmobile_defconfig kernel on r8a7791/koelsch:
> 
> rcu: INFO: rcu_sched self-detected stall on CPU
> rcu:     0-....: (2099 ticks this GP) idle=6fe/1/0x40000002
> softirq=29/29 fqs=1050
>  (t=2100 jiffies g=-1131 q=0)
> NMI backtrace for cpu 0
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> 5.3.0-rc2-shmobile-00050-ge42ee61017f58cd9 #376
> Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
> [<c010f8ac>] (unwind_backtrace) from [<c010b620>] (show_stack+0x10/0x14)
> [<c010b620>] (show_stack) from [<c073d038>] (dump_stack+0x7c/0x9c)
> [<c073d038>] (dump_stack) from [<c0742e80>] (nmi_cpu_backtrace+0xa0/0xb8)
> [<c0742e80>] (nmi_cpu_backtrace) from [<c0742f1c>] (nmi_trigger_cpumask_backtrace+0x84/0x114)
> [<c0742f1c>] (nmi_trigger_cpumask_backtrace) from [<c017d684>] (rcu_dump_cpu_stacks+0xac/0xc8)
> [<c017d684>] (rcu_dump_cpu_stacks) from [<c017a598>] (rcu_sched_clock_irq+0x2ac/0x6b4)
> [<c017a598>] (rcu_sched_clock_irq) from [<c0183980>] (update_process_times+0x30/0x5c)
> [<c0183980>] (update_process_times) from [<c01941a8>] (tick_nohz_handler+0xcc/0x120)
> [<c01941a8>] (tick_nohz_handler) from [<c05b1d40>] (arch_timer_handler_virt+0x28/0x30)
> [<c05b1d40>] (arch_timer_handler_virt) from [<c016c9e0>] (handle_percpu_devid_irq+0xe8/0x21c)
> [<c016c9e0>] (handle_percpu_devid_irq) from [<c0167a8c>] (generic_handle_irq+0x18/0x28)
> [<c0167a8c>] (generic_handle_irq) from [<c0167b3c>] (__handle_domain_irq+0xa0/0xb4)
> [<c0167b3c>] (__handle_domain_irq) from [<c03673ec>] (gic_handle_irq+0x58/0x90)
> [<c03673ec>] (gic_handle_irq) from [<c0101a8c>] (__irq_svc+0x6c/0x90)
> Exception stack(0xeb08dd30 to 0xeb08dd78)
> dd20:                                     c0cc7514 20000013 00000005 00003b27
> dd40: eb7c4020 c0cc750c 00000051 00000051 20000013 c0c66b08 eb1cdc00 00000018
> dd60: 00000000 eb08dd80 c05c1a38 c0756c00 20000013 ffffffff
> [<c0101a8c>] (__irq_svc) from [<c0756c00>] (_raw_spin_unlock_irqrestore+0x1c/0x20)
> [<c0756c00>] (_raw_spin_unlock_irqrestore) from [<c05c1a38>] (of_find_node_by_phandle+0xcc/0xf0)
> [<c05c1a38>] (of_find_node_by_phandle) from [<c05c1bb8>] (of_phandle_iterator_next+0x68/0x178)
> [<c05c1bb8>] (of_phandle_iterator_next) from [<c05c22bc>] (of_count_phandle_with_args+0x5c/0x7c)
> [<c05c22bc>] (of_count_phandle_with_args) from [<c053fc38>] (i2c_demux_pinctrl_probe+0x24/0x1fc)
> [<c053fc38>] (i2c_demux_pinctrl_probe) from [<c04463c4>] (platform_drv_probe+0x48/0x94)
> [<c04463c4>] (platform_drv_probe) from [<c0444a20>] (really_probe+0x1f0/0x2b8)
> [<c0444a20>] (really_probe) from [<c0444e68>] (driver_probe_device+0x140/0x158)
> [<c0444e68>] (driver_probe_device) from [<c0444ff0>] (device_driver_attach+0x44/0x5c)
> [<c0444ff0>] (device_driver_attach) from [<c04450b4>] (__driver_attach+0xac/0xb4)
> [<c04450b4>] (__driver_attach) from [<c0443178>] (bus_for_each_dev+0x64/0xa0)
> [<c0443178>] (bus_for_each_dev) from [<c04438a8>] (bus_add_driver+0x148/0x1a8)
> [<c04438a8>] (bus_add_driver) from [<c0445ad0>] (driver_register+0xac/0xf0)
> [<c0445ad0>] (driver_register) from [<c0b010b0>] (do_one_initcall+0xa8/0x1d4)
> [<c0b010b0>] (do_one_initcall) from [<c0b01448>] (kernel_init_freeable+0x26c/0x2c8)
> [<c0b01448>] (kernel_init_freeable) from [<c0751c70>] (kernel_init+0x8/0x10c)
> [<c0751c70>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
> Exception stack(0xeb08dfb0 to 0xeb08dff8)
> dfa0:                                     00000000 00000000 00000000 00000000
> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> 
> Presumably it loops forever, due to a conversion of -1 to unsigned
> somewhere?

Hmm, I fail to see the culprit. i2c_demux_pinctrl_probe calls
of_count_phandle_with_args with cells_name=NULL. With that I don't see
how my patch changes anything as the only change is in an if
(it->cells_name) block that shouldn't be relevant in your case.

Can you please verify that the loop in of_count_phandle_with_args is
indeed not terminating, e.g. with

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 2f25d2dfecfa..2425a6d26038 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1769,8 +1769,13 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
 	if (rc)
 		return rc;
 
-	while ((rc = of_phandle_iterator_next(&it)) == 0)
+	pr_err("%s: enter loop (np=%pOF, list_name=%s, cells_name=%s)\n",
+	       __func__, np, list_name, cells_name);
+	while ((rc = of_phandle_iterator_next(&it)) == 0) {
+		pr_err("%s: it.node = %pOF cur_index=%d\n", __func__, it.node, cur_index);
 		cur_index += 1;
+	}
+	pr_err("%s: exit loop\n", __func__);
 
 	if (rc != -ENOENT)
 		return rc;

Thanks
Uwe
-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
