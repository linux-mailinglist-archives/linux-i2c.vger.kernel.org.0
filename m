Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E754BB4E47
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2019 14:44:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbfIQMoN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Sep 2019 08:44:13 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46746 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfIQMoM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Sep 2019 08:44:12 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190917124411euoutp019d95d647f0048154a8d311a8bf6363cb~FOmUWSHu92814128141euoutp01e
        for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2019 12:44:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190917124411euoutp019d95d647f0048154a8d311a8bf6363cb~FOmUWSHu92814128141euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568724251;
        bh=wUXpKJGu/og/UoOB6RtnG3FPGUskHRfnTr98I07AiCg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=nxLKnwaKKX9LQvun66AiyzTXmN9UCeSbdxrSBsZwYpIm9/BC+GQcKG/BczvxX2pt2
         qy406lEZfIyOlj+RkGOrZstbmO7+1v9L1L6UWrYzHRtIGIzH99+u4+sn3ozzhy5bXQ
         ZQcWT2TFG9reddsKhb+ebndTPWp03YWRj6xRQOpw=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190917124410eucas1p2e83a6b1d64ddb17b4a345d786d7260b6~FOmTccf7w2150021500eucas1p2C;
        Tue, 17 Sep 2019 12:44:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FB.A0.04469.915D08D5; Tue, 17
        Sep 2019 13:44:09 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190917124409eucas1p2211d232e6833a44a9ad5dbf72457197c~FOmSsZsEg2149521495eucas1p2T;
        Tue, 17 Sep 2019 12:44:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190917124409eusmtrp2d5e1869c322423d265b23ce57565b766~FOmSeKWX42680926809eusmtrp2Z;
        Tue, 17 Sep 2019 12:44:09 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-b1-5d80d519d59e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 39.79.04166.815D08D5; Tue, 17
        Sep 2019 13:44:08 +0100 (BST)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190917124407eusmtip251bb455018ae4b0faee9f4999a104f9a~FOmRZq8a80883208832eusmtip2y;
        Tue, 17 Sep 2019 12:44:07 +0000 (GMT)
