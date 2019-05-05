Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C25BD14157
	for <lists+linux-i2c@lfdr.de>; Sun,  5 May 2019 19:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfEERQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 May 2019 13:16:55 -0400
Received: from smtp71.ord1c.emailsrvr.com ([108.166.43.71]:59846 "EHLO
        smtp71.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbfEERQz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 May 2019 13:16:55 -0400
Received: from smtp1.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp1.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id ED65D201CE;
        Sun,  5 May 2019 13:16:52 -0400 (EDT)
X-SMTPDoctor-Processed: csmtpprox beta
Received: from smtp1.relay.ord1c.emailsrvr.com (localhost [127.0.0.1])
        by smtp1.relay.ord1c.emailsrvr.com (SMTP Server) with ESMTP id E177720200;
        Sun,  5 May 2019 13:16:52 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=g001.emailsrvr.com;
        s=20190322-9u7zjiwi; t=1557076612;
        bh=Y7ULPTihcC8tZUsUeEO8vnDyUksm8HPED0aPcMLvXQc=;
        h=Subject:From:Date:To:From;
        b=VdciszEMsz38sYOamCJB4pcxatoruHAqCQYtEivdVXZgtcTHv/w7zaR6oZWgz/41R
         MX9O/MJMBVEb/B6xhfyot3hd0tGFP5rgSs84Bw0VNSJFCrQOOokMBPqE2iNn5Nck0X
         jVx4xM9N/qW9Y7RXYwqS1C2g3BiQNAdoeqxjVC5w=
X-Auth-ID: mcdermj@xenotropic.com
Received: by smtp1.relay.ord1c.emailsrvr.com (Authenticated sender: mcdermj-AT-xenotropic.com) with ESMTPSA id E0524201CE;
        Sun,  5 May 2019 13:16:51 -0400 (EDT)
X-Sender-Id: mcdermj@xenotropic.com
Received: from [10.0.3.33] (c-73-96-52-102.hsd1.or.comcast.net [73.96.52.102])
        (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
        by 0.0.0.0:465 (trex/5.7.12);
        Sun, 05 May 2019 13:16:52 -0400
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] i2c: bcm2835: Model Divider in CCF
From:   Annaliese McDermond <nh6z@nh6z.net>
In-Reply-To: <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
Date:   Sun, 5 May 2019 10:16:50 -0700
Cc:     eric@anholt.net, f.fainelli@gmail.com, wsa@the-dreams.de,
        linux-i2c@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, team@nwdigitalradio.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B56D729-1A4E-48E8-8594-E1B03D517E67@nh6z.net>
References: <20190505034339.30778-1-nh6z@nh6z.net>
 <610c7594-85c9-72db-63a6-6e632e9586aa@i2se.com>
To:     Stefan Wahren <stefan.wahren@i2se.com>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> On May 5, 2019, at 3:36 AM, Stefan Wahren <stefan.wahren@i2se.com> =
wrote:
>=20
> Hi Annaliese,
>=20
> Am 05.05.19 um 05:43 schrieb Annaliese McDermond:
>> Model the I2C bus clock divider as a part of the Core Clock =
Framework.
>> Primarily this removes the clk_get_rate() call from each transfer.
>> This call causes problems for slave drivers that themselves have
>> internal clock components that are controlled by an I2C interface.
>> When the slave's internal clock component is prepared, the prepare
>> lock is obtained, and it makes calls to the I2C subsystem to
>> command the hardware to activate the clock.  In order to perform
>> the I2C transfer, this driver sets the divider, which requires
>> it to get the parent clock rate, which it does with clk_get_rate().
>> Unfortunately, this function will try to take the clock prepare
>> lock, which is already held by the slave's internal clock calls
>> creating a deadlock.
>=20
> i think i understand the problem, but could you please explain the
> specific use case where this happend?
>=20
> I suspect bcm2835 is not the only platform which is affected, so it
> would be better to fix this in general.

The specific use case here is the tlv320aic32x4 audio codec.  We use
it in our RPi board connected via i2c for the command and control
channel.  The chip has multiple clock components on it for generating
the various clocks used by the chip such as the sample clock and the
word clock used on the i2s bus.  The components include a PLL,
muxes and various dividers to eventually create sample clocks.

I recently modeled these as CCF components internal to the
tlv320aic32x4 driver (see sound/soc/codecs/tlv320aic32x4-clk.c) to
make it a bit easier for the driver to generate an appropriate
sample clock for various sample rates requested by ALSA clients.

What happens is that at module load time, the driver attempts to
register all of its clocks.  When you call clk_register() the=20
global prepare lock is taken.

When you register a clock, the CCF will attempt to get=20
the current clock rate by querying the hardware for current settings=20
and calculating the current clock rate.  It will use the drivers =
recalc_rate=20
function to do this.  For the tlv320aic32x4 driver, this recalc_rate
function will try to read the divider value from hardware, which
creates an i2c call via regmap.  When the bcm2835 driver begins
the transfer, it will try to set its internal divider to the correct
value to get the bus frequency.  It calls clk_get_rate() to do this
which first tries to acquire the global prepare lock.  It=E2=80=99ll =
wait
forever, because clk_register() already holds it.

The actual behavior appears to get a little racey because other
drivers using the i2c bus get gummed up because the tlv320aic32x4=E2=80=99=
s
clock registration holding the lock stops those threads as well.
You can see the practical results from the below stack traces.

Modeling the i2c divider on the bcm2835 as part of the CCF also makes
sense from a variety of other angles.  The divider is only reset when
there=E2=80=99s an actual clock change upstream, and it=E2=80=99ll be =
done automatically
when a parent clock somewhere changes.  This way it doesn=E2=80=99t need =
to
get set every time we do a transfer.  It=E2=80=99s not a huge =
optimization but
it does save a little bit of math and register writes.

There is an argument that the divider might belong in the bcm2835-clk =
driver
instead and that you should just have an input clock that=E2=80=99s =
expected to be
the bus rate, but I decided that because of the extra work required with
setting BCM2835_I2C_FEDL_SHIFT and BCM2835_I2C_REDL_SHIFT that it was
more appropriate in the i2c driver itself.  I could easily be convinced
otherwise.

[  243.671636] INFO: task kworker/1:1:32 blocked for more than 120 =
seconds.
[  243.671641]       Tainted: G         C        4.19.34-v7+ #2
[  243.671643] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" =
disables this message.
[  243.671648] kworker/1:1     D    0    32      2 0x00000000
[  243.671666] Workqueue: events deferred_probe_work_func
[  243.671685] [<807ff4f4>] (__schedule) from [<807ffc70>] =
(schedule+0x4c/0xac)
[  243.671693] [<807ffc70>] (schedule) from [<80802818>] =
(__rt_mutex_slowlock+0xf8/0x138)
[  243.671702] [<80802818>] (__rt_mutex_slowlock) from [<80802a48>] =
(rt_mutex_slowlock.constprop.7+0xd4/0x1dc)
[  243.671710] [<80802a48>] (rt_mutex_slowlock.constprop.7) from =
[<80802c1c>] (rt_mutex_lock+0x64/0x68)
[  243.671719] [<80802c1c>] (rt_mutex_lock) from [<8063fe68>] =
(i2c_adapter_lock_bus+0x1c/0x20)
[  243.671727] [<8063fe68>] (i2c_adapter_lock_bus) from [<80641770>] =
(i2c_transfer+0xb0/0xc4)
[  243.671735] [<80641770>] (i2c_transfer) from [<8059c208>] =
(regmap_i2c_read+0x68/0x98)
[  243.671743] [<8059c208>] (regmap_i2c_read) from [<80597b10>] =
(_regmap_raw_read+0x100/0x288)
[  243.671749] [<80597b10>] (_regmap_raw_read) from [<80597ce0>] =
(_regmap_bus_read+0x48/0x70)
[  243.671755] [<80597ce0>] (_regmap_bus_read) from [<8059681c>] =
(_regmap_read+0x70/0x150)
[  243.671761] [<8059681c>] (_regmap_read) from [<80596948>] =
(regmap_read+0x4c/0x6c)
[  243.671777] [<80596948>] (regmap_read) from [<7f3ed564>] =
(clk_aic32x4_div_recalc_rate+0x38/0x68 [snd_soc_tlv320aic32x4])
[  243.671804] [<7f3ed564>] (clk_aic32x4_div_recalc_rate =
[snd_soc_tlv320aic32x4]) from [<80529e58>] (clk_register+0x3f8/0x6f4)
[  243.671812] [<80529e58>] (clk_register) from [<8052a260>] =
(devm_clk_register+0x50/0x84)
[  243.671823] [<8052a260>] (devm_clk_register) from [<7f3edc04>] =
(aic32x4_register_clocks+0x128/0x524 [snd_soc_tlv320aic32x4])
[  243.671840] [<7f3edc04>] (aic32x4_register_clocks =
[snd_soc_tlv320aic32x4]) from [<7f3ec9c4>] =
(aic32x4_component_probe+0xc8/0x314 [snd_soc_tlv320aic32x4])
[  243.671908] [<7f3ec9c4>] (aic32x4_component_probe =
[snd_soc_tlv320aic32x4]) from [<7f2b6e88>] =
(soc_probe_component+0x274/0x404 [snd_soc_core])
[  243.671988] [<7f2b6e88>] (soc_probe_component [snd_soc_core]) from =
[<7f2b9660>] (snd_soc_register_card+0x5e0/0xee0 [snd_soc_core])
[  243.672067] [<7f2b9660>] (snd_soc_register_card [snd_soc_core]) from =
[<7f2c7d48>] (devm_snd_soc_register_card+0x48/0x80 [snd_soc_core])
[  243.672115] [<7f2c7d48>] (devm_snd_soc_register_card [snd_soc_core]) =
from [<7f380770>] (asoc_simple_card_probe+0x2c0/0x558 =
[snd_soc_simple_card])
[  243.672126] [<7f380770>] (asoc_simple_card_probe =
[snd_soc_simple_card]) from [<80582880>] (platform_drv_probe+0x58/0xa8)
[  243.672135] [<80582880>] (platform_drv_probe) from [<80580a3c>] =
(really_probe+0x204/0x2c8)
[  243.672143] [<80580a3c>] (really_probe) from [<80580cd4>] =
(driver_probe_device+0x70/0x184)
[  243.672151] [<80580cd4>] (driver_probe_device) from [<80580f98>] =
(__device_attach_driver+0xc0/0xe4)
[  243.672159] [<80580f98>] (__device_attach_driver) from [<8057ea6c>] =
(bus_for_each_drv+0x90/0xd4)
[  243.672166] [<8057ea6c>] (bus_for_each_drv) from [<805807b0>] =
(__device_attach+0xe0/0x148)
[  243.672174] [<805807b0>] (__device_attach) from [<80581018>] =
(device_initial_probe+0x1c/0x20)
[  243.672181] [<80581018>] (device_initial_probe) from [<8057fa90>] =
(bus_probe_device+0x94/0x9c)
[  243.672189] [<8057fa90>] (bus_probe_device) from [<8057ff84>] =
(deferred_probe_work_func+0x70/0x9c)
[  243.672198] [<8057ff84>] (deferred_probe_work_func) from [<8013b0dc>] =
(process_one_work+0x23c/0x518)
[  243.672206] [<8013b0dc>] (process_one_work) from [<8013c1a0>] =
(worker_thread+0x60/0x5b8)
[  243.672215] [<8013c1a0>] (worker_thread) from [<80141a74>] =
(kthread+0x16c/0x174)
[  243.672224] [<80141a74>] (kthread) from [<801010ac>] =
(ret_from_fork+0x14/0x28)
[  243.672227] Exception stack(0xb9e87fb0 to 0xb9e87ff8)
[  243.672232] 7fa0:                                     00000000 =
00000000 00000000 00000000
[  243.672238] 7fc0: 00000000 00000000 00000000 00000000 00000000 =
00000000 00000000 00000000
[  243.672242] 7fe0: 00000000 00000000 00000000 00000000 00000013 =
00000000
[  243.672276] INFO: task modprobe:215 blocked for more than 120 =
seconds.
[  243.672280]       Tainted: G         C        4.19.34-v7+ #2
[  243.672282] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" =
disables this message.
[  243.672285] modprobe        D    0   215      1 0x00000081
[  243.672297] [<807ff4f4>] (__schedule) from [<807ffc70>] =
(schedule+0x4c/0xac)
[  243.672305] [<807ffc70>] (schedule) from [<808000d4>] =
(schedule_preempt_disabled+0x18/0x1c)
[  243.672313] [<808000d4>] (schedule_preempt_disabled) from =
[<8080121c>] (__mutex_lock.constprop.5+0x298/0x584)
[  243.672321] [<8080121c>] (__mutex_lock.constprop.5) from [<80801624>] =
(__mutex_lock_slowpath+0x1c/0x20)
[  243.672328] [<80801624>] (__mutex_lock_slowpath) from [<80801684>] =
(mutex_lock+0x5c/0x60)
[  243.672336] [<80801684>] (mutex_lock) from [<80525090>] =
(clk_prepare_lock+0x60/0x108)
[  243.672344] [<80525090>] (clk_prepare_lock) from [<80527480>] =
(clk_core_get_rate+0x1c/0x70)
[  243.672351] [<80527480>] (clk_core_get_rate) from [<805286bc>] =
(clk_get_rate+0x24/0x28)
[  243.672361] [<805286bc>] (clk_get_rate) from [<7f173248>] =
(bcm2835_i2c_xfer+0xb4/0x428 [i2c_bcm2835])
[  243.672372] [<7f173248>] (bcm2835_i2c_xfer [i2c_bcm2835]) from =
[<806412a4>] (__i2c_transfer+0x178/0x594)
[  243.672378] [<806412a4>] (__i2c_transfer) from [<80641734>] =
(i2c_transfer+0x74/0xc4)
[  243.672385] [<80641734>] (i2c_transfer) from [<806417e0>] =
(i2c_transfer_buffer_flags+0x5c/0x80)
[  243.672392] [<806417e0>] (i2c_transfer_buffer_flags) from =
[<8059c328>] (regmap_i2c_write+0x24/0x40)
[  243.672398] [<8059c328>] (regmap_i2c_write) from [<80597658>] =
(_regmap_raw_write_impl+0x710/0x83c)
[  243.672404] [<80597658>] (_regmap_raw_write_impl) from [<80597800>] =
(_regmap_bus_raw_write+0x7c/0xa4)
[  243.672410] [<80597800>] (_regmap_bus_raw_write) from [<80596c7c>] =
(_regmap_write+0x6c/0x120)
[  243.672416] [<80596c7c>] (_regmap_write) from [<805983a4>] =
(regmap_write+0x4c/0x6c)
[  243.672429] [<805983a4>] (regmap_write) from [<7f4138f8>] =
(sc16is7xx_probe+0x3a0/0x538 [sc16is7xx])
[  243.672447] [<7f4138f8>] (sc16is7xx_probe [sc16is7xx]) from =
[<7f413b1c>] (sc16is7xx_i2c_probe+0x8c/0xac [sc16is7xx])
[  243.672458] [<7f413b1c>] (sc16is7xx_i2c_probe [sc16is7xx]) from =
[<80640bb0>] (i2c_device_probe+0x270/0x290)
[  243.672465] [<80640bb0>] (i2c_device_probe) from [<80580a3c>] =
(really_probe+0x204/0x2c8)
[  243.672473] [<80580a3c>] (really_probe) from [<80580cd4>] =
(driver_probe_device+0x70/0x184)
[  243.672480] [<80580cd4>] (driver_probe_device) from [<80580ed4>] =
(__driver_attach+0xec/0xf0)
[  243.672488] [<80580ed4>] (__driver_attach) from [<8057e970>] =
(bus_for_each_dev+0x84/0xc4)
[  243.672495] [<8057e970>] (bus_for_each_dev) from [<80580334>] =
(driver_attach+0x2c/0x30)
[  243.672502] [<80580334>] (driver_attach) from [<8057fd70>] =
(bus_add_driver+0x1d0/0x214)
[  243.672510] [<8057fd70>] (bus_add_driver) from [<805816cc>] =
(driver_register+0x84/0x118)
[  243.672516] [<805816cc>] (driver_register) from [<806406fc>] =
(i2c_register_driver+0x4c/0x90)
[  243.672528] [<806406fc>] (i2c_register_driver) from [<7f418048>] =
(sc16is7xx_init+0x48/0x1000 [sc16is7xx])
[  243.672540] [<7f418048>] (sc16is7xx_init [sc16is7xx]) from =
[<80102f24>] (do_one_initcall+0x50/0x220)
[  243.672550] [<80102f24>] (do_one_initcall) from [<801b4d5c>] =
(do_init_module+0x74/0x244)
[  243.672557] [<801b4d5c>] (do_init_module) from [<801b72a0>] =
(load_module+0x22a8/0x258c)
[  243.672564] [<801b72a0>] (load_module) from [<801b77d8>] =
(sys_finit_module+0xd4/0xec)
[  243.672571] [<801b77d8>] (sys_finit_module) from [<80101198>] =
(__sys_trace_return+0x0/0x10)
[  243.672574] Exception stack(0xb6eedfa8 to 0xb6eedff0)
[  243.672579] dfa0:                   161d5f00 006ac328 00000003 =
0002cd30 00000000 0002d71c
[  243.672585] dfc0: 161d5f00 006ac328 00000000 0000017b 00040000 =
00000000 00000000 006ad208
[  243.672590] dfe0: 7eb32970 7eb32960 0002212c 76ed64f0

> Regards
>=20
> Stefan

--
Annaliese McDermond
nh6z@nh6z.net