Subject: Re: [PATCH v1 2/2] of: Let of_for_each_phandle fallback to
 non-negative cell_count
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Peter Rosin <peda@axentia.se>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <ba4d0f94-f147-049f-6252-10928b626e41@samsung.com>
Date:   Tue, 17 Sep 2019 14:44:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190917122530.3xy7sut3xdvzlomj@pengutronix.de>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0hTcRTHO7u7D5eL283y9JRGD3prJfzICqOgSwT5T1DGrFWXJT7bWmUP
        GhqiS8oKLWemhaaIle+m9HJKoyTL7LE0s8gEq0XqzMLKvF4s//ucc76/7zlf+HGUMEBP4yJj
        D0imWEO0jtGoqx/8fLJk6gurPtCdtZzkNjTRJOvLEEO6Wu+oSN69EJKaXcqS4owaNSn/8JIm
        Kb+9QFpqLzGkJakZSFX3VxVJPLmC3HHmAhm67WBJ3bdOmrSdPQ/k5JtgcrppY6ggdtZdVokl
        l0tAzLyfzYo19nZWLC9OZURnfQqIFfknxPPuQhDP/A4Uu67cVIt95bPCxodrVu+VoiMPSqZl
        a3dp9jnc/RB/I/Rw7eluxgqVwTbw4ZBfifdzr7A24DiBLwIcXCW3Bd4L+Na93waaYe4DvNva
        qx7V179+RCuDQsCMtFJQCg9gTWMLK6sm8XrsKEtkZFc/3ohtrk2yhuJPMWhvuMXIGoYPQpvH
        NsJafi06nDkqmdX8XPR+fT/iM3nY5+0PF6VoJuLDrM6RK3z4Ndhfeg5kpvgATKrKphT2x9bO
        XJW8DPkCDl+lDKiUszfgYNddWuFJ+MlVySo8A4dqRh8kAb5vus4qRRpgS+JFUFQhWO9qpuU4
        FL8Ab9YukxH5dVjhTVBwAro9E5UbJuC56guU0tZiSrKgeMxDu+vGv611T59R6aCzj0lmH5PG
        PiaN/f/aPFAXg79kMccYJXNQrHRoqdkQY7bEGpfuiYsph+Hv2PjH1euA/me7ncBzoPPV4mOr
        XqANB80JMU5AjtL5acOOn9AL2r2GhCOSKW6nyRItmZ0wnVPr/LVHx73bIfBGwwEpSpLiJdPo
        VMX5TLPCsR852yPnvO7rXhc8cMazJ+J7++0tvZZkvy1pPXNLErYGpH4uuBqXHrGozC8cfAMa
        DjEwf3ZUT7JeiE/XHI7InNIRFSoaF1vCex6Q4JkB81esDBI2P4z60FF0bXDxJ/96K3PhV8jm
        j3TJ83zxS2Fmu/fYAk/GelVeZrTvbge7bX2VTm3eZwhaSJnMhr/qgyryigMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRiGec+2s6O2OE7FNwurRRlF0zPdfC1d+qvzU4igD4cuPUzTOdk5
        SmbhUhFdZn6k6Cy/0AwT05kyLdHNKDQxzBLTykJRLFtRVkSpbc7Afxfc93XDAw/BE18X+BFJ
        qRyjT1WnSHB3/rO1p++OwFcGVdBsnhTVPR4ToOrldRwtTPdjqH7gGCqs6RCi1opePjLPTQpQ
        weoKQBN9t3A0kTsOUPeSHUM5ecGo31YH0PojixBZv84L0ExpOUB5b+SoeOxEpJiet9ZidFtt
        G6ArB2uEdK/prZA2txbitG2oANBdTdl0+VQLoG+sBtELDff59Hezf7THWWm4XpfOMXsSdSwX
        ITlHIZmUCkNSWUiYlAoOVR2VySWByvAEJiUpg9EHKuOkiZapHyCtPfJiX/ESbgAP5EbgRkAy
        BA69HhEYgTshJpsBLCtpELiCXXC40rDJXvDvpBF3lT4BePflotAZeJEqONuZgzvZm9TA0pVW
        obPEI0txWP7TwncZqxis/zOzMYWTFDR+Nm4YIlIJLbbbmJP55H64Yv/gsAnCx7Fq7le4Kp5w
        uHqe72Q3MgL+6CgDTuaRCljb9YHn4t0wt7tmk33h9HwdVgLEpi26aYti2qKYtij1gN8KvJl0
        VqvRspSUVWvZ9FSNNF6nNQPHK/Q8+d1lAS86T9oASQDJNtHgiEElFqgz2EytDUCCJ/EWRV/J
        VolFCerMS4xeF6tPT2FYG5A7bivl+fnE6xyPlcrFUnIqFIVRocGhwQok8RUVkNYYMalRc0wy
        w6Qx+v8eRrj5GUBcUWNQ28T4ArczoCi/khjtGLu8xH7b68mMnkrus1ccVxQtzo4eqM562Fvr
        P7W9qlGmxLznILfczin7FCG+1ihZj70yX8f6zP66d3DAmvQ84MuaveZ9v7Gtqen2tZjD2JmW
        mz8/Vvk3Rp3fV31BLLhzD3ns8Dc3R0ZTp69yWeUSPpuopg7x9Kz6H0G4kfwgAwAA
X-CMS-MailID: 20190917124409eucas1p2211d232e6833a44a9ad5dbf72457197c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190917124409eucas1p2211d232e6833a44a9ad5dbf72457197c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190917124409eucas1p2211d232e6833a44a9ad5dbf72457197c
References: <20190824132846.8589-1-u.kleine-koenig@pengutronix.de>
        <20190824132846.8589-2-u.kleine-koenig@pengutronix.de>
        <20190913215809.GA11833@bogus>
        <CAMuHMdV+pwoAA0zH_vQf2nKqzrgHP8rcMStyJbnuu2qviFC_qg@mail.gmail.com>
        <20190917101303.t5otztdus7y3ayau@pengutronix.de>
        <489c90fb-a135-4fd8-ecb9-46404bd3c234@axentia.se>
        <20190917122530.3xy7sut3xdvzlomj@pengutronix.de>
        <CGME20190917124409eucas1p2211d232e6833a44a9ad5dbf72457197c@eucas1p2.samsung.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On 17.09.2019 14:25, Uwe Kleine-König wrote:
> On Tue, Sep 17, 2019 at 11:25:46AM +0000, Peter Rosin wrote:
>> On 2019-09-17 12:13, Uwe Kleine-König wrote:
>>> Hello Geert,
>>>
>>> On Tue, Sep 17, 2019 at 11:40:25AM +0200, Geert Uytterhoeven wrote:
>>>> Hi Rob, Uwe,
>>>>
>>>> On Fri, Sep 13, 2019 at 11:58 PM Rob Herring <robh@kernel.org> wrote:
>>>>> On Sat, 24 Aug 2019 15:28:46 +0200, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=          wrote:
>>>>>> Referencing device tree nodes from a property allows to pass arguments.
>>>>>> This is for example used for referencing gpios. This looks as follows:
>>>>>>
>>>>>>        gpio_ctrl: gpio-controller {
>>>>>>                #gpio-cells = <2>
>>>>>>                ...
>>>>>>        }
>>>>>>
>>>>>>        someothernode {
>>>>>>                gpios = <&gpio_ctrl 5 0 &gpio_ctrl 3 0>;
>>>>>>                ...
>>>>>>        }
>>>>>>
>>>>>> To know the number of arguments this must be either fixed, or the
>>>>>> referenced node is checked for a $cells_name (here: "#gpio-cells")
>>>>>> property and with this information the start of the second reference can
>>>>>> be determined.
>>>>>>
>>>>>> Currently regulators are referenced with no additional arguments. To
>>>>>> allow some optional arguments without having to change all referenced
>>>>>> nodes this change introduces a way to specify a default cell_count. So
>>>>>> when a phandle is parsed we check for the $cells_name property and use
>>>>>> it as before if present. If it is not present we fall back to
>>>>>> cells_count if non-negative and only fail if cells_count is smaller than
>>>>>> zero.
>>>>>>
>>>>>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>>>> This is now commit e42ee61017f58cd9 ("of: Let of_for_each_phandle fallback
>>>> to non-negative cell_count") in robh/for-next, which causes a lock-up when
>>>> booting a shmobile_defconfig kernel on r8a7791/koelsch:
>>>>
>>>> rcu: INFO: rcu_sched self-detected stall on CPU
>>>> rcu:     0-....: (2099 ticks this GP) idle=6fe/1/0x40000002
>>>> softirq=29/29 fqs=1050
>>>>   (t=2100 jiffies g=-1131 q=0)
>>>> NMI backtrace for cpu 0
>>>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
>>>> 5.3.0-rc2-shmobile-00050-ge42ee61017f58cd9 #376
>>>> Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>>>> [<c010f8ac>] (unwind_backtrace) from [<c010b620>] (show_stack+0x10/0x14)
>>>> [<c010b620>] (show_stack) from [<c073d038>] (dump_stack+0x7c/0x9c)
>>>> [<c073d038>] (dump_stack) from [<c0742e80>] (nmi_cpu_backtrace+0xa0/0xb8)
>>>> [<c0742e80>] (nmi_cpu_backtrace) from [<c0742f1c>] (nmi_trigger_cpumask_backtrace+0x84/0x114)
>>>> [<c0742f1c>] (nmi_trigger_cpumask_backtrace) from [<c017d684>] (rcu_dump_cpu_stacks+0xac/0xc8)
>>>> [<c017d684>] (rcu_dump_cpu_stacks) from [<c017a598>] (rcu_sched_clock_irq+0x2ac/0x6b4)
>>>> [<c017a598>] (rcu_sched_clock_irq) from [<c0183980>] (update_process_times+0x30/0x5c)
>>>> [<c0183980>] (update_process_times) from [<c01941a8>] (tick_nohz_handler+0xcc/0x120)
>>>> [<c01941a8>] (tick_nohz_handler) from [<c05b1d40>] (arch_timer_handler_virt+0x28/0x30)
>>>> [<c05b1d40>] (arch_timer_handler_virt) from [<c016c9e0>] (handle_percpu_devid_irq+0xe8/0x21c)
>>>> [<c016c9e0>] (handle_percpu_devid_irq) from [<c0167a8c>] (generic_handle_irq+0x18/0x28)
>>>> [<c0167a8c>] (generic_handle_irq) from [<c0167b3c>] (__handle_domain_irq+0xa0/0xb4)
>>>> [<c0167b3c>] (__handle_domain_irq) from [<c03673ec>] (gic_handle_irq+0x58/0x90)
>>>> [<c03673ec>] (gic_handle_irq) from [<c0101a8c>] (__irq_svc+0x6c/0x90)
>>>> Exception stack(0xeb08dd30 to 0xeb08dd78)
>>>> dd20:                                     c0cc7514 20000013 00000005 00003b27
>>>> dd40: eb7c4020 c0cc750c 00000051 00000051 20000013 c0c66b08 eb1cdc00 00000018
>>>> dd60: 00000000 eb08dd80 c05c1a38 c0756c00 20000013 ffffffff
>>>> [<c0101a8c>] (__irq_svc) from [<c0756c00>] (_raw_spin_unlock_irqrestore+0x1c/0x20)
>>>> [<c0756c00>] (_raw_spin_unlock_irqrestore) from [<c05c1a38>] (of_find_node_by_phandle+0xcc/0xf0)
>>>> [<c05c1a38>] (of_find_node_by_phandle) from [<c05c1bb8>] (of_phandle_iterator_next+0x68/0x178)
>>>> [<c05c1bb8>] (of_phandle_iterator_next) from [<c05c22bc>] (of_count_phandle_with_args+0x5c/0x7c)
>>>> [<c05c22bc>] (of_count_phandle_with_args) from [<c053fc38>] (i2c_demux_pinctrl_probe+0x24/0x1fc)
>>>> [<c053fc38>] (i2c_demux_pinctrl_probe) from [<c04463c4>] (platform_drv_probe+0x48/0x94)
>>>> [<c04463c4>] (platform_drv_probe) from [<c0444a20>] (really_probe+0x1f0/0x2b8)
>>>> [<c0444a20>] (really_probe) from [<c0444e68>] (driver_probe_device+0x140/0x158)
>>>> [<c0444e68>] (driver_probe_device) from [<c0444ff0>] (device_driver_attach+0x44/0x5c)
>>>> [<c0444ff0>] (device_driver_attach) from [<c04450b4>] (__driver_attach+0xac/0xb4)
>>>> [<c04450b4>] (__driver_attach) from [<c0443178>] (bus_for_each_dev+0x64/0xa0)
>>>> [<c0443178>] (bus_for_each_dev) from [<c04438a8>] (bus_add_driver+0x148/0x1a8)
>>>> [<c04438a8>] (bus_add_driver) from [<c0445ad0>] (driver_register+0xac/0xf0)
>>>> [<c0445ad0>] (driver_register) from [<c0b010b0>] (do_one_initcall+0xa8/0x1d4)
>>>> [<c0b010b0>] (do_one_initcall) from [<c0b01448>] (kernel_init_freeable+0x26c/0x2c8)
>>>> [<c0b01448>] (kernel_init_freeable) from [<c0751c70>] (kernel_init+0x8/0x10c)
>>>> [<c0751c70>] (kernel_init) from [<c01010e8>] (ret_from_fork+0x14/0x2c)
>>>> Exception stack(0xeb08dfb0 to 0xeb08dff8)
>>>> dfa0:                                     00000000 00000000 00000000 00000000
>>>> dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>>>> dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
>>>>
>>>> Presumably it loops forever, due to a conversion of -1 to unsigned
>>>> somewhere?
>>> Hmm, I fail to see the culprit. i2c_demux_pinctrl_probe calls
>>> of_count_phandle_with_args with cells_name=NULL. With that I don't see
>>> how my patch changes anything as the only change is in an if
>>> (it->cells_name) block that shouldn't be relevant in your case.
>>>
>>> Can you please verify that the loop in of_count_phandle_with_args is
>>> indeed not terminating, e.g. with
>> The below indicated else-branch was not touched by e42ee61017f58cd9,
>> which ends up setting the count to -1 (aka 0xff...ff in this case).
>> No?
>>
>> int of_phandle_iterator_next(struct of_phandle_iterator *it)
>> {
>>
>> 	...
>>
>> 		if (it->cells_name) {
>>
>> 			...
>>
>> 		} else {
>> 			count = it->cell_count;    /* <---- SUSPECT!!! */
>> 		}
> Oh yeah, you're right. I'm a bit disappointed that I didn't spot this
> myself :-|
>
> Untested patch to fix this problem:

Yesterday I've noticed that sound driver fails to initialize on TM2(e) 
board (arm64) and today I've bisected to this commit. Nice to see that 
the issue has been already investigated.

> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index 2f25d2dfecfa..26f7a21d7187 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -1284,6 +1284,13 @@ int of_phandle_iterator_init(struct of_phandle_iterator *it,
>   	const __be32 *list;
>   	int size;
>   
> +	/*
> +	 * one of cell_count or cells_name must be provided to determine the
> +	 * argument length.
> +	 */
> +	if (cell_count < 0 && !cells_name)
> +		return -EINVAL;
> +
>   	memset(it, 0, sizeof(*it));
>   
>   	list = of_get_property(np, list_name, &size);
> @@ -1765,6 +1772,18 @@ int of_count_phandle_with_args(const struct device_node *np, const char *list_na
>   	struct of_phandle_iterator it;
>   	int rc, cur_index = 0;
>   
> +	/* If cells_name is NULL we assume an cell_count of 0 */
> +	if (cells_name == NULL) {
> +		const __be32 *list;
> +		int size;
> +
> +		list = of_get_property(np, list_name, &size);
> +		if (!list)
> +			return -ENOENT;
> +
> +		return size / sizeof(*list);
> +	}
> +
>   	rc = of_phandle_iterator_init(&it, np, list_name, cells_name, -1);
>   	if (rc)
>   		return rc;
>
I confirm that the above code works. The patch fixes my TM2(e) sound 
issue, feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

